using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;
using System.Data;


namespace Logica
{
    internal class LogicaEstadisticas:ILogicaEstadisticas
    {
        private static LogicaEstadisticas _instancia = null;
        private LogicaEstadisticas() { }
        public static LogicaEstadisticas GetInstancia()
        {
            if (_instancia == null)
                _instancia = new LogicaEstadisticas();

            return _instancia;
        }

        public void Estadisticas(ref string V1, ref string V2, ref string V3)
        {
            Persistencia.FabricaPersistencia.GetPersistenciaEstadisitcas().Estadisticas(ref V1,ref V2,ref V3);
        }

        public DataSet Estadisticas2()
        {
            return Persistencia.FabricaPersistencia.GetPersistenciaEstadisitcas().Estadisticas2();
        }
    }
}
