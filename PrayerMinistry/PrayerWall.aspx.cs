using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Shiloh.BL;

namespace ShilohWeb.PrayerMinistry
{
    public partial class PrayerWall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindList(DateTime.Now.Month, DateTime.Now.Year);
        }

        Shiloh.BL.Shiloh.prayerRequestDataTable _dtRequests = null;

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            // ucFilterMonthYear.FilterChanged += new ShilohWeb.Controls.FilterMonthYear.FilterChangedHandler(ucFilterMonthYear_FilterChanged);
        }

        protected void BindList(int Month, int Year)
        {
            DateTime start = DateTime.Now.AddDays(-30.0);
            DateTime end = DateTime.Now.AddDays(1.0);

            PrayerReq reqs = new PrayerReq();
            _dtRequests = reqs.GetByDateRange(start.Date, end.Date);

            dlRequests.DataSource = _dtRequests.Select("IsConfidential = 0 and wasProcessed = 1");
            dlRequests.DataBind();
        }

        protected string GetPrayerResponse(int RequestId)
        {
            string response = string.Empty;

            Shiloh.BL.PrayerResponse resp = new Shiloh.BL.PrayerResponse();
            Shiloh.BL.Shiloh.prayerResponseDataTable dtResponses = resp.GetByResponsesByRequestId(RequestId);

            if (dtResponses != null && dtResponses.Count > 0)
            {
                string respDate = Convert.ToDateTime(dtResponses.Rows[0]["dateCreated"]).ToString("dddd, dd MMMM yyyy hh:mm tt");
                response = string.Concat("<b>A Response From Shiloh: </b>", dtResponses.Rows[0]["response"].ToString(), "<div style='padding-top: 5px;'><i>%date%</i></div>".Replace("%date%", respDate));
            }

            return response;    
        }

        private void ucFilterMonthYear_FilterChanged(object sender, ShilohWeb.Controls.FilterMonthYear.FilterChangedEventArgs e)
        {
            BindList(e.Month, e.Year);
        }
    }
}
