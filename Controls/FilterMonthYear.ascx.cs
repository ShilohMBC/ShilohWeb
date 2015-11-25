using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.Controls
{
    public partial class FilterMonthYear : BaseUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadAndSetFilters();
        }

        #region Properties

        public int Month
        {
            get 
            {
                if (ddlFilterMonth != null)
                    return Convert.ToInt32(ddlFilterMonth.SelectedItem.Value);
                else
                    return 0;
            }
        }

        public int Year
        {
            get
            {
                if (ddlFilterYear != null)
                    return Convert.ToInt32(ddlFilterYear.SelectedItem.Value);
                else
                    return 0;
            }
        }
        public string MonthName
        {
            get
            {
                if (ddlFilterMonth != null)
                    return ddlFilterMonth.Text;
                else
                    return string.Empty;
            }
        }

        int _YearsBeforeCurrentDate = 2;
        public int YearsBeforeCurrentDate
        {
            get { return _YearsBeforeCurrentDate; }
            set { _YearsBeforeCurrentDate = value; }
        }

        int _YearsAfterCurrentDate = 2;
        public int YearsAfterCurrentDate
        {
            get { return _YearsAfterCurrentDate; }
            set { _YearsAfterCurrentDate = value; }
        }

        #endregion

        #region Events

        public delegate void FilterChangedHandler(object sender, FilterChangedEventArgs args);
        public event FilterChangedHandler FilterChanged;

        public void RaiseFilterChangedEvent(int Month, string MonthName, int Year)
        {
            FilterChangedHandler eh = FilterChanged;

            if (eh != null)
            {
                FilterChangedEventArgs args = new FilterChangedEventArgs(Month,  MonthName,  Year);
                eh(this, args);
            }
        }

        public class FilterChangedEventArgs : EventArgs
        {
            public FilterChangedEventArgs(int MonthId, string Monthname, int YearId)
            {
                MonthName = Monthname;
                Month = MonthId;
                Year = YearId;
            }

            public readonly string MonthName;
            public readonly int Month;
            public readonly int Year;
        }
        #endregion

        protected void LoadAndSetFilters()
        {           
            ddlFilterMonth.Text = DateTime.Now.Month.ToString();

            for (int i = DateTime.Now.Year + _YearsAfterCurrentDate; i >= DateTime.Now.Year - _YearsBeforeCurrentDate; i--)
                ddlFilterYear.Items.Add(new ListItem(i.ToString()));

            ddlFilterYear.Text = DateTime.Now.Year.ToString();
        }

        protected void ibtnFilter_Click(object sender, ImageClickEventArgs e)
        {
            RaiseFilterChangedEvent(
                Convert.ToInt32(ddlFilterMonth.SelectedItem.Value), 
                ddlFilterMonth.Text, 
                Convert.ToInt32(ddlFilterYear.SelectedItem.Value));
        }
    }
}