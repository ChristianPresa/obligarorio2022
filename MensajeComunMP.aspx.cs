using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {  
                cargoDDL();
                Limpio();
            }
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {   
        if (txtReceptor.Text.Trim().Length > 0)
        {
            lbReceptores.Items.Add(txtReceptor.Text.Trim());
            txtReceptor.Text = "";
            lblError.Text = "Se agrego un destinatario a la lista.";
        }
        else
            lblError.Text = "No Hay nada ingresado - No se agrega a la lista";

    }

    protected void Limpio()
    {
        txtMensaje.Text = "";
        txtReceptor.Text = "";
        txtAsunto.Text = "";
        lblError.Text = "";
        ddlTipo.SelectedIndex = 0;
    }

    protected void cargoDDL()
    {
        ddlTipo.DataSource = Logica.FabricaLogica.GetLogicaTipo().Listo();
        ddlTipo.DataTextField = "Nombre";
        ddlTipo.DataValueField = "Codigo";
        ddlTipo.DataBind();

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            if (lbReceptores.SelectedIndex >= 0)
            {
                lbReceptores.Items.RemoveAt(lbReceptores.SelectedIndex);
                lblError.Text = "Eliminacion con exito";
            }
            else
                lbReceptores.Text = "Debe Seleccionar un emisor para borrar";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        List<EntidadesCompartidas.Usuario> _lista = new List<EntidadesCompartidas.Usuario>();
        try
        {
            foreach (ListItem Uno in lbReceptores.Items)
                _lista.Add(Persistencia.FabricaPersistencia.GetPersistenciaUsuario().Busco(Uno.Text.Trim()));

            DateTime fecha = DateTime.Now;
            var unUsu = (EntidadesCompartidas.Usuario)Session["Usuario"];
            EntidadesCompartidas.Tipo Tipo = Logica.FabricaLogica.GetLogicaTipo().Busco(ddlTipo.SelectedValue);

            EntidadesCompartidas.MensajeComun Mensaje = new EntidadesCompartidas.MensajeComun(0, fecha, txtAsunto.Text, txtMensaje.Text, unUsu, _lista,Tipo);

            Logica.FabricaLogica.GetLogicaMensaje().Alta(Mensaje);

            lblError.Text = "Alta de mensaje + receptors en Transaccion Logica Correcta";
            Limpio();   
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }

    protected void lbReceptores_SelectedIndexChanged(object sender, EventArgs e)
    {     

    }
}