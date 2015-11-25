using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

using ICS.Utils;
using Shiloh.BL;
using Shiloh.BL.ShilohTableAdapters;

namespace ShilohWeb
{
    public partial class PrayerRequest : BasePage
    {
        private string _ErrorMsg = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Methods

        protected bool IsPageValid()
        {
            if (string.IsNullOrEmpty(txtFirstName.Text.Trim()))
            {
                _ErrorMsg = "Please enter a first name.";
                return false;
            }

            if (string.IsNullOrEmpty(txtLastName.Text.Trim()))
            {
                _ErrorMsg = "Please enter a last name.";
                return false;
            }

            return true;
        }

        protected bool SaveRequest()
        {
            bool saved = false;

            if (IsPageValid())
            {
                StringBuilder referrals = new StringBuilder(string.Empty);
                PrayerReq pr = new PrayerReq();

                pr.Address = txtAddress.Text;
                pr.BestCallTime = ddlBestTimeToCall.Text;
                pr.City = txtCity.Text;
                pr.DateReceived = DateTime.Now;
                pr.DoHospitalVisit = rbVisitYes.Checked;
                pr.Email = txtEmail.Text;
                pr.FirstName = txtFirstName.Text;
                pr.HospitalName = txtHospitalName.Text;
                pr.HospitalRoomNo = txtHospitalRoom.Text;
                
                pr.IsConfidential = cbIsConfidential.Checked;
                pr.IsInDanger = rbInDangerYes.Checked;
                pr.IsInHospital = rbInHospitalYes.Checked;
                pr.LastName = txtLastName.Text;
                pr.MiddleName = string.Empty;
                pr.Phone = txtPhone.Text.Replace("-",string.Empty).Replace(".","").Replace(" ","");
                pr.PleaseCall = false;
                pr.PrayerNeeds = txtPrayerNeeds.Text.Trim();
                pr.SpecialInstructions = txtSpecialInstructions.Text;
                pr.State = ucStates.StateCode;
                pr.ZipCode = txtZIP.Text;
                pr.WasProcessed = false;
                pr.ProcessedBy = string.Empty;

                // put the referral list together
                foreach (ListItem item in cblReferrals.Items)
                {
                    if (item.Selected)
                    {
                        referrals.Append(item.Text + "|");
                    }
                }

                pr.Referrals = (referrals.Length > 0) ? referrals.ToString().Substring(0, referrals.Length - 1) : string.Empty;

                try
                {
                    // save it off
                    saved = pr.Save();

                    if (saved)
                    {
                        // build details
                        StringBuilder dtls = new StringBuilder(litMailMsg.Text);
                        dtls.Replace("%name%", string.Concat(pr.FirstName, " ", pr.LastName));
                        dtls.Replace("%email%", pr.Email);
                        dtls.Replace("%phone%", pr.Phone);

                        // send off an e-mail
                        if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["PrayerRequestEmailList"]))
                        {
                            General.SendMail(
                                ConfigurationManager.AppSettings["SMTPServer"],
                                ConfigurationManager.AppSettings["SiteEmail"],
                                new List<string>(ConfigurationManager.AppSettings["PrayerRequestEmailList"].Split(new char[] { ',' })),
                                "New Prayer Request on Shiloh2000.com",
                                General.ToHTMLMailMsg(dtls.ToString()),
                                ICS.Utils.Enum.eMailMessageType.HTML);
                        }
                    }
                }
                catch (Exception ex)
                {
                    saved = false;
                    _ErrorMsg = ex.Message;
                }
            }

            
            return saved;
        }

        public void ClearForm()
        {
            txtAddress.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtFirstName.Text = string.Empty;
            txtHospitalName.Text = string.Empty;
            txtHospitalRoom.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtPrayerNeeds.Text = string.Empty;
            txtSpecialInstructions.Text = string.Empty;
            txtZIP.Text = string.Empty;

            rbInDangerNo.Checked = true;
            rbInHospitalNo.Checked = true;
            rbVisitNo.Checked = true;

            ddlBestTimeToCall.SelectedIndex = 0;

            cbIsConfidential.Checked = false;

            foreach (ListItem item in cblReferrals.Items)
                item.Selected = false;

        }

        #endregion

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (SaveRequest())
            {
                this.pnlShowMsg.Visible = true;
            }
            else
            {
                litError.Text = "<div class='error'>" + _ErrorMsg + "</div>";
                litError.Visible = true;
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            ClearForm();
            pnlShowMsg.Visible = false;            
        }
    }
}
