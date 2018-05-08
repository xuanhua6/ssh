package com.newture.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.newture.dao.FeenbackDao;
import com.newture.model.Classes;
import com.newture.model.Feenback_item;
import com.newture.model.Feenbackscore;
import com.newture.model.Users;
import com.newture.service.FeenbackscoreService;

@Service("feenbackscoreService")
public class FeenbackscoreServiceimpl implements FeenbackscoreService {
	
	@Resource(name="feenbackDao")
	private FeenbackDao<Feenbackscore> feenbackDao;
	
	@Resource(name="feenbackDao")
	private FeenbackDao<Users> usersDao;
	
	public void setFeenbackDao(FeenbackDao<Feenbackscore> feenbackDao) {
		this.feenbackDao = feenbackDao;
	}
	
	public FeenbackDao<Users> getUsersDao() {
		return usersDao;
	}

	public void setUsersDao(FeenbackDao<Users> usersDao) {
		this.usersDao = usersDao;
	}

	@Override
	public void save(Feenbackscore feenbackscore) {
		// TODO Auto-generated method stub
		feenbackDao.save(feenbackscore);
	}
	

	@Override
	public void update(Feenbackscore feenbackscore) {
		// TODO Auto-generated method stub
		feenbackDao.update(feenbackscore);
	}

	@Override
	public Feenbackscore findById(int id) {
		// TODO Auto-generated method stub
		return (Feenbackscore) feenbackDao.get(Feenbackscore.class,id);
	}

	@Override
	public Integer delete(int id) {
		// TODO Auto-generated method stub
		Feenbackscore f = feenbackDao.get(Feenbackscore.class, id);
		if(f!=null){
			feenbackDao.delete(f);
			return  1;
		}else{
			return  0;
		}
	}

	@Override
	public List<Feenbackscore> findAllList(Integer page, Integer limit) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Users findClass(int id) {
		// TODO Auto-generated method stub
		String hql="from Users u1 where u1.id=?";
		Object[] param = {id};
		List<Users> classes = usersDao.find(hql, param);
		return classes.get(0);
	}
	@Override
	public Integer count() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Feenbackscore> findList() {
		// TODO Auto-generated method stub
		return null;
	}

}
