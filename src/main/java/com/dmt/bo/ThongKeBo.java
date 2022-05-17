/*
*author TuanDM21
*date 2000-12-16
*Version 1.0
*/
package com.dmt.bo;

import com.dmt.dao.soTienDao;

public class ThongKeBo {
	soTienDao sd = new soTienDao();

	public int[] getSoTien() throws Exception {
		return sd.getSoTien();
	}
}
