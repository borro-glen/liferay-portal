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

package com.liferay.portalweb.portlet.blogs.blogsentry.searchblogsentryscopecurrentpage;

import com.liferay.portalweb.portal.BaseTestCase;
import com.liferay.portalweb.portal.util.RuntimeVariables;

/**
 * @author Brian Wing Shun Chan
 */
public class SearchBlogsEntry1QuotesScopeCurrentPage1Test extends BaseTestCase {
	public void testSearchBlogsEntry1QuotesScopeCurrentPage1()
		throws Exception {
		selenium.selectWindow("null");
		selenium.selectFrame("relative=top");
		selenium.open("/web/guest/home/");
		selenium.clickAt("link=Blogs Test Page1",
			RuntimeVariables.replace("Blogs Test Page1"));
		selenium.waitForPageToLoad("30000");
		selenium.type("//input[@title='Search Entries']",
			RuntimeVariables.replace("\"Blogs Entry1 Title\""));
		selenium.clickAt("//input[@value='Search']",
			RuntimeVariables.replace("Search"));
		selenium.waitForPageToLoad("30000");
		assertEquals(RuntimeVariables.replace("Blogs Entry1 Title"),
			selenium.getText("//span[@class='entry-title']"));
		assertEquals(RuntimeVariables.replace("Showing 1 - 1."),
			selenium.getText("//div[@class='search-results']"));
		selenium.clickAt("//span[@class='entry-title']",
			RuntimeVariables.replace("Blogs Entry1 Title"));
		selenium.waitForPageToLoad("30000");
		assertEquals(RuntimeVariables.replace("Blogs (Blogs Test Page1)"),
			selenium.getText("//span[@class='portlet-title-text']"));
		assertEquals(RuntimeVariables.replace("Blogs Entry1 Title"),
			selenium.getText("//h1[@class='header-title']"));
		assertEquals(RuntimeVariables.replace("Blogs Entry1 Content"),
			selenium.getText("//div[@class='entry-body']/div"));
	}
}