using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;
using System.Data;

namespace Persistencia
{
    internal class PersistenciaEstadisticas : IPersistenciaEstadisticas
    {
        private static PersistenciaEstadisticas _instancia;
        private PersistenciaEstadisticas() { }
        public static PersistenciaEstadisticas GetInstancia()
        {
            if (_instancia == null)
                _instancia = new PersistenciaEstadisticas();

            return _instancia;
        }

        public void Estadisticas(ref string V1, ref string V2, ref string V3)
        {
            SqlConnection cnn = new SqlConnection(Conexion.Cnn);
            SqlCommand cmd = new SqlCommand("Estadisticas", cnn);
            cmd.CommandType = CommandType.StoredProcedure;

            //Parametros de salida
            SqlParameter Valor1 = new SqlParameter("@CantUsuariosActivos", SqlDbType.Int);
            Valor1.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(Valor1);
            SqlParameter Valor2 = new SqlParameter("@CantMensajesComunes", SqlDbType.Int);
            Valor2.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(Valor2);
            SqlParameter Valor3 = new SqlParameter("@CantMensajesPrivados", SqlDbType.Int);
            Valor3.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(Valor3);

            try
            {
                cnn.Open();
                cmd.ExecuteScalar();
                V1 = Valor1.Value.ToString();
                V2 = Valor2.Value.ToString();
                V3 = Valor3.Value.ToString();
                cnn.Close();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                cnn.Close();
            }
        }


        public DataSet Estadisticas2()
         {
             SqlConnection cnn = new SqlConnection(Conexion.Cnn);
             SqlCommand cmd = new SqlCommand("Estadisticas2", cnn);
             cmd.CommandType = CommandType.StoredProcedure;    

             SqlDataAdapter _Tipo = new SqlDataAdapter();
             DataSet _DS = new DataSet();

            //_Tipo.Fill(_DS, "CodigoTipo");
            //_Tipo.Fill(_DS, "{1}");
             try
             {
                cnn.Open();
                SqlDataReader _lector = cmd.ExecuteReader();
                while (_lector.Read())
                {
                    string A = (string)_lector["CodigoTipo"];
                    string B = Convert.ToString((int)_lector[1]);   
                    //_Tipo.Fill(_DS, (string)_lector["0"]);
                    //_Tipo.Fill(_DS, (string)_lector["1"]);
                }
                _lector.Close();
             }
             catch (Exception ex)
             {
                 throw new Exception(ex.Message);
             }
             finally
             {
                 cnn.Close();
             }
             return _DS;
         }  
    }
}
