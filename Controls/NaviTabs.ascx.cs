using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.Controls
{
    public partial class NaviTabs : BaseUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RenderTabs();
        }

        #region Properties

        string _MenuItems = string.Empty;
        public string MenuItems
        {
            get { return _MenuItems; }
            set { _MenuItems = value; }
        }

        public int SelectedIndex { get; set; }

        public string HeaderText
        {
            get
            {
                if (lblHeader != null)
                    return lblHeader.Text;
                else
                    return string.Empty;
            }
            set
            {
                if (lblHeader != null)
                    lblHeader.Text = value;
            }
        }

        #endregion

        #region Methods

        public void RenderTabs()
        {
            if (!string.IsNullOrEmpty(_MenuItems))
            {
                litMenu.Text = string.Empty;
                string[] items = _MenuItems.Split(new char[] {'|' });
                StringBuilder mnu = new StringBuilder("");

                if (items.Length > 0)
                {
                    mnu.Append("<ul>");

                    string tabName = string.Empty;
                    string tabURL = string.Empty;
                    int idx = 0;

                    for (int i=0; i < items.Length; i++)
                    {
                        idx = items[i].IndexOf('|');

                        if (idx >= 0)
                        {
                            tabName = items[i].Substring(0, idx);
                            tabURL = items[i].Substring(idx + 1);

                            if (idx == SelectedIndex)
                                mnu.Append("<li class='current'>");
                            else
                                mnu.Append("<li>");

                            mnu.Append("<a href='%url%'>%name%</a>".Replace("%url%", tabURL).Replace("%name%",tabName));
                            mnu.Append("</li>");
                        }
                    }

                    mnu.Append("</ul>");
                }

                if (mnu.Length > 0)
                    litMenu.Text = mnu.ToString();
            }
        }

        #endregion
    }
}