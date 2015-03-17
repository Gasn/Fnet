﻿<%@ Page Language="C#" MasterPageFile="~/masterpages/masterpageforuser.master" AutoEventWireup="true"
    CodeBehind="UserEditProfile.aspx.cs" Inherits="Fnet.UserEditProfile"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="StyleSheet/UserEditProfile.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheet/jquery-ui-1.7.2.custom.css" />

    <script type="text/javascript" src="Javascript/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" src="Javascript/ui.core.js"></script>

    <script type="text/javascript" src="Javascript/ui.tabs.js"></script>

    <script type="text/javascript" src="Javascript/MyJavascript/FocusTextBox.js"></script>

    <script type="text/javascript" language="javascript">   
 $(function() {       
  $("#tabs").tabs({           
   show: function() {             
      var sel = $('#tabs').tabs('option', 'selected');            
          $("#<%= hidLastTab.ClientID %>").val(sel); }, selected: <%= hidLastTab.Value %> 
          });   
           });
           
    </script>

    <style type="text/css">
        .style1
        {
            width: 88px;
        }
        .style2
        {
            width: 134px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Col1" runat="Server">
<asp:HiddenField runat="server" ID="hidLastTab" Value="0" />
   <p>Username:<br /> <asp:Label ID="lblUserName" runat="server" ></asp:Label></p>
        <table class="userImg">
            <tr align="center">
                <td> <asp:Image ID="imgProfile" AlternateText="Brackets" runat="server" onerror="this.onerror=null;this.src='/Images/default_User.jpg'"  Height="159px" Width="140px" /></td>
            </tr>
        </table>
     <br />
     <div style="background-color: #ddd; border-bottom: solid 1px;"><br /></div>
     <div class="inboxSection">
        <!-- MailBox link is here  -->
         <table  width="100%">
            <tr>
                <td>
                    <img src="Images/letter.png" alt="mailbox"/>&nbsp;
                  <asp:HyperLink ID="HyperLink1" NavigateUrl="UserInbox.aspx" runat="server">MailBox:</asp:HyperLink>
                </td>
                <td class="cols2Message" valign="bottom">
                     <div align="right">
                        New messages (<asp:Label ID="lblUnread" runat="server" Text=""></asp:Label>)
                     </div>
                </td>
            </tr>
           </table>
        
         <!-- Lastest MESSAGE LIST IS HERE -->
         <br />
         <div>
            <div class="lastestMessages">
                <table class="messageTable">
                    <asp:Repeater ID="rptEmail" runat="server">  
                    <ItemTemplate>               
                    <tr>
                        <td class="cols1Message"><%#DataBinder.Eval(Container.DataItem, "NAME")%></td>
                    </tr>
                    <tr>
                        <td class ="cols2Message">
                            Sub: 
                            <%# Eval("SUBJECT")%>
                        </td>
                    </tr></ItemTemplate>   </asp:Repeater>
                </table>
                <br />
            </div>
         
         </div>
         <br />
         <!-- compose message link -->
         <div>
            <img src="Images/pencil.png" alt="mailbox"/>
              <asp:HyperLink ID="HyperLink2" NavigateUrl="UserInbox.aspx" runat="server">Send Email</asp:HyperLink>
         </div>
         <br />
     </div>
     <div style="background-color: #ddd;border-bottom: solid 1px;"><br /></div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Col2" runat="Server">
    <div id="contentEditProfile">
        <div id="tabs">
            <ul>
                <li><a href="#Profile"><span>Profile Info</span></a></li>
                <li><a href="#ChangeDisplayPicture"><span>Profile pictures</span></a></li>
            </ul>
            <!-- UPLOAD PROFILE INFO HERE ............................................................................................................-->
            <div id="Profile">
                <br />
                <div>
                    <!-- USER VIEW THEIR BASIC INFORMATION -->
                    <fieldset class="userinfofield">
                        <legend style="color: #F49500; font-weight: bold;">BASIC INFORMATION</legend>
                        <br />
                        <table align="center" style="width: 406px" cellpadding="5px">
                            <tr>
                                <td class="infocell">
                                    <div>
                                        First Name:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblFirstName" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Last Name:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblLastname" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Birthday:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblDOB" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Email address:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblEmail" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Gender:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblGender" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Address:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblAddress" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Suburb:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblSuburb" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        State:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblState" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Postcode:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblPostalCode" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Country:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="lblCountry" runat="server" ForeColor="Black"></asp:Label></div>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div align="right">
                            <asp:Button ID="editBasicInfo" Text="Edit ?" runat="server" Style="background-color: #FFCC99"
                                OnClick="editBasicInfo_Click"></asp:Button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        <br />
                    </fieldset>
                    <!-- USER EDIT THEIR BASIC INFORMATION -->
                    <asp:Panel runat="server" ID="userEditinfo" Visible="false">
                        <div id="panelBasicInfo" style="background-color: #F5FFFA;">
                            <div>
                            </div>
                            <p style="color: #F49500; font-weight: bold;">
                                &nbsp;&nbsp; Edit information</p>
                            <!-- Error/validation for edit details should be display here -->
                            <p>
                                [ Note: Error/validation of each edit field will be display in this area. Text field,
                                which should be re-edited by user, must be onfocus color background. /DELETE ]
                            </p>
                            <!-- end the error message -->
                            <table align="center" style="width: 475px" cellpadding="5px">
                                <tr>
                                    <td class="infocell">
                                        <div>
                                            First Name:
                                        </div>
                                    </td>
                                    <td colspan="3">
                                        <div>
                                            <asp:TextBox ID="txtFirstName" runat="server" ForeColor="Black" Width="200px" onfocus="Change(this, event)"
                                                onblur="Change(this, event)"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName"
                                                ErrorMessage="This field cannot be blank."></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infocell">
                                        <div>
                                            Last Name:
                                        </div>
                                    </td>
                                    <td colspan="3">
                                        <div>
                                            <asp:TextBox ID="txtLastName" runat="server" ForeColor="Black" Width="200px" onfocus="Change(this, event)"
                                                onblur="Change(this, event)"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName"
                                                ErrorMessage="This field cannot be blank."></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infocell">
                                        <div>
                                            Birthday:
                                        </div>
                                    </td>
                                    <td class="style1">
                                        <div style="width: 63px">
                                            <asp:TextBox ID="userEdateBirth" runat="server" ForeColor="Black" Width="60px"></asp:TextBox></div>
                                    </td>
                                    <td class="style2">
                                        <div>
                                            <asp:DropDownList ID="userEmonthBirth" runat="server">
                                                <asp:ListItem Value="">- Select Month -</asp:ListItem>
                                                <asp:ListItem Value="Jan">January</asp:ListItem>
                                                <asp:ListItem Value="Feb">February</asp:ListItem>
                                                <asp:ListItem Value="Mar">March</asp:ListItem>
                                                <asp:ListItem Value="Apr">April</asp:ListItem>
                                                <asp:ListItem Value="May">May</asp:ListItem>
                                                <asp:ListItem Value="jun">June</asp:ListItem>
                                                <asp:ListItem Value="Jul">July</asp:ListItem>
                                                <asp:ListItem Value="Aug">August</asp:ListItem>
                                                <asp:ListItem Value="Sep">Septemper</asp:ListItem>
                                                <asp:ListItem Value="Oct">October</asp:ListItem>
                                                <asp:ListItem Value="Nov">November</asp:ListItem>
                                                <asp:ListItem Value="Dec">December</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                    <td class="infocell">
                                        <div>
                                            <asp:TextBox ID="userEyearBirth" runat="server" ForeColor="Black" Width="60px"></asp:TextBox>
                                            &nbsp;
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infocell">
                                        <div>
                                        </div>
                                    </td>
                                    <td colspan="3">
                                        (dd/month/yyyy)
                                        <asp:Label ID="lblDOBError" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infocell">
                                        <div>
                                            Gender:
                                        </div>
                                    </td>
                                    <td colspan="3">
                                        <div>
                                            <asp:DropDownList ID="lstGender" runat="server">
                                                <asp:ListItem Value="">- Select One -</asp:ListItem>
                                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Label ID="lblGenderError" runat="server" ForeColor="Red"></asp:Label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infocell">
                                        <div>
                                            Email address
                                        </div>
                                    </td>
                                    <td colspan="3">
                                        <div>
                                            <asp:TextBox ID="txtEmail" runat="server" ForeColor="Black" Width="200px" onfocus="Change(this, event)"
                                                onblur="Change(this, event)"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="lblEmailError" runat="server" ForeColor="Red"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail"
                                                ErrorMessage="This field cannot be blank."></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infocell">
                                        <div>
                                            Address:
                                        </div>
                                    </td>
                                    <td colspan="3">
                                        <div>
                                            <asp:TextBox ID="txtAddress" runat="server" ForeColor="Black" Width="199px" onfocus="Change(this, event)"
                                                onblur="Change(this, event)"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtAddress"
                                                ErrorMessage="This field cannot be blank."></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infocell">
                                        <div>
                                            Suburb:
                                        </div>
                                    </td>
                                    <td colspan="3">
                                        <div>
                                            <asp:TextBox ID="txtSuburb" runat="server" ForeColor="Black" Width="145px" onfocus="Change(this, event)"
                                                onblur="Change(this, event)"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSuburb"
                                                ErrorMessage="This field cannot be blank."></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infocell">
                                        <div>
                                            State:
                                        </div>
                                    </td>
                                    <td colspan="3">
                                        <div>
                                            <asp:TextBox ID="txtState" runat="server" ForeColor="Black" Width="145px" onfocus="Change(this, event)"
                                                onblur="Change(this, event)"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtState"
                                                ErrorMessage="This field cannot be blank."></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infocell">
                                        <div>
                                            Postcode:
                                        </div>
                                    </td>
                                    <td colspan="3">
                                        <div>
                                            <asp:TextBox ID="txtPostalCode" runat="server" ForeColor="Black" Width="100px" onfocus="Change(this, event)"
                                                onblur="Change(this, event)"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPostalCode"
                                                ErrorMessage="This field cannot be blank."></asp:RequiredFieldValidator>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="infocell">
                                        <div>
                                            Country:
                                        </div>
                                    </td>
                                    <td colspan="3">
                                        <div>
                                            <asp:DropDownList ID="lstCountry" runat="server">
                                                <asp:ListItem Value="AF">Afghanistan</asp:ListItem>
                                                <asp:ListItem Value="AL">Albania</asp:ListItem>
                                                <asp:ListItem Value="DZ">Algeria</asp:ListItem>
                                                <asp:ListItem Value="AS">American Samoa</asp:ListItem>
                                                <asp:ListItem Value="AD">Andorra</asp:ListItem>
                                                <asp:ListItem Value="AO">Angola</asp:ListItem>
                                                <asp:ListItem Value="AI">Anguilla</asp:ListItem>
                                                <asp:ListItem Value="AQ">Antarctica</asp:ListItem>
                                                <asp:ListItem Value="AG">Antigua And Barbuda</asp:ListItem>
                                                <asp:ListItem Value="AR">Argentina</asp:ListItem>
                                                <asp:ListItem Value="AM">Armenia</asp:ListItem>
                                                <asp:ListItem Value="AW">Aruba</asp:ListItem>
                                                <asp:ListItem Value="AU" Selected="True">Australia</asp:ListItem>
                                                <asp:ListItem Value="AT">Austria</asp:ListItem>
                                                <asp:ListItem Value="AZ">Azerbaijan</asp:ListItem>
                                                <asp:ListItem Value="BS">Bahamas</asp:ListItem>
                                                <asp:ListItem Value="BH">Bahrain</asp:ListItem>
                                                <asp:ListItem Value="BD">Bangladesh</asp:ListItem>
                                                <asp:ListItem Value="BB">Barbados</asp:ListItem>
                                                <asp:ListItem Value="BY">Belarus</asp:ListItem>
                                                <asp:ListItem Value="BE">Belgium</asp:ListItem>
                                                <asp:ListItem Value="BZ">Belize</asp:ListItem>
                                                <asp:ListItem Value="BJ">Benin</asp:ListItem>
                                                <asp:ListItem Value="BM">Bermuda</asp:ListItem>
                                                <asp:ListItem Value="BT">Bhutan</asp:ListItem>
                                                <asp:ListItem Value="BO">Bolivia</asp:ListItem>
                                                <asp:ListItem Value="BA">Bosnia And Herzegowina</asp:ListItem>
                                                <asp:ListItem Value="BW">Botswana</asp:ListItem>
                                                <asp:ListItem Value="BV">Bouvet Island</asp:ListItem>
                                                <asp:ListItem Value="BR">Brazil</asp:ListItem>
                                                <asp:ListItem Value="IO">British Indian Ocean Territory</asp:ListItem>
                                                <asp:ListItem Value="BN">Brunei Darussalam</asp:ListItem>
                                                <asp:ListItem Value="BG">Bulgaria</asp:ListItem>
                                                <asp:ListItem Value="BF">Burkina Faso</asp:ListItem>
                                                <asp:ListItem Value="BI">Burundi</asp:ListItem>
                                                <asp:ListItem Value="KH">Cambodia</asp:ListItem>
                                                <asp:ListItem Value="CM">Cameroon</asp:ListItem>
                                                <asp:ListItem Value="CA">Canada</asp:ListItem>
                                                <asp:ListItem Value="CV">Cape Verde</asp:ListItem>
                                                <asp:ListItem Value="KY">Cayman Islands</asp:ListItem>
                                                <asp:ListItem Value="CF">Central African Republic</asp:ListItem>
                                                <asp:ListItem Value="TD">Chad</asp:ListItem>
                                                <asp:ListItem Value="CL">Chile</asp:ListItem>
                                                <asp:ListItem Value="CN">China</asp:ListItem>
                                                <asp:ListItem Value="CX">Christmas Island</asp:ListItem>
                                                <asp:ListItem Value="CC">Cocos (Keeling) Islands</asp:ListItem>
                                                <asp:ListItem Value="CO">Colombia</asp:ListItem>
                                                <asp:ListItem Value="KM">Comoros</asp:ListItem>
                                                <asp:ListItem Value="CG">Congo</asp:ListItem>
                                                <asp:ListItem Value="CK">Cook Islands</asp:ListItem>
                                                <asp:ListItem Value="CR">Costa Rica</asp:ListItem>
                                                <asp:ListItem Value="CI">Cote D'Ivoire</asp:ListItem>
                                                <asp:ListItem Value="HR">Croatia (Local Name: Hrvatska)</asp:ListItem>
                                                <asp:ListItem Value="CU">Cuba</asp:ListItem>
                                                <asp:ListItem Value="CY">Cyprus</asp:ListItem>
                                                <asp:ListItem Value="CZ">Czech Republic</asp:ListItem>
                                                <asp:ListItem Value="DK">Denmark</asp:ListItem>
                                                <asp:ListItem Value="DJ">Djibouti</asp:ListItem>
                                                <asp:ListItem Value="DM">Dominica</asp:ListItem>
                                                <asp:ListItem Value="DO">Dominican Republic</asp:ListItem>
                                                <asp:ListItem Value="TP">East Timor</asp:ListItem>
                                                <asp:ListItem Value="EC">Ecuador</asp:ListItem>
                                                <asp:ListItem Value="EG">Egypt</asp:ListItem>
                                                <asp:ListItem Value="SV">El Salvador</asp:ListItem>
                                                <asp:ListItem Value="GQ">Equatorial Guinea</asp:ListItem>
                                                <asp:ListItem Value="ER">Eritrea</asp:ListItem>
                                                <asp:ListItem Value="EE">Estonia</asp:ListItem>
                                                <asp:ListItem Value="ET">Ethiopia</asp:ListItem>
                                                <asp:ListItem Value="FK">Falkland Islands (Malvinas)</asp:ListItem>
                                                <asp:ListItem Value="FO">Faroe Islands</asp:ListItem>
                                                <asp:ListItem Value="FJ">Fiji</asp:ListItem>
                                                <asp:ListItem Value="FI">Finland</asp:ListItem>
                                                <asp:ListItem Value="FR">France</asp:ListItem>
                                                <asp:ListItem Value="GF">French Guiana</asp:ListItem>
                                                <asp:ListItem Value="PF">French Polynesia</asp:ListItem>
                                                <asp:ListItem Value="TF">French Southern Territories</asp:ListItem>
                                                <asp:ListItem Value="GA">Gabon</asp:ListItem>
                                                <asp:ListItem Value="GM">Gambia</asp:ListItem>
                                                <asp:ListItem Value="GE">Georgia</asp:ListItem>
                                                <asp:ListItem Value="DE">Germany</asp:ListItem>
                                                <asp:ListItem Value="GH">Ghana</asp:ListItem>
                                                <asp:ListItem Value="GI">Gibraltar</asp:ListItem>
                                                <asp:ListItem Value="GR">Greece</asp:ListItem>
                                                <asp:ListItem Value="GL">Greenland</asp:ListItem>
                                                <asp:ListItem Value="GD">Grenada</asp:ListItem>
                                                <asp:ListItem Value="GP">Guadeloupe</asp:ListItem>
                                                <asp:ListItem Value="GU">Guam</asp:ListItem>
                                                <asp:ListItem Value="GT">Guatemala</asp:ListItem>
                                                <asp:ListItem Value="GN">Guinea</asp:ListItem>
                                                <asp:ListItem Value="GW">Guinea-Bissau</asp:ListItem>
                                                <asp:ListItem Value="GY">Guyana</asp:ListItem>
                                                <asp:ListItem Value="HT">Haiti</asp:ListItem>
                                                <asp:ListItem Value="HM">Heard And Mc Donald Islands</asp:ListItem>
                                                <asp:ListItem Value="VA">Holy See (Vatican City State)</asp:ListItem>
                                                <asp:ListItem Value="HN">Honduras</asp:ListItem>
                                                <asp:ListItem Value="HK">Hong Kong</asp:ListItem>
                                                <asp:ListItem Value="HU">Hungary</asp:ListItem>
                                                <asp:ListItem Value="IS">Icel And</asp:ListItem>
                                                <asp:ListItem Value="IN">India</asp:ListItem>
                                                <asp:ListItem Value="ID">Indonesia</asp:ListItem>
                                                <asp:ListItem Value="IR">Iran (Islamic Republic Of)</asp:ListItem>
                                                <asp:ListItem Value="IQ">Iraq</asp:ListItem>
                                                <asp:ListItem Value="IE">Ireland</asp:ListItem>
                                                <asp:ListItem Value="IL">Israel</asp:ListItem>
                                                <asp:ListItem Value="IT">Italy</asp:ListItem>
                                                <asp:ListItem Value="JM">Jamaica</asp:ListItem>
                                                <asp:ListItem Value="JP">Japan</asp:ListItem>
                                                <asp:ListItem Value="JO">Jordan</asp:ListItem>
                                                <asp:ListItem Value="KZ">Kazakhstan</asp:ListItem>
                                                <asp:ListItem Value="KE">Kenya</asp:ListItem>
                                                <asp:ListItem Value="KI">Kiribati</asp:ListItem>
                                                <asp:ListItem Value="KP">Korea, Dem People'S Republic</asp:ListItem>
                                                <asp:ListItem Value="KR">Korea, Republic Of</asp:ListItem>
                                                <asp:ListItem Value="KW">Kuwait</asp:ListItem>
                                                <asp:ListItem Value="KG">Kyrgyzstan</asp:ListItem>
                                                <asp:ListItem Value="LA">Lao People'S Dem Republic</asp:ListItem>
                                                <asp:ListItem Value="LV">Latvia</asp:ListItem>
                                                <asp:ListItem Value="LB">Lebanon</asp:ListItem>
                                                <asp:ListItem Value="LS">Lesotho</asp:ListItem>
                                                <asp:ListItem Value="LR">Liberia</asp:ListItem>
                                                <asp:ListItem Value="LY">Libyan Arab Jamahiriya</asp:ListItem>
                                                <asp:ListItem Value="LI">Liechtenstein</asp:ListItem>
                                                <asp:ListItem Value="LT">Lithuania</asp:ListItem>
                                                <asp:ListItem Value="LU">Luxembourg</asp:ListItem>
                                                <asp:ListItem Value="MO">Macau</asp:ListItem>
                                                <asp:ListItem Value="MK">Macedonia</asp:ListItem>
                                                <asp:ListItem Value="MG">Madagascar</asp:ListItem>
                                                <asp:ListItem Value="MW">Malawi</asp:ListItem>
                                                <asp:ListItem Value="MY">Malaysia</asp:ListItem>
                                                <asp:ListItem Value="MV">Maldives</asp:ListItem>
                                                <asp:ListItem Value="ML">Mali</asp:ListItem>
                                                <asp:ListItem Value="MT">Malta</asp:ListItem>
                                                <asp:ListItem Value="MH">Marshall Islands</asp:ListItem>
                                                <asp:ListItem Value="MQ">Martinique</asp:ListItem>
                                                <asp:ListItem Value="MR">Mauritania</asp:ListItem>
                                                <asp:ListItem Value="MU">Mauritius</asp:ListItem>
                                                <asp:ListItem Value="YT">Mayotte</asp:ListItem>
                                                <asp:ListItem Value="MX">Mexico</asp:ListItem>
                                                <asp:ListItem Value="FM">Micronesia, Federated States</asp:ListItem>
                                                <asp:ListItem Value="MD">Moldova, Republic Of</asp:ListItem>
                                                <asp:ListItem Value="MC">Monaco</asp:ListItem>
                                                <asp:ListItem Value="MN">Mongolia</asp:ListItem>
                                                <asp:ListItem Value="MS">Montserrat</asp:ListItem>
                                                <asp:ListItem Value="MA">Morocco</asp:ListItem>
                                                <asp:ListItem Value="MZ">Mozambique</asp:ListItem>
                                                <asp:ListItem Value="MM">Myanmar</asp:ListItem>
                                                <asp:ListItem Value="NA">Namibia</asp:ListItem>
                                                <asp:ListItem Value="NR">Nauru</asp:ListItem>
                                                <asp:ListItem Value="NP">Nepal</asp:ListItem>
                                                <asp:ListItem Value="NL">Netherlands</asp:ListItem>
                                                <asp:ListItem Value="AN">Netherlands Ant Illes</asp:ListItem>
                                                <asp:ListItem Value="NC">New Caledonia</asp:ListItem>
                                                <asp:ListItem Value="NZ">New Zealand</asp:ListItem>
                                                <asp:ListItem Value="NI">Nicaragua</asp:ListItem>
                                                <asp:ListItem Value="NE">Niger</asp:ListItem>
                                                <asp:ListItem Value="NG">Nigeria</asp:ListItem>
                                                <asp:ListItem Value="NU">Niue</asp:ListItem>
                                                <asp:ListItem Value="NF">Norfolk Island</asp:ListItem>
                                                <asp:ListItem Value="MP">Northern Mariana Islands</asp:ListItem>
                                                <asp:ListItem Value="NO">Norway</asp:ListItem>
                                                <asp:ListItem Value="OM">Oman</asp:ListItem>
                                                <asp:ListItem Value="PK">Pakistan</asp:ListItem>
                                                <asp:ListItem Value="PW">Palau</asp:ListItem>
                                                <asp:ListItem Value="PA">Panama</asp:ListItem>
                                                <asp:ListItem Value="PG">Papua New Guinea</asp:ListItem>
                                                <asp:ListItem Value="PY">Paraguay</asp:ListItem>
                                                <asp:ListItem Value="PE">Peru</asp:ListItem>
                                                <asp:ListItem Value="PH">Philippines</asp:ListItem>
                                                <asp:ListItem Value="PN">Pitcairn</asp:ListItem>
                                                <asp:ListItem Value="PL">Poland</asp:ListItem>
                                                <asp:ListItem Value="PT">Portugal</asp:ListItem>
                                                <asp:ListItem Value="PR">Puerto Rico</asp:ListItem>
                                                <asp:ListItem Value="QA">Qatar</asp:ListItem>
                                                <asp:ListItem Value="RE">Reunion</asp:ListItem>
                                                <asp:ListItem Value="RO">Romania</asp:ListItem>
                                                <asp:ListItem Value="RU">Russian Federation</asp:ListItem>
                                                <asp:ListItem Value="RW">Rwanda</asp:ListItem>
                                                <asp:ListItem Value="KN">Saint K Itts And Nevis</asp:ListItem>
                                                <asp:ListItem Value="LC">Saint Lucia</asp:ListItem>
                                                <asp:ListItem Value="VC">Saint Vincent, The Grenadines</asp:ListItem>
                                                <asp:ListItem Value="WS">Samoa</asp:ListItem>
                                                <asp:ListItem Value="SM">San Marino</asp:ListItem>
                                                <asp:ListItem Value="ST">Sao Tome And Principe</asp:ListItem>
                                                <asp:ListItem Value="SA">Saudi Arabia</asp:ListItem>
                                                <asp:ListItem Value="SN">Senegal</asp:ListItem>
                                                <asp:ListItem Value="SC">Seychelles</asp:ListItem>
                                                <asp:ListItem Value="SL">Sierra Leone</asp:ListItem>
                                                <asp:ListItem Value="SG">Singapore</asp:ListItem>
                                                <asp:ListItem Value="SK">Slovakia (Slovak Republic)</asp:ListItem>
                                                <asp:ListItem Value="SI">Slovenia</asp:ListItem>
                                                <asp:ListItem Value="SB">Solomon Islands</asp:ListItem>
                                                <asp:ListItem Value="SO">Somalia</asp:ListItem>
                                                <asp:ListItem Value="ZA">South Africa</asp:ListItem>
                                                <asp:ListItem Value="GS">South Georgia , S Sandwich Is.</asp:ListItem>
                                                <asp:ListItem Value="ES">Spain</asp:ListItem>
                                                <asp:ListItem Value="LK">Sri Lanka</asp:ListItem>
                                                <asp:ListItem Value="SH">St. Helena</asp:ListItem>
                                                <asp:ListItem Value="PM">St. Pierre And Miquelon</asp:ListItem>
                                                <asp:ListItem Value="SD">Sudan</asp:ListItem>
                                                <asp:ListItem Value="SR">Suriname</asp:ListItem>
                                                <asp:ListItem Value="SJ">Svalbard, Jan Mayen Islands</asp:ListItem>
                                                <asp:ListItem Value="SZ">Sw Aziland</asp:ListItem>
                                                <asp:ListItem Value="SE">Sweden</asp:ListItem>
                                                <asp:ListItem Value="CH">Switzerland</asp:ListItem>
                                                <asp:ListItem Value="SY">Syrian Arab Republic</asp:ListItem>
                                                <asp:ListItem Value="TW">Taiwan</asp:ListItem>
                                                <asp:ListItem Value="TJ">Tajikistan</asp:ListItem>
                                                <asp:ListItem Value="TZ">Tanzania, United Republic Of</asp:ListItem>
                                                <asp:ListItem Value="TH">Thailand</asp:ListItem>
                                                <asp:ListItem Value="TG">Togo</asp:ListItem>
                                                <asp:ListItem Value="TK">Tokelau</asp:ListItem>
                                                <asp:ListItem Value="TO">Tonga</asp:ListItem>
                                                <asp:ListItem Value="TT">Trinidad And Tobago</asp:ListItem>
                                                <asp:ListItem Value="TN">Tunisia</asp:ListItem>
                                                <asp:ListItem Value="TR">Turkey</asp:ListItem>
                                                <asp:ListItem Value="TM">Turkmenistan</asp:ListItem>
                                                <asp:ListItem Value="TC">Turks And Caicos Islands</asp:ListItem>
                                                <asp:ListItem Value="TV">Tuvalu</asp:ListItem>
                                                <asp:ListItem Value="UG">Uganda</asp:ListItem>
                                                <asp:ListItem Value="UA">Ukraine</asp:ListItem>
                                                <asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>
                                                <asp:ListItem Value="GB">United Kingdom</asp:ListItem>
                                                <asp:ListItem Value="US">United States</asp:ListItem>
                                                <asp:ListItem Value="UM">United States Minor Is.</asp:ListItem>
                                                <asp:ListItem Value="UY">Uruguay</asp:ListItem>
                                                <asp:ListItem Value="UZ">Uzbekistan</asp:ListItem>
                                                <asp:ListItem Value="VU">Vanuatu</asp:ListItem>
                                                <asp:ListItem Value="VE">Venezuela</asp:ListItem>
                                                <asp:ListItem Value="VN">Viet Nam</asp:ListItem>
                                                <asp:ListItem Value="VG">Virgin Islands (British)</asp:ListItem>
                                                <asp:ListItem Value="VI">Virgin Islands (U.S.)</asp:ListItem>
                                                <asp:ListItem Value="WF">Wallis And Futuna Islands</asp:ListItem>
                                                <asp:ListItem Value="EH">Western Sahara</asp:ListItem>
                                                <asp:ListItem Value="YE">Yemen</asp:ListItem>
                                                <asp:ListItem Value="YU">Yugoslavia</asp:ListItem>
                                                <asp:ListItem Value="ZR">Zaire</asp:ListItem>
                                                <asp:ListItem Value="ZM">Zambia</asp:ListItem>
                                                <asp:ListItem Value="ZW">Zimbabwe</asp:ListItem>
                                            </asp:DropDownList>
                                            &nbsp; (Optional)
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <br></br>
                            <div align="center">
                                <asp:Label ID="lblUpdateBasicInformation" runat="server" Text=""></asp:Label>
                            </div>
                            <br />
                            <div align="right">
                                <asp:Button ID="saveBasicInfo" Text="Save Change" runat="server" Style="background-color: #FFCC99"
                                    OnClick="saveBasicInfo_Click"></asp:Button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="cancelEditBasicInfo" Text="Cancel" runat="server" Style="background-color: #FFCC99"
                                    OnClick="cancelEditBasicInfo_Click"></asp:Button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="doneEditBasicInfo" Text="Done Edit" runat="server" Style="background-color: #FFCC99"
                                    OnClick="doneEditBasicInfo_Click"></asp:Button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                            <br />
                        </div>
                    </asp:Panel>
                    <br />
                    <!-- USER VIEW THEIR INTEREST INFORMATION -->
                    <fieldset class="userinfofield">
                        <legend style="color: #F49500; font-weight: bold;">PERSONAL INTEREST</legend>
                        <br />
                        <table align="center" style="width: 406px" cellpadding="5px" class="userVIn">
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Looking for:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:BulletedList ForeColor="Black" ID="lstLookingFor" DataTextField="LOOKING_TYPE"
                                            runat="server">
                                        </asp:BulletedList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                    Interest in:
                                </td>
                                <td>
                                    <div>
                                        <asp:BulletedList ForeColor="Black" ID="lstInterest" DataTextField="HOBBY_NAME" runat="server">
                                        </asp:BulletedList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                        Relationship status:
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        <asp:Label ID="result" runat="server"></asp:Label>
                                        <asp:BulletedList ID="rList" runat="server" DataTextField="Relation_Type_ID">
                                        </asp:BulletedList>
                                        <asp:BulletedList ID="rWith" runat="server">
                                        </asp:BulletedList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="infocell">
                                    <div>
                                    </div>
                                </td>
                                <td>
                                    <div>
                                        &nbsp;</div>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div align="right">
                            <asp:Button ID="editInterest" Text="Edit ?" runat="server" Style="background-color: #FFCC99"
                                OnClick="editInterest_Click"></asp:Button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        <br />
                    </fieldset>
                    <br />
                    <!-- EDIT INTEREST INFO -->
                    <asp:Panel runat="server" ID="userEditInterest" Visible="false">
                        <div id="panelInterestInfo" style="background-color: #f5fffa;">
                            <br />
                            <p style="color: #F49500; font-weight: bold;">
                                &nbsp;&nbsp; Edit interest information</p>
                            <table align="center" style="width: 475px;" cellpadding="5px">
                                <tr class="rowinfo">
                                    <td class="infocell2" valign="top">
                                        <div>
                                            Looking for:
                                        </div>
                                    </td>
                                    <td class="infocell2">
                                        <div>
                                            <asp:CheckBoxList ID="chkLookingFor" DataValueField="LOOKING_FOR_ID" DataTextField="LOOKING_TYPE"
                                                runat="server" Width="161px">
                                            </asp:CheckBoxList>
                                            <br />
                                        </div>
                                    </td>
                                </tr>
                                <tr class="rowinfo">
                                    <td class="infocell2" valign="top">
                                        <div>
                                            Interest in:
                                        </div>
                                    </td>
                                    <td class="infocell2">
                                        <div>
                                            <asp:CheckBoxList ID="chkInterest" runat="server" DataTextField="HOBBY_NAME" DataValueField="HOBBY_ID"
                                                Width="215px" Height="281px">
                                            </asp:CheckBoxList>
                                            <br />
                                        </div>
                                    </td>
                                </tr>
                                <tr class="rowinfo">
                                    <td class="infocell2" valign="top">
                                        <div>
                                            Relationship status:
                                        </div>
                                    </td>
                                    <td class="infocell2">
                                        <div>
                                            <%--  <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="220px">
                                                <asp:ListItem Value="2"> I love single</asp:ListItem>
                                                <asp:ListItem Value="3"> I am in love</asp:ListItem>
                                                <asp:ListItem Value="4"> I am engaged</asp:ListItem>
                                                <asp:ListItem Value="5"> I am married</asp:ListItem>
                                                <asp:ListItem Value="6"> I am widow</asp:ListItem>
                                                <asp:ListItem Value="7"> I am not intested in relationship</asp:ListItem>
                                                <asp:ListItem Value="8"> It is complated and long story</asp:ListItem>
                                            </asp:RadioButtonList>--%>
                                            <br />
                                            <br />
                                        </div>
                                    </td>
                                </tr>
                                <tr class="rowinfo">
                                    <td class="infocell">
                                        <div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <br />
                                            Request Relationship here<br />
                                            <br />
                                            <asp:DropDownList ID="RELATIONSHIP_TYPE" runat="server" 
                                                DataTextField="RELATION_TYPE_NAME" DataValueField="RELATION_TYPE_ID">
                                            </asp:DropDownList>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="lblOf" runat="server" Text="of"></asp:Label>
                                            &nbsp;&nbsp;&nbsp; <asp:DropDownList ID="Friend_List" runat="server" DataTextField="FriendFullName" DataValueField="FRIEND_ID">
                                            </asp:DropDownList>
                                            <br />
                                            <br />
                                            <asp:Button ID="RequestButton" runat="server" onclick="RequestButton_Click" 
                                                Text="Request" />
                                            <br />
                                            <br />
                                            <asp:Label ID="lblResult" runat="server"></asp:Label>
                                        </div>
                                     
                                    </td>
                                </tr>
                                <tr class="rowinfo">
                                    <td class="infocell">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <br />
                            <div align="right">
                                <asp:Button ID="saveEditInterest" Text="Save Change" runat="server" Style="background-color: #FFCC99"
                                    OnClick="saveEditInterest_Click"></asp:Button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="cancelEditInterest" Text="Cancel" runat="server" Style="background-color: #FFCC99"
                                    OnClick="cancelEditInterest_Click"></asp:Button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="donEditInterest" Text="Done Edit" runat="server" Style="background-color: #FFCC99"
                                    OnClick="doneEditInterest_Click"></asp:Button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
                            </div>
                            <br />
                        </div>
                    </asp:Panel>
                    <br />
                </div>
            </div>
            <!-- UPLOAD PHOTO IS HERE...............................................................................................................-->
            <div id="ChangeDisplayPicture">
                <div class="userinfofield">
                    <br />
                    <p>
                        Use profile picture to show who you are on BSN./p>
                        <div>
                            <p style="color: #F49500; font-weight: bold;">
                                1. Your current picture</p>
                            <div>
                                <!-- current pic -->
                                <table id="borderpicture">
                                    <tr>
                                        <td>
                                            <asp:Image ID="imgProfileNew" runat="server" onerror="this.onerror=null;this.src='Images/default_User.jpg'"
                                                Height="160px" Width="140px" />
                                            
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br />
                        </div>
                        <div style="background-color: #f5fffa;">
                            <p style="color: #F49500; font-weight: bold;">
                                2. Choose a photo for your profile picture:
                            </p>
                            <asp:FileUpload ID="uploadPic" runat="server" />
                            <asp:Label ID="lblPicError" runat="server" ForeColor="Red"></asp:Label>
                            <br />
                            Size limit: 4 MB<br />
                            &nbsp;<br />
                            <asp:Button ID="btnUpload" runat="server" Text="Upload" Style="background-color: #FFCC99"
                                OnClick="btnUpload_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            <br />
                        </div>
                </div>
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Col3" runat="Server">
   <br />
    <br />
    <br />
    <br />
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
        BorderColor="#999999" CellPadding="2" DayNameFormat="Shortest" 
        Font-Names="Verdana" Font-Size="6pt" ForeColor="Black" Height="118px" 
        Width="130px">
        <SelectedDayStyle BackColor="#444444" Font-Bold="True" ForeColor="White" />
        <SelectorStyle BackColor="#CCCCCC" />
        <WeekendDayStyle BackColor="#FFFFCC" />
        <TodayDayStyle BackColor="#AAAFFB" ForeColor="Black" />
        <OtherMonthDayStyle ForeColor="#808080" />
        <NextPrevStyle VerticalAlign="Bottom" />
        <DayHeaderStyle BackColor="#ABABAB" Font-Bold="True" Font-Size="7pt" />
        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
    </asp:Calendar>
    <br />
    <div style="background-color: #ddd;border-bottom: solid 1px;"><br /></div>
    <div style="margin-left: 2px;">
        <br />
        
        External links<br />
        <ul style="margin-left: 5px;" width="100%">
            <li><a href="#">Travel</a></li>
                        <li><a href="#">Entertainment</a></li>            
                        <li><a href="#">Education</a></li>
                        <li><a href="#">Enviroment</a></li>
                        <li><a href="#">Economics</a></li>
        </ul>
    </div>
</asp:Content>