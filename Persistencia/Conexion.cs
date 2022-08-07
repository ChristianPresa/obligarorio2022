using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    internal class Conexion
    {

        internal static string _cnn = "Data Source=.;Initial Catalog=Mensajes;Integrated Security=True"; 
        public static string Cnn
        {
            get { return _cnn; }
        }

        /*internal static string Cnn(EntidadesCompartidas.Usuario pUsu = null)
        {
            if (pUsu == null)
                return "Data Source =.; Initial Catalog = Mensajes; Integrated Security = true";
            else
                return "Data Source =.; Initial Catalog = Mensajes; User='" + pUsu.NombreUsuario + "'; Password='" + pUsu.Password + "'";
            //van comillas simples porque se manejan siempre entre comillas Simples
        }*/
    }
}
