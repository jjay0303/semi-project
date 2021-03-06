<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.product.model.vo.Product" %>
    
<% 
	ArrayList<Product> searchList = (ArrayList<Product>)request.getAttribute("regionList");
	
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
	.option{
		width: 100%;
		height: 300px;
		margin-top: 35px;
		margin-bottom: 50px;
	}
    .name{
        width: 100%;
        font-size: 28px;
        font-weight: bolder;
        text-align: center;
		margin-bottom: 20px;
	}
	.op{
		float: left;
		margin-left: 80px;
		width: 150px;
		height: 100%;
	}
	#title{
		width: 100%;
		font-size: 24px;
		font-weight: bolder;
		text-align: center;
	}
	.op>div{
		width: 100%;
		height: 70%;
		font-size: 18px;
		text-align: center;
		background-color: rgb(151, 138, 116);
	}
	.op>div>button{
		border: none;
		background-color: rgb(151, 138, 116);
		font-weight: bolder;
	}
	.op_each1>button{
		font-size: 18px;
		margin-top: 25px;
	}
	.op_each2>button{
		font-size: 18px;
		margin: 3.3px;
	}
	.op_each3>button{
		font-size: 18px;
		margin: 5px;
		margin-top: 10px;
	}
	.op_each4>button{
		font-size: 18px;
		margin: 10px;
		margin-top: 12px;
	}
	button:hover{color: whitesmoke; background: white;}

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="wrapper">
		<div class="name">?????? ??????</div>
		<hr class="my-2">
			<div class="option" >
				<div class="op" >
					<p id="title">??????</p>
					<div class="op_each1">
						<button class="op1" id="today" value="today">?????? ?????? ??????</button>
						<button class="op1" id="week" value="week" >1?????? ?????? ??????</button>
						<button class="op1" id="month" value="month">1??? ?????? ??????</button>
					</div>
				</div>
				<div class="op">
					<p id="title">??????</p>
					<div class="op_each2">
						<button class="op2" id="se" value="se" >??????</button>
						<button class="op2" id="ki" value="ki" >??????/??????</button>
						<button class="op2" id="kc" value="kc" >??????/??????</button>
			            <button class="op2" id="jr" value="jr" >?????????</button>
			            <button class="op2" id="ks" value="ks" >?????????</button>
			            <button class="op2" id="jj" value="jj" >?????????</button>
					</div>
				</div>
				<div class="op">
					<p id="title">??????</p>
					<div class="op_each3">
						<button class="op3" id="price1" value="0" >??????</button>
						<button class="op3" id="price2" value="10000" >10000??? ??????</button>
						<button class="op3" id="price3" value="19999" >20000??? ??????</button>
						<button class="op3" id="price4" value="20000" >20000??? ??????</button>
					</div>
				</div>
				<div class="op">
					<p id="title">??????</p>
					<div class="op_each4"> 
						<button class="op4" id="age1" value="all" >???????????????</button>
						<button class="op4" id="age2" value="kids" >?????????</button>
						<button class="op4" id="age3" value="teen" >?????????</button>
						<button class="op4" id="age4" value="adult" >??????</button>
					</div>
				</div>
			</div>	

			<button class="btn btn-block" id="submit" style="background-color: rgb(151, 138, 116);"> ????????????</button>
			
	</div>
	
	<%@ include file="../common/footerbar.jsp" %>
	
	<script>
		(function(){
			
			var option = [];
			
			let op1="";
			let op2="";
			let op3="";
			let op4="";
		
			$(".op1").unbind("click");
			$(".op1").bind("click", function(){
				$(this).css("backgroundColor", "rgb(182, 167, 141)");
	            op1 = $(this).attr('value');
	            option[0] = op1;
	            //console.log(op1);
	            //console.log(option);
	        })
	        $(".op2").click(function(){
				$(this).css("backgroundColor", "rgb(182, 167, 141)");
	            op2 = $(this).attr('value');
	            option[1] = op2;
	            //console.log(option);
	            //console.log(op2);
	        })
	        $(".op3").click(function(){
				$(this).css("backgroundColor", "rgb(182, 167, 141)");
	            op3 = $(this).attr('value');
	            option[2] = op3;
	            //console.log(option);
	            //console.log(op3);
	        })
	        $(".op4").click(function(){
				$(this).css("backgroundColor", "rgb(182, 167, 141)");
	            op4 = $(this).attr('value');
	            option[3] = op4;
	            //console.log(op4);
	            //console.log(option);
	        })
	        
	        $("#submit").click(function(){
	            location.href = '<%=contextPath%>/search.pro?value=' + option;
	        })
		})();
    </script>

</body>
</html>