using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShilohWeb.Controls
{
    public partial class FilterDays : System.Web.UI.UserControl
    {
        public enum eDayFilters { All, Last30Days, LastMonth, LastQtr, LastYear, ThisMonth, ThisQtr, YTD }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Properties

        DateTime _StartDate;
        public DateTime DateRangeStart
        {
            get
            {
                if (_StartDate.Equals(DateTime.MinValue))
                    SetDateRanges();

                return _StartDate;
            }
        }

        DateTime _EndDate;
        public DateTime DateRangeEnd
        {
            get
            {
                if (_EndDate.Equals(DateTime.MinValue))
                    SetDateRanges();

                return _EndDate;
            }
        }

        #endregion

        #region Methods

        protected void SetDateRanges()
        {
            _StartDate = DateTime.MinValue;
            _EndDate = DateTime.MaxValue;

            int filterId = 0;

            if (Int32.TryParse(ddlFilter.SelectedItem.Value.ToString(), out filterId))
            {
                switch ((eDayFilters)filterId)
                {
                    case eDayFilters.All:
                        _StartDate =  System.Data.SqlTypes.SqlDateTime.MinValue.Value;
                        _EndDate = System.Data.SqlTypes.SqlDateTime.MaxValue.Value;
                        break;

                    case eDayFilters.Last30Days:
                        _StartDate = DateTime.Now.AddDays(-31.0);
                        _EndDate = DateTime.Now;
                        break;

                    case eDayFilters.LastMonth:
                        {
                            DateTime tmpDate = DateTime.Now.AddMonths(-1);
                            _StartDate = new DateTime(tmpDate.Year, tmpDate.Month, 1);
                            _EndDate = _StartDate.AddMonths(1).AddSeconds(-1.0);
                        }
                        break;

                    case eDayFilters.ThisMonth:
                        {
                            _StartDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                            _EndDate = _StartDate.AddMonths(1).AddSeconds(-1.0);
                        }
                        break;

                    case eDayFilters.LastQtr:
                    case eDayFilters.ThisQtr:
                        {
                            int year = ((eDayFilters)filterId == eDayFilters.ThisQtr) ? DateTime.Now.Year : DateTime.Now.Year - 1;

                            if (DateTime.Now.Month >= 1 && DateTime.Now.Month <= 3)                            
                                _StartDate = new DateTime(year, 1, 1);                            
                            else if (DateTime.Now.Month >= 4 && DateTime.Now.Month <= 6)                            
                                _StartDate = new DateTime(year, 4, 1);                            
                            else if (DateTime.Now.Month >= 7 && DateTime.Now.Month <= 9)                            
                                _StartDate = new DateTime(year, 7, 1);                            
                            else                            
                                _StartDate = new DateTime(year, 10, 1);                            

                            _EndDate = _StartDate.AddMonths(4).AddSeconds(-1.0);
                        }
                        break;

                    case eDayFilters.LastYear:
                    case eDayFilters.YTD:
                        {
                            int year = ((eDayFilters)filterId == eDayFilters.YTD) ? DateTime.Now.Year : DateTime.Now.Year - 1;
                            _StartDate = new DateTime(year, 1, 1);
                            _EndDate = _StartDate.AddYears(1).AddSeconds(-1.0);
                        }
                        break;
                }
            }
        }

        #endregion

        #region Events

        public delegate void FilterChangedHandler(object sender, FilterChangedEventArgs e);
        public event FilterChangedHandler FilterChanged;

        public void RaiseFilterChangedEvent(DateTime StartDateRange, DateTime EndDateRange)
        {
            FilterChangedHandler eh = FilterChanged;

            if (eh != null)
            {
                FilterChangedEventArgs args = new FilterChangedEventArgs(StartDateRange, EndDateRange);
                eh(this, args);
            }
        }

        public class FilterChangedEventArgs : EventArgs
        {
            public FilterChangedEventArgs(DateTime StartDateRange, DateTime EndDateRange)
            {
                StartDate = StartDateRange;
                EndDate = EndDateRange;
            }

            public readonly DateTime StartDate;
            public readonly DateTime EndDate;
        }

        #endregion

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            SetDateRanges();
            RaiseFilterChangedEvent(_StartDate, _EndDate);
        }
    }
}