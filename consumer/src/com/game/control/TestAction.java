package com.game.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.game.servic.business.dubbo.OrderDubboServices;


@Controller
public class TestAction {

	/*@Autowired
	private OrderDubboServices orderDubboServices;*/
	
	@RequestMapping(value="/system")
	public void index(ModelMap model,HttpServletRequest request,Integer pageNo,Long memberId,String realName){
		System.out.println("--------------");
//		System.out.println(orderDubboServices.findById(0L));
	}
}
