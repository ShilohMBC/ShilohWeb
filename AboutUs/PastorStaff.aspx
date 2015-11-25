<%@ Page Title="Shiloh Missionary Baptist Church - Pastor and Staff" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="PastorStaff.aspx.cs" Inherits="ShilohWeb.AboutUs.PastorStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<meta name="robots" content="all" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div id="subjectHeading">
        <h1>About Us</h1>
        <ul>
            <li><a href="WorshipServices.aspx">Worship Services</a></li>
            <li><a href="Mission.aspx">Mission &amp; Beliefs</a></li>
            <li class="current">Pastor &amp; Staff</li>
            <li><a href="OurHistory.aspx">Our History</a></li>
            <li><a href="WebConferencing.aspx">Web Conferencing</a></li>
        </ul>
    </div>
    <div class="defaultMargin prayerRequest">
        <div class="quote twoColumn right">
            <blockquote>"Whereof I was made a minister, according to the gift of the grace of God given unto me by the effectual working of his power."</blockquote>
            <cite>Ephesians 3:7</cite>
        </div>
        <h2>Our Pastor and Staff</h2>
        <p>Feel free to contact any of our staff members with questions or concerns...</p>
            
        <h3>Our Pastor</h3>
        <div class="directory">
            <div class="entry">
                <img alt="Picture of Reverend Alonso Patterson" src="../Images/PastorPatterson.png"/>
                <div class="fullDetails">
                    <h3>Dr. Alonzo B. Patterson: <i>Pastor</i></h3>
                    <p>
                        Pastor Alonzo B. Patterson&#39;s strong concern for people has allowed him to devote himself to professional and community service, addressing religious, cultural and social needs not only for the African-American community, but for all people across cultural distinctions.
                        <a href="../People/ReverendAlonsoPatterson.aspx" title="More about Revernd Alonso Patterson">more...</a>
                    </p>
                    <dl>
                        <dt>Phone</dt><dd>(907) 276-6673</dd>
                        <dt>Email</dt><dd><a href="mailto:pastor@shiloh2000.net">pastor@shiloh2000.net</a></dd>
                    </dl>
                </div>
            </div>
        </div>
        
        <h3>Church Staff</h3>
        <div class="directory">
            <div class="entry">
                <img runat="server" alt="Picture of Reverend Undra Parker" src="~/Images/shilohLogo.gif" />
                <div class="fullDetails">
                    <h3>Reverend Undra Parker: <i>Associate Pastor of Discipleship and Operations</i></h3>
                    <dl>
                        <dt>Phone</dt><dd>(907) 276-6609</dd>
                        <dt>Email</dt><dd><a href="mailto:uparker@shiloh2000.net">uparker@shiloh2000.net</a></dd>
                    </dl>
                </div>
            </div>
            <div class="entry">
                <img runat="server" alt="Picture of Reverend Edwenia Brown" src="~/Images/shilohLogo.gif" />
                <div class="fullDetails">
                    <h3>Reverend Edwenia Brown: <i>Executive Minister</i></h3>
                    <dl>
                        <dt>Phone</dt><dd>(907) 276-6609</dd>
                        <dt>Email</dt><dd><a href="mailto:ebrown@shiloh2000.net">ebrown@shiloh2000.net</a></dd>
                    </dl>
                </div>
            </div>
            <div class="entry">
                <img runat="server" alt="Picture of Reverend Michael Bunton" src="~/Images/shilohLogo.gif" />
                <div class="fullDetails">
                <h3>Reverend Michael Bunton: <i>Associate Pastor for Youth and Next Generation Ministries, Member Care</i></h3>
                <dl>
                    <dt>Phone:</dt><dd>(907) 276-6673</dd>
                    <dt>Email:</dt><dd><a href="mailto:mbunton@gshiloh2000.net">mbunton@shiloh2000.net</a></dd>
                </dl>
                </div>
            </div>
            <div class="entry">
                <img runat="server" alt="Picture of Office Administrator " src="~/Images/shilohLogo.gif" />
                <div class="fullDetails">
                <h3>Mrs. Deborah Washtour: <i>Office Administrator</i></h3>
                <dl>
                    <dt>Phone:</dt><dd>(907) 276-6673</dd>
                    <dt>Email:</dt><dd><a href="mailto:gdoucet@shiloh2000.net">dwashtour@shiloh2000.net</a></dd>
                </dl>
                </div>
            </div>
            <div class="entry">
                <img runat="server" alt="Picture of Mrs. Ruth McConnell" src="~/Images/shilohLogo.gif" />
                <div class="fullDetails">
                <h3>Mrs. Ruth McConnell: <i>Finance Officer</i></h3>
                <dl>
                    <dt>Phone:</dt><dd>(907) 276-6673</dd>
                    <dt>Email:</dt><dd><a href="mailto:rmcconnell@shiloh2000.net">rmcconnell@shiloh2000.net</a></dd>
                </dl>
                </div>
            </div>
<%--            <div class="entry">
                <img alt="Position Unfilled" src="../Images/noImage.png" width="100px" />
                <div class="fullDetails">
                    <h3>TBA: <i>Executive Music Director</i></h3>
                    <dl>
                        <dt>Phone:</dt><dd>(xxx) xxx-xxxx</dd>
                        <dt>Email:</dt><dd><a href="#">#</a></dd>
                    </dl>
                 </div>
            </div>
            <div class="entry">
                <img alt="Picture of Reverend Ben Williams " src="http://www.shiloh2000.net/shiloh/Shiloh_Staff/a_Rev.jpg" />
                <div class="fullDetails">
                    <h3>Reverend Ben Williams: <i>Associate Director of Music</i></h3>
                <dl>
                    <dt>Phone:</dt><dd>(907) 276-6673</dd>
                    <dt>Email:</dt><dd><a href="mailto:bwilliams@shiloh2000.net">bwilliams@shiloh2000.net</a></dd>
                </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of " src="../Images/noImage.png" width="100px" />
                <div class="fullDetails">
                <h3>TBA: <i>Church Secretary</i></h3>
                <dl>
                    <dt>Phone:</dt><dd>(907) 276-6609</dd>
                    <dt>Email:</dt><dd><a href="#">#</a></dd>
                </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of Mrs. Bea Freeman" src="http://www.shiloh2000.net/shiloh/Shiloh_Staff/a_BeaFreeman.jpg" />
                <div class="fullDetails">
                <h3>Mrs. Bea Freeman: <i>Church Clerk</i></h3>
                <dl>
                    <dt>Phone:</dt><dd>(907) 276-6602</dd>
                    <dt>Email:</dt><dd><a href="mailto:bfreeman@shiloh2000.net">bfreeman@shiloh2000.net</a></dd>
                </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of " src="../Images/noImage.png" width="100px" />
                <div class="fullDetails">
                <h3>TBA: <i>Youth Pastor</i></h3>
                <dl>
                    <dt>Phone:</dt><dd>(907) 276-6673</dd>
                    <dt>Email:</dt><dd><a href="#">#</a></dd>
                </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of Ms. Wilma Jones" src="http://www.shiloh2000.net/shiloh/Shiloh_Staff/a_WilmaJones.jpg" />
                <div class="fullDetails">
                <h3>Ms. Wilma Jones: <i>Administrative Assistant to ABC Coordinator</i></h3>
                <dl>
                    <dt>Phone:</dt><dd>(907) 278-5014</dd>
                    <dt>Email:</dt><dd><a href="mailto:abcak@shiloh2000.net">abcak@shiloh2000.net</a></dd>
                </dl>
                </div>
            </div>
--%>
        </div>
        
        <div class="twoColumn right quote" style="top: -22px; position: relative;">
            <blockquote>"Even as the Son of man came not to be ministered unto, but to minister, and to give his life a ransom for many."</blockquote>
            <cite>Matthew 20:28</cite>
        </div>
        
<%--  
        <h3>Ministry Leadership</h3>
        <div class="directory">
            <div class="entry">
                <img runat="server" alt="Picture of Deacon Donald Johnson" src="~/Images/Pictures/DeaconDonaldJohnson.png" />
                <div class="fullDetails">
                <h3>Deacon Donald Johnson: <i>Diaconate Chairman</i></h3>
                <dl>
                    <dt>Phone:</dt><dd>(907) 278-5014</dd>
                    <dt>Email:</dt><dd><a href="mailto:djohnson@shiloh2000.net">djohnson@shiloh2000.net</a></dd>
                </dl>
                </div>
            </div>
            <div class="entry">
                <img runat="server" alt="Picture of Mr. Franklin Harris" src="~/Images/Pictures/MrFranklinHarris.jpg" />
                <div class="fullDetails">
                <h3>Mr. Franklin Harris: <i>Trustee Chairman</i></h3>
                <dl>
                    <dt>Phone:</dt><dd>(907) 278-5014</dd>
                    <dt>Email:</dt><dd><a href="mailto:fharris@shiloh2000.net">fharris@shiloh2000.net</a></dd>
                </dl>
                </div>
            </div>
        </div>
     
   <h3>Associate Pastors</h3>
        <div class="directory">
            <div class="entry">
                <img alt="Picture of Reverend Edwenia C. Brown" src="http://www.shiloh2000.net/shiloh/Assoc__Ministers/a_RevBrown_1.jpg" />
                <div class="fullDetails">
                    <h3>
                        Reverend Edwenia C. Brown: <i>Position</i></h3>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6609</dd>
                        <dt>Email:</dt><dd><a href="mailto:ebrown@shiloh2000.net">ebrown@shiloh2000.net</a></dd>
                    </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of Reverend Vickie Casey" src="http://www.shiloh2000.net/shiloh/Assoc__Ministers/a_Rev_Vickie_Casey2.jpg" />
                <div class="fullDetails">
                    <h3>
                        Reverend Vickie Casey</h3>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6609</dd>
                        <dt>Email:</dt><dd><a href="mailto:prayervc@ptialaska.net">prayervc@ptialaska.net</a></dd>
                    </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of Reverend Al Cheathon " src="http://www.shiloh2000.net/shiloh/Shiloh_Staff/RevAlCheathon.jpg" />
                <div class="fullDetails">
                    <h3>
                        Reverend Al Cheathon</h3>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6635</dd>
                        <dt>Email:</dt><dd><a href="mailto:acheathon@shiloh2000.net">acheathon@shiloh2000.net</a></dd>
                    </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of Reverend Charles Coleman" src="http://www.shiloh2000.net/shiloh/Assoc__Ministers/a_RevCharlesColeman2.jpg" />
                <div class="fullDetails">
                    <h3>
                        Reverend Charles Coleman</h3>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6673</dd>
                        <dt>Email:</dt><dd><a href="mailto:nubian@gci.net">nubian@gci.net</a></dd>
                    </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of Reverend Dennis Davis" src="http://www.shiloh2000.net/shiloh/Assoc__Ministers/a_RevDennisDavis2.jpg" />
                <div class="fullDetails">
                    <h3>
                        Reverend Dennis Davis</h3>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6609</dd>
                        <dt>Email:</dt><dd><a href="mailto:dennis.davis@ak.net">dennis.davis@ak.net</a></dd>
                    </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of Reverend Jean Johnson" src="http://www.shiloh2000.net/shiloh/Assoc__Ministers/a_Rev_2.jpg" />
                <div class="fullDetails">
                    <h3>
                        Reverend Jean Johnson</h3>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6673</dd>
                        <dt>Email:</dt><dd><a href="mailto:jjfhdcatgram@aol.com">jjfhdcatgram@aol.com</a></dd>
                    </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of Reverend Vincent Marshall" src="http://www.shiloh2000.net/shiloh/Assoc__Ministers/a_RevVincentMarshall.jpg" />
                <div class="fullDetails">
                    <h3>
                        Reverend Vincent Marshall</h3>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6673</dd>
                        <dt>Email:</dt><dd><a href="mailto:shiloh@shiloh2000.net">shiloh@shiloh2000.net</a></dd>
                    </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of Reverend Jesse Mitchell" src="http://www.shiloh2000.net/shiloh/Assoc__Ministers/a_RevJesseMitchell.jpg" />
                <div class="fullDetails">
                    <h3>
                        Reverend Jesse Mitchell</h3>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 337-6887</dd>
                        <dt>Email:</dt><dd><a href="mailto:jmitchrev@aol.com">jmitchrev@aol.com</a></dd>
                    </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of Reverend Janet Mitchell" src="http://www.shiloh2000.net/shiloh/Assoc__Ministers/a_JanMitchell03.jpg" />
                <div class="fullDetails">
                    <h3>
                        Reverend Janet Mitchell</h3>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6673</dd>
                        <dt>Email:</dt><dd><a href="mailto:jsmitchell@shiloh2000.net">jsmitchell@shiloh2000.net</a></dd>
                    </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of Reverend Robert Mitchell" src="http://www.shiloh2000.net/shiloh/Assoc__Ministers/a_RevRobertMitchell.jpg" />
                <div class="fullDetails">
                    <h3>
                        Reverend Robert Mitchell</h3>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6673</dd>
                        <dt>Email:</dt><dd><a href="mailto:poppa5vipers@hotmail.com">poppa5vipers@hotmail.com</a></dd>
                    </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of Reverend Patricia Ray" src="http://www.shiloh2000.net/shiloh/Assoc__Ministers/a_RevPatRay.jpg" />
                <div class="fullDetails">
                    <h3>
                        Reverend Patricia Ray</h3>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6673</dd>
                        <dt>Email:</dt><dd><a href="mailto:reverend_ray@hotmail.com">reverend_ray@hotmail.com</a></dd>
                    </dl>
                </div>
            </div>
            <div class="entry">
                <img alt="Picture of Reverend Mary Showers" src="http://www.shiloh2000.net/shiloh/Assoc__Ministers/a_RevMaryShowers_1.jpg" />
                <div class="fullDetails">
                    <h3>
                        Reverend Mary Showers</h3>
                    <dl>
                        <dt>Phone:</dt><dd>(907) 276-6673</dd>
                        <dt>Email:</dt><dd><a href="mailto:showers_mary@asdk12.org">showers_mary@asdk12.org</a></dd>
                    </dl>
                </div>
            </div>
        </div>
--%>
    </div>
</asp:Content>
