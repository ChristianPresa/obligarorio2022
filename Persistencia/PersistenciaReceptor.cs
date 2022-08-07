using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace Persistencia
{
    #region Singleton
    internal class PersistenciaReceptor
    {
        private static PersistenciaReceptor _instancia;
        private PersistenciaReceptor() { }
        public static PersistenciaReceptor GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaReceptor();

            return _instancia;
        }
        #endregion
        internal void Alta(EntidadesCompartidas.Usuario UnUsuario, int CodMensaje, SqlTransaction _pTransaccion)
        {
            SqlCommand _comando = new SqlCommand("AltaDestinatario", _pTransaccion.Connection);
            _comando.CommandType = CommandType.StoredProcedure;
            _comando.Parameters.AddWithValue("@NombreUsuRecibe", UnUsuario.NombreUsuario);
            _comando.Parameters.AddWithValue("@Codigo", CodMensaje);
            SqlParameter _ParmRetorno = new SqlParameter("@Retorno", SqlDbType.Int);
            _ParmRetorno.Direction = ParameterDirection.ReturnValue;
            _comando.Parameters.Add(_ParmRetorno);

            try
            {
                _comando.Transaction = _pTransaccion;
                _comando.ExecuteNonQuery();
                int retorno = Convert.ToInt32(_ParmRetorno.Value);
                if (retorno == -1)
                    throw new Exception("No existe el usuario");
                else if (retorno == -2)
                    throw new Exception("Usuario ya cargado, verifique la lista que no este duplicado.");   
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
