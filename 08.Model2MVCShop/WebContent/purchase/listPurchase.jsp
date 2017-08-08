<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">


<script type="text/javascript">
function fncGetUserList(currentPage){
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/purchase/listPurchase" method="post">
<input type="hidden" name="prodNo" value ="${purchase.purchaseProd.prodNo}">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${resultPage.totalCount }�Ǽ�, ���� ${resultPage.currentPage } ������</td> 
	</tr>
	<tr>
		<td class="ct_list_b" width="100">�ֹ���ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">�޴� ��� </td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b"width="150">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b"width="150">��������</td>
	</tr>
	
	<c:set var="i" value="0"/>
		<c:forEach var="purchase" items="${list }">
		<c:set var="i" value="${i+1 }"/>
		
	<tr class="ct_list_pop">
		<td align="center">
		<a href="/purchase/getPurchase?tranNo=${purchase.tranNo }&prodNo=${purchase.purchaseProd.prodNo}">${purchase.tranNo }
		</a>
		
		</td>
		<td></td>
		<td align="left">
		${purchase.purchaseProd.prodName }
		</td>
		<td></td>
		<td align="left">	${purchase.receiverName}</td>
		<td></td>
		<td align="left">${ purchase.receiverPhone }</td>
		<td></td>
		<td align="left">
		<c:if test="${purchase.tranCode.trim() == '1'}">���ſϷ�</c:if>
		<c:if test="${purchase.tranCode.trim() == '2'}"> ����� </c:if>
		<c:if test="${purchase.tranCode.trim() == '2'}"><a href="/purchase/updateTranCodeByProd?prodNo=${purchase.purchaseProd.prodNo}&tranCode=${purchase.tranCode.trim()}&menu=purchase">(���ǵ���)</a></c:if>
		<c:if test="${purchase.tranCode.trim() == '3'}">��ۿϷ�</c:if>
		</td>
		<td></td>
		<td align="left"><c:if test="${purchase.tranCode.trim() == '1'}"><a href="/purchase/updatePurchaseView?prodNo=${purchase.purchaseProd.prodNo}&tranNo=${purchase.tranNo}" >�����ϱ�</a></c:if>
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	
		</c:forEach>
	
	
	
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">

    		<input type="hidden" id="currentPage" name="currentPage" value=""/>
    		 <jsp:include page="../common/pageNavigator.jsp"/>	
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>