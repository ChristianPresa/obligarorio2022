using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public interface ILogicaUsuario
    {
        void Alta(EntidadesCompartidas.Usuario unUsu);
        EntidadesCompartidas.Usuario Logueo(string usu, string pass);
        void Modificar(EntidadesCompartidas.Usuario UnUsuario);
        EntidadesCompartidas.Usuario Busco(string CodUsuario);
        void Eliminar(EntidadesCompartidas.Usuario UnUsuario);
    }
}
