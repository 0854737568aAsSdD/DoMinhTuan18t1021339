/*
*author TuanDM21
*date 2000-12-16
*Version 1.0
*/
package com.dmt.bo;

import java.util.List;

import com.dmt.dao.ListGmailDao;

public class ListGmailBo {
	ListGmailDao dao = new ListGmailDao();

	public List<String> getGmailDao() throws Exception {
		return dao.getGmailDao();
	}

}
