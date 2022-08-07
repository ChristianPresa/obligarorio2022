using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    internal class LogicaMensaje:IlogicaMensaje
    {
        private static LogicaMensaje _instancia = null;
        private LogicaMensaje() { }
        public static LogicaMensaje GetInstancia()
        {
            if (_instancia == null)
                _instancia = new LogicaMensaje();

            return _instancia;
        }

        public void Alta(EntidadesCompartidas.Mensaje Mensaje)
        {
            if (Mensaje is EntidadesCompartidas.MensajeComun)
                Persistencia.FabricaPersistencia.GetPersistenciaMensajeComun().AltaMensajeComun((EntidadesCompartidas.MensajeComun)Mensaje);
            else
                Persistencia.FabricaPersistencia.GetPersistenciaMensajePrviado().AltaMensajePrivado((EntidadesCompartidas.MensajePrivado)Mensaje);
        }

    }
}
