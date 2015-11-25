using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.Media {

    public partial class MediaDirectory : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) 
        {
            //if (!this.IsPostBack)
            {
                LoadMediaCategories();
                hlStream.NavigateUrl = ConfigurationManager.AppSettings["StreamingURL"];

                // put logic here to pop open stream logo
                if (DateTime.Now.DayOfWeek == DayOfWeek.Sunday &&
                    (DateTime.Now.Hour >= 10 && DateTime.Now.Hour <= 12))
                {
                    pnlStreameTyne.Visible = true;
                }
                else
                {
                    pnlStreameTyne.Visible = false;
                }

                if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["AlwaysShowStreamLogo"]) && ConfigurationManager.AppSettings["AlwaysShowStreamLogo"].ToLower().Equals("true"))
                    pnlStreameTyne.Visible = true;
            }
        }

        protected void LoadMediaCategories()
        {
            List<Shiloh.BL.Media> medias = Shiloh.BL.Medias.GetAll().Where(m => m.IsActive == true).OrderByDescending(m => m.MediaDate).ToList();

            if (medias.Count > 0)
            {
                litVideo.Text = medias[0].EmbedObjectBlob;

                Shiloh.BL.MediaCategories cats = Shiloh.BL.MediaCategories.GetAll();

                foreach (Shiloh.BL.MediaCategory cat in cats)
                {
                    List<Shiloh.BL.Media> mediaList = medias.Where(m => m.CategoryId == cat.Id && m.MediaDate > DateTime.Now.AddDays(-180.0)).ToList();

                    if (mediaList.Count > 0)
                    {
                        Control ucMedia = LoadControl(@"~/Controls/MediaCategory.ascx");
                        ((ShilohWeb.Controls.MediaCategory)ucMedia).Caption = cat.Name;
                        ((ShilohWeb.Controls.MediaCategory)ucMedia).DataSource = mediaList;
                        ((ShilohWeb.Controls.MediaCategory)ucMedia).MediaSelected += new ShilohWeb.Controls.MediaCategory.MediaSelectedHandler(ucMedia_MediaSelected);
                        ((ShilohWeb.Controls.MediaCategory)ucMedia).LoadMedia();

                        plMedia.Controls.Add(ucMedia);
                    }
                }
            }
            

        }

        void ucMedia_MediaSelected(object sender, ShilohWeb.Controls.MediaCategory.MediaSelectedEventArgs e)
        {
            litVideo.Text = e.EmbedLinkText;
        }

        protected void LinkButton_Command(object sender, CommandEventArgs e)
        {
            LinkButton lb = sender as LinkButton;

            if (lb != null)
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());

                Shiloh.BL.Media media = new Shiloh.BL.Media(id);

                if (media.IsStreaming)
                {
                    litVideo.Text = media.EmbedObjectBlob;
                }
            }

            //if (lb != null)
            //{
            //    string clipId = e.CommandArgument.ToString();
            //    this.litVideo.Text = litVideo.Text.Replace("%clipid%", e.CommandArgument.ToString());
            //  this.litVideo.Text = litVideo.Text.Replace("%clipid%", "8323818");
            //}
        }

    }
}
