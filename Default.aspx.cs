using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using Logica;
using EntidadesCompartidas;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Falta Agregar decoracion a los Valores

        string V1 = "";
        string V2 = "";
        string V3 = "";
        Logica.FabricaLogica.GetLogicaEstadisticas().Estadisticas(ref V1, ref V2, ref V3);
        lblCantUsu.Text = V1;
        lblCantMensajesCom.Text = V2;
        lblCantMensajesPriv.Text = V3;

        //Falta TRAER TIPO Y CANTIDAD POR TIPO
        // **  |  **

        if (!IsPostBack)
        {
            Session["Usuario"] = null;
            Limpio();
        }     
    }

    private void Limpio()
    {
        txtContraseña.Text = "";
        txtUsuario.Text = "";
        lblError.Text = "";
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        Limpio();
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string LogUsuario = "";
        string Contraseña = "";
        try
        {
            LogUsuario = txtUsuario.Text;
            Contraseña = txtContraseña.Text;
            EntidadesCompartidas.Usuario unUsu = Logica.FabricaLogica.GetLogicaUsuario().Logueo(LogUsuario, Contraseña);
            if (unUsu != null)
            {
                Session["Usuario"] = unUsu;
                Response.Redirect("Default2.aspx");
            }
            else
                lblError.Text = "Datos Incorrectos no tiene permiso para acceder al sitio";
        }
        catch
        {
            lblError.Text = "No existe el usuario ingresado";
            return;
        }
    }
}