package com.dmt.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dmt.bean.LoaiBean;
import com.dmt.bo.AddSachBo;
import com.dmt.bo.LoaiBo;

@Controller
public class HandleAdminController {
	@Autowired
	LoaiBo lbo;

	@RequestMapping("/AdminAdd")
	public String themSach(HttpServletRequest request) {
		List<LoaiBean> lbean = lbo.getAllusers();
		request.setAttribute("loai", lbean);
		return "ThemSachDuTru";
	}

	@RequestMapping("/AddOneBookController")
	public String voidshow(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<LoaiBean> lbean = lbo.getAllusers();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String nameimg = null, tendienthoai = null, manhinh = null;
		String urlimage = null, madienthoai = null, loai = null, hedieuhanh = null, cpu = null;
		String camerasau = null, cameratruoc = null, ram = null, bonhotrong = null;
		int gia = 0;
		DiskFileItemFactory factory = new DiskFileItemFactory();
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		String dirUrl1 = request.getServletContext().getRealPath("") + File.separator + "files";
		response.getWriter().println(dirUrl1);
		System.out.println(dirUrl1);
		try {
			List<FileItem> fileItems = upload.parseRequest(request);// Láº¥y vá»� cÃ¡c Ä‘á»‘i tÆ°á»£ng gá»­i lÃªn
			// duyá»‡t qua cÃ¡c Ä‘á»‘i tÆ°á»£ng gá»­i lÃªn tá»« client gá»“m file vÃ  cÃ¡c
			// control
			for (FileItem fileItem : fileItems) {
				if (!fileItem.isFormField()) {// Náº¿u ko pháº£i cÃ¡c control=>upfile lÃªn
					// xá»­ lÃ½ file
					nameimg = fileItem.getName();
					if (!nameimg.equals("")) {
						// Láº¥y Ä‘Æ°á»�ng dáº«n hiá»‡n táº¡i, chá»§ Ã½ xá»­ lÃ½ trÃªn dirUrl Ä‘á»ƒ cÃ³
						// Ä‘Æ°á»�ng dáº«n Ä‘Ãºng
						String dirUrl = request.getServletContext().getRealPath("") + File.separator + "hinh";
						File dir = new File(dirUrl);
						if (!dir.exists()) {// náº¿u ko cÃ³ thÆ° má»¥c thÃ¬ táº¡o ra
							dir.mkdir();
						}
						String fileImg = dirUrl + File.separator + nameimg;
						File file = new File(fileImg);// táº¡o file
						try {
							fileItem.write(file);// lÆ°u file
							System.out.println("UPLOAD THÃ€NH CÃ”NG...!");
							System.out.println("Ä�Æ°á»�ng dáº«n lÆ°u file lÃ : " + dirUrl);
							request.setAttribute("memay1", dirUrl);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				} else// Neu la control
				{
					String tentk = fileItem.getFieldName();
					if (tentk.equals("txtmadienthoai")) {
						madienthoai = fileItem.getString("utf-8");
					}
					if (tentk.equals("txttendienthoai")) {
						tendienthoai = fileItem.getString("utf-8");
					}
					if (tentk.equals("txtgia")) {
						gia = Integer.parseInt(fileItem.getString());
					}
					if (tentk.equals("txtloai")) {
						loai = fileItem.getString("utf-8");
					}
					if (tentk.equals("txthedieuhanh")) {
						hedieuhanh = fileItem.getString("utf-8");
					}
					if (tentk.equals("txtcpu")) {
						cpu = fileItem.getString("utf-8");
					}
					if (tentk.equals("txtmanhinh")) {
						manhinh = fileItem.getString("utf-8");
					}
					if (tentk.equals("txtram")) {
						ram = fileItem.getString("utf-8");
					}
					if (tentk.equals("txtcamerasau")) {
						camerasau = fileItem.getString("utf-8");
					}
					if (tentk.equals("txtcameratruoc")) {
						cameratruoc = fileItem.getString("utf-8");
					}
					if (tentk.equals("txtbonhotrong")) {
						bonhotrong = fileItem.getString("utf-8");
					}

				}

			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

		urlimage = "hinh/" + nameimg;
		AddSachBo bo = new AddSachBo();
		try {
			List<String> ds = bo.ListPhone();
			for (int i = 0; i < ds.size(); i++) {
				if (madienthoai.equals(ds.get(i))) {
					request.setAttribute("error", "Duplicate madienthoai");
					request.setAttribute("madienthoai", madienthoai);
					request.setAttribute("loai", lbean);
					request.setAttribute("tendienthoai", tendienthoai);
					request.setAttribute("manhinh", manhinh);
					request.setAttribute("gia", gia);
					request.setAttribute("hedieuhanh", hedieuhanh);
					request.setAttribute("camerasau", camerasau);
					request.setAttribute("cameratruoc", cameratruoc);
					request.setAttribute("ram", ram);
					request.setAttribute("bonhotrong", bonhotrong);
					request.setAttribute("cpu", cpu);
					return "ThemSachDuTru";
				}
			}
			bo.themdienthoai(madienthoai, tendienthoai, manhinh, gia, hedieuhanh, loai, cpu, urlimage, camerasau,
					cameratruoc, ram, bonhotrong);
			request.setAttribute("them", "them");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "HomeAdmin";
	}
}