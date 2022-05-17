/*
*
*
*@author TuanDM21
*@date 16-12-2000
*@version 1.0
*/

package com.dmt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {

	@GetMapping("/Chat")
	public String index123() {
		return "Chat";
	}

}