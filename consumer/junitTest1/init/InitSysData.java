package init;


import base.BaseTestCase;
import base.Launcher;

import com.alibaba.dubbo.config.ApplicationConfig;
import com.alibaba.dubbo.config.ReferenceConfig;
import com.alibaba.dubbo.config.RegistryConfig;
import com.game.servic.business.dubbo.OrderDubboServices;

public class InitSysData extends BaseTestCase{
	
	public void inOfwallet(){
		OrderDubboServices orderServ=(OrderDubboServices)Launcher.getBean("orderDubboServices");
		System.out.println("------------"+orderServ.findById(0L));		
//		GameOrder order = orderServ.findById(1L);
//		System.out.println(order.getBetCode());
	}
	
	public static void main(String[] args) {
//		InitSysData init = new InitSysData();
//		System.out.println("SUCCESS");
//		init.inOfwallet();
		
//		
		ApplicationConfig application = new ApplicationConfig();
		application.setName("yyy");
		 
		// 连接注册中心配置
		RegistryConfig registry = new RegistryConfig();
		registry.setAddress("127.0.0.1:2183");
		 
		// 注意：ReferenceConfig为重对象，内部封装了与注册中心的连接，以及与服务提供方的连接
		 
		// 引用远程服务
		ReferenceConfig<OrderDubboServices> reference = new ReferenceConfig<OrderDubboServices>(); // 此实例很重，封装了与注册中心的连接以及与提供者的连接，请自行缓存，否则可能造成内存和连接泄漏
		reference.setApplication(application);
		reference.setRegistry(registry); // 多个注册中心可以用setRegistries()
		reference.setInterface(OrderDubboServices.class);
		reference.setVersion("2.8.4");
		 
//		// 和本地bean一样使用xxxService
		OrderDubboServices orderService = reference.get(); // 注意：此代理对象内部封装了所有通讯细节，对象较重，请缓存复用	
		System.out.println(orderService);
	}
	
}
