package com.dmt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dmt.bean.AdminBean;
import com.dmt.bean.DienThoaiBean;
import com.dmt.bean.LoaiBean;
import com.dmt.bo.AdminBo;
import com.dmt.bo.DienThoaiBo;
import com.dmt.bo.LoaiBo;
import com.dmt.utills.VerifyUtils;

@Controller
public class AdminController {
	@Autowired
	DienThoaiBo dbo;
	@Autowired
	LoaiBo lbo;

	@RequestMapping(value = "/Admin", method = RequestMethod.GET)
	public String dangNhapAdmin() {
		return "Admin";
	}

	@RequestMapping(value = "/Admin", method = RequestMethod.POST)
	public String kiemtra(HttpServletRequest request, HttpSession session) {
		try {
			Boolean valid = true;
			String username = request.getParameter("username");
			String password = request.getParameter("pwd");
			if (username != null && password != null) {
				AdminBo bo = new AdminBo();
				AdminBean kh = bo.ktdn(username, password);
				if (kh != null) {
					String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
					System.out.println("gRecaptchaResponse" + gRecaptchaResponse);
					// Verify CAPTCHA.
					valid = VerifyUtils.verify(gRecaptchaResponse);
					if (valid == true) {
						System.out.println("Ä�Ã£ vÃ o Ä‘Ã¢y");
						session.setAttribute("admin", kh);
						return "redirect:QuanLyPhone";
					} else {
						request.setAttribute("SaiCapcha", "1");
					}
				} else {
					request.setAttribute("saidangnhap", "1");
				}
			}

			return "Admin";
		} catch (Exception e) {
			return null;
		}

	}

	@RequestMapping(value = "/QuanLyPhone", method = RequestMethod.GET)
	public String GetSach(HttpServletRequest request, HttpSession session) {

		try {
			List<LoaiBean> lbean = lbo.getAllusers();
			System.out.println(lbean.size());
			List<DienThoaiBean> dbean = dbo.getPhone();
			String loaidth = request.getParameter("txtloai");
			String timkiem = request.getParameter("tkttk");
			request.setAttribute("loai", lbean);
			if (loaidth == null && timkiem == null) {
				request.setAttribute("tensach", dbean);
			} else if (loaidth != null && timkiem == null) {
				dbean = dbo.getDienThoai(loaidth);
				request.setAttribute("tensach", dbean);
			} else if (loaidth == null && timkiem != null) {
				dbean = dbo.getTimKiem(timkiem);
				request.setAttribute("tensach", dbean);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return "HomeAdmin";
	}

	@RequestMapping(value = "/HomeAdmin", method = RequestMethod.GET)
	public String HomeAdmin() {
		return "HomeAdmin";
	}
}
