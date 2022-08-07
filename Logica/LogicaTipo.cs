using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    internal class LogicaTipo:ILogicaTipo
    {
        private static LogicaTipo _instancia = null;
        private LogicaTipo() { }
        public static LogicaTipo GetInstancia()
        {
            if (_instancia == null)
                _instancia = new LogicaTipo();

            return _instancia;
        }

        public void Alta(EntidadesCompartidas.Tipo Tipo)
        {
            Persistencia.FabricaPersistencia.GetPersistenciaTipo().Alta(Tipo);
        }

        public EntidadesCompartidas.Tipo Busco(string CodTipo)
        {
            return (Persistencia.FabricaPersistencia.GetPersistenciaTipo().Busco(CodTipo));
        }

        public void Eliminar(EntidadesCompartidas.Tipo Tipo)
        {
            Persistencia.FabricaPersistencia.GetPersistenciaTipo().Eliminar(Tipo);
        }

        public List<EntidadesCompartidas.Tipo> Listo()
        {
            return (Persistencia.FabricaPersistencia.GetPersistenciaTipo().Listo());
        }
    }
}
