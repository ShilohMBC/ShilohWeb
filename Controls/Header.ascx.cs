using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.Controls
{
    public partial class Header : BaseUserControl
    {
        protected void Page_Load(object sender, EventArgs e) 
        {
            if (Session[BaseGlobals.SESSION_ISLOGGEDIN] != null && Convert.ToBoolean(Session[BaseGlobals.SESSION_ISLOGGEDIN]))
            {
                hlSignIn.Text = "Sign Out";

                //if (Session[BaseGlobals.SESSION_ISADMIN] != null && Convert.ToBoolean(Session[BaseGlobals.SESSION_ISADMIN]))
                //    litAdminItem.Visible = true;
                hlMyAccount.NavigateUrl = Session[BaseGlobals.SESSION_HOMEURL].ToString();
                phMyAccount.Visible = true;
            }
            else
                phMyAccount.Visible = false;

        }
        protected void showLogin(object sender, EventArgs e) {
            // TODO: If iprincipal not empty
            //          change logIn.text to name + logout
            //          change login.href to logout method
            //       endIf

        }
    }
}