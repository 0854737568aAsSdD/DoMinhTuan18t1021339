package com.dmt.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dmt.bean.KhachHangBean;
import com.dmt.bean.PhanHoiBean;
import com.dmt.bo.AdminPhanHoiBo;
import com.dmt.bo.PhanHoiBo;

@Controller
public class PhanHoiController {
	@RequestMapping(value = "/PhanHoi", method = RequestMethod.GET)
	public String voidshow(HttpServletRequest request) {
		return "PhanHoi";

	}

	@RequestMapping(value = "/PhanHoi", method = RequestMethod.POST)
	public String voidshow123(HttpServletRequest request, HttpSession se, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String phanhoi = request.getParameter("phanhoi");
			System.out.println(phanhoi);
			KhachHangBean kh = (KhachHangBean) se.getAttribute("khachhang");
			System.out.println(kh.getMakh());
			PhanHoiBo bo = new PhanHoiBo();
			if (kh != null) {
				request.setAttribute("daphanhoi", "123");
				request.setAttribute("phanhoi", "123");
				bo.themloinhan(phanhoi, kh.getMakh());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "PhanHoi";
	}

	@RequestMapping(value = "/QuanLyPhanHoi", method = RequestMethod.GET)
	public String voidshow123456(HttpServletRequest request) {
		PhanHoiBo bo = new PhanHoiBo();
		try {
			ArrayList<PhanHoiBean> ds = bo.showloinhanadmin1();
			request.setAttribute("phanhoi", ds);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "QuanLyPhanHoi";
	}

	@RequestMapping(value = "/AdminPhanHoi", method = RequestMethod.GET)
	public String phanhoi(HttpServletRequest request, HttpSession se, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		String maphanhoi = request.getParameter("maphanhoi");
		String tenkhachhang = request.getParameter("tenkhachhang");
		String noidung = request.getParameter("noidung");
		System.out.println(tenkhachhang);
		System.out.println(noidung);
		request.setAttribute("maphanhoi", maphanhoi);
		request.setAttribute("tenkhachhang", tenkhachhang);
		request.setAttribute("noidung", noidung);
		return "LoiNhan";
	}

	@RequestMapping(value = "/AdminPhanHoi", method = RequestMethod.POST)
	public String phanhoi123(HttpServletRequest request, HttpSession se, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		AdminPhanHoiBo bo = new AdminPhanHoiBo();
		PhanHoiBo phbo = new PhanHoiBo();
		try {
			String maphanhoi = request.getParameter("maphanhoi");
			int ma = Integer.parseInt(maphanhoi);
			String loinhan = request.getParameter("phanhoi");
			bo.AdminPhanHoi(ma, loinhan);
			ArrayList<PhanHoiBean> ds = phbo.showloinhanadmin1();
			request.setAttribute("phanhoi", ds);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "QuanLyPhanHoi";
	}

	@RequestMapping(value = "/tinnhan", method = RequestMethod.GET)
	public String voidshow1234563434(HttpServletRequest request, HttpSession session) {
		KhachHangBean kh = (KhachHangBean) session.getAttribute("khachhang");
		PhanHoiBo bo = new PhanHoiBo();
		int makh = 0;
		if (kh == null) {
			request.setAttribute("Login", "1");
			return "TinNhan";
		} else {
			makh = kh.getMakh();
		}
		try {
			ArrayList<PhanHoiBean> ds = bo.showloinhanadmin(makh);
			request.setAttribute("phanhoi", ds);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "TinNhan";
	}

}
