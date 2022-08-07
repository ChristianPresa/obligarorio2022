﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
        .auto-style2 {
            height: 23px;
            text-align: center;
        }
        .auto-style3 {
            height: 24px;
            text-align: center;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style5 {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblCantUsu" runat="server"></asp:Label>
&nbsp;<asp:Label ID="lblCantMensajesCom" runat="server"></asp:Label>
&nbsp;<asp:Label ID="lblCantMensajesPriv" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Font-Size="Large" 
                    Text="Bienvenido a su mensajeria"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                <strong>
                <asp:Label ID="lblUsuairo" runat="server" Text="Usuario:"></asp:Label>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <strong>
                <asp:Label ID="lblContraseña" runat="server" Text="Contraseña:"></asp:Label>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:TextBox ID="txtContraseña" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <strong>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="auto-style5" />
                </strong>&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" 
                    onclick="btnLimpiar_Click" CssClass="auto-style5" />
                </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:LinkButton ID="lnkRegistrarse" runat="server" PostBackUrl="~/AltaUsuario.aspx">Registrarse</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
        </tr>
        </table>
    </form>
</body>
</html>
