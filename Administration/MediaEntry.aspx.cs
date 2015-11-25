using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.Administration
{
    public partial class MediaEntry : BaseAdminPage
    {
        string _ErrorMessage = string.Empty;
        int _MediaId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            _MediaId = GetMediaId();

            if (!IsPostBack)
            {
                if (_MediaId > 0)
                    GetExistingMedia();

                LoadDropDowns();
            }
        }
        #region Methods

        private void LoadDropDowns()
        {
            List<Shiloh.BL.MediaCategory> categories = Shiloh.BL.MediaCategories.GetAll().OrderBy(p => p.Name).ToList();
            List<Shiloh.BL.MediaProvider> providers = Shiloh.BL.MediaProviders.GetAll().OrderBy(p => p.Name).ToList(); ;

            ddlCategory.DataSource = categories;
            ddlCategory.DataTextField = "Name";
            ddlCategory.DataValueField = "Id";
            ddlCategory.DataBind();

            ddlProvider.DataSource = providers;
            ddlProvider.DataTextField = "Name";
            ddlProvider.DataValueField = "Id";
            ddlProvider.DataBind();
        }

        protected int GetMediaId()
        {
            int id = 0;

            if (Request.QueryString["mid"] != null)
            {
                if (!Int32.TryParse(Request.QueryString["mid"].ToString(), out id))
                    id = 0;
            }

            return id;
        }

        protected void GetExistingMedia()
        {
            if (_MediaId > 0)
            {
                Shiloh.BL.Media media = new Shiloh.BL.Media(_MediaId);

                if (!string.IsNullOrEmpty(media.Name))
                {
                    ucDateTimeMediaDate.SelectedDate = media.MediaDate;

                    txtDescription.Text = media.Description;
                    txtEmbedObject.Text = media.EmbedObjectBlob;
                    txtMIMEType.Text = media.MIMEType;
                    txtName.Text = media.Name;
                    txtSize.Text = media.Size.ToString();
                    txtURL.Text = media.URL;

                    cbIsActive.Checked = media.IsActive;
                    cbIsStreaming.Checked = media.IsStreaming;

                    ddlCategory.SelectedValue = media.CategoryId.ToString();
                    ddlProvider.SelectedValue = media.ProviderId.ToString();
                }
            }
        }

        protected bool SaveMedia()
        {
            bool saved = false;
            bool isExisting = (_MediaId > 0);

            Shiloh.BL.Media media = isExisting ? new Shiloh.BL.Media(_MediaId) : new Shiloh.BL.Media();
            
            {
                int catId = Convert.ToInt32(ddlCategory.SelectedItem.Value);
                int provId = Convert.ToInt32(ddlProvider.SelectedItem.Value);

                if (media.CategoryId != catId)
                    media.Category = new Shiloh.BL.MediaCategory(catId);

                if (media.ProviderId != provId)
                    media.Provider = new Shiloh.BL.MediaProvider(provId);
            }

            media.Description = txtDescription.Text.Trim();
            media.EmbedObjectBlob = txtEmbedObject.Text.Trim();
            media.IsActive = cbIsActive.Checked;
            media.IsStreaming = cbIsStreaming.Checked;
            media.MediaDate = ucDateTimeMediaDate.SelectedDate;
            media.MIMEType = txtMIMEType.Text.Trim();
            media.Name = txtName.Text.Trim();
            media.Size = Convert.ToInt32(txtSize.Text.Trim());
            media.URL = txtURL.Text.Trim();

            try
            {
                saved = media.Save();
            }
            catch (Exception ex)
            {
                _ErrorMessage = ex.Message;
                saved = false;
            }

            return saved;
        }

        public bool IsFormValid()
        {
            if (string.IsNullOrEmpty(txtName.Text.Trim()))
            {
                _ErrorMessage = "Enter a name for the media.";
                txtName.Focus();
                return false;
            }

            if (string.IsNullOrEmpty(this.txtDescription.Text.Trim()))
            {
                _ErrorMessage = "Enter a description of what's on the media.";
                txtDescription.Focus();
                return false;
            }

            if (ucDateTimeMediaDate.SelectedDate.CompareTo(new DateTime(2000, 1, 1)) < 0)
            {
                _ErrorMessage = "Please select a media production date.";
                return false;
            }

            int size = 0;
            if (!Int32.TryParse(txtSize.Text.Trim(), out size))
            {
                _ErrorMessage = "The size of the file is not valid (must be numeric with no decimals)";
                return false;
            }

            return true;
        }

        public void ResetForm()
        {
            txtDescription.Text = string.Empty;
            txtEmbedObject.Text = string.Empty;
            txtMIMEType.Text = string.Empty;
            txtName.Text = string.Empty;
            txtSize.Text = "0";
            txtURL.Text = string.Empty;
        }

        #endregion

        protected void valcustOther_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (ucDateTimeMediaDate.SelectedDate.CompareTo(new DateTime(2000,1,1)) < 0)
            {
                valcustOther.ErrorMessage = "Please select a date of production (or date when aired) for the media.";
                args.IsValid = false;
            }

            if (txtEmbedObject.Text.Trim().Equals(string.Empty) && txtURL.Text.Trim().Equals(string.Empty))
            {
                valcustOther.ErrorMessage = "Either the URL path field or the Embed Object field needs to have a value.";
                args.IsValid = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsFormValid())
            {
                if (SaveMedia())
                {
                    ResetForm();
                    ucPopupMessage.ShowMessage("Media was saved.");
                }
                else
                    ucPopupMessage.ShowMessage(_ErrorMessage);
            }
            else
                ucPopupMessage.ShowMessage(_ErrorMessage);
        }
    }
}
