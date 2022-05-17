package com.dmt.dao;

import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class HoaDonDao {
	public void getHoaDon(int makh, String name, String phone, String address,int Sotien) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		Date date = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
		String sql = " insert into hoadon(makh,NgayMua,damua,Name,Phone,Address,SoTien) " + "values('" + makh + "','"
				+ ft.format(date) + "','" + 0 + "',N'" + name + "',N'" + phone + "',N'" + address + "',"+ "'" + Sotien + "'"+")";
		System.out.println(sql);
		PreparedStatement preparedStatement = dc.cn.prepareStatement(sql);
		int x = preparedStatement.executeUpdate();
	}

}
