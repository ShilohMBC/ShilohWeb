using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Shiloh.BL;

namespace ShilohWeb.Administration
{
    public partial class EventsList : BaseAdminPage
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                SetDateRanges();
        }

        protected void SetDateRanges()
        {
            DateTime startDate;
            DateTime endDate;

            if (!IsPostBack)
                startDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            else
                startDate = new DateTime(ucFilterMonthYear.Year, ucFilterMonthYear.Month, 1);

            endDate = startDate.AddMonths(1).AddDays(-1.0).Date;

            Session["EventStartDate"] = startDate.Date;
            Session["EventEndDate"] = endDate.Date;
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            ucFilterMonthYear.FilterChanged += new ShilohWeb.Controls.FilterMonthYear.FilterChangedHandler(ucFilterMonthYear_FilterChanged);
        }

        protected string SubString(string StringValue, int MaxLength)
        {
            string desc = string.Empty;
            int maxLen = MaxLength;
            desc = (StringValue.Trim().Length > maxLen) ? string.Concat(StringValue.Substring(0, maxLen), "...") : StringValue;

            return desc;
        }

        protected void grdEvents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {            
        }

        protected void grdEvents_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
        }

        private void ucFilterMonthYear_FilterChanged(object sender, ShilohWeb.Controls.FilterMonthYear.FilterChangedEventArgs e)
        {
            sqldcEvents.Select(new DataSourceSelectArguments());
        }

        protected void sqldcEvents_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            SetDateRanges();
        }
    }
}
