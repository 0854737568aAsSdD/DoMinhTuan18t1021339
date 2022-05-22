/*
*author TuanDM21
*date 2000-12-16
*Version 1.0
*/
package com.dmt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductDetail {
	@RequestMapping("/ProductDetail")
	public String voidProductDetail(HttpServletRequest request) {
		String makhachhang = request.getParameter("makh");
		String tendienthoai = request.getParameter("tendienthoai");
		String gia = request.getParameter("gia");
		String anh = request.getParameter("anh");
		String madienthoai = request.getParameter("madienthoai");
		String manhinh = request.getParameter("manhinh");
		String hedieuhanh = request.getParameter("hedieuhanh");
		String camerasau = request.getParameter("camerasau");
		String cameratruoc = request.getParameter("cameratruoc");
		String cpu = request.getParameter("cpu");
		String ram = request.getParameter("ram");
		String bonhotrong = request.getParameter("bonhotrong");
		request.setAttribute("tendienthoai", tendienthoai);
		request.setAttribute("makhachhang", makhachhang);
		request.setAttribute("gia", gia);
		request.setAttribute("anh", anh);
		request.setAttribute("madienthoai", madienthoai);
		request.setAttribute("manhinh", manhinh);
		request.setAttribute("camerasau", camerasau);
		request.setAttribute("cameratruoc", cameratruoc);
		request.setAttribute("cpu", cpu);
		request.setAttribute("ram", ram);
		request.setAttribute("bonhotrong", bonhotrong);
		request.setAttribute("hedieuhanh", hedieuhanh);
		return "ProductDetail";
	}
}
