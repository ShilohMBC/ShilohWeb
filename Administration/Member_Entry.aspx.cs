using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Shiloh.BL;

namespace ShilohWeb.Administration
{
    public partial class Member_Entry : BaseAdminPage
    {
        string _ErrorMessage = string.Empty;
        int _MemberId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            _MemberId = GetMemberId();

            if (!IsPostBack)
            {
                if (_MemberId > 0)
                    GetExistingMember();
            }
        }

        #region Methods

        public bool IsFormValid()
        {            
            if (string.IsNullOrEmpty(txtFirstName.Text.Trim()))
            {
                _ErrorMessage = "Enter a First Name";
                txtFirstName.Focus();
                return false;
            }

            if (string.IsNullOrEmpty(this.txtLastName.Text.Trim()))
            {
                _ErrorMessage = "Enter a Last Name";
                txtLastName.Focus();
                return false;
            }

            if (!rbSexFemale.Checked && !rbSexMale.Checked)
            {
                _ErrorMessage = "Please select a gender";
                return false;
            }

            if (string.IsNullOrEmpty(txtAnniversaryDate.Text.Trim()))
            {
                _ErrorMessage = "Enter an anniversary date.";
                txtAnniversaryDate.Focus();
                return false;
            }
            else
            {
                DateTime anDate;

                if (!DateTime.TryParse(txtAnniversaryDate.Text.Trim(), out anDate))
                {
                    _ErrorMessage = "Enter an anniversary date.";
                    txtAnniversaryDate.Focus();
                    return false;
                }
            }

            if (string.IsNullOrEmpty(ucAddress.AddressInfo.Phone) &&
                    string.IsNullOrEmpty(txtPhoneWork.Text.Trim()) &&
                        string.IsNullOrEmpty(txtPhoneMobile.Text.Trim()))
            {
                _ErrorMessage = "Please enter at least a home phone, work phone or mobile phone number.";
                return false;
            }

            return true;
        }

        protected int GetMemberId()
        {
            int id = 0;

            if (Request.QueryString["mid"] != null)
            {
                if (!Int32.TryParse(Request.QueryString["mid"].ToString(), out id))
                    id = 0;
            }

            return id;
        }

        protected void GetExistingMember()
        {
            if (_MemberId != 0)
            {
                Shiloh.BL.Member member = new Shiloh.BL.Member(_MemberId);

                txtFirstName.Text = member.FirstName;
                txtLastName.Text = member.LastName;

                if (member.Sex.Equals("F"))
                {
                    rbSexFemale.Checked = true;
                    rbSexMale.Checked = false;
                }
                else
                {
                    rbSexFemale.Checked = false;
                    rbSexMale.Checked = true;
                }

                txtDOB.Text = member.BirthDate.Date.ToShortDateString();
                txtAnniversaryDate.Text = member.AnniversaryDate.Date.ToShortDateString();
                txtOccupation.Text = member.Occupation;
                txtPhoneMobile.Text = member.PhoneMobile;
                txtPhoneWork.Text = member.PhoneWork;
                txtEmail.Text = member.Email;
                txtNotes.Text = member.Notes;

                if (member.Address != null)
                    ucAddress.LoadAddressInfo(member.Address);

                if (member.EmergencyAddress != null)
                    ucAddressEmergency.LoadAddressInfo(member.EmergencyAddress);
            }
        }

        protected bool SaveMember()
        {
            bool saved = false;

            Shiloh.BL.Member member = (_MemberId > 0) ? new Shiloh.BL.Member(_MemberId) : new Shiloh.BL.Member();

            if (ucAddress.AddressWasChanged)
            {
                if (member.Address == null)
                    member.Address = new Address();

                member.Address.ContactName = string.Concat(txtFirstName.Text.Trim(), " ", txtLastName.Text.Trim());
                member.Address.City = ucAddress.AddressInfo.City;
                member.Address.Country = ucAddress.AddressInfo.Country;
                member.Address.Fax = ucAddress.AddressInfo.Fax;
                member.Address.Phone = ucAddress.AddressInfo.Phone;
                member.Address.State = ucAddress.AddressInfo.State;
                member.Address.StreetAddress = ucAddress.AddressInfo.StreetAddress;
                member.Address.Zip = ucAddress.AddressInfo.Zip;
            }

            if (ucAddressEmergency.AddressWasChanged)
            {
                if (member.EmergencyAddress == null)
                    member.EmergencyAddress = new Address();

                member.EmergencyAddress.ContactName = ucAddressEmergency.AddressInfo.ContactName;
                member.EmergencyAddress.City = ucAddressEmergency.AddressInfo.City;
                member.EmergencyAddress.Country = ucAddressEmergency.AddressInfo.Country;
                member.EmergencyAddress.Fax = ucAddressEmergency.AddressInfo.Fax;
                member.EmergencyAddress.Phone = ucAddressEmergency.AddressInfo.Phone;
                member.EmergencyAddress.State = ucAddressEmergency.AddressInfo.State;
                member.EmergencyAddress.StreetAddress = ucAddressEmergency.AddressInfo.StreetAddress;
                member.EmergencyAddress.Zip = ucAddressEmergency.AddressInfo.Zip;                
            }

            member.AnniversaryDate = Convert.ToDateTime(txtAnniversaryDate.Text.Trim());
            member.BirthDate = Convert.ToDateTime(txtDOB.Text.Trim());

            member.Email = txtEmail.Text.Trim();
            member.EmailWork = string.Empty;
            member.FirstName = txtFirstName.Text.Trim();            
            member.LastName = txtLastName.Text.Trim();
            member.IsActive = cbIsActive.Checked;
            member.Notes = txtNotes.Text;
            member.Occupation = txtOccupation.Text.Trim();
            member.PhoneMobile = txtPhoneMobile.Text.Trim();
            member.PhoneWork = txtPhoneWork.Text.Trim();

            member.Sex = (rbSexFemale.Checked) ? Shiloh.BL.Member.eSex.Female : Shiloh.BL.Member.eSex.Male;
            member.Status = Convert.ToInt32(ddlStatus.SelectedItem.Value);

            try
            {
                saved = member.Save();
            }
            catch (Exception ex)
            {
                _ErrorMessage = ex.Message;
            }

            return saved;
        }

        protected void ResetForm()
        {
            txtAnniversaryDate.Text = string.Empty;
            txtDOB.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtFirstName.Text = txtLastName.Text = string.Empty;
            txtNotes.Text = string.Empty;
            txtOccupation.Text = string.Empty;
            txtPhoneMobile.Text = txtPhoneWork.Text = string.Empty;
            ddlStatus.SelectedIndex = 0;
            rbSexFemale.Checked = rbSexMale.Checked = false;

            ucAddress.ClearAddress();
            ucAddressEmergency.ClearAddress();
        }

        #endregion

        protected void valSex_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (!rbSexMale.Checked && !rbSexFemale.Checked)            
                args.IsValid = false;            
            else
                args.IsValid = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsFormValid())
            {
                if (SaveMember())
                {
                    pnlShowMsg.Visible = true;
                    ResetForm();
                }
                else
                    ucPopupMsg.ShowMessage(_ErrorMessage);
            }
            else
            {
                ucPopupMsg.ShowMessage(_ErrorMessage);
            }
                
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            pnlShowMsg.Visible = false;
            ResetForm();
        }
    }
}
