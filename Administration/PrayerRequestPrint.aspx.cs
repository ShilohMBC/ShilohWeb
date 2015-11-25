using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Shiloh.BL;

namespace ShilohWeb.Administration
{
    public partial class PrayerRequestPrint : BaseAdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetRequest();
        }

        public void GetRequest()
        {
            if (Request.QueryString["rid"] != null)
            {
                int reqId = 0;

                if (Int32.TryParse(Request.QueryString["rid"].ToString(), out reqId))
                {
                    PrayerReq req = new PrayerReq(reqId);

                    if (req.PleaseCall)
                    {
                        lblCall.Text = "Yes - ";
                        if (!string.IsNullOrEmpty(req.Phone))
                        {
                            lblCall.Text = string.Concat(lblCall.Text, "Please call ", FormatPhone(req.Phone));

                            if (!req.BestCallTime.StartsWith("No"))
                                lblCall.Text = string.Concat(lblCall.Text, req.BestCallTime, " is the best time to call.");
                        }
                        else
                            lblCall.Text = string.Concat(lblCall.Text, "No phone number was listed.");                        
                    }
                    else
                        lblCall.Text = "No";

                    lblConfidential.Text = (req.IsConfidential) ? "Yes" : "No";
                    lblEmail.Text = (!string.IsNullOrEmpty(req.Email)) ? req.Email : string.Empty;
                    lblDatePrinted.Text = DateTime.Now.ToShortDateString();
                    lblDateReceived.Text = req.DateReceived.ToShortDateString();

                    if (req.IsInHospital)
                    {
                        if (req.DoHospitalVisit)
                        {
                            if (!string.IsNullOrEmpty(req.HospitalName))
                            {
                                if (!string.IsNullOrEmpty(req.HospitalRoomNo))
                                    lblHostpital.Text = string.Concat("Yes, please visit them at ", req.HospitalName, " hospital in room# ", req.HospitalRoomNo);
                                else
                                    lblHostpital.Text = string.Concat("Yes, please visit them at ", req.HospitalName, " hospital.");
                            }
                            else
                            {
                                lblHostpital.Text = string.Concat("Yes, please visit but contact family for hospital information. ");
                            }
                        }
                        else
                        {
                            lblHostpital.Text = "Yes, but do not visit.";
                        }
                    }
                    else
                    {
                        lblHostpital.Text = "No";
                    }

                    lblInDager.Text = (req.IsInDanger) ? "Yes" : "No";

                    lblName.Text = string.Concat(req.FirstName, " ", req.LastName);
                    lblPrayerRequest.Text = req.PrayerNeeds;
                    lblReferrals.Text = req.Referrals.Replace("|", " ,");
                    lblSpecialInstructions.Text = (!string.IsNullOrEmpty(req.SpecialInstructions)) ? req.SpecialInstructions : "None";
                    lblHandledBy.Text = req.ProcessedBy;
                }
            }
        }

        protected string FormatPhone(string PhoneNumber)
        {
            string phone = PhoneNumber;

            if (!string.IsNullOrEmpty(PhoneNumber))
            {
                if (PhoneNumber.Length == 7)
                    phone = string.Concat(PhoneNumber.Substring(0, 3), "-", PhoneNumber.Substring(3));
                else if (PhoneNumber.Length == 10)
                    phone = string.Concat("(", PhoneNumber.Substring(0, 3), ") ", PhoneNumber.Substring(3, 3), "-", PhoneNumber.Substring(6));
                else
                    phone = PhoneNumber;                
            }
            else
                phone = string.Empty;

            return phone;
        }
    }
}
