<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BadejaSalida.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            width: 312px;
        }
        .auto-style8 {
            width: 500px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <table style="width: 100%;">
        <tr>
            <td class="auto-style7"></td>
            <td class="auto-style8"><strong>Bandeja de Salida</strong></td>
            <td class="auto-style12"></td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style8"><strong>
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
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style8">
                <asp:GridView ID="gvEntrada" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="498px" OnSelectedIndexChanged="gvEntrada_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="FechHora" HeaderText="Fecha" />
                        <asp:BoundField DataField="Asunto" HeaderText="Asunto" />
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
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7"></td>
            <td class="auto-style8"></td>
            <td class="auto-style20"></td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style8"><strong>
                <asp:Button ID="btnLimpiar" runat="server" CssClass="auto-style4" Text="Limpiar" Width="108px" />
                </strong></td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style8">
                <asp:LinkButton ID="lnkVolver" runat="server">LinkButton</asp:LinkButton>
            </td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style8"><strong>
                <asp:Label ID="lblError" runat="server" BorderColor="Red"></asp:Label>
                </strong></td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

