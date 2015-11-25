using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.AboutUs {
    public partial class WorshipServices : BasePage  {
        protected void Page_Load(object sender, EventArgs e) {
            /*
             * WWB - 12/12/2009 - Changed google API key to domain: www.shiloh2000.com and inserted
             * into the script tag below.  The following key is the old key:
             * 
             * ABQIAAAAWudLBBPP2Hm6IuGjr5nbAxTt-YYh1-wKBrO4b2sMn8RfzfuV7xT-i1-7tdYIKK0AfkKJ3tIZcYqQJw            
             */
            string source = "<script src='http://maps.google.com/maps?file=api&v=2&key=ABQIAAAACl8f4Ddo6cVOL7d4MHDushRog08ZW0ObSKnTHIxRbRymCkYZMxT6KtWDP6br-7WCHialPEH0XArTQg'"
                + " type='text/javascript'></script><script>var map=null; function initialize() {"
                + "if (GBrowserIsCompatible()) {"
                + "   map = new GMap2(document.getElementById('mapViewport'));"
                + "  map.setCenter(new GLatLng(37.4419, -122.1419), 13);" 
                + "}} \n window.onload=initialize;</script>";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "google source", source);

        }
    }
}
