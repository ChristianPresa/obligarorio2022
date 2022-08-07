<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MensajeComunMP.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            width: 481px;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            width: 481px;
        }
        .auto-style4 {
            height: 23px;
            width: 481px;
        }
        .auto-style5 {
            width: 335px;
        }
        .auto-style6 {
            height: 23px;
            width: 335px;
        }
        .auto-style7 {
            width: 335px;
            height: 60px;
        }
        .auto-style8 {
            text-align: center;
            width: 541px;
            height: 60px;
        }
        .auto-style9 {
            height: 60px;
        }
        .auto-style10 {
            margin-left: 0px;
        }
        .auto-style11 {
            height: 23px;
            width: 541px;
            font-weight: bold;
            text-align: center;
        }
        .auto-style12 {
            width: 541px;
            text-align: center;
        }
        .auto-style13 {
            width: 596px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style12">
                <asp:Label ID="Label1" runat="server" Text="Mensajes Comunes"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="Label2" runat="server" Text="Asunto:"></asp:Label>
            </td>
            <td class="auto-style11">
                <asp:TextBox ID="txtAsunto" runat="server" Width="463px"></asp:TextBox>
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Label ID="Label3" runat="server" Text="Texto:"></asp:Label>
            </td>
            <td class="auto-style12">
                <asp:TextBox ID="txtMensaje" runat="server" Height="127px" Width="461px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label4" runat="server" Text="Enviar a :"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtReceptor" runat="server" Width="205px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Width="121px" OnClick="Button1_Click" style="height: 26px" />
            </td>
            <td class="auto-style8">&nbsp;<asp:Label ID="Label5" runat="server" Text="Tipo:"></asp:Label>
            </td>
            <td class="auto-style9"></td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:ListBox ID="lbReceptores" runat="server" Width="306px" OnSelectedIndexChanged="lbReceptores_SelectedIndexChanged" style="height: 70px"></asp:ListBox>
            </td>
            <td class="auto-style12">
                <asp:DropDownList ID="ddlTipo" runat="server" CssClass="auto-style10" Height="18px" Width="287px">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;<asp:Button ID="btnBorrar" runat="server" Text="Borrar" Width="121px" OnClick="Button2_Click" />
            </td>
            <td class="auto-style12">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style12">
                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" Width="212px" OnClick="btnEnviar_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style12">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
</asp:Content>

