<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
{
	"items" : [
				<c:forEach varStatus="i" var="sigungu" items="${sigungus}">
	 				{
	 				"areacode" : "${sigungu.areaCode}",
	 				"sigungucode" : "${sigungu.sigunguCode}",
	 				"sigunguname" : "${sigungu.sigunguName}"
	 				}
	 				<c:if test="${i.index != sigungus.size()-1}">
	 				,
	 				</c:if>
				</c:forEach>
				]
}