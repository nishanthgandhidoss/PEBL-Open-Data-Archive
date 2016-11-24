package com.erp.dao;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.executor.BatchResult;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

public interface CommonDAOInterface {

	public <T> T selectOne(String statement);

	public <T> T selectOne(String statement, Object parameter);

	public <E> List<E> selectList(String statement);

	public <E> List<E> selectList(String statement, Object parameter);

	public <E> List<E> selectList(String statement, Object parameter, RowBounds rowBounds);

	public <K, V> Map<K, V> selectMap(String statement, String mapKey);
		// TODO Auto-generated method stub
		
	

	public <K, V> Map<K, V> selectMap(String statement, Object parameter, String mapKey);
		// TODO Auto-generated method stub
		
	

	public <K, V> Map<K, V> selectMap(String statement, Object parameter, String mapKey, RowBounds rowBounds);
		// TODO Auto-generated method stub
		
	

	
	public void select(String statement, Object parameter, ResultHandler handler);
		// TODO Auto-generated method stub
		
	

	
	public void select(String statement, ResultHandler handler);
		// TODO Auto-generated method stub
		
	

	
	public void select(String statement, Object parameter, RowBounds rowBounds, ResultHandler handler);
		// TODO Auto-generated method stub
		
	

	
	public int insert(String statement);
	
	

	
	public int insert(String statement, Object parameter);
	
	

	
	public int update(String statement);
		

	
	public int update(String statement, Object parameter);
		// TODO Auto-generated method stub
		
	

	
	public int delete(String statement);
		// TODO Auto-generated method stub
		
	

	
	public int delete(String statement, Object parameter);
		// TODO Auto-generated method stub
		
	

	
	public void commit();
		// TODO Auto-generated method stub
		
	

	
	public void commit(boolean force);
		// TODO Auto-generated method stub
		
	

	
	public void rollback();
		// TODO Auto-generated method stub
		
	

	
	public void rollback(boolean force);
		// TODO Auto-generated method stub
		
	

	
	public List<BatchResult> flushStatements();
		// TODO Auto-generated method stub
		
	

	
	public void close();
		// TODO Auto-generated method stub
		
	

	
	public void clearCache();
		// TODO Auto-generated method stub
		
	

	
	public Configuration getConfiguration();
		// TODO Auto-generated method stub
		
	

	
	public <T> T getMapper(Class<T> type);
		// TODO Auto-generated method stub
		
	

	
	public Connection getConnection();
		// TODO Auto-generated method stub

	public Long getNextId(String queryId, Object obj) throws Exception;

	public String getLastValue(String queryId, Object obj) throws Exception;

	
		
	
}
	


