<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BandejaEntrada.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style7 {
            text-align: center;
            font-size: larger;
            width: 450px;
            height: 24px;
        }
        .auto-style8 {
            width: 327px;
        }
        .auto-style10 {
            width: 450px;
        }
        .auto-style11 {
            width: 327px;
            height: 24px;
            text-align: center;
        }
        .auto-style12 {
            height: 24px;
        }
        .auto-style13 {
            width: 327px;
            height: 23px;
        }
        .auto-style14 {
            width: 450px;
            height: 23px;
            text-align: center;
        }
        .auto-style15 {
            height: 23px;
            text-align: center;
        }
        .auto-style16 {
            text-align: center;
        }
        .auto-style17 {
            width: 327px;
            text-align: center;
        }
        .auto-style18 {
            width: 450px;
            text-align: center;
        }
        .auto-style19 {
            width: 450px;
            height: 23px;
        }
        .auto-style20 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style11"></td>
            <td class="auto-style7"><strong>Bandeja de Entrada</strong></td>
            <td class="auto-style12"></td>
        </tr>
        <tr>
            <td class="auto-style17">&nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
            <td class="auto-style16">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">&nbsp;</td>
            <td class="auto-style14"><strong>
                Fecha:<asp:TextBox ID="txtFecha" runat="server" OnTextChanged="txtFecha_TextChanged" Width="128px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rbComun" runat="server" Text="Comun" />
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButton ID="rbPrivado" runat="server" Text="Privado" />
                </strong></td>
            <td class="auto-style15">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="285px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style10">
                <asp:GridView ID="gvEntrada" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="444px" OnSelectedIndexChanged="gvEntrada_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="FechHora" HeaderText="Fecha" />
                        <asp:BoundField DataField="Asunto" HeaderText="Asunto" />
                        <asp:BoundField DataField="NombreUsuario" HeaderText="Remitente" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
            <td class="auto-style16">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style19"></td>
            <td class="auto-style20"></td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style18"><strong>
                <asp:Button ID="btnLimpiar" runat="server" CssClass="auto-style4" Text="Limpiar" Width="108px" />
                </strong></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style18">
                <asp:LinkButton ID="lnkVolver" runat="server">LinkButton</asp:LinkButton>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style18"><strong>
                <asp:Label ID="lblError" runat="server" BorderColor="Red"></asp:Label>
                </strong></td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

