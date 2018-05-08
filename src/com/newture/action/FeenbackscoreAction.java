package com.newture.action;

import java.util.ArrayList;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.newture.model.Classes;
import com.newture.model.Feenback;
import com.newture.model.Feenback_item;
import com.newture.model.Feenbackscore;
import com.newture.model.Users;
import com.newture.service.FeenbackService;
import com.newture.service.Feenback_itemService;
import com.newture.service.FeenbackscoreService;
import com.newture.util.Json;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

public class FeenbackscoreAction extends ActionSupport implements ServletRequestAware{
	
	private static final long serialVersionUID = 1665738927273391128L;
	
	@Resource(name="feenbackscoreService")
	private FeenbackscoreService feenbackscoreService;
	@Resource(name="feenbackService")
	private FeenbackService feenbackService;
	@Resource(name="feenbackitemService")
	private Feenback_itemService feenbackitemService;
	
	private HttpServletRequest request;
	private Feenback feenback;
	private Users users;
	private Feenback_item feenback_item;
	private Feenbackscore feenbackscore;
	private Integer[] fid;
	private int page1;
	private int limit1;
	
	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public Feenback getFeenback() {
		return feenback;
	}

	public void setFeenback(Feenback feenback) {
		this.feenback = feenback;
	}

	public Feenback_item getFeenback_item() {
		return feenback_item;
	}

	public void setFeenback_item(Feenback_item feenback_item) {
		this.feenback_item = feenback_item;
	}

	public Feenbackscore getFeenbackscore() {
		return feenbackscore;
	}

	public void setFeenbackscore(Feenbackscore feenbackscore) {
		this.feenbackscore = feenbackscore;
	}

	public Integer[] getFid() {
		return fid;
	}

	public void setFid(Integer[] fid) {
		this.fid = fid;
	}

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

	public void setFeenbackscoreService(FeenbackscoreService feenbackscoreService) {
		this.feenbackscoreService = feenbackscoreService;
	}

	public void setFeenbackService(FeenbackService feenbackService) {
		this.feenbackService = feenbackService;
	}

	public void setFeenbackitemService(Feenback_itemService feenbackitemService) {
		this.feenbackitemService = feenbackitemService;
	}
	
	public void save() throws Exception{
		if(fid!=null){
			for(int i = 0;i<=fid.length-1;i++){
				feenback_item = feenbackitemService.findById(fid[i]);
			}
			feenback.getFeenback().add(feenback_item);
		}
		//feenbackscoreService.save(feenbackscore);
	}
	/**
	 * 修改对象
	 * @return
	 */
	public String update() throws Exception{
			//feenbackService.update(feenback);
		return null;
	}
	/**
	 * 查询所有对象
	 * @serialData 4/19/2018
	 * @return
	 */
	public String find() throws Exception{
		Users users =feenbackscoreService.findClass(1);
		Classes cls = users.getStuclasses();
		int count = feenbackService.count();
		Json j = new Json();
		j.setCount(count);
		//对象转json，返回到前端
		JsonConfig config = new JsonConfig();  
		config.setExcludes(new String[]{"feenback","feenback_item"});
		String list =  JSONArray.fromObject(j,config).toString();
		String list1 = list.substring(1,list.length()-1);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(list1);
		return NONE;
	}
	public String findbyid(){
		Feenback f =  feenbackService.findById(feenback.getFeenback_id());
		HttpSession session = request.getSession();
		session.setAttribute("feenback", f);
		return "update";
	}
	/**
	 * 删除一个对象
	 * @return
	 */
	public String delete() throws Exception{
		/*int i = feenbackService.delete(feenback.getFeenback_id());
		if(i>0){
			return SUCCESS;
		}else{
			return ERROR;
		}*/
		return SUCCESS;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		
	}
}
