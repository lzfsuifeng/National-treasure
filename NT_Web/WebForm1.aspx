﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link class="TopmenuFont" href="#" rel="stylesheet" type="text/css" />
<link class="TextFont" href="#" rel="stylesheet" type="text/css" />
<link class="TitleFont" href="#" rel="stylesheet" type="text/css" />
<link href='http://fonts.useso.com/css?family=Lato:300,400,700,400italic|Droid+Sans|PT+Sans:400,700,400italic,700italic|PT+Sans+Narrow|Open+Sans:400,300' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="javascript/jquery-latest.js"></script>
<script type="text/javascript" src="javascript/red-sky-options.js"></script>
<script type="text/javascript" src="shortcodes/shortcodes.js"></script>
<script type="text/javascript" src="javascript/jquery.prettyPhoto.js"></script>
<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- CSS -->
<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/responsive.css" rel="stylesheet" type="text/css">
<link href="shortcodes/shortcodes.css" rel="stylesheet" type="text/css">
<link href="css/prettyPhoto.css" rel="stylesheet" type="text/css">

<!-- START SETTINGS BOX -->
<script type="text/javascript" src="settingsbox/farbtastic/farbtastic.js"></script>
<script type="text/javascript" src="settingsbox/settingsbox.js"></script>
<link href="settingsbox/settingsbox.css" rel="stylesheet" type="text/css">
<link href="settingsbox/farbtastic/farbtastic.css" rel="stylesheet" type="text/css">
<!-- END SETTINGS BOX -->

<title>Sky Walker</title>
</head>

<body>
<!-- START SETTINGS BOX -->
<div class="customPanel customPanelClosed">
  <div class="customPanelOptions">
    <h1>Settings Box</h1>
    Site Color<br />
    <div class="customPanelOptionsPickerButton customPanelOptionsPickerButtonSite"></div>
    <div style="clear:both;"></div>
    <div style="height: 10px"></div>
    Background<br />
    <div style="clear:both;"></div>
    <div class="customPanelOptionsDefault">Default</div>
    <div style="clear:both;"></div>
    <div style="height: 10px"></div>
    Colors:<br />
    <div style="clear:both;"></div>
    <div class="customPanelOptionsColor bodycolor01"></div>
    <div class="customPanelOptionsColor bodycolor02"></div>
    <div class="customPanelOptionsColor bodycolor03"></div>
    <div class="customPanelOptionsColor bodycolor04"></div>
    <div class="customPanelOptionsColor bodycolor06"></div>
    <div class="customPanelOptionsColor bodycolor07"></div>
    <div class="customPanelOptionsColor bodycolor08"></div>
    <div class="customPanelOptionsColor bodycolor09"></div>
    <div class="customPanelOptionsColor bodycolor10"></div>
    <div class="customPanelOptionsPickerButton customPanelOptionsPickerButtonBackground"></div>
    <div style="clear:both;"></div>
    Textures:<br />
    <div style="clear:both;"></div>
    <div class="customPanelOptionsTexture bodytexture01 bodytexturePreview"></div>
    <div class="customPanelOptionsTexture bodytexture02 bodytexturePreview"></div>
    <div class="customPanelOptionsTexture bodytexture03 bodytexturePreview"></div>
    <div class="customPanelOptionsTexture bodytexture04 bodytexturePreview"></div>
    <div class="customPanelOptionsTexture bodytexture05 bodytexturePreview"></div>
    <div class="customPanelOptionsTexture bodytexture06 bodytexturePreview"></div>
    <div class="customPanelOptionsTexture bodytexture07 bodytexturePreview"></div>
    <div class="customPanelOptionsTexture bodytexture08 bodytexturePreview"></div>
    <div class="customPanelOptionsTexture bodytexture09 bodytexturePreview"></div>
    <div class="customPanelOptionsTexture bodytexture10 bodytexturePreview"></div>
    <div style="clear:both;"></div>
    <br />
    Menu font:
    <select name="menu-font" size="1">
    </select>
    <br />
    Title font:
    <select name="title-font" size="1">
    </select>
    <br />
    Text font:
    <select name="text-font" size="1">
    </select>
  </div>
  <div class="customPanelOptionsPicker customPanelOptionsPickerBackground"></div>
  <div class="customPanelOptionsPicker customPanelOptionsPickerSite"></div>
  <div class="customPanelButton"></div>
</div>
<!-- END SETTINGS BOX --> 

<!-- START TOP HIDDEN AREA -->
<div id="topline">
  <div class="container">
    <div class="opentop">+</div>
    <div class="content">
      <div class="columns two">
        <div class="search">
          <form>
            <input class="searchline" name="search" value="enter keywords" onBlur="if(this.value=='') this.value='enter keywords'" onFocus="if(this.value =='enter keywords' ) this.value=''" />
            <input class="searchbutton" name="search" type="submit" value="">
          </form>
        </div>
      </div>
      <div class="columns two_last">
        <ul class="social">
          <li><a href="#"><img src="images/social/faccebook.png" class="show-tooltip" alt="facebook" title="Facebook" /></a></li>
          <li><a href="#"><img src="images/social/pinterest.png" class="show-tooltip" alt="pinterest" title="Pinterest" /></a></li>
          <li><a href="#"><img src="images/social/skype.png" class="show-tooltip" alt="skype" title="Skype" /></a></li>
          <li><a href="#"><img src="images/social/tube.png" class="show-tooltip" alt="tube" title="YouTube" /></a></li>
          <li><a href="#"><img src="images/social/twitter_1.png" class="show-tooltip" alt="twitter" title="Twitter" /></a></li>
          <li><a href="#"><img src="images/social/viemo.png" class="show-tooltip" alt="vimeo" title="Vimeo" /></a></li>
        </ul>
      </div>
      <div class="clear"></div>
    </div>
  </div>
</div>
<!-- END TOP HIDDEN AREA -->

<div id="box">
  <div class="container"> 
    <!-- START HEADER -->
    <div id="header">
      <div class="one-third columns">
        <div class="logo"><a href="index-2.html"><span>sky</span>walker</a></div>
      </div>
      <div class="two-thirds_last columns">
        <form action="http://wp.red-sky.pl/">
          <select class="navigationmicro" name="myDestination" onChange="this.form.window_name.value++; ob=this.form.myDestination; window.open(ob.options[ob.selectedIndex].value,'Window_Name'+this.form.window_name.value)">
            <option value="shortcodes.html">- Shortcodes -</option>
            <option value="index-2.html">- Homepage -</option>
            <option value="shortcodes.html">Features</option>
            <option value="shortcodes.html">- Shortcodes</option>
            <option value="page_404.html">- 404 Error</option>
            <option value="sample_page.html">- Sample Page</option>
            <option value="page_r_sidebar.html">- Right Sidebar</option>
            <option value="page_l_sidebar.html">- Left Sidebar</option>
            <option value="page_wide.html">- Full width page</option>
            <option value="single_project.html">Portfolio</option>
            <option value="portfolio_2col.html">- 2 columns</option>
            <option value="portfolio_3col.html">- 3 columns</option>
            <option value="portfolio_4col.html">- 4 columns</option>
            <option value="single_project.html">- Single Project</option>
            <option value="blog.html">Blog</option>
            <option value="single_post.html">- Single Post</option>
            <option value="contact.html">Contact Us</option>
          </select>
          <input name="window_name" style="display:none;" type="hidden" value="1">
        </form>
        <ul class="topmenu">
          <li><a href="index-2.html">Homepage</a></li>
          <li class="active"><a class="active" href="#">Features +</a>
            <ul class="MenuDropdown">
              <li><a href="shortcodes.html">Shortcodes</a></li>
              <li><a href="page_404.html">404 Error</a></li>
              <li><a href="sample_page.html">Sample Page</a></li>
              <li><a href="page_r_sidebar.html">Right Sidebar</a></li>
              <li><a href="page_l_sidebar.html">Left Sidebar</a></li>
              <li><a href="page_wide.html">Full width page</a></li>
              <li><a href="#">DropDown +</a>
                <ul class="MenuDropdown">
                  <li><a href="#l">This is</a></li>
                  <li><a href="#">an example</a></li>
                  <li><a href="#">of dropdown</a></li>
                </ul>
              </li>
            </ul>
          </li>
          </li>
          <li><a href="single_project.html">Portfolio +</a>
            <ul class="MenuDropdown">
              <li><a href="portfolio_2col.html">2 columns</a></li>
              <li><a href="portfolio_3col.html">3 columns</a></li>
              <li><a href="portfolio_4col.html">4 columns</a></li>
              <li><a href="single_project.html">Single Project</a></li>
            </ul>
          </li>
          <li><a href="blog.html">Blog +</a>
            <ul class="MenuDropdown">
              <li><a href="single_post.html">Single Post</a></li>
            </ul>
          </li>
          <li><a href="contact.html">Contact</a></li>
        </ul>
      </div>
      <div class="clear"></div>
    </div>
    <!-- END HEADER --> 
    
    <!-- START PATH -->
    <div class="path one columns"> Shortcodes </div>
    <!-- END PATH --> 
    
    <!-- START SLIDER -->
    <div class="slider"></div>
    <!-- END SLIDER --> 
    
    <!-- START CONTENT -->
    <div class="columns one">
      <div class="shortcodesPage">
        <h2> quotes </h2>
        <div class="rs_quote">
          <div class="rs_quote_text"> Vel ne ignota latine eleifend, adipisci consetetur ea eum. At errem antiopam moderatius cum, eius vituperata te sed. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti, mea te sale vocent. Cum falli adipiscing ut. Vis ei vidisse nominati atomorum, cu pri veri omnium dissentiet. </div>
          <div class="rs_quote_author"> John Doe </div>
        </div>
        <br />
        <div class="rs_column rs_column_1_2">
          <div class="rs_quote rs_quote_left">
            <div class="rs_quote_text"> Vel in dicat tempor expetenda, ex eros solet per. Mea ex malorum persius, fugit essent admodum no vim, wisi repudiandae cu vix. </div>
            <div class="rs_quote_author"> John Doe </div>
          </div>
          Vel ne ignota latine eleifend, adipisci consetetur ea eum. At errem antiopam moderatius cum, eius vituperata te sed. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti, mea te sale vocent. Cum falli adipiscing ut. Vis ei vidisse nominati atomorum, cu pri veri omnium dissentiet. </div>
        <div class="rs_column rs_column_1_2 rs_column_last">
          <div class="rs_quote rs_quote_right">
            <div class="rs_quote_text"> Vel in dicat tempor expetenda, ex eros solet per. Mea ex malorum persius, fugit essent admodum no vim, wisi repudiandae cu vix. </div>
            <div class="rs_quote_author"> John Doe </div>
          </div>
          Vel ne ignota latine eleifend, adipisci consetetur ea eum. At errem antiopam moderatius cum, eius vituperata te sed. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti, mea te sale vocent. Cum falli adipiscing ut. Vis ei vidisse nominati atomorum, cu pri veri omnium dissentiet. </div>
        <div style="clear:both;"></div>
        <h2 class="mt40"> unordered lists </h2>
        <div class="rs_column rs_column_1_3">
          <ul class="rs_list rs_list_checkmark">
            <li> Lorem ipsum dolor sit amet </li>
            <li> Lorem ipsum dolor sit amet </li>
            <li> Lorem ipsum dolor sit amet </li>
            <li class="rs_list_active"> Lorem ipsum dolor sit amet </li>
          </ul>
        </div>
        <div class="rs_column rs_column_1_3">
          <ul class="rs_list rs_list_cross">
            <li> Lorem ipsum dolor sit amet </li>
            <li> Lorem ipsum dolor sit amet </li>
            <li> Lorem ipsum dolor sit amet </li>
            <li class="rs_list_active"> Lorem ipsum dolor sit amet </li>
          </ul>
        </div>
        <div class="rs_column rs_column_1_3 rs_column_last">
          <ul class="rs_list rs_list_star">
            <li> Lorem ipsum dolor sit amet </li>
            <li> Lorem ipsum dolor sit amet </li>
            <li> Lorem ipsum dolor sit amet </li>
            <li class="rs_list_active"> Lorem ipsum dolor sit amet </li>
          </ul>
        </div>
        <div style="clear:both;"></div>
        <h2 class="mt40"> buttons </h2>
        <a class="rs_button rs_button_small rs_button_green rs_button_light rs_button_top" href="#">Small</a>&nbsp;&nbsp;<a class="rs_button rs_button_small rs_button_green rs_button_light rs_button_top" href="#">Small</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="rs_button rs_button_medium rs_button_gray rs_button_dark rs_button_top" href="#">Medium</a>&nbsp;&nbsp;<a class="rs_button rs_button_medium rs_button_gray rs_button_dark rs_button_top" href="#">Medium</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="rs_button rs_button_large rs_button_blue rs_button_light rs_button_top" href="#">Large</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="rs_button rs_button_large rs_button_blue rs_button_light rs_button_top" href="#">Large</a> <br />
        <br />
        <a class="rs_button rs_button_large rs_button_brown rs_button_light rs_button_bottom" href="#">Large</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="rs_button rs_button_large rs_button_brown rs_button_light rs_button_bottom" href="#">Large</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="rs_button rs_button_medium rs_button_yellow rs_button_dark rs_button_bottom" href="#">Medium</a>&nbsp;&nbsp;<a class="rs_button rs_button_medium rs_button_yellow rs_button_dark rs_button_bottom" href="#">Medium</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="rs_button rs_button_small rs_button_red rs_button_light rs_button_bottom" href="#">Small</a>&nbsp;&nbsp;<a class="rs_button rs_button_small rs_button_red rs_button_light rs_button_bottom" href="#">Small</a>
        <h2 class="mt40"> alerts </h2>
        <div class="rs_alert rs_alert_success">Success</div>
        <div class="rs_alert rs_alert_info">Info</div>
        <div class="rs_alert rs_alert_other">Other Alert</div>
        <div class="rs_alert rs_alert_error">Error</div>
        <h2 class="mt40"> tabs </h2>
        <h3> Standard Tabs </h3>
        <div class="rs_tabs">
          <ul class="rs_tabs_nav">
            <li class="rs_tabs_nav_active"> Tab One </li>
            <li> Tab Two </li>
          </ul>
          <div class="rs_tabs_content">
            <div class="rs_tabs_content_page rs_tabs_content_page_active"> Vel ne ignota latine eleifend, adipisci consetetur ea eum. At errem antiopam moderatius cum, eius vituperata te sed. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli um dissentiet. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti. </div>
            <div class="rs_tabs_content_page"> Vel ne ignota latine eleifend, adipisci consetetur ea eum. At errem antiopam moderatius cum, eius vituperata te sed. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti, mea te sale vocent. Cum falli adipiscing ut. Vis ei vidisse nominati atomorum, cu pri veri omnium dissentiet. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti. </div>
          </div>
        </div>
        <h3 class="mt40"> Tabs - Tabs Left </h3>
        <div class="rs_tabs rs_tabs_left">
          <ul class="rs_tabs_nav">
            <li class="rs_tabs_nav_active"> Tab One </li>
            <li> Tab Two </li>
          </ul>
          <div class="rs_tabs_content">
            <div class="rs_tabs_content_page rs_tabs_content_page_active"> Vel ne ignota latine eleifend, adipisci consetetur ea eum. At errem antiopam moderatius cum, eius vituperata te sed. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti, mea te sale vocent. Cum falli adipiscing ut. Vis ei vidisse nominati atomorum, cu pri veri omnium dissentiet. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti.Vel ne ignota latine eleifend, adipisci consetetur ea eum. At errem antiopam moderatius cum, eius vituperata te sed. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti, mea te sale vocent. Cum falli adipiscing ut. Vis ei vidisse nominati atomorum, cu pri veri omnium dissentiet. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti. </div>
            <div class="rs_tabs_content_page"> Vel ne ignota latine eleifend, adipisci consetetur ea eum. At errem antiopam moderatius cum, eius vituperata te sed. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti, mea te sale vocent. Cum falli adipiscing ut. Vis ei vidisse nominati atomorum, cu pri veri omnium dissentiet. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti. </div>
          </div>
        </div>
        <h3 class="mt40"> Tabs - Tabs Right </h3>
        <div class="rs_tabs rs_tabs_right">
          <ul class="rs_tabs_nav">
            <li class="rs_tabs_nav_active"> Tab One </li>
            <li> Tab Two </li>
          </ul>
          <div class="rs_tabs_content">
            <div class="rs_tabs_content_page rs_tabs_content_page_active"> Vel ne ignota latine eleifend, adipisci consetetur ea eum. At errem antiopam moderatius cum, eius vituperata te sed. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti, mea te sale vocent. Cum falli adipiscing ut. Vis ei vidisse nominati atomorum, cu pri veri omnium dissentiet. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti. Vel ne ignota latine eleifend, adipisci consetetur ea eum. At errem antiopam moderatius cum, eius vituperata te sed. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti, mea te sale vocent. Cum falli adipiscing ut. Vis ei vidisse nominati atomorum, cu pri veri omnium dissentiet. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti. </div>
            <div class="rs_tabs_content_page"> Vel ne ignota latine eleifend, adipisci consetetur ea eum. At errem antiopam moderatius cum, eius vituperata te sed. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti, mea te sale vocent. Cum falli adipiscing ut. Vis ei vidisse nominati atomorum, cu pri veri omnium dissentiet. </div>
          </div>
        </div>
        <h2 class="mt30"> toggle </h2>
        <div class="rs_toggle">
          <div class="rs_toggle_title"> Click me </div>
          <div class="rs_toggle_content"> Vel ne ignota latine eleifend, adipisci consetetur ea eum. At errem antiopam moderatius cum, eius vituperata te sed. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti, mea te sale vocent. Cum falli adipiscing ut. Vis ei vidisse nominati atomorum, cu pri veri omnium dissentiet. </div>
        </div>
        <h2 class="mt40"> accordion </h2>
        <div class="rs_accordion">
          <div class="rs_accordion_item rs_accordion_item_active">
            <div class="rs_accordion_item_title"> Accordion 1 </div>
            <div class="rs_accordion_item_content"> Lorem ipsum dolor sit amet, eum nobis vidisse posidonium eu. Liber simul at eam. At pro tollit iriure, amet legere intellegam id duo, est partem ignota senserit ea. Id eripuit posidonium disputationi cum. Vel ne ignota latine eleifend, adipisci consetetur ea eum. At errem antiopam moderatius cum, eius vituperata te sed. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti, mea te sale vocent. Cum falli adipiscing ut. Vis ei vidisse nominati atomorum, cu pri veri omnium dissentiet. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti. </div>
          </div>
          <div class="rs_accordion_item">
            <div class="rs_accordion_item_title"> Accordion 2 </div>
            <div class="rs_accordion_item_content"> Vel ne ignota latine eleifend, adipisci consetetur ea eum. At errem antiopam moderatius cum, eius vituperata te sed. Elitr eripuit impedit pro ut, et qui noster tacimates convenire, graecis vivendo sensibus no nec. Qui ad ferri falli postulant, vim ad vide dicta deleniti, mea te sale vocent. Cum falli adipiscing ut. Vis ei vidisse nominati atomorum, cu pri veri omnium dissentiet. </div>
          </div>
          <div class="rs_accordion_item">
            <div class="rs_accordion_item_title"> Accordion 3 </div>
            <div class="rs_accordion_item_content"> Cu eos zril graece prodesset, te vim iusto atomorum, vix quod tale graece at. Ea mea aliquid explicari. Ei vim clita vitae. Aliquam temporibus no usu, at sale saperet atomorum mel. Vitae perfecto lobortis te sit, nonumy evertitur cotidieque eos ad, commodo civibus interpretaris ad qui. </div>
          </div>
        </div>
      </div>
      <div class="clear"></div>
    </div>
    <!-- END CONTENT --> 
  </div>
</div>

<!-- START FOOTER -->
<div id="footer">
  <div class="container">
    <div class="columns three">
      <h2>About <span>Sky</span>walker</h2>
      <p>Ut scelerisque magna a nisl porttitor posuere. Felis ipsum, interdum ut dignissim. </p>
      <p>Aliquam felis ipsum, interdum ut dignissim at, accumsan non tellus. Ut scelerisque magna a nisl porttitor posuere. Felis ipsum, interdum a nisl porttitor posuere.</p>
    </div>    <div class="columns three skywalkerTwitter" data-user="mojothemes" data-posts="2">
      <h2>Latest Tweets</h2>
    </div>
    <div class="columns three_last skywalkerPhotostream" data-userid="25975342@N02" data-items="8">
      <h2>My PhotoStream</h2>
    </div>
  </div>
</div>
<!-- END FOOTER --> 

<!-- START BOTTOMAREA -->
<div id="bottomarea">
  <div class="container">
    <div class="columns two">
      <ul class="bottommenu">
        <li><a href="index-2.html">Homepage</a></li>
        <li><a href="shortcodes.html">Features</a></li>
        <li><a href="portfolio_2col.html">Portfolio</a></li>
        <li><a href="blog.html">Blog</a></li>
        <li><a href="contact.html">Contact</a></li>
      </ul>
    </div>
    <div class="columns two_last">
      <ul class="social">
        <li><a href="#"><img src="images/social/f.png" class="show-tooltip" alt="facebook" title="Facebook" /></a></li>
        <li><a href="#"><img src="images/social/p.png" class="show-tooltip" alt="pinterest" title="Pinterest" /></a></li>
        <li><a href="#"><img src="images/social/s.png" class="show-tooltip" alt="skype" title="Skype" /></a></li>
        <li><a href="#"><img src="images/social/t.png" class="show-tooltip" alt="tube" title="YouTube" /></a></li>
        <li><a href="#"><img src="images/social/twitter.png" class="show-tooltip" alt="twitter" title="Twitter" /></a></li>
        <li><a href="#"><img src="images/social/v.png" class="show-tooltip" alt="vimeo" title="Vimeo" /></a></li>
      </ul>
    </div>
    <div class="clear"></div>
  </div>
</div>

<!-- END BOTTOMAREA -->
</body>

</html>
