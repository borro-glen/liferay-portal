<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/html/taglib/init.jsp" %>

<%
boolean collapsible = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:panel:collapsible"));
String cssClass = GetterUtil.getString((String)request.getAttribute("liferay-ui:panel:cssClass"));
String defaultState = (String)request.getAttribute("liferay-ui:panel:defaultState");
boolean extended = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:panel:extended"));
String helpMessage = (String)request.getAttribute("liferay-ui:panel:helpMessage");
String id = (String)request.getAttribute("liferay-ui:panel:id");
String parentId = (String)request.getAttribute("liferay-ui:panel:parentId");
boolean persistState = GetterUtil.getBoolean((String)request.getAttribute("liferay-ui:panel:persistState"));
String title = (String)request.getAttribute("liferay-ui:panel:title");

IntegerWrapper panelCount = (IntegerWrapper)request.getAttribute("liferay-ui:panel-container:panelCount" + parentId);

if (panelCount != null) {
	panelCount.increment();

	Boolean panelContainerExtended = (Boolean)request.getAttribute("liferay-ui:panel-container:extended");

	if (panelContainerExtended != null) {
		extended = panelContainerExtended.booleanValue();
	}
}

if (extended) {
	cssClass += " lfr-panel-extended";
}

String contentCssClass = StringPool.BLANK;
String headerCssClass = StringPool.BLANK;
String panelState = GetterUtil.getString(SessionClicks.get(request, id, null), defaultState);

if (collapsible) {
	contentCssClass += "toggler-content";
	headerCssClass += "toggler-header";
}

if (panelState.equals("open")) {
	contentCssClass += " toggler-content-expanded";
	headerCssClass += " toggler-header-expanded";
}
else {
	contentCssClass += " toggler-content-collapsed";
	headerCssClass += " toggler-header-collapsed";
}
%>