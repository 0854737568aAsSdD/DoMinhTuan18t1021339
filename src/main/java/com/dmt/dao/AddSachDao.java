package com.dmt.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AddSachDao {
	public void themdienthoai(String madienthoai, String tendienthoai, String manhinh, int gia, String hedieuhanh,
			String loai, String cpu, String urlimage, String camerasau, String cameratruoc, String ram,
			String bonhotrong) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "insert into DienThoai(madienthoai,tendienthoai,gia,manhinh,hedieuhanh,maloai,anh,cpu,camerasau,cameratruoc,ram,bonhotrong)"
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?)";
		System.out.print(sql);
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, madienthoai);
		cmd.setString(2, tendienthoai);
		cmd.setInt(3, gia);
		cmd.setString(4, manhinh);
		cmd.setString(5, hedieuhanh);
		cmd.setString(6, loai);
		cmd.setString(7, urlimage);
		cmd.setString(8, cpu);
		cmd.setString(9, camerasau);
		cmd.setString(10, cameratruoc);
		cmd.setString(11, ram);
		cmd.setString(12, bonhotrong);
		cmd.executeUpdate();
		cmd.close();
		dc.cn.close();
	}

	public void suadienthoai(String madienthoai, String tendienthoai, String manhinh, int gia, String hedieuhanh,
			String loai, String cpu, String urlimage, String camerasau, String cameratruoc, String ram,
			String bonhotrong) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
//		String sql = "update DienThoai\r\n" + "	set tendienthoai = ?\r\n" + "	,manhinh = ?\r\n" + "	,gia = ?\r\n"
//				+ "	, hedieuhanh = ?\r\n" + "	, maloai = ?\r\n" + "	, cpu = ?\r\n" + "	, anh = ?\r\n"
//				+ "	, camerasau = ?\r\n" + "	, cameratruoc = ?\r\n" + "	, ram = ?\r\n" + "	, bonhotrong = ?\r\n"
//				+ " where madienthoai = ?";
		String sql = "update DienThoai set tendienthoai = ?, manhinh = ?, gia = ?, hedieuhanh = ? , maloai = ?, cpu = ?, anh = ? , camerasau = ?, cameratruoc = ?, ram = ?, bonhotrong = ? where madienthoai = ? ";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, tendienthoai);
		cmd.setString(2, manhinh);
		cmd.setInt(3, gia);
		cmd.setString(4, hedieuhanh);
		cmd.setString(5, loai);
		cmd.setString(6, cpu);
		cmd.setString(7, urlimage);
		cmd.setString(8, camerasau);
		cmd.setString(9, cameratruoc);
		cmd.setString(10, ram);
		cmd.setString(11, bonhotrong);
		cmd.setString(12, madienthoai);
		cmd.executeUpdate();
		cmd.close();
		dc.cn.close();
	}

	public void DeleteSach(String madienthoai) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "delete from DienThoai where madienthoai=?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, madienthoai);
		cmd.executeUpdate();
		cmd.close();
		dc.cn.close();
	}

	public List<String> ListPhone() throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		List<String> ds = new ArrayList<String>();
		String sql = "select madienthoai from DienThoai";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			String s = rs.getString("madienthoai");
			ds.add(s);
		}
		cmd.close();
		dc.cn.close();
		return ds;
	}

}
