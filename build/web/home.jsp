<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache");    //Doesnot allow to store in cache memory.
    response.setHeader("Cache-Control", "no-storage");  //Doesonot allow to store in Temp folder.
%>


<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Home</title>
                <meta content="no" http-equiv="imagetoolbar"></meta>
		<link rel="stylesheet" href="TEMP/styles/layout.css" type="text/css" />
                <script src="TEMP/scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
                <script src="TEMP/scripts/jquery.scrollTo-min.js" type="text/javascript"></script>
                <style>
                    body{
                            margin:0;
                            padding:0;
                    }

                    .firstUL{
                            padding:0px 0px 0px 10px;
                            margin:0px;
                            background-color:#3285ef;
                    }

                    .firstUL li {
                            background:transparent url(Images/link_sprite_img.jpg) no-repeat scroll 0 0;
                            display:inline;
                            font-family:'Arial',Verdana,Tahoma;
                            font-size:16pt;
                            font-weight:bold;
                            padding:10px 15px 22px;
                            line-height:70px;
                            cursor:pointer;
                    }

                    .firstUL li.selected{
                            background:transparent url(Images/link_sprite_img.jpg) no-repeat scroll 0px -57px;
                            color:#ffffff;
                            font-weight:bold;
                    }

                    #body-container{
                            width:1000px;
                            height:500px;
                            margin:0 auto 0;
                            border:1px solid #3285ef;
                    }

                    #body-container .glossary-container{
                            clear:both;

                    }

                    #body-container .content-container{
                            height:360px;
                            width:1000px;
                            overflow:auto;
                            font-family:'Arial',Verdana,Tahoma;
                            font-size:10pt;
                            clear:both;
                    }

                    #body-container .content-container div{
                            padding-left:10px;
                            border-bottom:1px #666666 solid;
                    }

                    #body-container .content-container div h2{
                            margin-top:0px;
                    }

                    #body-container .content-container p.return-to-top{
                            color:#0066FF;
                            text-decoration:underline;
                            text-align:right;
                            margin-right:10px;
                            cursor:pointer;
                    }
                </style>
</head>
<body>
    <div class="backcolor">
    
		<div class="wrapper row1">
  			<div id="header" class="clear">
    			<div class="fl_left">
      				<h1><a href="home.jsp">E-Lok Geet</a></h1>
          		</div>
			</div>
		</div>

		<div class="wrapper row2">
  			<div id="topnav">
    			<div  class="clear">
    				<ul>
                                     <jsp:include page="WEB-INF/jspf/navipart.jsp"></jsp:include>
    				</ul>
    		  	</div>
  			</div>
		</div>
                <div class="wrapper row3" >
                    <div id="featured_slide" style="padding-top:10px;height:200px;width:1000px;">
                    <marquee height="180px" behavior="alternate" direction="left" scrolldelay="100" onmouseover="this.stop()" onmouseout="this.start()">


                        <%@include file="WEB-INF/jspf/picsinclude.jspf" %>
                    </marquee>
                    </div>
            </div>
        <jsp:include page="WEB-INF/jspf/homepart.jsp"></jsp:include>
    </div>
	</body>
</html>