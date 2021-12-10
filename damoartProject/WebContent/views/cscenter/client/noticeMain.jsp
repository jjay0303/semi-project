<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.common.model.vo.PageInfo, com.kh.cscenter.model.vo.Notice" %>
    
<% PageInfo pi = (PageInfo)request.getAttribute("pi");
   ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
   
   int currentPage = pi.getCurrentPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   int maxPage = pi.getMaxPage();
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
    div{ box-sizing:border-box;}

    #outer{

        width:1000px; 
        height:1050px; 
        padding:40px;
        margin:auto;
    }

    #list-area{
        text-align:center;
    }
    
    .search-area>a{
        background-color:rgb(151, 138, 116);
        color:white;
    }

    thead{
        background:rgb(203, 185, 153);
    }
    
    tbody th{
        font-weight:500;
        font-size:14px;/
    }

    #outer>a{
        text-decoration:none;
        color:rgb(64, 64, 64);
    }


</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	
        <div id="outer">
            <a href="">고객센터</a>&gt<a href=""><b>공지사항</b></a>
            <br><br>
			<h4 style="font-size: 23px; font-weight: bolder;" align="center">공지사항</h4>
            <br>
            <hr>
            <br><br>
            <div>
                <table align="center" id="list-area" class="table table-hover">
                    <thead>
                        <tr>
                            <th width="70">번호</th>
                            <th width="300">제목</th>
                            <th width="100">작성자</th>
                            <th width="100">등록일</th>
                            <th width="100">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<% if(list.isEmpty()) { %>
	                        <tr>
	                            <th colspan="5">게시글이 없습니다.</th>
	                        </tr>
                        <% }else { %>
                        	<%for(Notice n : list) { %>
		                        <tr>
		                            <th><%=n.getNoticeNo() %></th>
		                            <th><%=n.getNoticeTitle() %></th>
		                            <th><%=n.getNoticeWriter() %></th>
		                            <th><%=n.getCreateDate() %></th>
		                            <th><%=n.getCount() %></th>
		                        </tr>
                        	<% } %>
                        <% } %>
                    </tbody>
                </table>
                <br><br>
                <div class="paging-area" align="center">
                	<% if(currentPage != 1) {%>
                    	<button class="btn" onclick="location.href='<%=contextPath%>/list.no?cpage=<%=currentPage-1%>'">&lt;</button>
                    <% }else { %>
                    	<button class="btn" disabled>&lt;</button>
                    <% } %>
                    
                    <% for(int p=startPage; p<=endPage; p++) { %>
                    	<% if(p == currentPage) { %>
                    		<button class="btn" disabled><%=p %></button>
                    	<% }else { %>
                    		<button class="btn" onclick="location.href='<%=contextPath %>/list.no?cpage=<%=p%>'"><%=p %></button>
                    	<% } %>
                    <% } %>
                    <% if(currentPage != maxPage) {%>
                    <button class="btn" onclick="location.href='<%=contextPath%>/list.no?cpage=<%=currentPage+1%>'">&gt;</button>
                    <% }else { %>
                    	<button class="btn" disabled>&gt;</button>
                    <% } %>
                </div>
                <br>
                <div class="search-area" align="center">
                    <select name="" id="">
                        <option value="">제목</option>
                        <option value="">내용</option>
                    </select>
                    <input type="text">
                    <a href="" class="btn btn-sm">검색</a>
                </div>
            </div>
           
        </div>

        

    <%@ include file="../../common/footerbar.jsp" %>

</body>
</html>