<%@ Page Title="" Language="C#" MasterPageFile="MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="Ministries.aspx.cs" Inherits="ShilohWeb.MinistriesAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div id="subjectHeading">
        <h1>Ministries &amp; Departments</h1>
        <ul>
            <li class="current">All Ministries</li>
<!-- Hide ministry groups until additional ministry information is available...
            <li><a href="#">Support</a></li>
            <li><a href="#">Evangelism</a></li>
            <li><a href="#">Worship</a></li>
            <li><a href="#">Fellowship</a></li>
            <li><a href="#">Discipleship</a></li>   -->
        </ul>
    </div>
    <!-- This page will be a directory page using an SQL query to select a set of ministries by type -->
    <!-- The page section navigation will switch between sets of ministries and each ministry listed -->
    <!-- is provided with it's own page series -->
    <div class="defaultMargin">
        <h2>Ministry and Department Directory</h2>
        <div class="directory">
            <div class="entry">
                <img runat="server" alt="Administration and Support Ministry Image" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Administration & Support Ministries</h3>
                    <p>To render excellent service through an operational structure that values and supports the gifts and abilities of God’s people; providing administrative leadership that enables staff and ministries to operate together in pursuit of the vision of Shiloh Missionary Baptist Church.</p>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6603</dd><dd>(907) 276-6609</dd>
                        <dt>Email:</dt><dd>SupportMinistry@shiloh2000.net</dd>   
                    </dl>
                    <a runat="server" href="~/Ministries/AdminSupportMinistry.aspx" title="Administration and Support Ministries">Learn more...</a>
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Children's Ministry Image" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Children's Ministries</h3>
                    <p>
                        We have had a wonderful ministry, ShilohKids, for our
                        children from ages 6 months to 12 years. Our vision and plans for ShilohKids are
                        grounded in the New Life in Jesus and His Glorious Riches that are promised to each
                        of our children. We will offer Salvation in each of our worship experiences on Sunday.
                    </p>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6609</dd>
                        <dt>Email:</dt><dd>ChildrensMinistry@shiloh2000.net</dd>
                    </dl>
                    <a runat="server" href="~/ChildrensMinistry/About.aspx" title="Children's Ministry">Learn more...</a>
                </div>
            </div>
 <!-- Hidden waiting for content...   
            <div class="entry">
                <img runat="server" alt="Christian Education Ministry" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Christian Education Ministries</h3>
                    <p>Biblically based Sunday and weekday instruction for all ages.</p>
                    <dl>
                        <dt>Phone:</dt><dd> (907) 276-6628</dd>
                        <dt>Email:</dt><dd>undraparker@shiloh2000.net</dd>
                    </dl>
                    <a runat="server" href="#" title="">Learn more...</a>
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Community Development" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Community Development Corporation<br />
                    [Shiloh Community Development, Inc]</h3>
                    <p>Our non-profit community development division</p>
                    <dl>
                        <dt>Phone:</dt><dd>(323) 751-3440</dd>
                        <dt>Email:</dt><dd></dd>
                    </dl>
                    <a runat="server" href="#" title="">Learn more...</a>
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Discipleship" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Discipleship</h3>
                    <p>Guiding lay Christians to spiritual maturity and assisting leaders in developing lives worth emulating.</p>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6628</dd>
                        <dt>Email:</dt><dd>undraparker@shiloh2000.net</dd>
                    </dl>
                    <a runat="server" href="#" title="">Learn more...</a>
                </div>
            </div>
-->   
            <div class="entry">
                <img runat="server" alt="Evangelism" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Evangelism</h3>
                    <p>Going beyond the four walls and winning the lost to Christ.</p>
                    <dl>
                        <dt>Phone:</dt><dd>-</dd>
                        <dt>Email:</dt><dd>-</dd>    
                    </dl>
                    <a runat="server" href="~/EvangelismMinistry/About.aspx" title="">Learn more...</a>
                </div>
            </div>
<!-- Hidden waiting for content...   
            <div class="entry">
                <img runat="server" alt="Food Services and Weddings" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Food Services and Wedding Department</h3>
                    <p>Divine dining services and wedding event coordination.</p>
                    <dl>
                        <dt>Phone:</dt><dd>-</dd>
                        <dt>Email:</dt><dd>-</dd>
                    </dl>
                    <a runat="server" href="~/FoodWeddingMinistry/About.aspx" title="">Learn more...</a>
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Marriage & Family" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Marriage &amp; Family</h3>
                    <dl>
                        <dt>Phone:</dt><dd>-</dd>
                        <dt>Email:</dt><dd>-</dd>
                    </dl>
                    <a runat="server" href="~/MarriageFamilyMinistry/About.aspx" title="">Learn more...</a>
                </div>
            </div>
-->   
            <div class="entry">
                <img runat="server" alt="Media" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Media</h3>    
                    <dl>
                        <dt>Phone:</dt><dd>-</dd>
                        <dt>Email:</dt><dd>-</dd>
                    </dl>
                    <a runat="server" href="~/MediaMinistry/About.aspx" title="">Learn more...</a>
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Membership and Shiloh Support Services" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Membership and Shiloh Support Services</h3>
                    <p>Members count!</p>
                    <dl>
                        <dt>Phone:</dt><dd>-</dd>
                        <dt>Email:</dt><dd>-</dd>
                    </dl>
                    <!-- <a runat="server" href="#" title="">Learn more...</a> -->
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Men's Ministry" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Men’s Ministry</h3>
                    <dl>
                        <dt>Phone:</dt><dd>-</dd>
                        <dt>Email:</dt><dd>-</dd>
                    </dl>
                    <a runat="server" href="~/MensMinistry/About.aspx" title="">Learn more...</a>
                </div>
            </div>   
            <div class="entry">
                <img  runat="server" alt="Missions" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Missions</h3>
                    <p>Spreading the Gospel worldwide.</p>
                    <dl>
                        <dt>Phone:</dt><dd>-</dd>
                        <dt>Email:</dt><dd>-</dd>
                    </dl>
                    <!-- <a runat="server" href="#" title="">Learn more...</a> -->
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Music and Worship Arts" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Music and Worship Arts Ministries</h3>
                    <p>Setting an atmosphere whereby we may See His Glory.</p>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 267-6647</dd>
                        <dt>Email:</dt><dd>lcanty@shiloh2000.net</dd>    
                    </dl>
                    <a runat="server" href="~/MusicWorshipArtsMinistry/About.aspx" title="">Learn more...</a>
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Office of the Pastor" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Office of the Pastor</h3>
                    <p>Serving the needs of the congregation and community.</p>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6673</dd>
                        <dt>Email:</dt><dd>pastor@shiloh2000.net</dd>        
                    </dl>
                    <!-- <a runat="server" href="#" title="">Learn more...</a> -->
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Prayer Ministries" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Prayer Ministries</h3>
                    <p>Praying for our church, our community and the world.</p>
                    <dl>
                        <dt>Phone:</dt><dd>-</dd>
                        <dt>Email:</dt><dd>-</dd>   
                    </dl>
                    <a runat="server" href="~/PrayerMinistry/About.aspx" title="">Learn more...</a>
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Small Group" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Small Group Ministry:  Family Parishes </h3>
                    <p>-</p>
                    <dl>
                        <dt>Phone:</dt><dd>-</dd>
                        <dt>Email:</dt><dd>-</dd>
                    </dl>
                    <!-- <a runat="server" href="#" title="">Learn more...</a> -->
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Senior Adult" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Senior Adult Ministry: <i>Silver Strands</i></h3>
                    <p>-</p>
                    <dl>
                        <dt>Phone:</dt><dd>-</dd>
                        <dt>Email:</dt><dd>-</dd>
                    </dl>
                    <a runat="server" href="~/SeniorMinistry/About.aspx" title="">Learn more...</a>
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Volunteer" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Volunteer Ministry</h3>
                    <p>-</p>
                    <dl>
                        <dt>Phone:</dt><dd>-</dd>
                        <dt>Email:</dt><dd>-</dd>
                    </dl>
                    <!-- <a runat="server" href="~/VolunteerMinistry/About.aspx" title="">Learn more...</a> -->
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Women's Ministry" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Women's Ministry: Shiloh’s Sisterhood</h3>
                    <p>-</p>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6609</dd>    
                        <dt>Email:</dt><dd>ebrown@shiloh2000.net</dd>    
                    </dl>
                    <a runat="server" href="~/WomensMinistry/About.aspx" title="">Learn more...</a>
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Worship Ministry" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Worship Ministry</h3>
                    <p>-</p>
                    <dl>
                        <dt>Phone:</dt><dd>-</dd>
                        <dt>Email:</dt><dd>-</dd>
                    </dl>
                    <!-- <a runat="server" href="#" title="">Learn more...</a> -->
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Young Adult Ministry" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Young Adult Ministry</h3>
                    <p>Assisting Christians in their twenties and thirties to reach spiritual maturity.</p>   
                    <dl>
                        <dt>Phone:</dt><dd>-</dd>
                        <dt>Email:</dt><dd>mbunton@shiloh2000.net</dd>    
                    </dl>
                    <a runat="server" href="~/YoungAdultMinistry/About.aspx" title="">Learn more...</a>
                </div>
            </div>   
            <div class="entry">
                <img runat="server" alt="Youth Ministry" src="~/Images/noImage.gif" />
                <div class="fullDetails">
                    <h3>Youth Ministry</h3>
                    <p>Leading a new generation to Jesus.</p>
                    <dl>
                        <dt>Phone:</dt><dd>-</dd>
                        <dt>Email:</dt><dd>-</dd>
                    </dl>
                    <!-- <a runat="server" href="~/YouthMinistry/About.aspx" title="">Learn more...</a> -->
                </div>
            </div>
        </div>
    </div>
</asp:Content>