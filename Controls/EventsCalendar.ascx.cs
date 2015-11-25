using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Shiloh.BL;

namespace ShilohWeb.Controls
{
    public partial class EventsCalendar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        #region Properties

        public struct sActivity
        {
            public int Id;
            public string Name;
            public string Description;
            public DateTime StartDate;
            public DateTime EndDate;
        }

        Shiloh.BL.Shiloh.activityDataTable _dtActivities;
        Dictionary<string, List<sActivity>> _Activities = new Dictionary<string, List<sActivity>>();

        public DateTime SelectedDate
        {
            get { return eventCalendar.SelectedDate; }
            set { eventCalendar.SelectedDate = value.Date; }
        }

        public Shiloh.BL.Shiloh.activityDataTable MonthlyActivities
        {
            get { return _dtActivities; }
        }

        #endregion

        #region Methods

        private void AddActivity(DateTime ActivityDate, sActivity Activity)
        {
            string dateString = ActivityDate.ToShortDateString();

            if (!_Activities.ContainsKey(dateString))
            {
                List<sActivity> activities = new List<sActivity>();
                _Activities.Add(dateString, activities);
            }

            ((List<sActivity>)_Activities[dateString]).Add(Activity);
        }

        public void LoadActivities(int Month, int Year)
        {
            _Activities.Clear();
            Activity activity = new Activity();

            _dtActivities = activity.GetByMonth(Month, Year);

            foreach (Shiloh.BL.Shiloh.activityRow row in _dtActivities.Rows)
            {
                sActivity act = new sActivity();

                act.Id = row.ID;
                act.Name = row.name;
                act.Description = row.description;
                act.StartDate = row.activityStart;
                act.EndDate = row.activityEnd;

                // add to the list of activities for the day
                AddActivity(act.StartDate, act);

                // if this is a date range then add an event for each day in the range
                int dayRange = Math.Abs(act.EndDate.Subtract(act.StartDate).Days);
                if (dayRange > 0)
                {
                    for (double i = 1; i <= dayRange; i++)
                    {
                        AddActivity(act.StartDate.AddDays(i), act);
                    }
                }
            }
        }

        protected string GetDescription(string Description)
        {
            string desc = string.Empty;

            if (!string.IsNullOrEmpty(Description))
                desc = (Description.Length > 25) ? Description.Substring(0, 24) + "..." : Description;

            return desc.ToUpper();
        }

        protected string BuildDateHeader(DateTime StartDate, DateTime EndDate)
        {
            string dateHdr = string.Empty;

            // if the start and end dates are the same, just show the one date
            if (StartDate.Date.CompareTo(EndDate.Date) == 0)
            {
                dateHdr = StartDate.ToString("dddd, MMM dd");
            }
            else
            {
                // if the months are the same, then just show the day
                if (StartDate.Month == EndDate.Month)
                    dateHdr = string.Concat(StartDate.ToString("dddd, MMM dd"), " - ", EndDate.ToString("dd"));
                else
                    dateHdr = string.Concat(StartDate.ToString("dddd, MMM dd"), " - ", EndDate.ToString("MMM dd"));
            }

            return dateHdr;
        }

        protected string BuildEventURL(int EventId, DateTime ActivityDate)
        {
            string eventLink = "/Calendar.aspx?dt=%date%&eid=%eid%";
            eventLink = eventLink.Replace("%date%", ActivityDate.ToString("yyyyMMdd")).Replace("%eid%", EventId.ToString());

            return eventLink;
        }

        #endregion

        #region Calendar Events

        protected void eventCalendar_DayRender(object sender, DayRenderEventArgs e)
        {
            string key = e.Day.Date.ToShortDateString();
            if (_Activities.ContainsKey(key))
            {
                sActivity activity = ((List<sActivity>)_Activities[key])[0];

                if (e.Day.Date.CompareTo(DateTime.Now.Date) >= 0)
                {
                    string eventLink = "<a href='%elink%' title='%tip%'><div><img src='/Images/Calendar.png' alt='event' style='width:16px;height:16px;' /></div></a>";

                    // build event URL
                    string eventUrl = "/Calendar.aspx?dt=%date%&eid=%eid%";
                    eventUrl = eventUrl.Replace("%date%", activity.StartDate.ToString("yyyyMMdd")).Replace("%eid%", activity.Id.ToString());

                    // make the backcolor active
                    e.Cell.BackColor = System.Drawing.Color.FromArgb(255, 255, 128);

                    // make a popup tooltip for the event
                    StringBuilder tooltip = new StringBuilder(string.Empty);

                    foreach (sActivity act in (List<sActivity>)_Activities[key])
                    {
                        tooltip.Append(act.StartDate.ToString("h:mm tt"));
                        tooltip.Append(" - " + act.Name);
                        tooltip.Append(System.Environment.NewLine);
                    }

                    // build anchor tag and add it to the calendar
                    eventLink = eventLink.Replace("%tip%", tooltip.ToString()).Replace("%elink%", eventUrl);

                    LiteralControl calEvent = new LiteralControl(eventLink);
                    e.Cell.Controls.Add(calEvent);
                    e.Cell.ToolTip = tooltip.ToString();
                }
                else
                {
                    e.Cell.Controls.Add(new LiteralControl("<div><img alt='X' src='/Images/CalendarDisabled.png' style='width:16px;height:16px;' /></div>"));
                    e.Cell.BackColor = System.Drawing.SystemColors.GrayText;
                    e.Cell.ToolTip = activity.Name;
                }
            }
        }

        protected void eventCalendar_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {
            LoadActivities(e.NewDate.Month, e.NewDate.Year);
            RaiseMonthChangedEvent(e.NewDate);
        }

        protected void eventCalendar_Load(object sender, EventArgs e)
        {

        }

        protected void eventCalendar_SelectionChanged(object sender, EventArgs e)
        {
            Response.Redirect("/Calendar.aspx?dt=%date%&eid=-1".Replace("%date%", eventCalendar.SelectedDate.Date.ToString("yyyyMMdd")));
        }

        #endregion

        #region Events

        public delegate void MonthChangedHandler(object sender, MonthChangeEventArgs e);
        public event MonthChangedHandler MonthChanged;

        public void RaiseMonthChangedEvent(DateTime NewSelectedDate)
        {
            MonthChangedHandler eh = MonthChanged;

            if (eh != null)
            {
                MonthChangeEventArgs args = new MonthChangeEventArgs(NewSelectedDate);
                eh(this, args);
            }
        }

        public class MonthChangeEventArgs : EventArgs
        {
            public MonthChangeEventArgs(DateTime NewDate)
            {
                NewSelectedDate = NewDate;
            }

            public readonly DateTime NewSelectedDate;
        }

        #endregion
    }
}