using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Shiloh.BL;

namespace ShilohWeb
{
    public partial class UserLogin : BasePage
    {
        string _redirectURL;
        WebAccount _userAccount;

        private const string DEFAULT_MEMBER_PAGE = "/Member/Home.aspx";
        private const string DEFAULT_ADMIN_PAGE = "/Administration/Home.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Session[BaseGlobals.SESSION_ISLOGGEDIN] = false;
        }

        string _ErrorMessage = string.Empty;

        protected bool IsFormValid()
        {
            if (string.IsNullOrEmpty(txtUser.Text))
            {
                _ErrorMessage = "Please enter a user name.";
                return false;
            }

            if (string.IsNullOrEmpty(txtPwd.Text))
            {
                _ErrorMessage = "Please enter a password.";
                return false;
            }
            
            return true;
        }

        protected bool Login()
        {
            bool loggedin = false;

            try
            {
                _userAccount = new WebAccount();
                loggedin = _userAccount.Login(txtUser.Text, txtPwd.Text);

                if (loggedin && !string.IsNullOrEmpty(_userAccount.Website))
                {
                    try
                    {
                        string localPath = Server.MapPath(_userAccount.Website);

                        if (System.IO.File.Exists(localPath))
                        {
                            _redirectURL = _userAccount.Website;
                        }
                        else
                        {
                            _redirectURL = (_userAccount.IsAdmin) ? DEFAULT_ADMIN_PAGE : DEFAULT_MEMBER_PAGE;
                        }
                    }
                    catch
                    {
                        _redirectURL = (_userAccount.IsAdmin) ? DEFAULT_ADMIN_PAGE : DEFAULT_MEMBER_PAGE;
                    }
                }
            }
            catch (Exception ex)
            {
                _ErrorMessage = ex.Message;
            }

            return loggedin;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (IsFormValid())
            {
                if (Login())
                {
                    if (_userAccount != null)
                    {
                        Session[BaseGlobals.SESSION_ISLOGGEDIN] = true;
                        Session[BaseGlobals.SESSION_ISADMIN] = _userAccount.IsAdmin;
                        Session[BaseGlobals.SESSION_HOMEURL] = _redirectURL;

                        Response.Redirect(_redirectURL, true);
                    }
                    else
                    {
                        Response.Redirect(DEFAULT_MEMBER_PAGE, true);
                    }
                }
            }

            Session[BaseGlobals.SESSION_ISLOGGEDIN] = false;
            ucPopupMsg.ShowMessage("Your user name or password is invalid.");
        }
    }
}
