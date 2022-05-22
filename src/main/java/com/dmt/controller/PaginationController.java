/*
*author TuanDM21
*date 2000-12-16
*Version 1.0
*/
package com.dmt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.dmt.bean.DienThoaiBean;
import com.dmt.bo.PaginationBo;

@Controller
public class PaginationController {
	@RequestMapping("/Pagination")
	public String voidPagination(HttpServletRequest request) {
		PaginationBo bo = new PaginationBo();
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		try {
			List<DienThoaiBean> ds = bo.getPagination(Integer.parseInt(start), Integer.parseInt(end));
			request.setAttribute("phone", ds);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "Product";
	}
}
