/*
*author TuanDM21
*date 2000-12-16
*Version 1.0
*/
package com.dmt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.social.security.SocialUserDetails;
import org.springframework.social.security.SocialUserDetailsService;
import org.springframework.stereotype.Service;

import com.dmt.user.MySocialUserDetails;

@Service
public class MySocialUserDetailsService implements SocialUserDetailsService {

  @Autowired
  private UserDetailsService userDetailService;


  // Tải thông tin người dùng đăng nhập bởi mạng xã hội.
  // (Phương thức này được sử dụng bởi Spring Social Security API)
  @Override
  public SocialUserDetails loadUserByUserId(String userId) throws UsernameNotFoundException, DataAccessException {


      // Dựa trên UserDetailService. (Xem MyUserDetailService).
      UserDetails userDetails = userDetailService.loadUserByUsername(userId);

      return (MySocialUserDetails) userDetails;
  }

}