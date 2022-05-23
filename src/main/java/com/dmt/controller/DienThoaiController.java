package com.dmt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dmt.bean.DienThoaiBean;
import com.dmt.bean.LoaiBean;
import com.dmt.bo.DienThoaiBo;
import com.dmt.bo.LoaiBo;
import com.dmt.bo.PaginationBo;

@Controller
public class DienThoaiController {
	@Autowired
	DienThoaiBo bo;
	@Autowired
	LoaiBo lbo;

	@RequestMapping(value = "phone", method = RequestMethod.GET)
	public String getAlluser(HttpServletRequest request) {
		PaginationBo pbo = new PaginationBo();
		String maloai = request.getParameter("maloai");
		String timkiem = request.getParameter("txtTimkiem");
		System.out.println(timkiem);
		List<DienThoaiBean> phone = new ArrayList<DienThoaiBean>();
		if (maloai != null & timkiem == null) {
			phone = bo.getDienThoai(maloai);
		} else if (maloai == null && timkiem != null) {
			phone = bo.getTimKiem(timkiem);
		} else {
			try {
				phone = pbo.getPagination(0, 5);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.setAttribute("phone", phone);
		request.setAttribute("soluong", phone.size());
		List<LoaiBean> loai = lbo.getAllusers();
		request.setAttribute("loai", loai);
		return "Product";
	}
}
