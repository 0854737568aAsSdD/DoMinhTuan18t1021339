package com.dmt.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dmt.bean.GioHangBean;
import com.dmt.bean.KhachHangBean;
import com.dmt.bo.ChiTietHoaDonBo;
import com.dmt.bo.HoaDonBo;

@Controller
public class DatMuaHangController {
	@Autowired
	MailSender mailSender;

	@RequestMapping("/Address")
	public String diaChiGiaoHang(HttpServletRequest request, String diachigiaohang) {
		String sotien = request.getParameter("Sotien");
		System.out.println("SoTien la " + sotien);
		request.setAttribute("sotien", sotien);
		return "Address";
	}

	@RequestMapping(value = "/DatMuaHangController", method = RequestMethod.POST)
	public String datMua(HttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String name = request.getParameter("hovaten");
		String phone = request.getParameter("sodienthoai");
		String address = request.getParameter("diachigiaohang");
		String sotien = request.getParameter("sotien");
		String email = request.getParameter("email");
		String text1 = request.getParameter("text0");
		String text2 = request.getParameter("text1");
		String text3 = request.getParameter("text2");
		String text4 = request.getParameter("text3");
		String subject = request.getParameter("subject");

		int money = Integer.parseInt(sotien);
		System.out.println(name + phone + address + sotien + email);
		HoaDonBo hdBo = new HoaDonBo();
		ChiTietHoaDonBo chitietbo = new ChiTietHoaDonBo();
		KhachHangBean kh = (KhachHangBean) session.getAttribute("khachhang");
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("minhtuandeptrai05@gmail.com");
		message.setTo(email);
		message.setSubject(subject);
		message.setText(text1 + address + text2 + name + text3 + sotien + text4);
		mailSender.send(message);
		if (kh == null) {
			request.setAttribute("xacnhan", "xacnhan");
		} else {
			try {
				hdBo.getHoaDon(kh.getMakh(), name, phone, address, money);
				ArrayList<GioHangBean> ghbean = (ArrayList<GioHangBean>) session.getAttribute("giohang");
				chitietbo.getChiTietHoaDon(ghbean);
				session.setAttribute("giohang", null);
				request.setAttribute("kiemtra", "kiemtra");
				System.out.println("Đã kiểm tra");
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return "Cart";
	}
}
