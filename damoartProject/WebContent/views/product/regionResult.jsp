<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.product.model.vo.Product"%>
<% 
	ArrayList<Product> regionList = (ArrayList<Product>)request.getAttribute("regionList");
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
        height: auto;
        top: 0; left: 0; right: 0; bottom: 0; margin: auto;
        margin-top: 50px;
    }
    
    /* 페이지 이름 스타일 */
    .name{ width: 100%; height: 30px; }
    #name1{
        width: 70%;
        font-size: 23px;
        font-weight: bolder;
        float: left;
    }

    /* 페이지 정렬 버튼 스타일 */
    .name>a{
        width: 6%; 
        font-size: 10px;
        padding-top: 20px;
        float: left;
        text-decoration: none;
        color: black;
    }
    .name>a:hover{font-weight: bolder; text-decoration: none; color: black;}

    /* 지역 버튼 스타일 */
    .button{padding: 20px;}
    .button *{
        margin-left: 30px;
        width: 120px;
        background-color: rgb(182, 167, 141);
        font-weight: bolder;
    }
    .button *:hover{
        background-color: rgb(151, 138, 116);
        color: whitesmoke;
        font-weight: bolder;
    }

    /* 본문 스타일 */
    .content1{
        width: 100%;
        height: 300px;
        margin: auto;
        margin-top: 20px;
        margin-bottom: 50px;
    }
    .content{
        width: 20%;
        height: 100%;
        float: left;
        margin-left: 40px;
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
    /* 텍스트 글자수 표시 제한*/
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
            <div id="name1">지역별 전시</div>
            <a href="">높은가격순</a>
            <a href="">낮은가격순</a>
            <a href="">신규등록순</a>
            <a href="">마감임박순</a>
            <a href="">별점순</a>
        </div>

        <hr class="my-2">                       <!-- 구분선-->

        <div class="button">
        	<% for(Product p : regionList){ %>
            <button class="btn" onclick="location.href='<%=contextPath%>/views/product/regionResult.pro?value=<%=p.getRegion()%>';">서울</button>
            <button class="btn" value="경기" onclick="location.href='<%=contextPath%>/views/product/regionResult.pro';">경기/인천</button>
            <button class="btn" value="강원" onclick="location.href='<%=request.getContextPath()%>/views/product/regionResult.pro';">강원/충청</button>
            <button class="btn" value="전라도" onclick="location.href='<%=request.getContextPath()%>/views/product/regionResult.pro';">전라도</button>
            <button class="btn" value="경상도" onclick="location.href='<%=request.getContextPath()%>/views/product/regionResult.pro';">경상도</button>
            <button class="btn" value="제주도" onclick="location.href='<%=request.getContextPath()%>/views/product/regionResult.pro';">제주도</button>
        	<% } %> 
        </div>

        <div class="content1">
           	<% if(regionList.isEmpty()) { %>
        		<p> 결과가 없습니다 </p>
        	<% } else {%> 
		        <% for(Product p : regionList){ %>
		            <div class="content" id="">
		           		<div class="poster">
		           			<input type="hidden" name="num" value="<%= p.getpNo() %>">
		                	<a href="<%=request.getContextPath()%>/detail.pro?num=<%=p.getpNo()%>">
		                		<img src="<%=request.getContextPath()%>/<%= p.getMainImg() %>" width="100%" height="100%">
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

    </div> 
    
    <%@ include file="../common/footerbar.jsp" %>

</body>
</html>