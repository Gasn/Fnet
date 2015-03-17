using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace BrisbaneConnect
{
    public partial class _Default : Base
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            WeatherWS.GlobalWeather ws = new BrisbaneConnect.WeatherWS.GlobalWeather();
            Response.Write(ws.GetWeather("Brisbane", "Australia"));           
        }

       
    }
}
