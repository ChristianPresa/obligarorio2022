using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public interface IPersistenciaUsuario
    {
        void Alta(EntidadesCompartidas.Usuario unUsu);
        EntidadesCompartidas.Usuario Logueo(string Usu, string Pass);
        void Modificar(EntidadesCompartidas.Usuario UnUsuario);
        EntidadesCompartidas.Usuario Busco(string CodUsuario);
        void Eliminar(EntidadesCompartidas.Usuario UnUsuario);
    }
}
