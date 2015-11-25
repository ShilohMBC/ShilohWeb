using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.Controls
{
    public partial class StatesList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string StateName
        {
            get
            {
                if (ddlState != null)
                    return ddlState.Text;
                else
                    return string.Empty;
            }

            set
            {
                if (ddlState != null)
                    ddlState.Text = value;
            }
        }

        public string StateCode
        {
            get
            {
                if (ddlState != null)
                    return ddlState.SelectedItem.Value;
                else
                    return string.Empty;
            }

            set
            {
                if (ddlState != null)
                {
                    ddlState.SelectedItem.Value = value;
                }
            }
        }

        public int SelectedIndex
        {
            get
            {
                if (ddlState != null)
                    return ddlState.SelectedIndex;
                else
                    return 0;
            }

            set
            {
                if (ddlState != null)
                    ddlState.SelectedIndex = value;
            }
        }
    }
}