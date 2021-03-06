<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.order.model.vo.ManageOrder"%>
<%
ArrayList<ManageOrder> list = (ArrayList<ManageOrder>)request.getAttribute("list");
int totalOrder = (int)request.getAttribute("totalOrder");
int totalPay = (int)request.getAttribute("totalPay");
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
</head>
<style>

    .wrap{
        width: 100%;
    }

    .manage_head{
    width: 800px;
    height: 50px;
    font-size: 20px;
    margin: auto;
    margin-top: 220px;
    }


    #title{
        font-size: 25px;
    }

    .order_chart{    
        margin:auto;
        width:800px; 
        height:80px;
        border-radius:10px;
        background-color: rgb(203, 185, 153);
    }

    .box{
        display: inline-block;
        height: 80px;
        width: 230px;
        padding-top: 3%;
        font-size: 20px;
        font-weight: 800;
    }

    .search_date{
        width: 800px;
        margin: auto;
        margin-top: 50px;
    }

    .search_date>.btn{
        background-color: rgba(149, 133, 99, 0.6);
        width: 70px;
        height: 30px;
        padding: 3px;
        font-size: 13px;
        margin-left: 15px;
    }
    
    .select_date{
        float: right;
    }

    .order_box{
        width: 800px;
        margin-top: 50px;
    }
    .search{
        float: right;
    }

    .order_box>.btn{
        width: 130px;
        font-size: 13px;
    }

    #cancel{
        background-color: rgb(203, 185, 153);

    }
    #check{
        color: white;
        background-color: rgba(78, 67, 44, 0.6);
    }

    #search{
        color: white;
        background-color: rgba(78, 67, 44, 0.6);
        width: 60px;
        font-size: 13px;
    }

    input::placeholder{
        font-size: 12px;
    }

    .chart{
        font-size: 13px;
        margin: auto;
        margin-top: 30px;
    }
    .chart_order{
        width: 800px;
    }
    td{
        border-bottom: 1px solid black;
        height: 100px;
        background-color: rgba(238, 232, 222, 0.829);
    }
    .table_title{
        height: 40px;
        background-color: rgba(179, 165, 141, 0.829)
    }
</style>
<body>
    
   <%@ include file="../common/manageMenubar_2.jsp" %>

<!--?????? ??????-->

<div class="wrap">
    <div class="manage_head" align="center">
        <p>?????? ??????<b id="title"> > ?????? ?????? ??????</b></p>
    </div>
        <br><br><br>
        <!--?????? ??????-->
        <div class="order_chart" align="center">
           <div class="box new_order">
                ????????????&nbsp;&nbsp; <%= totalOrder %>
           </div>
           <div class="box com_order">
               ????????????&nbsp;&nbsp; <%= totalPay %>
           </div>

        </div>
        
        <!--???????????? ?????? ??????-->
        
        <div class="search_date">
            <b>????????????</b> 
            <button class="btn" id="today">??????</button>
            <button class="btn" id="week">?????????</button>
            <button class="btn" id="month">1??????</button>
            <div class="select_date">
                <input type="date"> <b>&nbsp;~&nbsp;</b> <input type="date">
            </div>
           
        <!--?????? ?????????-->
        <div class="order_box">
            <a href="" class="btn" id="cancel" data-toggle="modal" data-target="#myModal1" type="button"><b>????????????</b></a>
            <div class="search">
                <input type="text" placeholder="????????? ID, ??????, ????????????">
                <button class="btn" id="search"><b>??????</b></button>
            </div>

            <!--?????? ???-->
            <div class="chart">
                <table class="chart_order">
                <thead>
                        <tr align="center" class="table_title">
                        <th width="30"><input type="checkbox" id="allCheck"></th>
                        <th width="150">???????????? / ??????</th>
                        <th width="220" colspan="2">????????????</th>
                        <th width="80">????????????</th>
                        <th width="60">??????</th>
                        <th width="80">??????</th>
                        <th width="170">????????????</th>
                    </tr>
                </thead>


                <% System.out.println("data_size=>" + list.size()); %>
     
                <tbody id="table_content">
       			 <% for(ManageOrder m : list) { %>
       			 <% System.out.println(m.toString()); %>
                  <tr align="center">
                        <td ><input type="checkbox" class="deleteCheck" name="checkNo" value="<%=m.getOrderNo()%>"></td>
                        <td> <%= m.getOrderName() %><br><%= m.getOrderNo() %><br><%= m.getOrderDate() %></td>
                        <td width="60"><img src="<%=request.getContextPath()%>/<%= m.getMainImg()%>" width="40px" height="40px"></td>
                        <td><%= m.getpNo() %><br><%= m.getTitle() %></td>
                        <td><%= m.getTotalPrice() %>???</td>
                        <td><%= m.getOrderCount() %></td>
                        <td><% if (m.getOrderStatus().equals("W")) { %>
                         	  ????????????
                         	  <% } else if (m.getOrderStatus().equals("P")) { %>
                         	  ????????????
                         	  <% } else if (m.getOrderStatus().equals("C")) { %>
                         	  ????????????
                         	  <% } else if (m.getOrderStatus().equals("CC")) { %>
                         	  ????????????
                         	  <% } else if (m.getOrderStatus().equals("N")) { %>
                         	  ????????????
                         	  <% } else { %>
                         	  ???????????? <%} %></td>
                        <td>??? ???????????? &nbsp; <%=m.getPayPrice()%>??? 
                         	 
                        </td>
                        </tr>
                        <% } %>
                </tbody>
                          
                </table>
            </div>    
            <script>
			(function(){

        		$("#allCheck").click(function(){
        			$(".deleteCheck").prop("checked", $(this).prop("checked"));
        		})
        		
				$("#today").click(function(){
					console.log("11111");
		 			var startDt = new Date();
					var year = new String(startDt.getFullYear()); 
					var month = new String(startDt.getMonth()+1); 
					var day = new String(startDt.getDate());

					// ??????????????? ?????? 0??? ????????????. 
					if(month.length == 1){ 
					  month = "0" + month; 
					} 
					if(day.length == 1){ 
					  day = "0" + day; 
					}
					var g_todayDate = year.substring(2,4) + month + day;

					console.log("startDt" + g_todayDate)
							
							$.ajax({
			    				url:"order.mg",
			    				data:{
				    				content:"today",
				    				startDt:g_todayDate,
				    				endDt: g_todayDate,
			    				},
			    				type:"get",
			    				success:function(result){
			    					console.log("ajax?????? ??????");
			    					location.reload()
			    					return result;
			    				}, error:function(){
			    					console.log("ajax?????? ??????");
			    				}
			    			})
				        })
				        
				        
				        
				        
		         $("#week").click(function(){
					console.log("11111");
					var startDt = new Date();
					var year = new String(startDt.getFullYear()); 
					var month = new String(startDt.getMonth()+1); 
					var day = new String(startDt.getDate());

					// ??????????????? ?????? 0??? ????????????. 
					if(month.length == 1){ 
					  month = "0" + month; 
					} 
					if(day.length == 1){ 
					  day = "0" + day; 
					}
					startDt = year.substring(2,4) + month + day;
					

					var onemonth = new Date();
					onemonth.setDate(onemonth.getDate()-7);
					var weekyear = String(onemonth.getFullYear()); 
					var weekmonth = new String(onemonth.getMonth()+1); 
					var weekday = new String(onemonth.getDate());

					// ??????????????? ?????? 0??? ????????????. 
					if(weekmonth.length == 1){ 
					  weekmonth = "0" + weekmonth; 
					} 
					if(weekday.length == 1){ 
					  weekday = "0" + weekday; 
					}
					startDt = weekyear.substring(2,4) + weekmonth + weekday;
					
					var today = new Date();
					var year = new String(today.getFullYear()); 
					var month = new String(today.getMonth()+1); 
					var day = new String(today.getDate());

					// ??????????????? ?????? 0??? ????????????. 
					if(month.length == 1){ 
					  month = "0" + month; 
					} 
					if(day.length == 1){ 
					  day = "0" + day; 
					}
					var endDt = year.substring(2,4) + month + day;
					console.log("startDt" + startDt + "endDt" + endDt)
					$.ajax({
	    				url:"order.mg",
	    				data:{
		    				content:"week",
		    				startDt:startDt,
		    				endDt: endDt,
	    				},
	    				type:"get",
	    				success:function(result){
	    					console.log("ajax?????? ??????" + result);
	    					location.reload()
	    				}, error:function(){
	    					console.log("ajax?????? ??????");
	    				}
	    			})
		        })
		        
		        $("#month").click(function(){
					console.log("11111");
					$("#table_content").remove();
					var startDt = new Date();
					var year = new String(startDt.getFullYear()); 
					var month = new String(startDt.getMonth()+1); 
					var day = new String(startDt.getDate());

					// ??????????????? ?????? 0??? ????????????. 
					if(month.length == 1){ 
					  month = "0" + month; 
					} 
					if(day.length == 1){ 
					  day = "0" + day; 
					}
					endDt = year.substring(2,4) + month + day;
					

					var onemonth = new Date();
					onemonth.setDate(onemonth.getDate()-30);
					var weekyear = String(onemonth.getFullYear()); 
					var weekmonth = new String(onemonth.getMonth()+1); 
					var weekday = new String(onemonth.getDate());

					// ??????????????? ?????? 0??? ????????????. 
					if(weekmonth.length == 1){ 
					  weekmonth = "0" + weekmonth; 
					} 
					if(weekday.length == 1){ 
					  weekday = "0" + weekday; 
					}
					startDt = weekyear.substring(2,4) + weekmonth + weekday;
					
					var today = new Date();
					var year = new String(today.getFullYear()); 
					var month = new String(today.getMonth()+1); 
					var day = new String(today.getDate());

					// ??????????????? ?????? 0??? ????????????. 
					if(month.length == 1){ 
					  month = "0" + month; 
					} 
					if(day.length == 1){ 
					  day = "0" + day; 
					}
					var endDt = year.substring(2,4) + month + day;
					console.log("startDt" + startDt + "endDt" + endDt)
					$.ajax({
	    				url:"order.mg",
	    				data:{
		    				content:"month",
		    				startDt:startDt,
		    				endDt: endDt,
	    				},
	    				type:"get",
	    				success:function(result){
	    					console.log("ajax?????? ??????" + result);
	    					location.reload()
	    				}, error:function(){
	    					console.log("ajax?????? ??????");
	    				}
	    			})
		        })
		        
			})();
			
	    </script>
				
            </div>    


        </div>
        
       
        <br><br><br><br><br><br>
<%@ include file="../common/footerbar.jsp" %>
</div>

 
	<!-- The Modal -->
	<div class="modal" id="myModal1">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	
	      <!-- Modal body -->
	      <div class="modal-body" align="center">
	        	?????? ?????????????????????????
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button id="deleteCancel" type="button" class="btn" data-dismiss="modal">??????</button>
	      	<button id ="deleteCheck" type="button" class="btn" data-dismiss="modal" onclick="checkCancel();" name="checkCancel">??????</button>
		  </div>	
	    </div>
	  </div>
	</div>
	<script>
		function checkCancel(){
            var checkArr = [];
            $("input:checkbox[class='deleteCheck']:checked").each(function(){
                checkArr.push($(this).val());
            })
            console.log("checkArr" + checkArr);
            location.href = "/damoart/checkCancel.mg?arr=" + checkArr
		}    
	</script>



</body>
</html>