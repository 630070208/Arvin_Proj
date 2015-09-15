package com.game.control.site.secuirty;

import javax.servlet.http.HttpSessionEvent;

import org.springframework.security.web.session.HttpSessionEventPublisher;

/**
 * 监听过期的session
 * @author _Arvin date: 2014-7-8 下午09:31:35
 */
public class MySessionLister extends HttpSessionEventPublisher {
	

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {


	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
	}
}
