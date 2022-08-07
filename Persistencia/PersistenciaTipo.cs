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
    internal class PersistenciaTipo:IPersistenciaTipo
    {
        private static PersistenciaTipo _instancia;
        private PersistenciaTipo() { }
        public static PersistenciaTipo GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaTipo();

            return _instancia;
        }
#endregion
        public void Alta(EntidadesCompartidas.Tipo Tipo)
        {
        }
        public EntidadesCompartidas.Tipo Busco(string CodTipo)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            SqlCommand cmd = new SqlCommand("BuscarTipoMensaje", cnn);
            cmd.Parameters.AddWithValue("@CodigoTipo", CodTipo);
            cmd.CommandType = CommandType.StoredProcedure;

            EntidadesCompartidas.Tipo tTipo = null;

            try
            {
                cnn.Open();
                SqlDataReader _lector = cmd.ExecuteReader();
                if (_lector.Read())
                {
                    tTipo = new EntidadesCompartidas.Tipo((string)_lector["CodigoTipo"], (string)_lector["NombreTipo"]);
                }
                _lector.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cnn.Close();
            }
            return tTipo;
        }
        public List<EntidadesCompartidas.Tipo> Listo()
        {

            List<EntidadesCompartidas.Tipo> oAux = new List<EntidadesCompartidas.Tipo>();
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            SqlCommand cmm = new SqlCommand("ListarTipo", cnn);
            cmm.CommandType = CommandType.StoredProcedure;

            SqlDataReader oReader;
            try
            {
                cnn.Open();
                oReader = cmm.ExecuteReader();

                while (oReader.Read())
                {
                    EntidadesCompartidas.Tipo tTipo = new EntidadesCompartidas.Tipo((string)oReader["CodigoTipo"], (string)oReader["NombreTipo"]);
                    oAux.Add(tTipo);
                }
                oReader.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cnn.Close();
            }
            return oAux;
        }
        public void Eliminar(EntidadesCompartidas.Tipo Tipo)
        {
        }
    }
}
