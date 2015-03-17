<%@ Page Language="C#" MasterPageFile="~/masterpages/MasterPage.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Fnet.Login" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <script type="text/javascript" src="Javascript/MyJavascript/FocusTextBox.js"></script>
     <link href="StyleSheet/HomeStyleSheet.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="Javascript/jquery-1.3.2.min.js"></script>
     <script type="text/javascript"> 
 
                        /*** 
                            Simple jQuery Slideshow Script
                            Released by Jon Raasch (jonraasch.com) under FreeBSD license: free to use or modify, not responsible for anything, etc.  Please link out to me if you like it :)
                        ***/
                         
                        function slideSwitch() {
                            var $active = $('#slideshow IMG.active');
                         
                            if ( $active.length == 0 ) $active = $('#slideshow IMG:last');
                         
                            // use this to pull the images in the order they appear in the markup
                            var $next =  $active.next().length ? $active.next()
                                : $('#slideshow IMG:first');
                         
                            // uncomment the 3 lines below to pull the images in random order
                            
                            // var $sibs  = $active.siblings();
                            // var rndNum = Math.floor(Math.random() * $sibs.length );
                            // var $next  = $( $sibs[ rndNum ] );
                         
                         
                            $active.addClass('last-active');
                         
                            $next.css({opacity: 0.0})
                                .addClass('active')
                                .animate({opacity: 1.0}, 1000, function() {
                                    $active.removeClass('active last-active');
                                });
                        }
                         
                        $(function() {
                            setInterval( "slideSwitch()", 5000 );
                        });
                         
                        </script>
                         
                        <style type="text/css"> 
                         
                            /*
                         
                         set the width and height to match your images 
                        */
                         
                        #slideshow {
                            position:relative;
                            height:359px;
	                        width:657px;
                                top: 0px;
                                left: 155px;
                            }
                         
                        #slideshow IMG {
                            position:absolute;
                            top:2px;
                            left:-125px;
                            z-index:8;
                            opacity:0.0;
                                height: 338px;
                                width: 604px;
                            }
                         
                        #slideshow IMG.active {
                            z-index:10;
                            opacity:1.0;
                                height: 340px;
                                width: 607px;
                            }
                         
                        #slideshow IMG.last-active {
                            z-index:9;
                        }
 
                        </style>
     <style type="text/css">
            .links
            {
                height: 16px;
            }
     </style>
   
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />

<div id="content">
    <div id="groupContent">
        
	    <div id="posts">
	        
	<!-- welcome post -->
		    <div>
			    <h2 class="title" align=center>Welcome to fnet!</h2>
			    <br />
			    <br />
			    <div style="height: 257px">
			        <div id="slideshow">
                        <img src="Images/globe-people-city-globe.JPG" alt="Slideshow Image 1" class="active" />
                        <img src="Images/Shake_hands.jpg" alt="Slideshow Image 2" />
                       <!-- <img src="Images/ssImg32.jpg" alt="Slideshow Image 3" />-->
                    </div>
			    </div>
			    <br />
			    <br />
			    <br />
			    <br />
			    <br />
			    <br />
			    <br />
			    <div>
			        <p>Welcome to Fnet Social Network, one of the first auto enthusiasts content sites with fully integrated social networking features. 
			        It&#39;s a place where people can interact one-on-one. 
                    Members are encouraged to complete their profiles, make friends and comment on 
                    each other&#39;s “walls.”
			        </p>
			    </div>
		    </div>
		    <br />
		    <h2>_____News CORNER__________________________________________</h2>
		    <br />
		    <br />
		    <!-- Daily entry -->
		    <div class="entry">
				<h3><a href="#">CASDASDSAD</a></h3>
					<p class="meta">Sunday, Sep 27, 2009 7:27 AM Posted by&nbsp; <a href="#">Elvin</a></p>
					<div class="entrydetail">
						<p>daasDasDSADASD</p>
						<p class="links"><a href="#">Read More</a></p>
						<br />
					</div>
			</div>
           <div class="entry">
				<h3><a href="#">DSADSASD</a></h3>
					<p class="meta">Sunday, Sep 27, 2009 7:27 AM Posted by&nbsp; <a href="#">Terrence</a></p>
					<div class="entrydetail">
						<p>ASDSADSADSAD</p>
						<p class="links"><a href="#">Read More</a></p>
						<br />
					</div>
			</div>
	    </div>
	
	<!--Login -->
	    <div id="login" style="background-color: #F5FFFA;">
	        <h3 align="left">Log in</h3>
	        <div style="height: 39px">
                <asp:Label ID="user" runat="server" Text="Username: "></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtUserName" runat="server" Width="192px" onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>
            </div>
            <div style="height: 39px">
                <asp:Label ID="pass" runat="server" Text="Password: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtPassword" runat="server" Width="192px" TextMode="Password" onfocus ="Change(this, event)" onblur ="Change(this, event)"></asp:TextBox>
             </div>
             <div>
                <asp:Button ID="signin" runat="server" Text="Sign In" BackColor="#FFCC99" 
                 Width="64px" onclick="signin_Click" />
                 <br />
            <br />
                <font style="color: Red;"><asp:Label runat="server" ID="lblMessage" ></asp:Label></font>
            </div>
	<!-- end # login -->
	<!-- Start the link for registration -->
	        <div style="width: 312px; height: 140px;" id="linktotegistor">
	        <p>&nbsp;</p>
                <p>Not a member?</p>
                <p>Sign up is simple!!!!</p>
                <div><a href="Registration.aspx" id="signUplink">Sign Up</a></div>

            </div>
            <div margine-left="10px">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
                Width="200px">
                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" />
                <WeekendDayStyle BackColor="#FFFFCC" />
                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                <OtherMonthDayStyle ForeColor="#808080" />
                <NextPrevStyle VerticalAlign="Bottom" />
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                </asp:Calendar>
            </div>
            <div style="margin-left: 30px;">
                    <br />
                    <br />
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
	    </div>
    </div>
</div>


</asp:Content>

