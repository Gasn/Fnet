<%@ Page Language="C#" MasterPageFile="~/masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="contactus.aspx.cs" Inherits="webpages_contactus_contactus" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type ="text/javascript">
    function Change(obj, evt)
    {
        if(evt.type=="focus")
            obj.style.background="#FFFFCC";
        else if(evt.type=="blur")
           obj.style.background="#FFFFFF";
    }
 </script> 
<link href="../Css/contactus.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />

<div id="content">
    <div id="groupContent">
	    <div id="posts">
	    <!-- CONTACT FORM -->
		   <div style="width: 436px">
                <fieldset>
                    <legend style="color: #F49500; font-weight: bold;"><h2>CONTACT US</h2></legend>
                    <br />
                    <div class="field">
                        <div style="width: 370px"><p>Don't hesitate to send us an email if you have a question or a request regarding our 
                            Fnet Social Networking. Please use emailform below.</p></div>
                        <br />
                        <div><asp:Label ID="SName" runat="server" Text="Your name: "></asp:Label></div>
                        <div><asp:TextBox ID="sendername" runat="server" Width="200px" onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>&nbsp;[required]</div>
                        <br />
                        <div><asp:Label ID="SEmail" runat="server" Text="Your email: "></asp:Label></div>
                        <div><asp:TextBox ID="senderemail" runat="server" Width="200px" onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>&nbsp;[required]</div>
                        <br />
                        <div><asp:Label ID="Sub" runat="server" Text="Subject: "></asp:Label></div>
                        <div><asp:TextBox ID="sendersubject" runat="server" Width="200px" onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox></div>
                        <br />
                        <div><asp:Label ID="Econtent" runat="server" Text="MESSAGE/COMMENTS: "></asp:Label></div>
                        <div style="width: 363px">
                            <asp:TextBox ID="emailcontent" runat="server" Height="124px" Width="365px" onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>
                        </div>
                        <br />
                        <div>
                            <asp:Button ID="email" runat="server" Text="Send" BackColor="#FFCC99"/>
                        </div>
                        <br />
                   </div>
                </fieldset>
            </div>

	    </div>
	
	<!--Login -->
	    <div id="col2">
	
	    </div>
	    <div id="col3">
	
	    </div>
    </div>
</div>


</asp:Content>

