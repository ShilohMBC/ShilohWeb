using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Shiloh.BL;

namespace ShilohWeb.Administration
{
    public partial class PrayerRequestList : BaseAdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            //if (!IsPostBack)
            {
                SetDateRanges();
            }
        }

        protected void SetDateRanges()
        {

            if (!IsPostBack)
            {
                Session["PrayerReqStartDate"] = DateTime.Now.AddDays(-31.0);
                Session["PrayerReqEndDate"] = DateTime.Now;
            }
            else
            {
                Session["PrayerReqStartDate"] = ucFilterDays.DateRangeStart;
                Session["PrayerReqEndDate"] = ucFilterDays.DateRangeEnd;
            }
        }

        protected string GetRequest(string PrayerRequest, int MaxLength)
        {
            return (PrayerRequest.Length > MaxLength) ? PrayerRequest.Substring(0, MaxLength) + "..." : PrayerRequest;;
        }

        protected string BuildResponseImage(bool BeenProcessed, int RequestId, int ResponseId, string EnabledImageOn, string EnabledImageOff, string DisabledImage)
        {
            System.Text.StringBuilder html = new System.Text.StringBuilder(string.Empty);

            if (BeenProcessed)
            {
                string img = (ResponseId > 0) ? EnabledImageOn : EnabledImageOff;
                html.Append("<a href='%url%?rid=%id%' title='Respond to prayer'><img src='/Images/%imgurl%' alt='X' style='border: none;width: 16px; height: 16px;' /></a>");
                html.Replace("%url%", "PrayerResponse.aspx");
                html.Replace("%id%", RequestId.ToString());
                html.Replace("%imgurl%", img);

            }
            else
            {
                html.Append("<a href='' title='The request must be assigned to someone before responding.'><img src='/Images/%imgurl%' alt='X' style='border: none;width: 16px; height: 16px;' /></a>");
                html.Replace("%imgurl%", DisabledImage);
            }

            return html.ToString();
        }

        protected string BuildPrinterImage(bool BeenProcessed, int RequestId, string EnabledImage, string DisabledImage)
        {
            System.Text.StringBuilder html = new System.Text.StringBuilder(string.Empty);

            if (BeenProcessed)
            {
                html.Append("<a href='%url%?rid=%id%' title='Print prayer request' target='_blank'><img src='/Images/%imgurl%' alt='X' style='border: none;width: 16px; height: 16px;' /></a>");
                html.Replace("%url%", "PrayerRequestPrint.aspx");
                html.Replace("%id%", RequestId.ToString());
                html.Replace("%imgurl%", EnabledImage);

            }
            else
            {
                html.Append("<a href='' title='The request must be assigned to someone before printing'><img src='/Images/%imgurl%' alt='X' style='border: none;width: 16px; height: 16px;' /></a>");
                html.Replace("%imgurl%", DisabledImage);
            }

            return html.ToString();
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            ucFilterDays.FilterChanged += new ShilohWeb.Controls.FilterDays.FilterChangedHandler(ucFilterDays_FilterChanged);
            // ucFilterMonthYear.FilterChanged += new ShilohWeb.Controls.FilterMonthYear.FilterChangedHandler(ucFilterMonthYear_FilterChanged);
        }

        private void ucFilterDays_FilterChanged(object sender, ShilohWeb.Controls.FilterDays.FilterChangedEventArgs e)
        {
            sqldcRequests.Select(new DataSourceSelectArguments());
        }

        private void ucFilterMonthYear_FilterChanged(object sender, ShilohWeb.Controls.FilterMonthYear.FilterChangedEventArgs e)
        {
            sqldcRequests.Select(new DataSourceSelectArguments());
        }

        protected void sqldcRequests_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            SetDateRanges();
        }

        protected void grdRequests_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        }

        protected void grdRequests_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
        }


        protected void grdRequests_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
 
        }

        protected void grdRequests_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (e.NewValues.Count > 0)
            {
                if (string.IsNullOrEmpty(e.NewValues[0].ToString().Trim()))
                {
                    e.Cancel = true;
                }
            }

        }
    }
}
