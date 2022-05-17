/*
*author TuanDM21
*date 2000-12-16
*Version 1.0
*/
package com.dmt.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ListGmailDao {
	public List<String> getGmailDao() throws Exception {
		List<String> ds = new ArrayList<String>();
		DungChung dc = new DungChung();
		dc.KetNoi();
		PreparedStatement ps = dc.cn.prepareStatement("select tendn from KhachHang");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			String s = rs.getString("tendn");
			ds.add(s);
		}
		return ds;

	}
}
