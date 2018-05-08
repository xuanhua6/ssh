package com.newture.action;

import java.util.ArrayList;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Controller;

import com.newture.model.Feenback;
import com.newture.model.Feenback_item;
import com.newture.service.FeenbackService;
import com.newture.service.Feenback_itemService;
import com.newture.util.Json;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
@Controller
public class FeenbackAction extends ActionSupport implements ServletRequestAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource(name="feenbackService")
	private FeenbackService feenbackService;
	@Resource(name="feenbackitemService")
	private Feenback_itemService feenbackitemService;
	
	private HttpServletRequest request;
	private Feenback feenback;
	private Feenback_item feenback_item;
	private Integer[] fid;
	private int page1;
	private int limit1;
	
	public int getPage1() {
		return page1;
	}
	
	public void setFeenbackService(FeenbackService feenbackService) {
		this.feenbackService = feenbackService;
	}

	public void setFeenbackitemService(Feenback_itemService feenbackitemService) {
		this.feenbackitemService = feenbackitemService;
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

	public Integer[] getFid() {
		return fid;
	}

	public void setFid(Integer[] fid) {
		this.fid = fid;
	}
	/**
	 * 保存一个对象
	 * @return
	 */
	public void save() throws Exception{
		if(fid!=null){
			for(int i = 0;i<=fid.length-1;i++){
				feenback_item = feenbackitemService.findById(fid[i]);
			}
			feenback.getFeenback().add(feenback_item);
		}
		feenbackService.save(feenback);
	}
	/**
	 * 修改对象
	 * @return
	 */
	public String update() throws Exception{
			feenbackService.update(feenback);
		return null;
	}
	/**
	 * 查询所有对象
	 * @serialData 4/19/2018
	 * @return
	 */
	public String find() throws Exception{
		ArrayList data =(ArrayList) feenbackService.findAllList(page1,limit1);
		int count = feenbackService.count();
		Json j = new Json();
		j.setCount(count);
		j.setData(data);
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
		int i = feenbackService.delete(feenback.getFeenback_id());
		if(i>0){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
}
