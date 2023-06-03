<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">    
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:1200px;
		margin: 0 auto;
		margin-top:30px;		
		display:flex;	
		flex-wrap: wrap;
		
	}
	.left{
		width:200px;
	}
	.right{
		width:1000px;
	}
	.profile{
		margin-bottom: 15px;
	}
	.names{
		display:flex;
		align-items:  baseline;
	}
	.name{
		font-size: 32px;
		font-weight: 500;
		margin-right: 12px;		
	}
	.inner{
		width:1200px;
	}
	.rates{
		width:1000px;
		height:100px;
		display:flex; 
		background-color: black; 
		justify-content: space-between;

	}
	.rate{
			color:white; 
			width:400px; 
			height:100px;			
			display:flex; 		  
			flex-direction:column;		
			justify-content: space-between;
			padding:3px;
	}
		.grade{
			color:white;
			font-size:26px;	
			font-weight:500;
		}
		.a{
			display:flex;
			justify-content: space-between;
			align-items: baseline;
		
		}
		.ext{
			width:120px;
			height:20px;
			font-size: 12px;
			border-radius: 15px;
			color:white;
			border:1px solid #fcfcfc;
			text-align: center;
		}
		.temp{
			padding-left:5px;
			color:white;
		}
		.point{
			width:220px;
		}
		ul{
			
			list-style-type:none;
			padding-left: 0 !important;		
		}
		li{
			list-style-type:none;
			padding-left: 0;
		}
		.temp > span{
			font-size:12px;
		}
		.ext{
			margin-right: 8px;
		}	
		.ti{
				border-top: 3px solid black;
				border-bottom:1px solid black;
				display:flex;
				justify-content: space-between;
			}
			.ti:nth-child(1) {
				flex-grow:4;
			}
			.ti:nth-child(2){
				flex-grow:1
			}
			.ti:nth-child(3){
				flex-grow:1
			}
			.orderbox{
				display:flex;
			}
			table{
				margin-top:14px;
				border-top:3px solid black;		
			}
			caption{
				caption-side: top;
				text-align: left;
				font-size: 20px;
				font-weight: bold;
			}
			.table_ti{
				margin-top:32px;
				display:flex;
				justify-content: space-between;
				align-items: center;
			}
			.more_icon{
				width:30px;
				height:30px;
			}
			.tb_img{
			
				width:55px;
				height:55px;
				margin-top: 2px;
			}
			.imgtd{
				display:flex;
				align-items: center;
				justify-content: center;
			}		
			a{
				color:black !important;
				text-decoration: none;
			}
			#f_li {
				font-weight: bold;
				font-size: 18px;
			}
</style>
</head>
<body>
<c:if test="${member.membership_id eq 'e' }"><c:set var="membership">BRONZE</c:set></c:if>
<div class="outer">
	<div class="left">
		<div class="profile">
			<div class="names">
				<div class="name">
				${member.member_name }
				</div>
				님
			</div>
		</div>
		<ul style="padding-top: 12px;">
			<li id="f_li">나의 쇼핑정보</li>
			<li><a href="${pageContext.request.contextPath}/allorderlist.or">주문조회</a></li>
			<li onclick="alert('고객센터에 문의바랍니다.');" style="cursor: pointer;">증빙서류 발급</li>
		</ul>
		<ul style="padding-top: 12px; ">
			<li id="f_li">나의 계정설정</li>
			<li><a href="${pageContext.request.contextPath}/memberInfo.me">회원정보수정</a></li>
			<li onclick="alert('준비중인 서비스 입니다.');" style="cursor: pointer;">회원등급</li>
			<li onclick="alert('준비중인 서비스 입니다.');" style="cursor: pointer;">쿠폰</li>
			<li onclick="alert('준비중인 서비스 입니다.');" style="cursor: pointer;">포인트</li>
		</ul>
		
		<ul style="padding-top: 12px;">
			<li onclick="alert('준비중인 서비스 입니다.');" style="cursor: pointer;" id="f_li">고객센터</li>
			<li><a href="${pageContext.request.contextPath}/memberQnAList.qu">1:1문의내역</a></li>
			<li onclick="alert('준비중인 서비스 입니다.');" style="cursor: pointer;">공지사항</li>
			<li onclick="alert('준비중인 서비스 입니다.');" style="cursor: pointer;">고객의 소리</li>
		</ul>
	</div>

	<div class="right">
		<div class="rates" >	
			<div class="rate">
				<div class="temp">
					<span>회원등급</span>
						<div class="a" style="margin-top: 25px;">
							<div class="grade" >
							${membership }
							</div>
							<div class="ext">
							등급혜택 살펴보기
							</div>
						</div>	
				</div>
			</div>
			<div class="point">
				<div class="temp">
					<span>사용가능한 쿠폰</span>
						<div class="a" style="margin-top: 30px;">
							<div class="grade" >
							27
							</div>
						</div>	
				</div>
			</div>		
			<div class="point">
				<div class="temp">
					<span >포인트</span>
						<div class="a" style="margin-top: 30px;">
							<div class="grade">
								530
							</div>
						</div>	
				</div>
			</div>
		</div>
	<div class="ordercontent">
		<c:if test="${infofile eq 'allorder'}">
			<jsp:include page="/member/memberAllOrderCheckForm.jsp"></jsp:include>
		</c:if>
		<c:if test="${infofile eq 'myinfo'}">
			<jsp:include page="/member/myInfo.jsp"></jsp:include>
		</c:if>
		<c:if test="${infofile eq 'QnAList'}">
			<jsp:include page="/member/memberQnAList.jsp"></jsp:include>
		</c:if>
		<c:if test="${infofile eq 'QnAForm'}">
			<jsp:include page="/member/memberQnAForm.jsp"></jsp:include>
		</c:if>
		<c:if test="${infofile eq null }">		
		<div class="table_ti" >
				<span style="font-size: 24px; font-weight: 500;">최근 주문내역</span>
				<div class="more_icon"><a href="${pageContext.request.contextPath}/allorderlist.or"><img src="${pageContext.request.contextPath}/img/icon/more.svg"></a></div>
			</div>
			<table>
				<tr style="text-align: center; height:30px; border-bottom: 1px solid black; ">
					<td>주문일</td>
					<td colspan='2'>주문내역</td>
					<td>주문번호</td>
					<td>결제금액</td>
				</tr>
			
				<c:if test="${fn:length(orderList) <= 0}">
				<tr>
				<td colspan="5" style="text-align: center; height:50px; border-bottom: 1px solid black;">구매목록이 없습니다.</td>
				</tr>
				</c:if>
			<c:forEach var="orderlist" items="${orderList }">
				<tr style="border-bottom : 1px solid black; text-align: center; height:55px;">
					<td>${orderlist.order_date }</td>
					<td class="imgtd"><div class="tb_img" style="margin-left: 30px;"><img src="${pageContext.request.contextPath}/gongu/images/${orderlist.gongu_thimg }" style="width:52px; height:52px;"></div></td>
				<td style="text-align:left;">${orderlist.gongu_name }</td>
					<td>ORDERNUM-00${orderlist.order_id }</td>
					<td>${orderlist.order_price }</td>
				</tr>
				</c:forEach>
			</table>
			</c:if>
		
		</div>
		</div>
		</div>

</body>
</html>