using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.Controls
{
    public partial class MediaCategory : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Properties

        string _Caption = string.Empty;
        public string Caption
        {
            get
            {
                if (lblCatName != null)
                    _Caption = lblCatName.Text;

                return _Caption;
            }
            set
            {
                _Caption = value;
                if (lblCatName != null)
                {
                    lblCatName.Text = _Caption;
                }
            }
        }

        IEnumerable<Shiloh.BL.Media> _DataSource;
        public IEnumerable<Shiloh.BL.Media> DataSource
        {
            get
            {
                return _DataSource;
            }
            set
            {
                _DataSource = value;
                if (dlMedia != null)
                {
                    LoadMedia();
                }
            }
        }

        #endregion

        #region Events

        public delegate void MediaSelectedHandler(object sender, MediaSelectedEventArgs args);
        public event MediaSelectedHandler MediaSelected;

        public void RaiseMediaSelectedEvent(string MediaEmbedLink)
        {
            MediaSelectedHandler eh = MediaSelected;

            if (eh != null)
            {
                MediaSelectedEventArgs args = new MediaSelectedEventArgs(MediaEmbedLink);
                eh(this, args);
            }
        }

        public class MediaSelectedEventArgs : EventArgs
        {
            public MediaSelectedEventArgs(string EmbedObject)
            {
                EmbedLinkText = EmbedObject;
            }

            public readonly string EmbedLinkText;            
        }

        #endregion

        #region Methods
        
        public void LoadMedia()
        {
            lblCatName.Text = _Caption;
            dlMedia.DataSource = _DataSource;
            dlMedia.DataBind();
        }

        #endregion

        protected void LinkButton_Command(object sender, CommandEventArgs e)
        {
            LinkButton lb = sender as LinkButton;

            if (lb != null)
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());

                Shiloh.BL.Media media = new Shiloh.BL.Media(id);

                RaiseMediaSelectedEvent(media.EmbedObjectBlob);
            }
        }
    }
}