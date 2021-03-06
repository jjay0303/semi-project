<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.common.model.vo.PageInfo, com.kh.cscenter.model.vo.FAQ" %>
    
<% PageInfo pi = (PageInfo)request.getAttribute("pi");
   ArrayList<FAQ> list = (ArrayList<FAQ>)request.getAttribute("list");
   String keyword = request.getParameter("keyword");
   
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
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    div, input{ box-sizing:border-box;}

    #outer{

        width:1000px; 
        height:auto; 
        padding:40px;
        margin:auto;
    }

    #searchbox{
        border:1px solid black;
        height:180px;
        border:1px solid rgb(151, 138, 116);
    }

    #searchbox>div{

        float:left;
        margin:auto;
        height:100%;
    }

    #searchbox button{

        background-color:rgb(151, 138, 116);
            color:white;
    }

    #faq{
        width:30%;
        padding-top:45px;
        padding-right:20px;
    }

    #str1{
        font-size: 25px;
        font-weight:700;
        width:30%;
        text-align:center;
    }

    #str2{
        font-size: 17px;
        font-weight:700;
        width:30%;
        text-align:center;
    }

    #search{
        width:70%;
        padding-top:60px;
    }

    #list-area{
        text-align:center;
    }
    
    thead{
        background:rgb(203, 185, 153);
    }
    
    tbody td{
        font-weight:500;
        font-size:14px;
    }

    #outer>a{
        color:rgb(64, 64, 64);
    }

    .a{
        display:none;
    }
    
    .q{
        cursor:pointer;
    }

</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	
        <div id="outer">
            <a href="">????????????</a><i class="fas fa-angle-right"></i><a href=""><b>FAQ</b></a>
            <br><br>
			<h4 style="font-weight: bolder;" align="center">FAQ</h4>
            <h6 align="center" style="font-weight:700">???????????? ??????</h6>

            <hr>
            <br>
            <div id="searchbox">
                <div id="faq" align="right">
                    <p id="str1">FAQ</p>
                    <p id="str2">????????????</p>
                </div>
                <div id="search">
                    <form action="search.fa">
                        <input type="text" size="50" placeholder="???????????? ???????????????" name="keyword" required>
                        <input type="hidden" name="cpage" value="1">
                        <button type="submit" class="btn btn-sm">??????</button> <br>
                        ???????????? ????????? ????????? Q&A???????????? ??????????????????.
                    </form>
                </div>
            </div>
            <br><br>
            <h5>"<%=keyword %>"(???)??? ????????? ??????</h5>
            <br>
            <div>
                <table align="center" id="list-area" class="table table-hover">
                    <thead>
                        <tr>
                            <th width="100">??????</th>
                            <th width="520">??????</th>
                            <th width="50"></th>
                        </tr>
                    </thead>
                    <tbody>
                    	<% if(list.isEmpty()) { %>
	                        <tr>
	                            <td colspan="3">???????????? ????????????.</td>
	                        </tr>
                        <% }else { %>
                        	<%for(FAQ f : list) { %>
		                        <tr class="q">
		                            <td><%=f.getfCategoryCode() %></td>
		                            <td align="left"><span><b>Q</b></span>&nbsp;&nbsp;<%=f.getFaqTitle() %></td>
                                    <td><i class="fas fa-angle-down"></i></td>
		                        </tr>
                                <tr class="a" align="left">
		                            <td></td>
		                            <td colspan="2">
		                            	<p><b>A</b></p>
		                            	<%=f.getFaqContent().replace("\r\n", "<br>")%>
		                            </td>
		                        </tr>
                        	<% } %>
                        <% } %>
                    </tbody>
                </table>
                <script>
                    $(function(){
                        $(".q").click(function(){
                            const $tr = $(this).next();
    
                            if($tr.css("display") == "none"){
                                $(this).siblings(".a").hide();
    
                                $tr.show();
                            }else{
                                $tr.hide();
                            }
                        })
                    })
                    
                    
                </script>
                <br><br>
                <div class="paging-area" align="center">
                	<% if(currentPage != 1) {%>
                    	<button class="btn" onclick="location.href='<%=contextPath%>/list.fa?cpage=<%=currentPage-1%>'">&lt;</button>
                    <% } %>
                    
                    <% for(int p=startPage; p<=endPage; p++) { %>
                    	<% if(p == currentPage) { %>
                    		<button class="btn" disabled><%=p %></button>
                    	<% }else { %>
                    		<button class="btn" onclick="location.href='<%=contextPath %>/list.fa?cpage=<%=p%>'"><%=p %></button>
                    	<% } %>
                    <% } %>
                    <% if(currentPage != maxPage) {%>
                    <button class="btn" onclick="location.href='<%=contextPath%>/list.fa?cpage=<%=currentPage+1%>'">&gt;</button>
                    <% } %>
                </div>
                <br>
            </div>
           
        </div>
		<br><br><br>
        

    <%@ include file="../../common/footerbar.jsp" %>

</body>
</html>