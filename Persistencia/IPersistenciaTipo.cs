using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public interface IPersistenciaTipo
    {
        void Alta(EntidadesCompartidas.Tipo Tipo);
        void Eliminar(EntidadesCompartidas.Tipo Tipo);
        EntidadesCompartidas.Tipo Busco(string CodTipo);
        List<EntidadesCompartidas.Tipo> Listo();
    }
}
