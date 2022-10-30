package com.zjq.users.controller;

import com.zjq.commons.model.domain.ResultInfo;
import com.zjq.commons.model.domain.SignInIdentity;
import com.zjq.commons.model.vo.SignInDinerInfo;
import com.zjq.commons.utils.ResultInfoUtil;
import com.zjq.users.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 用户中心
 */
@RestController
@RequestMapping("user")
public class UserController {

    @Resource
    private HttpServletRequest request;

    @Resource
//    private RedisTokenStore redisTokenStore;

    @Autowired
    private UserService userService;


    /**
     * 登录
     *
     * @param account
     * @param password
     * @return
     */
    @GetMapping("signin")
    public ResultInfo signIn(String account, String password) {
        return userService.signIn(account, password, request.getServletPath());
    }

    @GetMapping("me")
    public ResultInfo getCurrentUser(Authentication authentication) {
        // 获取登录用户的信息，然后设置
        SignInIdentity signInIdentity = (SignInIdentity) authentication.getPrincipal();
        // 转为前端可用的视图对象
        SignInDinerInfo dinerInfo = new SignInDinerInfo();
        BeanUtils.copyProperties(signInIdentity, dinerInfo);
        return ResultInfoUtil.buildSuccess(request.getServletPath(), dinerInfo);
    }


}
