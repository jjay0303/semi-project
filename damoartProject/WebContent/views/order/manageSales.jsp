<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    .wrap{
        width: 1200px;
        height: 100%;
        margin-top: 150px;
        margin: auto;
    }

    .manage_head{
    width: 1000px;
    height: 50px;
    float: left;
    font-size: 20px;
    margin-top: 70px;
    margin-left: 80px;
    }
    
    #title{
        font-size: 25px;
    }
    
    .date {
        width: 800px;
        height: auto;
        margin: auto;
    }

    .date01{
        width: 50%;
        height: 80px;
        float: left;
        margin-top: 40px;
        padding: 15px;
    }

    .date01>.btn{
        background-color: rgba(149, 133, 99, 0.6);
        width: 70px;
        height: 30px;
        padding: 3px;
        font-size: 13px;
        margin-left: 15px;
    }
    .calender{
        width: 50%;
        height: 80px;
        float: right;
        margin-top: 40px;
        padding: 15px;
    }
    
    #sales_table{
        width: 1000px;
        height: auto;
        margin-top: 150px;
        font-size: 13px;
    }
    

    .sales_product{
        height: auto;
        margin-top: 50px;
        font-size: 13px;
    }

    td{
        border-bottom: 1px solid;
        padding: 7px;
        background-color: rgba(238, 232, 222, 0.829);
    }
    th{
        padding: 7px;
        background-color: rgba(179, 165, 141, 0.829);
    }

    #btn{
        margin: 50px;
        width: 150px;
        background-color: rgb(203, 185, 153);
        font-size: 14px;
    }
</style>
</head>
<body>

    <!-- 헤드 -->
    <div class="wrap">
        <div class="manage_head">
            <p>현황 관리<b id="title"> > 판매 현황</b></p>
        </div>
    
        <!-- 조회 기간 -->
            <div class="date">
                <div class="date01">
                    <b>조회기간</b> 
                    <button class="btn">오늘</button>
                    <button class="btn">일주일</button>
                    <button class="btn">1개월</button>
                </div>
                    <div class="calender" align="center">
                        <input type="date" style="height: 25px; width: 150px;" > <b>&nbsp;~&nbsp;</b> <input type="date" style="height: 25px; width: 150px;" >
                  </div>
               
            </div>


    <!-- 조회 표 -->
    <div class="sales" align="center">
        <table id="sales_table" style="width: 700px;" >
            <tr align="center">
                <th width="130">일자</th>
                <th width="130">주문수</th>
                <th width="130">취소수</th>
                <th width="155">주문액</th>
                <th width="155">매출액</th>
            </tr>
            <tr align="center">
                <td>2021-11</td>
                <td>52</td>
                <td>13</td>
                <td>620.000 ￦</td>
                <td>580.000 ￦</td>
            </tr>
            <tr align="center">
                <td>2021-10</td>
                <td>75</td>
                <td>21</td>
                <td>1.230.000 ￦</td>
                <td>1.230.000 ￦</td>
            </tr>
            <tr align="center">
                <td>2021-09</td>
                <td>47</td>
                <td>3</td>
                <td>1.100.000 ￦</td>
                <td>980.000 ￦</td>
            </tr>
            <tr align="center">
                <td>2021-08</td>
                <td>34</td>
                <td>6</td>
                <td>450.000 ￦</td>
                <td>390.000 ￦</td>
            </tr>
        </table>
                <!--주문 상품 표-->
                <div class="sales_product">
                    <table width="700">
                        <tr align="center">
                            <th colspan="3" width="400">상품 정보</th>
                            <th width="100">주문수</th>
                            <th width="180">비고</th>
                        </tr>
                        <tr align="center" style="height:90px">
                            <td width="70">1</td>
                            <td width="130">
                                <img src="" width="50" height="50">
                            </td>
                            <td width="200" align="left">
                                A0001 <br>
                                영국 테이트 미술관 특별전
                            </td>
                            <td>32</td>
                            <td>
                                판매중
                                <br>2021.10.28~2021.11.30
                            </td>
                        </tr>
                        <tr align="center" style="height:90px">
                            <td width="70">1</td>
                            <td width="130">
                                <img src="" width="50" height="50">
                            </td>
                            <td width="200" align="left">
                                A0001 <br>
                                영국 테이트 미술관 특별전
                            </td>
                            <td>32</td>
                            <td>
                                판매중
                                <br>2021.10.28~2021.11.30
                            </td>
                        </tr>
                        <tr align="center" style="height:90px">
                            <td width="70">1</td>
                            <td width="130">
                                <img src="" width="50" height="50">
                            </td>
                            <td width="200" align="left">
                                A0001 <br>
                                영국 테이트 미술관 특별전
                            </td>
                            <td>32</td>
                            <td>
                                판매중
                                <br>2021.10.28~2021.11.30
                            </td>
                        </tr>
                    </table>

                    
                <button class="btn" id="btn">더보기</button>
                </div>

        </div>


    <br><br><br><br><br>

</div>
    
<%@ include file="../common/footerbar.jsp" %>
</body>
</html>