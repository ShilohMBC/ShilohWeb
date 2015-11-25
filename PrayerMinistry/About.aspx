<%@ Page Title="About: Shiloh Prayer Ministry" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ShilohWeb.PrayerMinistry.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div id="subjectHeading">
        <h1>Prayer Ministry</h1>
        <ul>
            <li class="current">About</li>
            <li><a href="PrayerRequest.aspx">Prayer Request</a></li>
            <li><a href="PrayerWall.aspx">Prayer Wall</a></li>
        </ul>
    </div>
    <div class="defaultMargin">		
        <h2>About the Prayer Ministry</h2>
        <div class="right twoColumn quote">			
			<h2 style="font-style: italic;">Scripture for Today</h2>
            <blockquote>
				<asp:Label ID="lblSOD" runat="server" Text='"And all things, whatsoever ye shall ask in prayer, believing, ye shall receive."'></asp:Label>
			</blockquote>
            <cite>
				<asp:Label ID="lblSODVerse" runat="server" Text="Matt. 21-22"></asp:Label>
			</cite>
        </div>
        <div id="directory">
            <div class="entry">
                <table>
                    <tr>
                        <td>
                            <img alt="Picture" src="/Images/a_Rev_1.jpg" />
                         </td>
                        <td style="padding-left: 8px;" valign="top">
                            <div><b>Rev. Jean Johnson: <i>Director</i></b></div>
                            <div><b>Phone:</b> (907) 276-6673</div>
                            <div><b>Email:</b> <a href="mailto:jjfhdcatgram@aol.com">jjfhdcatgram@aol.com</a></div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>        
        Praying is a basic act of communicating with God. God cares about you and your needs.
		If you need to pray and want to submit a
        <a href="PrayerRequest.aspx" title="Submit a prayer request">prayer request</a> you can
		<div id="onlineBible">
			<a target="biblewin" href="http://www.biblegateway.com/passage/" title="Online searchable bible">
				<asp:Image ID="imgBible" runat="server" AlternateText="Online Bible" ToolTip="Online Bible"
					ImageUrl="~/Images/bibleIcon.png" Width="45" Height="45" CssClass="imgLeft" />
			</a><a target="biblewin" href="http://www.biblegateway.com/passage/" title="Online searchable bible">
				Click here</a> for a searchable online Bible.
		</div>
		do so by  <a href="PrayerRequest.aspx" title="Submit a prayer request">clicking here</a>. If you need help in your praying, please 
        consider our prayer guide below or you can contact our prayer team at (907) 276-6673. Thank you and may God bless you.
        
        <!-- Currently placed on an independent page... -->
        <h3>Prayer Guidance: <i>How to Pray</i></h3>
        <ol>
            <li>Determine to be obedient to God in prayer.</li>
            <li>Take your Bible, pencil and paper with you when you pray, and be ready to receive from God.</li>
            <li>Set aside a time of prayer for the family, as well as time for your own personal prayer.</li>
            <li>Designate and dedicate to God a special place in your home for prayer. Make Him a prayer altar. This will be the place where you and your family meet with God in prayer, praise, worship, and the Word. If you will do this, you will find over time, that it will not take you very long to come into the actual presence of God. There you can make your requests known unto Him. Most of us have certain places for everything, but we fail to have a place for God in our homes. He is holy and deserves our reverence. Designate a special place and dedicate it unto God.</li>
            <li>Be honest with God, no matter what. There is nothing we can tell God that He doesn't already know.</li>
            <li>For some prayer is new. Talk to God and listen to Him. These tips for effective prayer may take some time to institute, but they are achievable. You have two that intercede for you, the 2nd and 3rd persons of the Trinity. If you have not been praying as the Holy Spirit would have you pray, repent and start again. The only prayer that God can't answer is the one He is still waiting to hear you pray.</li>
            <li>If you are not currently spending time with God in prayer, start slow, with a few minutes each day. Be consistent, with the intention to increase the time you spend with God. God will not only honor your sincere efforts, He will uphold them and bless you.</li>
            <li>Pray scriptural prayers. Find a scripture that agrees with your request or praise. The Word of our God is powerful and alive.</li>
            <li>
                Here is the pathway to prayer:<br />
                <ul>
                    <li>A - Adore God</li>
                    <li>C - Confess your sin</li>
                    <li>T - Thanksgiving unto God</li>
                    <li>S - Supplication</li>
                </ul>
            </li>
        </ol>
        <h4>Scriptures for Meditation</h4>
        <ul>
            <li>Psalm 23, 27</li>
            <li>Psalm 100, 103, 121</li>
            <li>Exodus 15:25</li>
            <li>Deuteronomy 28: 8-18</li>
            <li>Lamentations 3:21-26</li>
            <li>Isaiah 53</li>
            <li>Matthew 8</li>
            <li>1 Peter 2:24</li>
            <li>1 Thessalonians 5:17</li>
        </ul>
    </div>
</asp:Content>