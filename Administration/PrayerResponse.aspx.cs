using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Shiloh.BL;

namespace ShilohWeb.Administration
{
    public partial class PrayerResponse : BaseAdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            _RequestId = GetRequestId();

            if (!IsPostBack)
            {
                if (_RequestId > 0)
                    GetPrayerRequest();
            }
        }

        #region Properties

        int _ResponseId = 0;
        int _RequestId = 0;
        string _ErrorMsg = string.Empty;

        #endregion

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            ucDeleteButton.OnButtonClick += new ShilohWeb.Controls.ActionButton.OnButtonClickHandler(ucDeleteButton_OnButtonClick);
            ucPrintButton.OnButtonClick += new ShilohWeb.Controls.ActionButton.OnButtonClickHandler(ucPrintButton_OnButtonClick);
        }

        #region Methods

        protected int GetRequestId()
        {
            int id = 0;

            if (Request.QueryString["rid"] != null)
            {
                if (!Int32.TryParse(Request.QueryString["rid"].ToString(), out id))
                    id = 0;
            }

            return id;
        }

        protected void GetPrayerRequest()
        {
            if (_RequestId > 0)
            {
                PrayerReq pr = new PrayerReq(_RequestId);

                if (!string.IsNullOrEmpty(pr.PrayerNeeds.Trim()))
                {
                    divPrayer.InnerText = pr.PrayerNeeds;
                    txtProcessedBy.Text = pr.ProcessedBy;
                    lblConfidential.Visible = pr.IsConfidential;
                    lblFrom.Text = string.Concat(pr.FirstName, " ", pr.LastName);

                    if (pr.Responses.Count > 0)
                    {
                        txtResponse.Text = pr.Responses[0].ResponseText;
                        hdnResponseId.Value = pr.Responses[0].Id.ToString();
                    }
                }
            }            
        }

        protected bool SaveResponse()
        {
            bool saved = false;

            _ResponseId = Convert.ToInt32(hdnResponseId.Value);

            Shiloh.BL.PrayerResponse response = new Shiloh.BL.PrayerResponse(_ResponseId);
            
            response.ProcessedBy = this.txtProcessedBy.Text;
            response.ResponseText = Server.HtmlEncode(txtResponse.Text);
            response.RequestId = _RequestId;
            response.DateCreated = DateTime.Now;

            try
            {
                saved = response.Save();
            }
            catch (Exception ex)
            {
                _ErrorMsg = ex.Message;
                saved = false;
            }

            return saved;
        }

        protected bool DeleteRequest()
        {
            bool deleted = true;

            if (_RequestId > 0)
            {
                try
                {                    
                    PrayerReq pr = new PrayerReq(_RequestId);

                    if (pr.Responses.Count > 0)
                    {
                        foreach (Shiloh.BL.PrayerResponse resp in pr.Responses)
                        {
                            resp.Delete();
                        }
                    }

                    deleted = pr.Delete();
                }
                catch (Exception ex)
                {
                    _ErrorMsg = ex.Message;
                    deleted = false;
                }
            }

            return deleted;
        }

        protected bool SaveRequest()
        {
            bool saved = false;

            try
            {
                PrayerReq pr = new PrayerReq(_RequestId);

                pr.ProcessedBy = txtProcessedBy.Text;
                pr.WasProcessed = true;

                saved = pr.Save();
            }
            catch (Exception ex)
            {
                _ErrorMsg = ex.Message;
                saved = false;
            }

            return saved;
        }

        #endregion

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtProcessedBy.Text.Trim()))
            {
                if (SaveResponse())
                {
                    // blind save
                    if (!SaveRequest())
                        ucPopupMsg1.ShowMessage(_ErrorMsg);
                    else
                        Response.Redirect("PrayerRequestList.aspx");
                }
                else
                {
                    ucPopupMsg1.ShowMessage(_ErrorMsg);
                }
            }
            else
                ucPopupMsg1.ShowMessage("Please enter a name into the Process By field.");
        }

        void ucPrintButton_OnButtonClick(object sender, EventArgs e)
        {            
            if (_RequestId > 0)
                Response.Redirect("PrayerRequestPrint.aspx?rid=%rid%".Replace("%rid%", _RequestId.ToString()));

        }

        void ucDeleteButton_OnButtonClick(object sender, EventArgs e)
        {
            if (DeleteRequest())
                Response.Redirect("PrayerRequestList.aspx");
            else
                ucPopupMsg1.ShowMessage(_ErrorMsg);
        }

    }
}
