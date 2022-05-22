/*
*author TuanDM21
*date 2000-12-16
*Version 1.0
*/
package com.dmt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dmt.bean.KhachHangBean;
import com.dmt.bean.MyUserAccount;
import com.dmt.bo.KhachHangBo;
import com.dmt.dao.MyUserAccountDAO;
import com.dmt.form.MyUserAccountForm;
import com.dmt.utills.SecurityUtil;
import com.dmt.validator.MyUserAccountValidator;

@Controller
//Cần thiết để sử dụng RedirectAttributes
@EnableWebMvc
public class MainController {

	@Autowired
	private MyUserAccountDAO myUserAccountDAO;

	@Autowired
	private ConnectionFactoryLocator connectionFactoryLocator;

	@Autowired
	private UsersConnectionRepository connectionRepository;

	@Autowired
	private MyUserAccountValidator myUserAccountValidator;

// Set a form validator
	@InitBinder
	protected void initBinder(WebDataBinder dataBinder) {
		Object target = dataBinder.getTarget();
		if (target == null) {
			return;
		}
		System.out.println("Target=" + target);

		if (target.getClass() == MyUserAccountForm.class) {
			System.out.println("hehehe");
			dataBinder.setValidator(myUserAccountValidator);
		}
	}

	@RequestMapping(value = { "/abc" }, method = RequestMethod.GET)
	public String homePage(Model model) {
		try {
			UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			if (userDetails != null) {
				System.out.println(userDetails.getPassword());
				System.out.println(userDetails.getUsername());
				System.out.println(userDetails.isEnabled());
				System.out.println("Đã chạy vào đây");
				model.addAttribute("userDetails", userDetails);
			}
		} catch (Exception e) {
		}
		return "index";
	}

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String welcomePage(Model model) {

		return "LoginSocial";
	}

// Người dùng login bằng mạng xã hội,
// nhưng không cho phép ứng dụng xem các thông tin cơ bản
// ứng dụng sẽ chuyển hướng về trang /signin.
	@RequestMapping(value = { "/signin" }, method = RequestMethod.GET)
	public String signInPage(Model model, HttpSession session) throws Exception {
		KhachHangBo bo = new KhachHangBo();
		KhachHangBean kh = bo.ktdm("TuanNe@gmail.com", "123");
		session.setAttribute("khachhang", kh);
		return "About";
	}

	@RequestMapping(value = { "/signup" }, method = RequestMethod.GET)
	public String signupPage(WebRequest request, Model model) {

		ProviderSignInUtils providerSignInUtils //
				= new ProviderSignInUtils(connectionFactoryLocator, connectionRepository);
		// Nếu người dùng đăng nhập bằng mạng xã hội (Social),
		// Lấy ra thông tin mạng xã hội.
		Connection<?> connection = providerSignInUtils.getConnectionFromSession(request);

		//
		MyUserAccountForm myForm = null;
		//
		if (connection != null) {
			System.out.println("connection is not null");
			myForm = new MyUserAccountForm(connection);
		} else {
			System.out.println("connection is null");
			myForm = new MyUserAccountForm();
		}
		model.addAttribute("myForm", myForm);
		return "signup";
	}

	@RequestMapping(value = { "/signup" }, method = RequestMethod.POST)
	public String signupSave(WebRequest request, //
			Model model, //
			@ModelAttribute("myForm") @Validated MyUserAccountForm accountForm, //
			BindingResult result, //
			final RedirectAttributes redirectAttributes) {

		// Nếu validate có lỗi.
		if (result.hasErrors()) {
			return "signup";
		}

		MyUserAccount registered = null;

		try {
			registered = myUserAccountDAO.registerNewUserAccount(accountForm);
		} catch (Exception ex) {
			ex.printStackTrace();
			model.addAttribute("errorMessage", "Error " + ex.getMessage());
			return "signup";
		}

		if (accountForm.getSignInProvider() != null) {
			ProviderSignInUtils providerSignInUtils //
					= new ProviderSignInUtils(connectionFactoryLocator, connectionRepository);

			// Nếu người dùng đăng nhập bởi mạng xã hội. Phương thức này
			// lưu thông tin mạng xã hội vào bảng UserConnection.
			providerSignInUtils.doPostSignUp(registered.getId(), request);
		}
		// Sau khi đăng ký xong, đăng nhập vào.
		SecurityUtil.logInUser(registered);

		return "redirect:/userInfo";
	}

	@RequestMapping(value = { "/userInfo" }, method = RequestMethod.GET)
	public String userInfoPage(WebRequest request, Model model) {
		return "userInfo";
	}

}
