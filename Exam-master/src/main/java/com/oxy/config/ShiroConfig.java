package com.oxy.config;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.Filter;

import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


/**
 *
 */
@Configuration
public class ShiroConfig {
	
	private Logger LOGGER = LoggerFactory.getLogger(this.getClass());
	

	@Bean
	public ShiroFilterFactoryBean shirFilter(DefaultWebSecurityManager securityManager) {
		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
		shiroFilterFactoryBean.setSecurityManager(securityManager);

		shiroFilterFactoryBean.setLoginUrl("/exam/login");

		Map<String, Filter> filterMap = new HashMap<>();
		filterMap.put("authc", myShiroUserFilter());
		shiroFilterFactoryBean.setFilters(filterMap);

		Map<String, String> filterChainDefinitionMap = new LinkedHashMap<String, String>();
		filterChainDefinitionMap.put("/exam/login", "anon");// 不拦截
		filterChainDefinitionMap.put("/exam/**", "authc");// 拦截
		shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);

		return shiroFilterFactoryBean;
	}
	
	
	
	@Bean
	public DefaultWebSecurityManager securityManager() {
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		securityManager.setRealm(myShiroUserRealm());
		securityManager.setSessionManager(sessionManager()); // 设置sessionManager
		return securityManager;
	}

	/**
	 * 自定义Filter
	 */
	@Bean
	public ShiroUserFilter myShiroUserFilter() {
		ShiroUserFilter shiroUserFilter = new ShiroUserFilter();
		return shiroUserFilter;
	}

	/**
	 * 身份认证
	 */
	@Bean
	public ShiroUserRealm myShiroUserRealm() {
		ShiroUserRealm shiroUserRealm = new ShiroUserRealm();
		return shiroUserRealm;
	}

	/**
	 * 配置Cookie信息
	 */
	@Bean
	public SimpleCookie simpleCookie() {
		SimpleCookie cookie = new SimpleCookie("SHAREJSESSIONID");
		cookie.setHttpOnly(false);
		cookie.setPath("/");
		cookie.setMaxAge(1800000);
		return cookie;
	}
	/**
	 * 配置Session属性
	 */
	@Bean
	public DefaultWebSessionManager sessionManager() {
		DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
		sessionManager.setGlobalSessionTimeout(1800000); // Session超时时间，30分钟
//		sessionManager.setSessionDAO(redisSessionDAO());
		sessionManager.setSessionValidationSchedulerEnabled(true);
		sessionManager.setDeleteInvalidSessions(true); // 删除无效Session
		sessionManager.setSessionIdCookie(simpleCookie()); // 设置JSESSIONID
		return sessionManager;
	}
}
