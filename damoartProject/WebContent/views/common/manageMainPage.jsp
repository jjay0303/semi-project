<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.common.model.vo.AdminMainOrder, com.kh.member.model.vo.Member" %>

<%
	ArrayList<Member> mList = (ArrayList<Member>)request.getAttribute("mList");
	ArrayList<AdminMainOrder> oList = (ArrayList<AdminMainOrder>)request.getAttribute("oList");
	int newOrderCount = (int)request.getAttribute("newOrderCount");
	int cancelCount = (int)request.getAttribute("cancelCount");
	int nonAnswerCount = (int)request.getAttribute("nonAnswerCount");
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
    div{ box-sizing:border-box;}
     #outer{
		/* border:1px solid black; */
        width:1000px; 
        height:auto; 
        padding:20px;
        margin:auto;
        margin-top:180px;
        margin-left:230px;
    }

    #member, #order{
        width:900px;
        height:auto;
        margin:auto;
        margin-top:40px;
    }

    #area>div{
        display:inline-block;
        margin-left:80px;
        border-radius: 20px;;
        width:200px;
        height:180px;
        background:rgb(151, 138, 116);
        color:white;
        font-size:22px;
        text-align:center;
        padding-top:50px;
    }

    thead{
        background:rgb(207, 206, 206);
    }

    #list-area{
        text-align:center;
        
    }
    
    #list-area>tbody>tr:hover{
    	background:rgb(240, 239, 239);
    	cursor:pointer;
    }
    
    #outer a{
        text-decoration:none;
            color:rgb(64, 64, 64);
            font-size:18px;
            font-weight:600;
    }

    .mem-tb, .order-tb{
        background:white;
        font-size:14px;
    }

</style>
</head>
<body>
	<%@ include file="../common/manageMenubar_2.jsp" %>	
        <div id="outer">

            <h3 style="font-weight: bolder;">HOME</h3>
            <br>
            <hr>

            <div id="area">
                <div id="newOrder"><%=newOrderCount %> <br> ????????????</div>
                <div id="orderCancel"> <%=cancelCount %> <br>????????????</div>
                <div id="nonAnswer"> <%=nonAnswerCount %> <br>????????? Q&A</div>
            </div>
            <br><br>
            <a href="<%=contextPath%>/mngmem.me?cpage=1">?????? ??????<i class="fas fa-angle-right"></i></a>
            <hr>
            <div id="member">
                <table align="center" id="list-area" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>??????</th>
                            <th>?????????</th>
                            <th>??????</th>
                            <th>?????????</th>
                            <th>?????????</th>
                            <th>????????????</th>
                            <th>?????????</th>
                        </tr>
                    </thead>
                    <tbody class="mem-tb">
                    	<% if(mList.isEmpty()) { %>
	                        <tr>
	                            <td colspan="7">??????????????? ????????????.</td>
	                        </tr>
                        <% }else { %>
                        	<%for(Member m : mList) { %>
		                        <tr class="mem-list">
                                    <td><%=m.getMemNo() %></td>
		                            <td><%=m.getMemId() %></td>
		                            <td><%=m.getMemName() %></td>
		                            <td><%=m.getNickName() %></td>
		                            <td><%=m.getEmail() %></td>
		                            <td><%=m.getPhone() %></td>
		                            <td><%=m.getEnrollDate() %></td>
		                        </tr>
                        	<% } %>
                        <% } %>
                    </tbody>
                </table>
                <script>
                	$(function(){
                		$(".mem-list").click(function(){ // ?????? ??? ??????
                			
                		})
                	})
                </script>
            </div>
    		<br><br><br><br>
            <a href="<%=contextPath%>/order.mg">?????? ??????<i class="fas fa-angle-right"></i></a>
            <hr>
            <div id="order">
                <table align="center" id="list-area" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>?????? ??????</th>
                            <th>?????? ?????????</th> 
                            <th>?????? ??????</th>                           
                            <th>????????????</th>
                            <th>?????? ??????</th>
                            <th>??????</th>
                        </tr>
                    </thead>
                    <tbody class="order-tb">
                    	<% if(oList.isEmpty()) { %>
	                        <tr>
	                            <td colspan="7">???????????? ????????????.</td>
	                        </tr>
                        <% }else { %>
                        	<%for(AdminMainOrder o : oList) { %>
		                        <tr>
                                    <td><%=o.getOrderNo() %></td>
		                            <td><%=o.getMemId() %></td>
		                            <td><%=o.getMemName() %></td>
		                            <td><%=o.getOrderDate() %></td>
		                            <td><%=o.getTotalPrice() %></td>
		                            <td><%=o.getOrderStatus() %></td>
		                        </tr>
                        	<% } %>
                        <% } %>
                    </tbody>
                </table>
                <script>
                	$(function(){
                		$(".order-tb").click(function(){
                			
                		})

                	})
                </script>
            </div>
        </div>


</body>
</html>