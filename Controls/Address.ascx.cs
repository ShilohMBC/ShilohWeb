using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ShilohWeb.Controls
{
    public partial class Address : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Properties

        bool _ChangesWereMade;
        public bool AddressWasChanged 
        {
            get {
                return _ChangesWereMade;
            }
        }

        Shiloh.BL.Address _Address = new Shiloh.BL.Address();
        public Shiloh.BL.Address AddressInfo
        {
            get
            {
                BuildAddressInfo();
                return _Address;
            }
        }

        public string Caption
        {
            get
            {
                if (lblTitle != null)
                    return lblTitle.Text;
                else
                    return "Address";
            }
            set
            {
                if (lblTitle != null)
                    lblTitle.Text = value;
            }
        }

        public bool ShowName
        {
            get
            {
                if (txtName != null)
                    return txtName.Visible;
                else
                    return true;
            }
            set
            {
                if (txtName != null)
                    txtName.Visible = lblName.Visible = value;
            }
        }

        #endregion

        #region Methods

        public void ClearAddress()
        {
            txtName.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtCountry.Text = "USA";
            txtFax.Text = txtPhone.Text = string.Empty;
            txtStreetAddress.Text = string.Empty;
            txtZip.Text = string.Empty;

            _ChangesWereMade = false;
        }

        private void BuildAddressInfo()
        {
            if (_Address == null)
                _Address = new Shiloh.BL.Address();

            if (txtStreetAddress != null)
            {
                _Address.ContactName = txtName.Text.Trim();
                _Address.City = txtCity.Text.Trim();
                _Address.Country = txtCountry.Text.Trim();
                _Address.Fax = txtFax.Text.Trim();
                _Address.Phone = txtPhone.Text.Trim();                
                _Address.StreetAddress = txtStreetAddress.Text.Trim();
                _Address.State = ucStates.StateCode.Trim();
                _Address.Zip = txtZip.Text;

                if (!string.IsNullOrEmpty(_Address.State.Trim()))
                    _ChangesWereMade = true;
            }
            else
            {
                _Address.ContactName = string.Empty;
                _Address.City = string.Empty;
                _Address.Country = string.Empty;
                _Address.Fax = string.Empty;
                _Address.Phone = string.Empty;
                _Address.State = string.Empty;
                _Address.StreetAddress = string.Empty;
                _Address.Zip = string.Empty;
            }
        }

        public void LoadAddressInfo(int AddressId)
        {
            Shiloh.BL.Address addr = new Shiloh.BL.Address(AddressId);
            LoadAddressInfo(addr);
        }

        public void LoadAddressInfo(Shiloh.BL.Address AddressInfo)
        {
            _Address = AddressInfo;

            if (AddressInfo != null)
            {
                txtName.Text = AddressInfo.ContactName;
                txtCity.Text = AddressInfo.City;
                txtCountry.Text = AddressInfo.Country;
                txtFax.Text = AddressInfo.Fax;
                txtPhone.Text = AddressInfo.Phone;
                txtStreetAddress.Text = AddressInfo.StreetAddress;
                ucStates.StateCode = AddressInfo.State;
                txtZip.Text = AddressInfo.Zip;
            }
        }

        #endregion

        protected void TextBox_Changed(object sender, EventArgs e)
        {
            _ChangesWereMade = true;
        }
    }
}