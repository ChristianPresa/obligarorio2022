using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AltaUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Limpiar();
        }
    }

    void Limpiar()
    {
        txtUsuario.Text = "";
        txtPassword.Text = "";
        txtNomCompleto.Text = "";
        txtMail.Text = "";
        lblError.Text = "";
    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        try
        {
            EntidadesCompartidas.Usuario Usu = new EntidadesCompartidas.Usuario(txtUsuario.Text, txtPassword.Text, txtNomCompleto.Text, txtMail.Text);
            Logica.FabricaLogica.GetLogicaUsuario().Alta(Usu);
            Limpiar();
            lblError.Text = "Alta con exito";
        }
        catch(Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        Limpiar();
    }
}