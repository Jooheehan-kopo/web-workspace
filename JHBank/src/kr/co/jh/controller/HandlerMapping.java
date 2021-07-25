package kr.co.jh.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class HandlerMapping {

	private Map<String, Controller> mappings;
	
	public HandlerMapping() {
		this("C:\\Users\\HP\\web-workspace\\JHBank\\WebContent\\bean.propertiess");
	}
	
	public HandlerMapping(String propLoc) {
		mappings = new HashMap<>();
		Properties prop = new Properties();
		try {
//			InputStream is = new FileInputStream("C:\\Lecture\\web-workspace\\Mission-Web-MVC01\\bean.properties");
			InputStream is = new FileInputStream(propLoc);
		
			prop.load(is);
			
			Set<Object> keys = prop.keySet();
			for(Object key : keys) {
				String className = prop.getProperty(key.toString());
				
				Class<?> clz = Class.forName(className);
				mappings.put(key.toString(), (Controller)clz.newInstance());
			}
			
			
//			System.out.println(prop.getProperty("/board/list.do"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
//		
//		mappings.put("/board/list.do", new BoardListController());
//		mappings.put("/board/writeForm.do", new WriteFormController());
//		mappings.put("/board/detail.do", new BoardDetailController());
		
	}
	
	public Controller getController(String uri) {
		return mappings.get(uri);
	}
/*	
	public static void main(String[] args) {
		
		try {
			
			Class<?> clz = Class.forName("java.util.Random");
			java.util.Random r = (java.util.Random)clz.newInstance();
			System.out.println("난수 : " + r.nextInt(10));
			
//			Class<?> clz = Class.forName("kr.ac.kopo.controller.BoardListController");
//			BoardListController list = (BoardListController)clz.newInstance();
//			System.out.println(list.handleRequest(null, null));
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
*/
}





















