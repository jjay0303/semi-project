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
    div{ box-sizing:border-box;}
    #outer{

        width:1000px; 
        height:1050px; 
        padding:40px;
        margin:auto;
        margin-top:50px;
    }

    #outer>div{
        width:900px;
        height:250px;
        margin:auto;
        margin-top:40px;
        border:1px solid black;
    }

    #area>div{
        float:left;
    }
    #notice_area{
        width:430px;
        height:250px;
        background:rgb(203, 185, 153);
    }

    #call_area{
        width:430px;
        height:250px;
        margin-left:38px;
        background:rgb(203, 185, 153);
    }


    #faq_area, #qna_area, #notice_area, #call_area{
        padding:15px;
    }
    
    #outer a{
        text-decoration:none;
            color:rgb(64, 64, 64);
            font-size:16px;
            font-weight:600;
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

            <h4 style="font-size: 23px; font-weight: bolder;">고객센터</h4>
            <br>
            <hr>
            <div id="faq_area">
                <a href="">FAQ &gt</a>
                <table id="faq_tb">
                    <tr class="q">
                        <td width="150">취소/환불</td>
                        <td width="660">Q 티켓 구매 취소를 하고싶어요</td>
                        <td width="40">▼</td>
                    </tr>
                    <tr class="a">
                        <td></td>
                        <td colspan="2"><div>
                            A

                            ▼ 환불 안내 <br>
                            - MY PAGE 클릭 -> 최근 주문 정보 -> 티켓 번호 클릭 -> 환불신청<br>
                            - 본 상품은 특가로 진행되는 상품으로 미사용 티켓에 한하여 구매일로부터 7일 이내에만 환불이 가능합니다. <br>
                            - 티켓 사용 여부 상관없이 환불기간, 유효기간 이후, 전시종료 이후에는 어떠한 사유로든 환불이 불가합니다. <br>
                            - 해당 절차는 환불 규정에 적합하지 않은 상품일 경우 신청이 철회될 수 있습니다. <br>
                            - 결제수단에 따라 환불규정이 각기 다르므로 결제수단 별 환불 기간을 확인해주세요. <br>
                            - 신용카드 : 카드 취소일 로부터 2-5일 이내 이내 카드사별 개별 승인취소 확인이 가능합니다.<br>
                            - 무통장 입금 및 계좌이체 : 취소/환불 접수 시 입력한 환불 계좌로 (평일 기준) 2-3일 이내 입금됩니다.
                        </div></td> 
                    </tr>
                    <tr class="q">
                        <td >취소/환불</td>
                        <td>Q 티켓 구매 취소를 하고싶어요</td>
                        <td>▼</td>
                    </tr>
                    <tr class="a">
                        <td width="150"></td>
                        <td colspan="2" width="700"><div>
                            A

                            ▼ 환불 안내 <br>
                            - MY PAGE 클릭 -> 최근 주문 정보 -> 티켓 번호 클릭 -> 환불신청<br>
                            - 본 상품은 특가로 진행되는 상품으로 미사용 티켓에 한하여 구매일로부터 7일 이내에만 환불이 가능합니다. <br>
                            - 티켓 사용 여부 상관없이 환불기간, 유효기간 이후, 전시종료 이후에는 어떠한 사유로든 환불이 불가합니다. <br>
                            - 해당 절차는 환불 규정에 적합하지 않은 상품일 경우 신청이 철회될 수 있습니다. <br>
                            - 결제수단에 따라 환불규정이 각기 다르므로 결제수단 별 환불 기간을 확인해주세요. <br>
                            - 신용카드 : 카드 취소일 로부터 2-5일 이내 이내 카드사별 개별 승인취소 확인이 가능합니다.<br>
                            - 무통장 입금 및 계좌이체 : 취소/환불 접수 시 입력한 환불 계좌로 (평일 기준) 2-3일 이내 입금됩니다.
                        </div></td> 
                    </tr>
                    <tr class="q">
                        <td >취소/환불</td>
                        <td>Q 티켓 구매 취소를 하고싶어요</td>
                        <td>▼</td>
                    </tr>
                    <tr class="a">
                        <td width="150"></td>
                        <td colspan="2" width="700"><div>
                            A

                            ▼ 환불 안내 <br>
                            - MY PAGE 클릭 -> 최근 주문 정보 -> 티켓 번호 클릭 -> 환불신청<br>
                            - 본 상품은 특가로 진행되는 상품으로 미사용 티켓에 한하여 구매일로부터 7일 이내에만 환불이 가능합니다. <br>
                            - 티켓 사용 여부 상관없이 환불기간, 유효기간 이후, 전시종료 이후에는 어떠한 사유로든 환불이 불가합니다. <br>
                            - 해당 절차는 환불 규정에 적합하지 않은 상품일 경우 신청이 철회될 수 있습니다. <br>
                            - 결제수단에 따라 환불규정이 각기 다르므로 결제수단 별 환불 기간을 확인해주세요. <br>
                            - 신용카드 : 카드 취소일 로부터 2-5일 이내 이내 카드사별 개별 승인취소 확인이 가능합니다.<br>
                            - 무통장 입금 및 계좌이체 : 취소/환불 접수 시 입력한 환불 계좌로 (평일 기준) 2-3일 이내 입금됩니다.
                        </div></td> 
                    </tr>
                    <tr class="q">
                        <td >취소/환불</td>
                        <td>Q 티켓 구매 취소를 하고싶어요</td>
                        <td>▼</td>
                    </tr>
                    <tr class="a">
                        <td width="150"></td>
                        <td colspan="2" width="700"><div>
                            A

                            ▼ 환불 안내 <br>
                            - MY PAGE 클릭 -> 최근 주문 정보 -> 티켓 번호 클릭 -> 환불신청<br>
                            - 본 상품은 특가로 진행되는 상품으로 미사용 티켓에 한하여 구매일로부터 7일 이내에만 환불이 가능합니다. <br>
                            - 티켓 사용 여부 상관없이 환불기간, 유효기간 이후, 전시종료 이후에는 어떠한 사유로든 환불이 불가합니다. <br>
                            - 해당 절차는 환불 규정에 적합하지 않은 상품일 경우 신청이 철회될 수 있습니다. <br>
                            - 결제수단에 따라 환불규정이 각기 다르므로 결제수단 별 환불 기간을 확인해주세요. <br>
                            - 신용카드 : 카드 취소일 로부터 2-5일 이내 이내 카드사별 개별 승인취소 확인이 가능합니다.<br>
                            - 무통장 입금 및 계좌이체 : 취소/환불 접수 시 입력한 환불 계좌로 (평일 기준) 2-3일 이내 입금됩니다.
                        </div></td> 
                    </tr>
                    <tr class="q">
                        <td >취소/환불</td>
                        <td>Q 티켓 구매 취소를 하고싶어요</td>
                        <td>▼</td>
                    </tr>
                    <tr class="a">
                        <td width="150"></td>
                        <td colspan="2" width="700"><div>
                            A

                            ▼ 환불 안내 <br>
                            - MY PAGE 클릭 -> 최근 주문 정보 -> 티켓 번호 클릭 -> 환불신청<br>
                            - 본 상품은 특가로 진행되는 상품으로 미사용 티켓에 한하여 구매일로부터 7일 이내에만 환불이 가능합니다. <br>
                            - 티켓 사용 여부 상관없이 환불기간, 유효기간 이후, 전시종료 이후에는 어떠한 사유로든 환불이 불가합니다. <br>
                            - 해당 절차는 환불 규정에 적합하지 않은 상품일 경우 신청이 철회될 수 있습니다. <br>
                            - 결제수단에 따라 환불규정이 각기 다르므로 결제수단 별 환불 기간을 확인해주세요. <br>
                            - 신용카드 : 카드 취소일 로부터 2-5일 이내 이내 카드사별 개별 승인취소 확인이 가능합니다.<br>
                            - 무통장 입금 및 계좌이체 : 취소/환불 접수 시 입력한 환불 계좌로 (평일 기준) 2-3일 이내 입금됩니다.
                        </div></td> 
                    </tr>                   
                </table>
            </div>

            <script>
                $(function(){
                    $(".q").click(function(){
                        const $tr = $(this).next();

                        if($tr.css("display") == "none"){
                            $(this).siblings(".a").slideUp();

                            $tr.slideDown();
                        }else{
                            $tr.slideUp();
                        }
                    })
                })
            </script>
    
            <div id="qna_area">
                <a href="">Q&A &gt</a>
    
            </div>
    
            <div id="area">
                <div id="notice_area">
                    <a href="">공지사항 &gt</a>
        
                </div>
                <div id="call_area">
        
                </div>
            </div>
        </div>

    <%@ include file="../../common/footerbar.jsp" %>

</body>
</html>