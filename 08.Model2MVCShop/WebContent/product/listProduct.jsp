<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%-- <%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>

<%@ page import="com.model2.mvc.common.Page"%>
<%@ page import="com.model2.mvc.service.domain.Product"%>
<%@ page import="com.model2.mvc.common.Search"%>
<%
	System.out.println("listProduct.jsp");
	Page resultPage = (Page) request.getAttribute("resultPage");
	Search search = (Search) request.getAttribute("search");

	List<Product> list = (ArrayList<Product>) request.getAttribute("list");
	/* 	Map<String,Object> map=(HashMap<String,Object>)request.getAttribute("map");
	Search search=(Search)request.getAttribute("search");
	
	
	int total=0;
	List<Product> list=null;
	if(map != null){ 
		total=((Integer)map.get("count")).intValue();
		list=(ArrayList<Product>)map.get("list");
		
		
	}
	int currentPage=search.getPage();
	
		int totalPage = 0;
		if(total>0){
			totalPage = total/search.getPageUnit();
			if(total%search.getPageUnit() > 0){
				totalPage += 1;
			}
		}
		
		
		 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 --%>
	<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncGetUserList(currentPage){
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/product/listProduct" method="post">
<input name="menu" value="search" type="hidden"/>
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					
							��ǰ �����ȸ 
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
		
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
		
			</select>
			<input type="text" name="searchKeyword" 
						value="${! empty search.searchKeyword ? search.searchKeyword : ""   }"  
						class="ct_input_g" style="width:200px; height:20px" > 
		</td>
		
	<%-- 	<% if(search.getSearchCondition() != null){ %>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
			<% if(search.getSearchCondition().equals("0") || search.getSearchCondition().equals("null")) {%>
				<option value="0" selected="selected">��ǰ��ȣ</option>
				<option value="1">��ǰ��</option>
				<option value="2">��ǰ����</option>
			<%

			}else if(search.getSearchCondition().equals("1")) { %>
				<option value="0">��ǰ��ȣ</option>
				<option value="1"  selected="selected" >��ǰ��</option>
				<option value="2" >��ǰ����</option>
				<%}else if(search.getSearchCondition().equals("2")){ %>
				<option value="0">��ǰ��ȣ</option>
				<option value="1">��ǰ��</option>
				<option value="2"  selected="selected">��ǰ����</option>
				<%} %>
			</select>
			<% if(search.getSearchCondition().equals("2") || search.getSearchCondition().equals("1")||search.getSearchCondition().equals("0")) {%>
			<input type="text" name="searchKeyword"   value = "<%= search.getSearchKeyword() %>" class="ct_input_g" style="width:200px; height:19px" />
			<%} else{%>
			
				<input type="text" name="searchKeyword"   value = "" class="ct_input_g" style="width:200px; height:19px" />
			
			<%} %>
		</td>
	<% } else { %>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
			<option value="0">��ǰ��ȣ</option>
				<option value="1">��ǰ��</option>
				<option value="2">��ǰ����</option>
				</select>
				<input type="text" name="searchKeyword"  class="ct_input_g" style="width:200px; height:19px" />
		</td>		
		<%
		}
	%> --%>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetUserList('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >��ü ${resultPage.totalCount }�Ǽ�, ���� ${resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
<%-- 	<% int no = list.size();
		for(int i = 0; i<list.size(); i++){
			Product  product = (Product)list.get(i);
			
			
			request.setAttribute("product", product);
			
			System.out.println("product ::::: "+ product);
			
	%>
	<tr class="ct_list_pop">
	<td align="center"><%=no-- %></td>
	<td></td>
	<td align="left">

		<a href="/getProduct.do?prodNo=<%= product.getProdNo()%>&menu=search"><%= product.getProdName() %></a>

		</td>
		<td></td>
		<td align="left"> <%= product.getPrice()%>
		</td>
		<td></td>
		<td align="left"> <%= product.getRegDate()%>
		</td>
		<td></td>
		<td align="left"> �������
		</td>
		<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<%} 
	
	
	%>
		 --%>
		 
<c:set var="i" value="0"/>
<c:forEach var="product" items="${list }">
<c:set var="i" value="${i+1 }"/>

<tr class="ct_list_pop">
	<td align="center">${i }</td>
	<td></td>
	<td align="left">

	
		<c:if test="${ empty product.proTranCode }">	<a href="/product/getProduct?prodNo=${ product.prodNo}&menu=search">	${product.prodName} </a></c:if>
		<c:if test="${!empty product.proTranCode }">${product.prodName}</c:if>

		</td>
		<td></td>
		<td align="left"> ${product.price}
		</td>
		<td></td>
		<td align="left"> ${ product.regDate}
		</td>
		<td></td>
		<td align="left">
		
		
		<c:if test="${empty product.proTranCode}">�Ǹ���</c:if>
		<c:if test="${ ! empty product.proTranCode}">�ǸſϷ�</c:if>
		
		</td>
		<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	

</c:forEach>		 
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
	<%-- 	<%
		/* 	int totalPage1 = 0;
			int startPage = 0;
			int endPage = 0;
			int unitPage = 5;
			
			

			
			
			if(totalPage>0){
				totalPage1 = currentPage/unitPage;
				if(currentPage%unitPage > 0){
					totalPage1 += 1;
				}
			}

			startPage = unitPage*totalPage1-(unitPage-1);
			
			endPage = unitPage*totalPage1;
			
			
			startPage = totalPage1*unitPage -(unitPage-1);
			endPage = totalPage1*unitPage;
			
			
			 if(endPage>totalPage){
				 endPage = totalPage;
			 }
			  */
			 if(resultPage.getBeginUnitPage() > resultPage.getPageUnit()){%>
				 <a href="/listProduct.do?currentPage=<%= resultPage.getBeginUnitPage()-1%>&searchCondition=<%= search.getSearchCondition() %>&searchKeyword=<%= search.getSearchKeyword()%>&menu=search"> �� pre</a>
					<%} %>		
		<%
			for(int i=resultPage.getBeginUnitPage();i<=resultPage.getEndUnitPage();i++){
		%>
			<a href="/listProduct.do?currentPage=<%= i%>&searchCondition=<%= search.getSearchCondition() %>&searchKeyword=<%= search.getSearchKeyword()%>&menu=search"><%=i %></a>
		<%
			}
		if(resultPage.getEndUnitPage() < resultPage.getMaxPage()){		
		%>	
		<a href="/listProduct.do?currentPage=<%= resultPage.getEndUnitPage()+1%>&searchCondition=<%= search.getSearchCondition() %>&searchKeyword=<%= search.getSearchKeyword()%>&menu=search"> next ��</a>
		<%} 
		
		%>
    		 --%>
    		   <input type="hidden" id="currentPage" name="currentPage" value="1"/>
    		 <jsp:include page="../common/pageNavigator.jsp"/>	
    	</td>
	</tr>
</table>


<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
