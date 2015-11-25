using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.ComponentModel;

namespace ShilohWeb
{
    public class BaseAdminPage : BasePage
    {

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            EnforceLogin();
        }

        #region Properties

        protected bool IsLoggedIn
        {
            get
            {
                if (Session[BaseGlobals.SESSION_ISLOGGEDIN] != null)
                    return Convert.ToBoolean(Session[BaseGlobals.SESSION_ISLOGGEDIN].ToString());
                else
                    return false;
            }
        }

        protected bool IsAdmin
        {
            get
            {
                if (Session[BaseGlobals.SESSION_ISADMIN] != null)
                    return Convert.ToBoolean(Session[BaseGlobals.SESSION_ISADMIN].ToString());
                else
                    return false;
            }
        }

        #endregion

        #region Methods

        protected bool EnforceLogin()
        {
            return EnforceLogin(string.Empty);
        }

        protected bool EnforceLogin(string ComeBackURL)
        {
            bool loggedIn = false;

            if (!IsLoggedIn)
            {
                Session[BaseGlobals.SESSION_RETURNURL] = ComeBackURL;
                Response.Redirect("/UserLogin.aspx");
            }
            else
            {
                loggedIn = true;

                //if (Session[BaseGlobals.SESSION_HOMEURL] != null && !string.IsNullOrEmpty(Session[BaseGlobals.SESSION_HOMEURL].ToString()))
                //{
                //    Response.Redirect(Session[BaseGlobals.SESSION_HOMEURL].ToString());
                //}
                //else
                //    Response.Redirect("/Calendar.aspx");
            }

            return loggedIn;
        }

        #endregion
    }
}
