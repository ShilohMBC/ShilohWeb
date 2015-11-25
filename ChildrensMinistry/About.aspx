<%@ Page Title="Shiloh Missionary Baptist Church - Children's Ministry" Language="C#" MasterPageFile="~/MasterPages/Shiloh.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ShilohWeb.ChildrensMinistry.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .defaultMargin, .defaultMargin h1, .defaultMargin h2
        {
            font-family: Comic Sans MS, Arial, Sans-Serif;
        }
        
        .defaultMargin
        {
            background-image: url('/Images/sk_kidsbg.png');
        }
        
        .defaultMargin > h2
        {
            font-size: 14pt;
        }
         
        p
        {
            font-weight: bold;
        }
                
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div id="subjectHeading">
        <h1>Children's Ministry</h1>
        <ul>
            <li><a href="#" class="current">About</a></li>
            <li><a href="Programs.aspx">Programs</a></li>
            <li><a href="Events.aspx">Events</a></li>
        </ul>
    </div>
   
    <div class="defaultMargin prayerRequest">
        <h2>About the Children's Ministry</h2>
        <p style="color: Green;"> 
            <img src="../Images/sk_flowerpot.jpg" alt="Flower" style="width: 103px; height: 172px;
                float: right; margin: 4px;" />        
            Welcome to Shiloh Missionary Baptist Church children's ministry. 
            
            We ourselves are a spiritual family and we have your best interests in mind.                         
            The ultimate goal of the children's ministry is to prepare you and your children, spiritually 
            for the rest of your life.            
            Our vision and plans include character development, or Christ Like behavior; behavior
            that reflects the glory of God in the child life in every setting—home, school,
            church, and at play! 
        </p>
        <p style="color: red;">Jesus said, "Let the little children come to me, and do not hinder
            them, for the kingdom of heaven belongs to such as these." Matthew 19:14</p>
        <p>"Preparing children for a lifetime of devotion to Jesus."</p>
        
        <h2>School Levels</h2>
        <p>
        We offer different levels of education and guidance for your children ranging from ages 6 months to 12 years old:
        </p>
        <img src="../Images/sk_butterfly.png" alt="Butterfly" style="width: 147px; height: 138px;
            float: left; margin: 4px;" />
        <table style="margin-left: 25px; color: Blue;">
            <tbody>
                <tr>
                    <td style="font-weight: bold; font-size: 10pt; color: Green;">Nursery</td>
                    <td>A clean, safe and loving environment for infants to grow and develop.</td>
                </tr>
                <tr>
                    <td style="font-weight: bold; font-size: 10pt; color: Green;">Toddlers</td>
                    <td>Helps children transition out of nursery into a classroom setting.</td>
                </tr>
                <tr>
                    <td style="font-weight: bold; font-size: 10pt; color: Green;">Preschool</td>
                    <td>Consists of Bible lessons, crafts, music and activities.</td>
                </tr>
                <tr>
                    <td style="font-weight: bold; font-size: 10pt; color: Green;">Elementary</td>
                    <td>Large group setting, worship, Bible lessons, drama and small groups.</td>
                </tr>
                <tr>
                    <td style="font-weight: bold; font-size: 10pt; color: Green;">Sunday School</td>
                    <td>Lays the foundation for spiritual growth and development.</td>
                </tr>
                <tr>
                    <td style="font-weight: bold; font-size: 10pt; color: Green;">Choir</td>
                    <td>Gives children the opportunity to sing praises unto God and serve in ministry.</td>
                </tr>
            </tbody>
        </table>        
        <h2>Contact Information</h2>
        <div style="float:right;position: relative; margin-bottom: 25px;">
            <a href='http://d6family.com/splink' target="D6"><img src='http://d6family.com/images/ads/Splink_Small_Square_200x200.jpg' alt="D6 Family"/></a>
        </div>
        <dl style="color:Navy;">
            <dt>Rev. Edwenia Brown</dt>
            <dd>Staff - (907) 276-6609 - ebrown@shiloh2000.net</dd>
            <dt>Mrs. Donna King</dt>
            <dd>Children's Ministry Director - (907) 276-6609</dd>
            <dt>Ms. Michelle Phillips</dt>
            <dd>Elementary Director - (907) 276-6025</dd>
            <dt>Ms. Tonya Edwards</dt>
            <dd>Preschool Director - (907) 276-6609</dd>
        </dl>

    </div>
    
</asp:Content>