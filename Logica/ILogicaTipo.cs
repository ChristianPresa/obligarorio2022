using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public interface ILogicaTipo
    {
        void Alta(EntidadesCompartidas.Tipo Tipo);
        List<EntidadesCompartidas.Tipo> Listo();
        EntidadesCompartidas.Tipo Busco(string tipo);
        void Eliminar(EntidadesCompartidas.Tipo Tipo);
    }
}
