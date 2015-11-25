using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.Controls
{
    public partial class ActionButton : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Properties

        public string ImageURL
        {
            get
            {
                if (imgAction != null)
                    return imgAction.ImageUrl;
                else
                    return string.Empty;
            }

            set
            {
                if (imgAction != null)
                    imgAction.ImageUrl = (!string.IsNullOrEmpty(value)) ? value : string.Empty;
            }
        }

        public string Caption
        {
            get
            {
                if (lbAction != null)
                    return lbAction.Text;
                else
                    return string.Empty;
            }

            set
            {
                if (lbAction != null)
                    lbAction.Text = (!string.IsNullOrEmpty(value)) ? value : string.Empty;
            }
        }

        public string ConfirmationMessage
        {
            //return confirm('Are you sure you want to delete this prayer request?');
            get
            {
                if (lbAction != null)
                    return lbAction.OnClientClick;
                else
                    return string.Empty;
            }

            set
            {
                if (lbAction != null)
                {
                    lbAction.OnClientClick = (!string.IsNullOrEmpty(value)) ? "return confirm('%msg%')".Replace("%msg%", value) : string.Empty;
                }
            }

        }

        string _NewWindowURL = string.Empty;
        public string NewWindowURL
        {
            get
            {
                return _NewWindowURL;
            }

            set
            {
                if (lbAction != null)
                {
                    if (lbAction.Attributes["onclick"] == null)
                    {
                        lbAction.Attributes.Add("onclick", "%javascript:window.open('%win%','printwindow','status=0,toolbar=0,location=0,menubar=0,directories=0')".Replace("%win%", value));
                    }
                }
            }
        }

        #endregion

        #region Events


        public delegate void OnButtonClickHandler(object sender, EventArgs e);
        public event OnButtonClickHandler OnButtonClick;

        public void RaiseOnButtonClickEvent()
        {
            OnButtonClickHandler eh = OnButtonClick;

            if (eh != null)
            {
                EventArgs args = new EventArgs();
                eh(this, args);
            }
        }

        #endregion

        protected void lbAction_Click(object sender, EventArgs e)
        {
            RaiseOnButtonClickEvent();
        }

        protected void imgAction_Click(object sender, ImageClickEventArgs e)
        {
            RaiseOnButtonClickEvent();
        }
    }
}