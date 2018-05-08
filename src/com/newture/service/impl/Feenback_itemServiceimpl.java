package com.newture.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.stereotype.Service;

import com.newture.dao.FeenbackDao;
import com.newture.model.Feenback_item;
import com.newture.service.Feenback_itemService;

@Service("feenbackitemService")
public class Feenback_itemServiceimpl implements Feenback_itemService{
	
	@Resource(name="feenbackDao")
	private FeenbackDao<Feenback_item> feenbackDao;
	
	public void setFeenbackDao(FeenbackDao<Feenback_item> feenbackDao) {
		this.feenbackDao = feenbackDao;
	}

	@Override
	public void save(Feenback_item feenback) {
		// TODO Auto-generated method stub
		feenbackDao.save(feenback);
	}

	@Override
	public void update(Feenback_item feenback) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Feenback_item findById(int id) {
		// TODO Auto-generated method stub
		Feenback_item s =feenbackDao.get(Feenback_item.class, id);
		return s;
	}

	@Override
	public Integer delete(int id) {
		// TODO Auto-generated method stub
		Feenback_item f = feenbackDao.get(Feenback_item.class, id);
		if(f!=null){
			feenbackDao.delete(f);
			return  1;
		}else{
			return  0;
		}
	}
	@Override
	public List findAllList(Integer page,Integer limit) {
		// TODO Auto-generated method stub
		String hql="from Feenback_item as f1";
		Object[] param = null;
		ArrayList<Feenback_item> list = (ArrayList<Feenback_item>) feenbackDao.find(hql, param, page, limit);
		return list;
}

	@Override
	public Integer count() {
		// TODO Auto-generated method stub
		String hql="select count(*) from Feenback_item as f1";
		Long count1 = feenbackDao.count(hql);
		return count1.intValue();
	}
	@Test
	public void test(){
		Serializable id =81;
		Feenback_item f = feenbackDao.get(Feenback_item.class, id);
		System.out.println(f);
	}

	@Override
	public List<Feenback_item> findList() {
		// TODO Auto-generated method stub
		String hql="from Feenback_item as f1";
		Object[] param = null;
		ArrayList<Feenback_item> list = (ArrayList<Feenback_item>) feenbackDao.find(hql, param);
		return list;
	}
}
