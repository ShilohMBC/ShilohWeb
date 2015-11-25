using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ShilohWeb.Controls
{
    public partial class Login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
                ViewState["LoginErrors"] = 0;
        }
        protected void LoginControl_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if (PersonIsAMember(LoginControl.UserName, LoginControl.Password))
            {
                // e.Authenticated = true;
                LoginControl.Visible = false;
                // MessageLabel.Text = "Successfully Logged In";
                // Change Login.Text to Logout in Primary Navigation, include Administration tab in Primary Navigation 
            }
            else
            {
                e.Authenticated = false;
            }
        }


        protected void LoginControl_LoginError(object sender, EventArgs e)
        {
            if (ViewState["LoginErrors"] == null)
                ViewState["LoginErrors"] = 0;

            int ErrorCount = (int)ViewState["LoginErrors"] + 1;
            ViewState["LoginErrors"] = ErrorCount;

            if ((ErrorCount > 3) && (LoginControl.PasswordRecoveryUrl != string.Empty))
                Response.Redirect(LoginControl.PasswordRecoveryUrl);
        }

        private bool PersonIsAMember(string UserName, string Password)
        {
            bool boolReturnValue = false;
            // Need to set this up for the ASP.Net login or to the custom provider database...
            string strConnection = "server=.;database=Vendor;uid=sa;pwd=wintellect;";
            
            SqlConnection sqlConnection = new SqlConnection(strConnection);
            // Change this to a stored procedure for safety...
            String SQLQuery = "select UserName, Password from Login";
            SqlCommand command = new SqlCommand(SQLQuery, sqlConnection);
            SqlDataReader dataReader;
            
            sqlConnection.Open();
            dataReader = command.ExecuteReader();
            while (dataReader.Read())
            {
                if ((UserName == dataReader["UserName"].ToString()) & (Password == dataReader["Password"].ToString()))
                {
                    boolReturnValue = true;
                }
                dataReader.Close();
                return boolReturnValue;
            }
            return boolReturnValue;
        }
    }
}