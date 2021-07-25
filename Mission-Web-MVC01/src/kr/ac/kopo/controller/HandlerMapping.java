package kr.ac.kopo.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping {

	private Map<String, Controller> mappings;
	
	public HandlerMapping() {
		this("C:\\Users\\HP\\web-workspace\\Mission-Web-MVC01\\bean.properties");
	}

	public HandlerMapping(String propLoc) { // 이틀에다가 넣어주는 것임..

		mappings = new HashMap<>(); 
		Properties prop = new Properties();
		try {
			//InputStream is = new FileInputStream("C:\\Users\\HP\\web-workspace\\Mission-Web-MVC01\\bean.properties");
			InputStream is = new FileInputStream(propLoc);
			prop.load(is);
			
			Set<Object>keys = prop.keySet();
			for(Object key : keys) {
				//System.out.println(key);
				String className = prop.getProperty(key.toString());
				//System.out.println(className);
				
				Class<?> clz = Class.forName(className);
				mappings.put(key.toString(), (Controller)clz.newInstance());
			}
			//System.out.println(prop.getProperty("/board/list.do"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	
//		  mappings.put("/board/list.do", new BoardListController()); 
//		  mappings.put("/board/writeForm.do", new WriteFormController()); 
//		  mappings.put("/board/detail.do", new BoardDetailController());
		
	}

	public Controller getController(String uri) {
		return mappings.get(uri);
	}
	
	/*
	 * public static void main(String[] args) { try { Class<?> clz =
	 * Class.forName("java.util.Random"); java.util.Random r =
	 * (java.util.Random)clz.newInstance(); System.out.println("난수 : ")+
	 * r.nextInt(10) ;
	 * 
	 * 
	 * 
	 * Class<?> clz = Class.forName("kr.ac.kopo.controller.BoardListController");
	 * //실제 클래스에 대한 정보가 clz가 갖게 되는 것. 동적으로 객체를 만드는 것이 목적. BoardListController list =
	 * (BoardListController)clz.newInstance(); //System.out.println(list); //객체하나가
	 * 생성됨.. System.out.println(list.handleRequest(null, null)); }catch(Exception e)
	 * { e.printStackTrace(); } }
	 */
}
