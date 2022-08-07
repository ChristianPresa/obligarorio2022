using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace Persistencia
{
    internal class PersistenciaMensajeComun:IPersistenciaMensajeComun
    {
        private static PersistenciaMensajeComun _instancia;
        private PersistenciaMensajeComun() { }
        public static PersistenciaMensajeComun GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaMensajeComun();

            return _instancia;
        }

        public void AltaMensajeComun(EntidadesCompartidas.MensajeComun Mensaje)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            SqlCommand cmd = new SqlCommand("AltaMensajeComun", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@NombreUsuario", Mensaje.Emisor.NombreUsuario );
            cmd.Parameters.AddWithValue("@Asunto", Mensaje.Asunto);
            cmd.Parameters.AddWithValue("@Texto", Mensaje.Texto);
            cmd.Parameters.AddWithValue("@CodigoTipo", Mensaje.Tipo.Codigo);

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
                    throw new Exception("El Usuario no existe.");
                if (oRetorno == -2)
                    throw new Exception("No existe el Tipo de mensaje.");
                if (oRetorno == -3)
                    throw new Exception("Error en BD 1.");
                if (oRetorno == -4)
                    throw new Exception("Error en BD 2.");

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
