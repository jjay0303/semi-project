<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.product.model.vo.Product" %>
<% 
	ArrayList<Product> freeList = (ArrayList<Product>)request.getAttribute("freeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
	div{ box-sizing:border-box; }
    .wrapper{
        width: 1000px;
        height: 1200px;
        top: 0; left: 0; right: 0; bottom: 0; margin: auto;
        margin-top: 50px;
    }
     /* 페이지 이름 스타일 */
    .name{ width: 100%; height: 30px; }
    #name1{
        width: 82%;
        font-size: 23px;
        font-weight: bolder;
        float: left;
    }
    /* 페이지 정렬 버튼 스타일 */
    .name>a{
        width: 6%; 
        font-size: 10px;
        margin-top: 10px;
        padding-top: 10px;
        float: left;
        text-decoration: none;
        color: black;
    }
    .name>a:hover{font-weight: bolder; text-decoration: none; color: black;}
    #content1{
        width: 100%;
        height: 300px;
        margin: auto;
        margin-top: 20px;
        margin-bottom: 50px;
    }
    #content{
        width: 20%;
        height: 100%;
        float: left;
        margin-left: 25px;
        margin-right: 25px;
        margin-bottom: 50px;
        margin-top: 0px;
        display: block;
    }
    .poster{
        width: 100%;
        height: 75%;
        width: 100%;
        height: 80%;
    }
    .info{
        width: 100%;
        height: 25%;
    }
    .info>p{
        width: 100%;
        text-align: center;
        display: inline-block;
        overflow:hidden;
        text-overflow:ellipsis;
        white-space:nowrap; 
    }
    .title{font-weight: bolder; padding-top: 10px;}
    .summary{font-size: 12px; font-weight: bolder; margin-top: -10px;}
</style>

</head>
<body>

    <%@ include file="../common/menubar.jsp" %>

    <div class="wrapper">
        <div class="name">
            <div id="name1">무료 전시</div>
            <a href="<%=contextPath%>/OpenFree.pro">오픈날짜순</a>
            <a href="<%=contextPath%>/EndFree.pro">종료날짜순</a>
            <a href="">별점순</a>
        </div>
        <hr class="my-2">
        <div id="content1">
        <% if(freeList.isEmpty()) { %>
        	<p> 결과가 없습니다 </p>
        <% } else {%> 
	        <% for(Product p : freeList){ %>
	            <div id="content">
	           		<div class="poster">
	           			<input type="hidden" name="num" value="<%= p.getpNo() %>">
	                	<a href="<%=contextPath%>/detail.pro?num=<%=p.getpNo()%>">
	                		<img src="<%=contextPath%>/<%= p.getMainImg() %>" width="100%" height="100%">
	                	</a>
	            	</div>
	            	<div class="info">
	                    <p class="title">
	                        <%= p.getTitle() %>
	                    </p>
	                    <p class="summary">
	                        <%= p.getsDate() %> ~ <%= p.geteDate() %><br>
	                        <%= p.getArea() %>
	                    </p>
	                </div>
	            </div>
	        <% } %> 
        <% } %> 
        	
        </div>
    </div>   <!-- wrapper클래스 -->
    
    
    <%@ include file="../common/footerbar.jsp" %>
     
</body>
</html>