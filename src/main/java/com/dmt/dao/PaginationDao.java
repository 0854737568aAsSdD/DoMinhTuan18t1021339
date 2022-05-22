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

import com.dmt.bean.DienThoaiBean;

public class PaginationDao {
	public List<DienThoaiBean> getPagination(int start, int end) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		List<DienThoaiBean> ds = new ArrayList<DienThoaiBean>();
		String sql = "select * from DienThoai ORDER BY(SELECT NULL) OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		System.out.println(sql);
		ps.setInt(1, start);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			DienThoaiBean dth = new DienThoaiBean();
			dth.setManhinh(rs.getString(2));
			dth.setHedieuhanh(rs.getString(3));
			dth.setCamerasau(rs.getString(4));
			dth.setCameratruoc(rs.getString(5));
			dth.setCpu(rs.getString(6));
			dth.setRam(rs.getString(7));
			dth.setBonhotrong(rs.getString(8));
			dth.setThenho(rs.getString(9));
			dth.setThesim(rs.getString(10));
			dth.setDungluongpin(rs.getString(11));
			dth.setTendienthoai(rs.getString("tendienthoai"));
			dth.setAnh(rs.getString("anh"));
			dth.setGia(rs.getInt("gia"));
			dth.setMadienthoai(rs.getString("madienthoai"));
			ds.add(dth);
		}
		return ds;
	}
}
