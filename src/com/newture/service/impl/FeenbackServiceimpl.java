package com.newture.service.impl;

import java.util.ArrayList;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.newture.dao.FeenbackDao;
import com.newture.model.Feenback;
import com.newture.service.Feenback1Service;
import com.newture.service.FeenbackService;

@Service("feenbackService")
public class FeenbackServiceimpl implements FeenbackService{

	@Resource(name="feenbackDao")
	private FeenbackDao<Feenback> feenbackDao;
	
	public FeenbackDao<Feenback> getFeenbackDao() {
		return feenbackDao;
	}

	public void setFeenbackDao(FeenbackDao<Feenback> feenbackDao) {
		this.feenbackDao = feenbackDao;
	}

	@Override
	public void save(Feenback feenback) {
		// TODO Auto-generated method stub
		feenbackDao.save(feenback);
	}

	@Override
	public void update(Feenback feenback) {
		// TODO Auto-generated method stub
		//Feenback f = feenbackDao.get(Feenback.class, feenback.getFeenback_id());
		feenbackDao.update(feenback);
	}

	@Override
	public Feenback findById(int id) {
		// TODO Auto-generated method stub
		return (Feenback) feenbackDao.get(Feenback.class,id);
	}

	@Override
	public Integer delete(int id) {
		// TODO Auto-generated method stub
		
		Feenback f = feenbackDao.get(Feenback.class, id);
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
		String hql="from Feenback as f1 order by f1.feenback_id asc";
		Object[] param = null;
		List list = feenbackDao.find(hql, param, page, limit);
		return list;
}

	@Override
	public Integer count() {
		// TODO Auto-generated method stub
		String hql="select count(*) from Feenback as f1";
		Long count1 = feenbackDao.count(hql);
		return count1.intValue();
	}

	@Override
	public List<Feenback> findList() {
		// TODO Auto-generated method stub
		return null;
	}


}
