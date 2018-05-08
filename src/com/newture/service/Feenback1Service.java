package com.newture.service;

import java.util.List;

public abstract interface Feenback1Service<T> {
	/**
	 * 保存数据
	 * @param T
	 * @return Integer
	 */
	public void save(T feenback);
	
	/**
	 * 修改数据
	 * @param T
	 * @return Integer
	 */
	public void update(T feenback);
	
	/**
	 * 查询单个数据
	 * @param T
	 * @return T
	 */
	public T findById(int id);
	
	/**
	 * 删除数据
	 * @param T 
	 * @return Integer
	 */
	public Integer delete(int id);
	
	/**
	 * 查询多个数据
	 * @return Json
	 */
	public List<T> findAllList(Integer page, Integer limit);
	/**
	 * 查询总数
	 * @return
	 */
	public Integer count();
	
	/**
	 * 条件查询
	 * @return
	 */
	public List<T> findList();

	
}
