using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet _DS;
        if (!IsPostBack)
        {
            ViewState["_DS"] = Logica.FabricaLogica.GetLogicaEstadisticas().Estadisticas2();
            //sacar eso de abajo
            lblError.Text = "";
        }
        else
        {
            _DS = (DataSet)ViewState["_DS"];
        }
        txtFecha.Attributes.Add("Type", "Date");
    }

    private int[] ConvertirFechaHora(string pFecha, string pHoraMinutos)
    {
        int[] resultado = new int[5];
        try
        {
            string[] subFecha = pFecha.Split('-');
            resultado[0] = Convert.ToInt32(subFecha[0]);
            resultado[1] = Convert.ToInt32(subFecha[1]);
            resultado[2] = Convert.ToInt32(subFecha[2]);

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

    protected void gvEntrada_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}