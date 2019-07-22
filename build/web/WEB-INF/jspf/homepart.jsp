<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="oms.dao.SongDao"%>

<div class="wrapper row4">
                    <div id="container" class="clear">
    			<div id="homepage" style="font-size: 14px;">
                            <div id="body-container">
    <div class="glossary-container">
        <ul class="firstUL">
            
            <li id="a" class="selected">A</li>
            <li id="b">B</li>
            <li id="c">C</li>
            <li id="d">D</li>
            <li id="e">E</li>
            <li id="f">F</li>
            <li id="g">G</li>
            <li id="h">H</li>
            <li id="i">I</li>
            <li id="j">J</li>
            <li id="k">K</li>
            <li id="l">L</li>
            <li id="m">M</li>
            <li id="n">N</li>
            <li id="o">O</li>
            <li id="p">P</li>
            <li id="q">Q</li>
            <li id="r">R</li>
            <li id="s">S</li>
            <li id="t">T</li>
            <li id="u" style="margin-left:330px">U</li>
            <li id="v">V</li>
            <li id="w">W</li>
            <li id="x">X</li>
            <li id="y">Y</li>
            <li id="z">Z</li>
            <li id="09">0-9</li>


        </ul>
    </div>
    <div class="content-container">
        
    	<!-- A -->
    	<div id="content-for-a" style="background-color:#d2e2fc">
        	<h2>A</h2>
                 <%
                    Set<Map.Entry<Integer,String>> s = new SongDao().getMovieNames('A');
                    Iterator<Map.Entry<Integer,String>> it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>
        
        <!-- B -->
        <div id="content-for-b">
	        <h2>B</h2>
        	<%
                    s = new SongDao().getMovieNames('B');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
			<p class="return-to-top">Return to Top</p>
        </div>
        
        <!-- C -->
        <div id="content-for-c">
	        <h2>C</h2>
        	<%
                    s = new SongDao().getMovieNames('C');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
			<p class="return-to-top">Return to Top</p>
        </div>

        <!-- D -->
        <div id="content-for-d">
	        <h2>D</h2>
        	<%
                    s = new SongDao().getMovieNames('D');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
			<p class="return-to-top">Return to Top</p>
        </div>

        <!-- E -->
        <div id="content-for-e">
        	<h2>E</h2>
        	<%
                    s = new SongDao().getMovieNames('E');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>

        <!-- F -->
        <div id="content-for-f">
        	<h2>F</h2>
        	<%
                    s = new SongDao().getMovieNames('F');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>
        
        <!-- G -->
        <div id="content-for-g">
        	<h2>G</h2>
        	<%
                    s = new SongDao().getMovieNames('G');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
			<p class="return-to-top">Return to Top</p>
        </div>

        <!-- H -->
        <div id="content-for-h">
        	<h2>H</h2>
        	<%
                    s = new SongDao().getMovieNames('H');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
			<p class="return-to-top">Return to Top</p>
        </div>

<!-- I -->
        <div id="content-for-i">
        	<h2>I</h2>
        	<%
                    s = new SongDao().getMovieNames('I');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
			<p class="return-to-top">Return to Top</p>
        </div>

<!-- J -->
    	<div id="content-for-j" style="background-color:#d2e2fc">
        	<h2>J</h2>
        	<%
                    s = new SongDao().getMovieNames('J');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>

<!-- K -->
    	<div id="content-for-k" style="background-color:#d2e2fc">
        	<h2>K</h2>
        	<%
                    s = new SongDao().getMovieNames('K');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>

<!-- L -->
    	<div id="content-for-l" style="background-color:#d2e2fc">
        	<h2>L</h2>
        	<%
                    s = new SongDao().getMovieNames('L');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>
<!-- M -->
    	<div id="content-for-m" style="background-color:#d2e2fc">
        	<h2>M</h2>
        	<%
                    s = new SongDao().getMovieNames('M');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>


<!-- N -->
    	<div id="content-for-n" style="background-color:#d2e2fc">
        	<h2>N</h2>
        	<%
                    s = new SongDao().getMovieNames('N');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>

<!-- O -->
    	<div id="content-for-o" style="background-color:#d2e2fc">
        	<h2>O</h2>
        	<%
                    s = new SongDao().getMovieNames('O');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>


<!-- P -->
    	<div id="content-for-p" style="background-color:#d2e2fc">
        	<h2>P</h2>
        	<%
                    s = new SongDao().getMovieNames('P');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>

<!-- Q -->
    	<div id="content-for-q" style="background-color:#d2e2fc">
        	<h2>Q</h2>
        	<%
                    s = new SongDao().getMovieNames('Q');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>

<!-- R -->
    	<div id="content-for-r" style="background-color:#d2e2fc">
        	<h2>R</h2>
        	<%
                    s = new SongDao().getMovieNames('R');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>


<!-- S -->
    	<div id="content-for-s" style="background-color:#d2e2fc">
        	<h2>S</h2>
        	<%
                    s = new SongDao().getMovieNames('S');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>

<!-- T -->
    	<div id="content-for-t" style="background-color:#d2e2fc">
        	<h2>T</h2>
        	<%
                    s = new SongDao().getMovieNames('T');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>

<!-- U -->
    	<div id="content-for-u" style="background-color:#d2e2fc">
        	<h2>U</h2>
        	<%
                    s = new SongDao().getMovieNames('U');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>


<!-- V -->
    	<div id="content-for-v" style="background-color:#d2e2fc">
        	<h2>V</h2>
        	<%
                    s = new SongDao().getMovieNames('V');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>

<!-- W -->
    	<div id="content-for-w" style="background-color:#d2e2fc">
        	<h2>W</h2>
        	<%
                    s = new SongDao().getMovieNames('W');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>

<!-- X -->
    	<div id="content-for-x" style="background-color:#d2e2fc">
        	<h2>X</h2>
        	<%
                    s = new SongDao().getMovieNames('X');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>

<!-- Y -->
    	<div id="content-for-y" style="background-color:#d2e2fc">
        	<h2>Y</h2>
        	<%
                    s = new SongDao().getMovieNames('Y');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>


<!-- Z -->
    	<div id="content-for-z" style="background-color:#d2e2fc">
        	<h2>Z</h2>
        	<%
                    s = new SongDao().getMovieNames('Z');
                    it = s.iterator();
                    while(it.hasNext()) {
                        Map.Entry<Integer,String> me = it.next();
                        %>        
                        <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                        <%        
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>
<!-- 09 -->
    	<div id="content-for-09" style="background-color:#d2e2fc">
        	<h2>0-9</h2>
        	<%
                    for(Integer i=0;i<=9;i++) {
                        s = new SongDao().getMovieNames(i.toString().charAt(0));
                        it = s.iterator();
                        while(it.hasNext()) {
                            Map.Entry<Integer,String> me = it.next();
                            %>        
                            <p style="font-weight: bolder;"><a href="movie.jsp?movieId=<%=me.getKey()%>"><%=me.getValue()%></a></p>
                            <%        
                        }
                    }
                 %>
 			<p class="return-to-top">Return to Top</p>
        </div>


    </div>
</div>



<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        //below code is for high-lighting the link and scroll to particular DOM Element as well
        $(".firstUL li").each(function () {
            $(this).click(function () { //On click of any Alphabet
                $(".firstUL li").removeClass("selected"); //Initially remove "selected" class if any
                $(this).addClass("selected"); //Add "selected" class for the clicked one
                elementClick = $(this).attr("id"); //get respective 'Id' for example 'a','b','c'.. etc.,
                $(".content-container").scrollTo($("#content-for-" + elementClick), 800); //scrollTo particular DOM Element
                $(".content-container div").css({ 'background-color': '#ffffff' }); //set the background color to default, that is white
                $(".content-container #content-for-" + elementClick).css({ 'background-color': '#d2e2fc' }); //set the background color to light-blue to that div
            });
        });

        //When "Return to Top" is clicked highlight the first Alphabet that 'A' and scroll to top.
        $('.return-to-top').click(function () {
            $(".firstUL li").each(function () {
                $(".firstUL li").removeClass("selected"); //Remove classname "selected"
            });
            $("#a").addClass("selected"); //Add a class named "selected" to the first Alphabet
            $(".content-container").scrollTo($("#content-for-a"), 800); //This is for scrolling to particular element that is "A" here...
            $(".content-container div").css({ 'background-color': '#ffffff' }); //set the background color to default, that is white
            $(".content-container #content-for-a").css({ 'background-color': '#d2e2fc' }); //set the background color to light-blue to that div
        });
    });
</script>
    			</div>
  			</div>
		</div>

		<div class="wrapper">
  			<div id="copyright" class="clear">
    			<p class="fl_left">Copyright &copy; 2014 - All Rights Reserved - </p>
    			<p class="fl_right">Developed & Designed by Ashwini, Keshav and Prathmesh</p>
  			</div>
		</div>
