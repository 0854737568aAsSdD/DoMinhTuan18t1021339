package com.dmt.bo;

import com.dmt.dao.HoaDonDao;

public class HoaDonBo {
	HoaDonDao hddao = new HoaDonDao();

	public void getHoaDon(int makh, String name, String phone, String diachi,int SoTien) throws Exception {
		hddao.getHoaDon(makh, name, phone, diachi,SoTien);
	}
}
