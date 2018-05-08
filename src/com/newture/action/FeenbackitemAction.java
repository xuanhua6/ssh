package com.newture.action;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.newture.model.Feenback_item;
import com.newture.service.Feenback_itemService;
import com.newture.util.Json;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;


public class FeenbackitemAction extends ActionSupport implements ServletRequestAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource(name="feenbackitemService")
	private Feenback_itemService feenback_itemService;
	
	private HttpServletRequest request;
	private Feenback_item feenback_item;
	private int page1;
	private int limit1;
	
	public int getPage1() {
		return page1;
	}
	public void setPage1(int page1) {
		this.page1 = page1;
	}
	public int getLimit1() {
		return limit1;
	}
	public void setLimit1(int limit1) {
		this.limit1 = limit1;
	}
	public Feenback_item getFeenback_item() {
		return feenback_item;
	}
	public void setFeenback_item(Feenback_item feenback_item) {
		this.feenback_item = feenback_item;
	}

	/**
	 * 保存一个对象
	 * @return
	 */
	public String save(){
		feenback_itemService.save(feenback_item);
		if(feenback_item.getFb_id()>0){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	/**
	 * 查询所有对象
	 * @serialData 4/19/2018
	 * @return
	 */
	public String find() throws Exception{
		ArrayList data =(ArrayList) feenback_itemService.findAllList(page1,limit1);
		int count = feenback_itemService.count();
		Json j = new Json();
		j.setCount(count);
		j.setData(data);
		//对象转json，返回到前端
		JsonConfig config = new JsonConfig();  
		config.setExcludes(new String[]{"feenback","feenbackscore"});
		String list =  JSONArray.fromObject(j,config).toString();
		String list1 = list.substring(1,list.length()-1);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(list1);
		return NONE;
	}
	
	/**
	 * 删除一个对象
	 * @return
	 */
	public String delete(){
		int i = feenback_itemService.delete(feenback_item.getFb_id());
		if(i>0){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request; 
	}
	
	
}
