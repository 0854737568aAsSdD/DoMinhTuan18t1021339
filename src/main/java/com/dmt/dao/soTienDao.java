/*
*author TuanDM21
*date 2000-12-16
*Version 1.0
*/
package com.dmt.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class soTienDao {
	public int[] getSoTien() throws Exception {
		int[] arrSoTien = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "select Month(NgayMua) as NgayMua,SUM(SoTien) as SoTien \r\n" + "from HoaDon\r\n"
				+ "group by Month(NgayMua)";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			int i = 0;
			switch (rs.getString("NgayMua")) {
			case "1":
				arrSoTien[0] = Integer.parseInt(rs.getString("SoTien"));
				break;
			case "2":
				arrSoTien[1] = Integer.parseInt(rs.getString("SoTien"));
				break;
			case "3":
				arrSoTien[2] = Integer.parseInt(rs.getString("SoTien"));
				break;
			case "4":
				arrSoTien[3] = Integer.parseInt(rs.getString("SoTien"));
				break;
			case "5":
				arrSoTien[4] = Integer.parseInt(rs.getString("SoTien"));
				break;
			case "6":
				arrSoTien[5] = Integer.parseInt(rs.getString("SoTien"));
				break;
			case "7":
				arrSoTien[6] = Integer.parseInt(rs.getString("SoTien"));
				break;
			case "8":
				arrSoTien[7] = Integer.parseInt(rs.getString("SoTien"));
				break;
			case "9":
				arrSoTien[8] = Integer.parseInt(rs.getString("SoTien"));
				break;
			case "10":
				arrSoTien[9] = Integer.parseInt(rs.getString("SoTien"));
				break;
			case "11":
				arrSoTien[10] = Integer.parseInt(rs.getString("SoTien"));
				break;
			case "12":
				arrSoTien[11] = Integer.parseInt(rs.getString("SoTien"));
				i++;
				break;
			default:
				break;
			}

		}
		return arrSoTien;
	}
}
