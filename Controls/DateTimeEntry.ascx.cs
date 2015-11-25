using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel.Design;
using System.ComponentModel;

namespace ShilohWeb.Controls
{
    public partial class DateTimeEntry : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlCalendar.Style.Add("position", "absolute");
                pnlCalendar.Style.Add("top", _CalendarTop.ToString() + "px");
                pnlCalendar.Style.Add("left", _CalendarLeft.ToString() + "px");
            }
        }

        #region Properties

        DateTime _SelectedDate;
        public DateTime SelectedDate
        {
            get { 
                _SelectedDate = GetDate();
                return _SelectedDate;
            }
            set {
                _SelectedDate = value;
                SetDate(_SelectedDate);
            }
        }

        
        bool _ShowTime = true;

        [Browsable(true)]
        public bool ShowTime
        {
            get { return _ShowTime; }
            set
            {
                _ShowTime = value;

                if (ddlHour != null)
                {
                    ddlHour.Visible = ddlMinute.Visible = ddlMerdian.Visible = value;
                }
            }
        }

        [Browsable(true)]
        int _CalendarTop = 10;
        public int CalendarPositionTop
        {
            get { return _CalendarTop; }
            set { _CalendarTop = value; }
        }

        [Browsable(true)]
        int _CalendarLeft = 300;
        public int CalendarPositionLeft
        {
            get { return _CalendarLeft; }
            set { _CalendarLeft = value; }
        }

        #endregion

        #region Methods

        private void SetDate(DateTime DateValue)
        {
            bool increaseToNextHour = false;

            txtDate.Text = DateValue.Date.ToShortDateString();            

            if (DateValue.Minute == 0 || DateValue.Minute == 15 || DateValue.Minute == 30 || DateValue.Minute == 45)
                ddlMinute.Text = DateValue.Minute.ToString();
            else
                ddlMinute.Text = RoundMinute(DateValue.Minute, out increaseToNextHour).ToString();

            if (increaseToNextHour)
                DateValue = DateValue.AddHours(1.0);

            ddlHour.Text = (DateValue.Hour > 12) ? (DateValue.Hour - 12).ToString() : DateValue.Hour.ToString();

            //ddlMerdian.SelectedIndex = (DateValue.ToString("tt").ToLower().Equals("am")) ? 0 : 1;
            ddlMerdian.SelectedIndex = (DateValue.Hour > 12) ? 1 : 0;
        }

        private DateTime GetDate()
        {
            DateTime selectDate = DateTime.Now;

            if (txtDate.Text.Trim().Length > 0)
            {
                string[] tokens = txtDate.Text.Split(new char[] { '/' });

                if (tokens.Length >= 3)
                {
                    int hour = Convert.ToInt32(ddlHour.SelectedItem.Text);

                    // use 24 hour clock
                    if (ddlMerdian.Text.Equals("PM") && hour < 12)
                        hour = hour + 12;

                    selectDate = new DateTime(
                        Convert.ToInt32(tokens[2]),
                        Convert.ToInt32(tokens[0]),
                        Convert.ToInt32(tokens[1]),
                        hour,
                        Convert.ToInt32(ddlMinute.SelectedItem.Value),
                        0);
                }
            }

            return selectDate;
        }

        private int RoundMinute(int Minute, out bool IncreaseHour)
        {
            int minute = 0;
            IncreaseHour = false;

            if (Minute >= 0 && Minute <= 7)
                minute = 0;
            else if (Minute >= 8 && Minute <= 22)
                minute = 15;
            else if (Minute >= 23 && Minute <= 37)
                minute = 30;
            else if (Minute >= 38 && Minute <= 52)
                minute = 45;
            else
            {
                minute = 0;
                IncreaseHour = true;
            }

            return minute;
        }

        #endregion

        #region Events

        public delegate void DateChangedHandler(object sender, DateChangedEventArgs e);
        public event DateChangedHandler DateChanged;

        public void RaiseDateChangedEvent(DateTime NewSelectedDate)
        {
            DateChangedHandler eh = DateChanged;

            if (eh != null)
            {
                DateChangedEventArgs args = new DateChangedEventArgs(NewSelectedDate);
                eh(this, args);
            }
        }

        public class DateChangedEventArgs : EventArgs
        {
            public DateChangedEventArgs(DateTime NewDate)
            {
                NewSelectedDate = NewDate;
            }

            public readonly DateTime NewSelectedDate;
        }

        #endregion

        protected void ibtnPopupCal_Click(object sender, ImageClickEventArgs e)
        {
            pnlCalendar.Visible = true;
        }

        protected void btnCloseCal_Click(object sender, EventArgs e)
        {
            if (calPickDate != null && calPickDate.SelectedDate.Year != 1)
                txtDate.Text = calPickDate.SelectedDate.ToShortDateString();

            pnlCalendar.Visible = false;
        }

        protected void calPickDate_SelectionChanged(object sender, EventArgs e)
        {
            if (calPickDate != null && calPickDate.SelectedDate.Year != 1)
            {
                _SelectedDate = calPickDate.SelectedDate.Date;
                txtDate.Text = _SelectedDate.Date.ToShortDateString();
                RaiseDateChangedEvent(_SelectedDate);

                pnlCalendar.Visible = false;
            }
        }
    }
}