/*
*author TuanDM21
*date 2000-12-16
*Version 1.0
*/
package com.dmt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dmt.bo.ThongKeBo;

@Controller
public class ThongKeController {
	@RequestMapping("/QuanLyThongKe")
	public String voidThongKe(Model model) {

		ThongKeBo bo = new ThongKeBo();
		try {
			int arr[] = bo.getSoTien();
			model.addAttribute("sotien", arr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "QuanLyThongKe";
	}
}
