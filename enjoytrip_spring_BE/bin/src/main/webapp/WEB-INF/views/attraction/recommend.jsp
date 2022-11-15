<?xml version="1.0" encoding="utf-8"?>
<%@ page language="java" contentType="application/xml; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<items>
	<c:forEach varStatus="i" var="attraction" items="${attractions}">
		<item>
			<contentid>${attraction.contentId}</contentid>
			<contenttypeid>${attraction.contentTypeId}</contenttypeid>
			<contenttypename>${attraction.contentTypeName}</contenttypename>
			<addr1>${attraction.addr1}</addr1>
			<addr2>${attraction.addr2}</addr2>
			<tel>${attraction.tel}</tel>
			<firstimage>${attraction.firstImage}</firstimage>
			<readcount>${attraction.readCount}</readcount>
			<areacode>${attraction.areaCode}</areacode>
			<sigungucode>${attraction.sigunguCode}</sigungucode>
			<lattitude>${attraction.lattitude}</lattitude>
			<longitude>${attraction.longitude}</longitude>
			<title>${attraction.title}</title>
		</item>
	</c:forEach> 
</items>
