using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace Persistencia
{
    internal class PersistenciaMensajePrivado:IPersistenciaMensajePrivado
    {
        private static PersistenciaMensajePrivado _instancia;
        private PersistenciaMensajePrivado() { }
        public static PersistenciaMensajePrivado GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaMensajePrivado();

            return _instancia;
        }

        public void AltaMensajePrivado(EntidadesCompartidas.MensajePrivado Mensaje)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            SqlCommand cmd = new SqlCommand("AltaMensajePrivado", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@NombreUsuario", Mensaje.Emisor.NombreUsuario);
            cmd.Parameters.AddWithValue("@Asunto", Mensaje.Asunto);
            cmd.Parameters.AddWithValue("@Texto", Mensaje.Texto);
            cmd.Parameters.AddWithValue("@FechaCaduca", Mensaje.FechaCaduca);

            SqlParameter Retorno = new SqlParameter("@Retorno", SqlDbType.Int);
            Retorno.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(Retorno);
            int oRetorno = 0;

            SqlTransaction _miTransaccion = null;

            try
            {
                cnn.Open();
                _miTransaccion = cnn.BeginTransaction();
                cmd.Transaction = _miTransaccion;
                cmd.ExecuteNonQuery();

                oRetorno = (int)cmd.Parameters["@Retorno"].Value;
                if (oRetorno == -1)
                    throw new Exception("El Usuario no existe");
                if (oRetorno == -2)
                    throw new Exception("No existe el Tipo de mensaje");

                foreach (EntidadesCompartidas.Usuario usu in Mensaje.Receptor)
                {
                    Persistencia.PersistenciaReceptor.GetInstancia().Alta(usu, oRetorno, _miTransaccion);
                }
                _miTransaccion.Commit();
            }
            catch (Exception ex)
            {
                _miTransaccion.Rollback();
                throw ex;
            }
            finally
            {
                cnn.Close();
            }
        }
    }
}
