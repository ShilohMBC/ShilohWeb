using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.Controls
{
    public partial class TabsAdmin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Properties

        int _SelectedIndex = 0;
        public int SelectedIndex 
        {
            get { return _SelectedIndex; }
            set
            {
                _SelectedIndex = value;
                SetSelectedTab(_SelectedIndex);
            }
        }

        public string SelectedCssClass
        {
            get;
            set;
        }

        #endregion

        #region Methods

        public void SetSelectedTab(int Index)
        {
            Control ctrl = this.FindControl("litIndex" + Index.ToString());

            if (ctrl != null)
            {
                Literal litCtrl = ctrl as Literal;
                string cssClass = (!string.IsNullOrEmpty(SelectedCssClass)) ? SelectedCssClass : "current";

                if (litCtrl != null)
                {
                    litCtrl.Text = litCtrl.Text.Replace("<li>", "<li class='%css%'>".Replace("%css%", cssClass));
                }
            }
        }

        #endregion
    }
}