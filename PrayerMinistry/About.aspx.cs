using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Shiloh.BL;

namespace ShilohWeb.PrayerMinistry
{
    public partial class About : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTheScriptureOfTheDay();
            }
        }

        protected void GetTheScriptureOfTheDay()
        {
            ScripturesOfTheDay scriptures = new ScripturesOfTheDay(DateTime.Now);

            if (scriptures.Count > 0)
            {
                // ok this is kind of wizzy wack, but lets roll with it.  This is my lazy way of trying to build the list of passages
                // so that the books and chapters don't repeat when more than on passage is selected:  
                // e.g.  John 3:16,17,18 as opposed to John 3:16,John 3:17,John 3:18
                Dictionary<string, Dictionary<int, Dictionary<int, string>>> books = new Dictionary<string, Dictionary<int, Dictionary<int, string>>>();

                foreach (ScriptureOfTheDay script in scriptures)
                {
                    if (!string.IsNullOrEmpty(script.scripture))
                    {
                        if (books.ContainsKey(script.book))
                        {
                            Dictionary<int, Dictionary<int, string>> chapters = books[script.book];

                            if (chapters.ContainsKey(script.chapter))
                            {
                                Dictionary<int, string> verses = chapters[script.chapter];

                                if (!verses.ContainsKey(script.verse))
                                    verses.Add(script.verse, script.scripture);
                                else
                                    verses[script.verse] = script.scripture;
                            }
                            else
                            {
                                Dictionary<int, string> verses = new Dictionary<int, string>();
                                verses.Add(script.verse, script.scripture);

                                chapters.Add(script.chapter, verses);
                            }
                        }
                        else
                        {
                            Dictionary<int, string> verses = new Dictionary<int, string>();
                            verses.Add(script.verse, script.scripture);

                            Dictionary<int, Dictionary<int, string>> chapters = new Dictionary<int, Dictionary<int, string>>();
                            chapters.Add(script.chapter, verses);

                            books.Add(script.book, chapters);
                        }
                    }
                }

                StringBuilder passages = new StringBuilder("");
                StringBuilder passageText = new StringBuilder("");
                bool hilite = false;

                foreach (string book in books.Keys)
                {
                    if (hilite)
                    {
                        passages.Append("<span class='prayerHilite'>");
                        passageText.Append("<span class='prayerHilite'>");
                    }

                    passages.Append(book); passages.Append(" ");

                    Dictionary<int, Dictionary<int, string>> chapters = books[book];

                    foreach (int chapter in chapters.Keys)
                    {                        
                        passages.Append(chapter.ToString()); passages.Append(":");
                        Dictionary<int, string> verses = chapters[chapter];

                        foreach (int verse in verses.Keys)
                        {
                            passages.Append(verse.ToString()); passages.Append(",");
                            passageText.Append(verses[verse]); passages.Append(" ");
                        }

                        // remove trailing comma
                        passageText.Append("  ");
                        //passages.Remove(passages.Length - 1, 1); passages.Append(" ");

                        if (hilite)
                        {
                            passages.Append("</span>");
                            passageText.Append("</span>");
                        }

                        hilite = !hilite;
                    }
                }

                if (passageText.Length > 0)
                {
                    string finalText = passageText.ToString();

                    lblSOD.Font.Size = new FontUnit(GetFontSize(finalText));
                    lblSODVerse.Text = passages.Remove(passages.Length - 2,2 ).ToString();
                    lblSOD.Text = string.Format("\"{0}.\"", finalText.Substring(0,finalText.Length-3));                    
                }

                // now we should have list of chapters and verses, so lets spin through and build the passages along with
                // the list of passages

                //if (scriptures.Count > 0)
                //{
                //    ScriptureOfTheDay sod = scriptures[0];

                //    if (!string.IsNullOrEmpty(sod.scripture))
                //    {
                //        lblSOD.Font.Size = new FontUnit(GetFontSize(sod.scripture));
                //        lblSOD.Text = string.Format("\"{0}\"",sod.scripture);
                //        lblSODVerse.Text = string.Format("{0} {1}:{2}", sod.book, sod.chapter.ToString(), sod.verse.ToString());
                //    }
                //}
            }
        }

        private int GetFontSize(string Scripture)
        {
            int size = 14;

            if (!string.IsNullOrEmpty(Scripture))
            {
                int len = Scripture.Length;

                if (len > 80 && len <= 160)
                {
                    size = 13;
                }
                else if (len > 160 && len <= 240)
                {
                    size = 12;
                }
                else if (len > 240 && len <= 320)
                {
                    size = 11;
                }
                else if (len > 320 && len <= 360)
                {
                    size = 10;
                }
                else if (len > 360)
                {
                    size = 9;
                }
            }
            
            return size;
        }


    }
}
