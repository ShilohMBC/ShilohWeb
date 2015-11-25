 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.Controls
{
    public partial class PopUpMessage : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pnlMsg.Visible = false;
        }

        #region Properties

        string _Message;
        public string Message 
        {
            get { return _Message; }
            set { _Message = value; } 
        }

        #endregion

        public void ShowMessage()
        {
            ShowMessage(_Message);
        }

        public void ShowMessage(string Message)
        {
            if (!string.IsNullOrEmpty(Message))
            {
                lblMsg.Text = Message;
                pnlMsg.Visible = true;
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            pnlMsg.Visible = false;
        }
    }
}