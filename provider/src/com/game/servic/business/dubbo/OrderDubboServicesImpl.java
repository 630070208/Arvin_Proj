package com.game.servic.business.dubbo;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("orderDubboServicesImpl")
public class OrderDubboServicesImpl implements OrderDubboServices {

	public String findById(Long id){
		
		return "hello world";
	}
	
	
}
