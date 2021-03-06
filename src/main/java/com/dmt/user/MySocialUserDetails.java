/*
*author TuanDM21
*date 2000-12-16
*Version 1.0
*/
package com.dmt.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.social.security.SocialUserDetails;

import com.dmt.bean.MyUserAccount;

public class MySocialUserDetails implements SocialUserDetails {

    private static final long serialVersionUID = -5246117266247684905L;

    private List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
    private MyUserAccount myUserAccount;

    public MySocialUserDetails(MyUserAccount myUserAccount) {
        this.myUserAccount = myUserAccount;
        String role = myUserAccount.getRole();

        GrantedAuthority grant = new SimpleGrantedAuthority(role);
        this.list.add(grant);
    }

    @Override
    public String getUserId() {
        return this.myUserAccount.getId();
    }

    @Override
    public String getUsername() {
        return myUserAccount.getUserName();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return list;
    }

    @Override
    public String getPassword() {
        return myUserAccount.getPassword();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}