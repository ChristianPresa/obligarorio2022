using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    internal class LogicaUsuario:ILogicaUsuario
    {
        private static LogicaUsuario _instancia = null;
        private LogicaUsuario() { }
        public static LogicaUsuario GetInstancia()
        {
            if (_instancia == null)
                _instancia = new LogicaUsuario();

            return _instancia;
        }

        public void Alta(EntidadesCompartidas.Usuario unUsu)
        {
            Persistencia.FabricaPersistencia.GetPersistenciaUsuario().Alta(unUsu);
        }

        public EntidadesCompartidas.Usuario Logueo(string Usu, string pass)
        {
            return (Persistencia.FabricaPersistencia.GetPersistenciaUsuario().Logueo(Usu, pass));
        }

        public void Modificar(EntidadesCompartidas.Usuario UnUsuario)
        {
             Persistencia.FabricaPersistencia.GetPersistenciaUsuario().Modificar(UnUsuario);
        }

        public EntidadesCompartidas.Usuario Busco(string UnUsuario)
        {
            return (Persistencia.FabricaPersistencia.GetPersistenciaUsuario().Busco(UnUsuario));
        }

        public void Eliminar(EntidadesCompartidas.Usuario UnUsuario)
        {
            Persistencia.FabricaPersistencia.GetPersistenciaUsuario().Eliminar(UnUsuario);
        }

    }
}
