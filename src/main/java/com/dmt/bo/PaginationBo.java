/*
*author TuanDM21
*date 2000-12-16
*Version 1.0
*/
package com.dmt.bo;

import java.util.List;

import com.dmt.bean.DienThoaiBean;
import com.dmt.dao.PaginationDao;

public class PaginationBo {
	PaginationDao pd = new PaginationDao();

	public List<DienThoaiBean> getPagination(int start, int end) throws Exception {
		return pd.getPagination(start, end);
	}

}
