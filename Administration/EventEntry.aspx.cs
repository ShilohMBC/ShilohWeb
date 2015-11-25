using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Shiloh.BL;

namespace ShilohWeb.Administration
{
    public partial class EventEntry : BaseAdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EnforceLogin();

            _ActivityId = GetEventId();

            if (!IsPostBack)
            {
                ucDateTimeEditStart.SelectedDate = ucDateTimeEditStop.SelectedDate = DateTime.Now;

                if (_ActivityId > 0)
                    GetExistingActivity();
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            ucDateTimeEditStart.DateChanged += new ShilohWeb.Controls.DateTimeEntry.DateChangedHandler(ucDateTimeEditStart_DateChanged);
        }

        #region Properties

        int _ActivityId;
        string _ErrorMessage = string.Empty;

        #endregion 
        
        #region Methods

        protected int GetEventId()
        {
            int id = 0;

            if (Request.QueryString["eid"] != null)
            {
                if (!Int32.TryParse(Request.QueryString["eid"].ToString(), out id))
                    id = 0;
            }

            return id;
        }

        protected void GetExistingActivity()
        {
            if (_ActivityId != 0)
            {
                Activity activity = new Activity(_ActivityId);

                txtAddress.Text = activity.Address;
                txtCity.Text = activity.City;
                txtContactEmail.Text = activity.ContactEmail;
                txtContactName.Text = activity.ContactName;
                txtContactPhone.Text = activity.ContactPhone;
                txtContactURL.Text = activity.ContactURL;
                txtDescription.Text = activity.Description;
                txtEventName.Text = activity.Name;
                txtLocation.Text = activity.Location;
                txtZIP.Text = activity.ZIPcode;

                ucStates.StateCode = activity.State;
                ucDateTimeEditStart.SelectedDate = activity.StartDateTime;
                ucDateTimeEditStop.SelectedDate = activity.EndDateTime;

                ddlCommunity.SelectedItem.Value = activity.HostId.ToString();
                ddlFrequency.SelectedItem.Value = activity.Frequency.ToString();                
            }
        }

        protected bool IsFormValid()
        {
            string msg = "<div class='required'>%msg%</div>";

            if (txtEventName.Text.Trim().Length == 0)
            {
                _ErrorMessage = msg.Replace("%msg%", "Please enter an event name.");
                return false;
            }

            if (txtDescription.Text.Trim().Length == 0)
            {
                _ErrorMessage = msg.Replace("%msg%", "Please enter an event description.");
                return false;
            }

            if (txtLocation.Text.Trim().Length == 0)
            {
                _ErrorMessage = msg.Replace("%msg%", "Please enter an event location.");
                return false;
            }

            if (ucDateTimeEditStart.SelectedDate.Date.CompareTo(ucDateTimeEditStop.SelectedDate.Date) > 0)
            {
                _ErrorMessage = msg.Replace("%msg%", "Make sure the start date/time is less than the end date/time.");
                return false;
            }

            return true;
        }

        protected bool SaveEvent()
        {
            bool saved = false;

            Activity activity = null;

            if (_ActivityId == 0)
                activity = new Activity();
            else
                activity = new Activity(_ActivityId);

            activity.Address = Server.HtmlEncode(txtAddress.Text.Trim());
            activity.City = txtCity.Text.Trim();
            activity.ContactEmail = txtContactEmail.Text.Trim();
            activity.ContactName = Server.HtmlEncode(txtContactName.Text.Trim());
            activity.ContactPhone = txtContactPhone.Text.Trim();
            activity.ContactURL = txtContactURL.Text.Trim();
            activity.Description = Server.HtmlEncode(txtDescription.Text.Trim());
            activity.EndDateTime = ucDateTimeEditStop.SelectedDate;
            activity.StartDateTime = ucDateTimeEditStart.SelectedDate;
            activity.Name = Server.HtmlEncode(txtEventName.Text);
            activity.Frequency = Convert.ToInt32(ddlFrequency.SelectedItem.Value);
            activity.State = ucStates.StateCode;
            activity.Tag = (_ActivityId == 0) ? GenerateTag() : activity.Tag;
            activity.Location = Server.HtmlEncode(txtLocation.Text.Trim());
            activity.HostId = Convert.ToInt32(ddlCommunity.SelectedItem.Value);
            activity.ZIPcode = txtZIP.Text.Trim();
            activity.ImagePath = string.Empty;

            try
            {
                saved = activity.Save();
            }
            catch (Exception ex)
            {
                _ErrorMessage = ex.Message;
                saved = false;
            }

            return saved;
        }

        protected string GenerateTag()
        {
            string tag = string.Concat(
                            DateTime.Now.ToString("yyyyddMMHHmm"),
                            ucDateTimeEditStart.SelectedDate.ToString("yyyyddMM"));

            return tag;
        }

        private void ClearForm()
        {
            txtEventName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            ddlCommunity.SelectedIndex = 0;

            txtLocation.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtContactEmail.Text = string.Empty;
            txtContactName.Text = string.Empty;
            txtContactPhone.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtZIP.Text = string.Empty;
            ucStates.SelectedIndex = 0;
        }

        #endregion

        #region Control Events

        protected void custvalEndDateTime_ServerValidate(object source, ServerValidateEventArgs e)
        {
            e.IsValid = (ucDateTimeEditStop.SelectedDate.Date.CompareTo(ucDateTimeEditStart.SelectedDate.Date) > 0);
        }

        protected void custvalStartDateTime_ServerValidate(object source, ServerValidateEventArgs e)
        {
            e.IsValid = (ucDateTimeEditStart.SelectedDate.Date.CompareTo(ucDateTimeEditStop.SelectedDate.Date) < 0);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsFormValid())
            {
                if (SaveEvent())
                {
                    ClearForm();
                    ucPopupMessage.ShowMessage("Your event was saved.");
                }
                else
                    ucPopupMessage.ShowMessage(_ErrorMessage);
            }
            else
            {
                ucPopupMessage.ShowMessage(_ErrorMessage);
            }
        }

        private void ucDateTimeEditStart_DateChanged(object sender, ShilohWeb.Controls.DateTimeEntry.DateChangedEventArgs e)
        {
            if (ucDateTimeEditStart.SelectedDate.CompareTo(ucDateTimeEditStop.SelectedDate) > 0)
            {
                ucDateTimeEditStop.SelectedDate = e.NewSelectedDate;
            }
        }

        #endregion
    }
}
