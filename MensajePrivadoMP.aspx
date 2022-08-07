<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MensajePrivadoMP.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 618px;
        }
        .auto-style2 {
            width: 617px;
        }
        .auto-style3 {
            width: 616px;
        }
        .auto-style4 {
            width: 615px;
            text-align: center;
        }
        .auto-style5 {
            width: 394px;
        }
        .auto-style6 {
            width: 618px;
            text-align: center;
        }
        .auto-style7 {
            width: 616px;
            text-align: center;
        }
        .auto-style8 {
            width: 596px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style6">
                <asp:Label ID="lblTitulo" runat="server" Text="Mensajes Comunes"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblAsunto" runat="server" Text="Asunto:"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtAsunto" runat="server" Width="463px"></asp:TextBox>
            </td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblTexto" runat="server" Text="Texto:"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:TextBox ID="txtMensaje" runat="server" Height="127px" Width="461px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style7">
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="lblReceptores" runat="server" Text="Enviar a :"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtReceptores" runat="server" Width="205px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnAregar" runat="server" Text="Agregar" Width="121px" OnClick="btnAregar_Click" />
            </td>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style9"></td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:ListBox ID="lbReceptores" runat="server" Width="306px"></asp:ListBox>
            </td>
            <td class="auto-style1">
                Fecha :&nbsp;
                <asp:TextBox ID="txtFecha" runat="server" OnTextChanged="txtFecha_TextChanged"></asp:TextBox>
                <asp:TextBox ID="txtHora" runat="server" OnTextChanged="txtHora_TextChanged"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;<asp:Button ID="brnBorrar" runat="server" Text="Borrar" Width="121px" OnClick="brnBorrar_Click" />
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style7">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style8">
                <asp:Button ID="lblLimpiar" runat="server" OnClick="lblLimpiar_Click" Text="Limpiar Todo" Width="107px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style6">
                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" Width="212px" OnClick="btnEnviar_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style6">
                <asp:Label ID="LblError" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

