using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LblError.Text = "";
        txtFecha.Attributes.Add("Type", "Date");
        txtHora.Attributes.Add("Type", "Time");
    }

    protected void Limpio()
    {
        txtAsunto.Text = "";
        txtReceptores.Text = "";
        txtMensaje.Text = "";
        LblError.Text = "";
    }

    protected void btnAregar_Click(object sender, EventArgs e)
    {
        if (txtReceptores.Text.Trim().Length > 0)
        {
            lbReceptores.Items.Add(txtReceptores.Text.Trim());
            txtReceptores.Text = "";
            LblError.Text = "Se agrego Correctamente el usuario a la Lista";
        }
        else
            LblError.Text = "No Hay nada ingresado - No se agrega a la lista";
    }

    protected void brnBorrar_Click(object sender, EventArgs e)
    {
        if (lbReceptores.SelectedIndex >= 0)
        {
            lbReceptores.Items.RemoveAt(lbReceptores.SelectedIndex);
            LblError.Text = "Eliminacion de la lista con Exito";
        }
        else
            LblError.Text = "Debe seleccionar un emisor para eliminar";
    }

    protected void lblLimpiar_Click(object sender, EventArgs e)
    {
        Limpio();
        lbReceptores.Items.Clear();
        lbReceptores.SelectedIndex = -1;
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        string Hora, fFecha;
        List<EntidadesCompartidas.Usuario> _lista = new List<EntidadesCompartidas.Usuario>();
        try
        {
            fFecha = txtFecha.Text.Trim();
            Hora = txtHora.Text.Trim();
            int[] fecHora = ConvertirFechaHora(fFecha, Hora);
            DateTime fechaHora = new DateTime(fecHora[0], fecHora[1], fecHora[2], fecHora[3], fecHora[4], 0);


            foreach (ListItem Uno in lbReceptores.Items)
                _lista.Add(Persistencia.FabricaPersistencia.GetPersistenciaUsuario().Busco(Uno.Text.Trim()));

       
            var unUsu = (EntidadesCompartidas.Usuario)Session["Usuario"];

            DateTime fecha = DateTime.Now;
            EntidadesCompartidas.MensajePrivado Mensaje = new EntidadesCompartidas.MensajePrivado(0, fecha, txtAsunto.Text, txtMensaje.Text, unUsu, _lista, fechaHora);

            Logica.FabricaLogica.GetLogicaMensaje().Alta(Mensaje);

            LblError.Text = "Alta de mensaje + receptors en Transaccion Logica Correcta";
            Limpio();
        }
        catch (Exception ex)
        {
            LblError.Text = ex.Message;
        }
    }

    private int[] ConvertirFechaHora(string pFecha, string pHoraMinutos)
    {
        int[] resultado = new int[5];
        try
        {
            string[] subFecha = pFecha.Split('-');
            string[] subHoraMin = pHoraMinutos.Split(':');
            resultado[0] = Convert.ToInt32(subFecha[0]);
            resultado[1] = Convert.ToInt32(subFecha[1]);
            resultado[2] = Convert.ToInt32(subFecha[2]);
            resultado[3] = Convert.ToInt32(subHoraMin[0]);
            resultado[4] = Convert.ToInt32(subHoraMin[1]);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        return resultado;
    }



    protected void txtFecha_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtHora_TextChanged(object sender, EventArgs e)
    {

    }
}