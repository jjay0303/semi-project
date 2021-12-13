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
		/* border:1px solid black; */
        width:1000px; 
        height:auto; 
        padding:20px;
        margin:auto;
        margin-top:150px;
        margin-left:230px;
    }

    #outer>a{
        color:rgb(64, 64, 64);
    }
    .search-button{width:100%; height:40px; position:relative;}
    .search-button>div{float:left;}
    .search a{
        background-color:rgb(151, 138, 116);
        color:white;
    }
    .button{
        position:absolute;
        right:0;
    }

    #enroll{
        background-color:rgb(203, 185, 153);
        color:rgb(64, 64, 64);
        font-weight:600;
    }
    #delete{
        background-color:rgb(151, 138, 116);
        color:white;
    }

    thead{
        background:rgb(207, 206, 206);
    }

    .no-tb{
        background:white;
        font-size:14px;
    }


    


</style>
</head>
<body>

	<%@ include file="../../common/manageMenubar_2.jsp" %>
		
		<div id="outer">
			<a href="">고객센터</a>&gt<a href=""><b>공지사항</b></a>
            <br><br>
			<h4 style="font-weight: bolder;">공지사항 관리</h4>
            
            <br>
            <hr>
            
            <div class="search-button">
                <div class="search" width="50%">
                    <form action="">
                        <input type="text">
                        <a href="" class="btn btn-sm">검색</a>
                    </form>
                </div>
                <div class="button" width="50%">
                    <a href="" class="btn btn-sm" id="enroll">공지 등록</a>
                    <a href="" class="btn btn-sm" id="delete">선택 삭제</a>
                </div>
            </div>
            <br>
            <div>
                <table align="center" id="list-area" class="table table-bordered">
                    <thead>
                        <tr>
                            <th width="10"></th>
                            <th width="40">번호</th>
                            <th width="280">제목</th>
                            <th width="60">작성자</th>
                            <th width="100">등록일</th>
                            <th width="50">조회수</th>
                        </tr>
                    </thead>
                    <tbody class="no-tb">
                    	<% if(list.isEmpty()) { %>
	                        <tr>
	                            <th colspan="5">게시글이 없습니다.</th>
	                        </tr>
                        <% }else { %>
                        	<%for(Notice n : list) { %>
		                        <tr>
                                    <th><input type="checkbox"></th>
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
            </div>
            
        </div>

</body>
</html>