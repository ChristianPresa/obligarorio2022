using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;
using System.Data;

namespace Persistencia
{
    public interface IPersistenciaEstadisticas
    {
        void Estadisticas(ref string V1, ref string V2, ref string V3);
        DataSet Estadisticas2();
    }
}
