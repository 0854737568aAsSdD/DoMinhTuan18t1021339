/*
*author TuanDM21
*date 2000-12-16
*Version 1.0
*/
package com.dmt.utills;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.dmt.bean.MyUserAccount;
import com.dmt.user.MySocialUserDetails;

public class SecurityUtil {

 
   // Tự động đăng nhập.
   public static void logInUser(MyUserAccount user) {

       MySocialUserDetails userDetails = new MySocialUserDetails(user);

       Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null,
               userDetails.getAuthorities());
       SecurityContextHolder.getContext().setAuthentication(authentication);
   }
 
}
