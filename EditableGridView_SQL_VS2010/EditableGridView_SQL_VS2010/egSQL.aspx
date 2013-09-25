<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="egSQL.aspx.cs" Inherits="EditableGridView.egSQL" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SQL</title>
    <link rel="stylesheet" href="CSS/Main.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="gvEG" runat="server" AutoGenerateColumns="False" CssClass="grid"
            AlternatingRowStyle-CssClass="gridAltRow" RowStyle-CssClass="gridRow" ShowFooter="True"
            EditRowStyle-CssClass="gridEditRow" FooterStyle-CssClass="gridFooterRow" OnRowCancelingEdit="gvEG_RowCancelingEdit"
            OnRowCommand="gvEG_RowCommand" OnRowDataBound="gvEG_RowDataBound" OnRowDeleting="gvEG_RowDeleting"
            OnRowEditing="gvEG_RowEditing" OnRowUpdating="gvEG_RowUpdating" DataKeyNames="ID,DepartmentId">
            <Columns>
                <asp:TemplateField HeaderText="Employee Code" HeaderStyle-HorizontalAlign="Left"
                    ControlStyle-Width="50px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmployeeCode" runat="server" Text='<%# Bind("EmployeeCode") %>'
                            MaxLength="6" Width="50px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmployeeCode" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtEmployeeCode" ErrorMessage="Please Enter Employee Code"
                            ToolTip="Please Enter Employee Code" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="reEmployeeCode" runat="server" ControlToValidate="txtEmployeeCode"
                            ErrorMessage="Please Enter Only Numbers in Employee Code" ToolTip="Please Enter Only Numbers"
                            SetFocusOnError="true" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="Update">*</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtEmployeeCode" runat="server" MaxLength="6" Width="50px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmployeeCode" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtEmployeeCode" ErrorMessage="Please Enter Employee Code"
                            ToolTip="Please Enter Employee Code" SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="reEmployeeCode" runat="server" ControlToValidate="txtEmployeeCode"
                            ErrorMessage="Please Enter Only Numbers in Employee Code" ToolTip="Please Enter Only Numbers"
                            SetFocusOnError="true" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="Insert">*</asp:RegularExpressionValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("EmployeeCode")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="90px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmployeeName" runat="server" Text='<%# Bind("EmployeeName") %>'
                            Width="90px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmployeeName" ValidationGroup="Update" runat="server"
                            ControlToValidate="txtEmployeeName" ErrorMessage="Please Enter Name" ToolTip="Please Enter Name"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtEmployeeName" runat="server" Width="90px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmployeeName" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtEmployeeName" ErrorMessage="Please Enter Name" ToolTip="Please Enter Name"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <%# Eval("EmployeeName") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Department" HeaderStyle-HorizontalAlign="Left">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlDepartment" runat="server" DataTextField="Name" DataValueField="Id">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# Eval("DepartmentName")%>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlDepartment" runat="server" DataTextField="Name" DataValueField="Id">
                        </asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Group" HeaderStyle-HorizontalAlign="Left">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEmployeeGroup" runat="server" SelectedValue='<%# Eval("EmployeeGroup") %>'>
                            <asp:ListItem Text="User" Value="User"></asp:ListItem>
                            <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                            <asp:ListItem Text="Super User" Value="Super User"></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# Eval("EmployeeGroup")%>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlEmployeeGroup" runat="server">
                            <asp:ListItem Text="User" Value="User" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                            <asp:ListItem Text="Super User" Value="Super User"></asp:ListItem>
                        </asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" HeaderStyle-HorizontalAlign="Left" ControlStyle-Width="100px">
                    <ItemTemplate>
                        <%# Eval("Email")%>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Width="100px" />
                        <asp:RequiredFieldValidator ID="rfvEmail" ValidationGroup="Insert" runat="server"
                            ControlToValidate="txtEmail" ErrorMessage="Please Enter Email" ToolTip="Please Enter Email"
                            SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="reEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Please Enter a Valid Email" ToolTip="Please Enter a Valid Email"
                            SetFocusOnError="true" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ValidationGroup="Insert">*</asp:RegularExpressionValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Active">
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkActive" runat="server" Checked='<%# Eval("isActive") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblActive" runat="server" Text='<%# Eval("isActive") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:CheckBox ID="chkActive" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit" ShowHeader="False" HeaderStyle-HorizontalAlign="Left">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" OnClientClick="return confirm('Update?')" ValidationGroup="Update"></asp:LinkButton>
                        <asp:ValidationSummary ID="vsUpdate" runat="server" ShowMessageBox="true" ShowSummary="false"
                            ValidationGroup="Update" Enabled="true" HeaderText="Validation Summary..." />
                        <asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lnkAdd" runat="server" CausesValidation="True" CommandName="Insert"
                            ValidationGroup="Insert" Text="Insert"></asp:LinkButton>
                        <asp:ValidationSummary ID="vsInsert" runat="server" ShowMessageBox="true" ShowSummary="false"
                            ValidationGroup="Insert" Enabled="true" HeaderText="Validation..." />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete" ShowHeader="False" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" OnClientClick="return confirm('Delete?')"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <table class="grid" cellspacing="0" rules="all" border="1" id="gvEG" style="border-collapse: collapse;">
                    <tr>
                        <th align="left" scope="col">
                            Employee Code
                        </th>
                        <th align="left" scope="col">
                            Name
                        </th>
                        <th align="left" scope="col">
                            Department
                        </th>
                        <th align="left" scope="col">
                            Group
                        </th>
                        <th align="left" scope="col">
                            Email
                        </th>
                        <th scope="col">
                            Ative
                        </th>
                        <th align="left" scope="col">
                            Edit
                        </th>
                        <th scope="col">
                            Delete
                        </th>
                    </tr>
                    <tr class="gridRow">
                        <td colspan="8">
                            No Records found...
                        </td>
                    </tr>
                    <tr class="gridFooterRow">
                        <td>
                            <asp:TextBox ID="txtEmployeeCode" runat="server" MaxLength="6"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmployeeName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlDepartment" runat="server" DataTextField="Name" DataValueField="Id">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlEmployeeGroup" runat="server">
                                <asp:ListItem Text="User" Value="User" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                <asp:ListItem Text="Super User" Value="Super User"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox ID="chkActive" runat="server" />
                        </td>
                        <td colspan="2" align="justify" valign="middle">
                            <asp:LinkButton ID="lnkAdd" runat="server" CausesValidation="false" CommandName="emptyInsert"
                                Text="emptyInsert"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
