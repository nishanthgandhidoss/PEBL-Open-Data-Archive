package com.erp.dao;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.executor.BatchResult;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.support.SqlSessionDaoSupport;

public class CommonDAOImpl extends SqlSessionDaoSupport implements CommonDAOInterface {

	/*
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#count(java.lang.Object)
	 */

	public int count(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#create(java.lang.Object)
	 */

	public Object create(Object obj, String insertParameterName) throws Exception {
		// TODO Auto-generated method stub
		// this.getSqlSession().startTransaction();
		return (Object) this.getSqlSession().insert(insertParameterName, obj);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#delete(long)
	 */

	public int delete(long id, String queryId) throws Exception {
		
			return this.getSqlSession().delete(queryId, id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#edit(long)
	 */

	public Object edit(long id, String editParameterName) throws Exception {
		// TODO Auto-generated method stub
		return (Object) this.getSqlSession().update(editParameterName, id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#read()
	 */
	@SuppressWarnings("unchecked")

	public List<Object> read(Long orgId, String readParameterName) throws Exception {
		// TODO Auto-generated method stub
		return (List<Object>) this.getSqlSession().selectList(readParameterName, orgId);
	}

	public Object update(Object obj, String queryId) throws Exception {
		
		return (Object) this.getSqlSession().update(queryId, obj);
	}

	public int update(String queryId, Map<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Object> search(Object obj, String searchParameterName) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Object> getRecordListById(Long id, String queryId) throws Exception {
		return this.getSqlSession().selectList(queryId, id);
	}

	public List<Object> getRecordList(String queryId) throws Exception {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(queryId);
	}

	public List<Object> getRecordList(String queryId, Map inputMap) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Map<?, ?> getRecordsByMap(String queryId, Map inputMap) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Object create(String queryId, Object inputObject) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public int remove(String queryId, Object inputObject) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public boolean isExists(String queryId, Map<String, Object> inputMap) throws Exception {
		
		
		int returnId= this.getSqlSession().selectOne(queryId, inputMap);
		
		if(returnId>0){
			return true;
		}else{
			return false;
		}
		
	}

	public boolean isExists(String queryId, Object object) throws Exception {
		int returnId= this.getSqlSession().selectOne(queryId, object);
		if(returnId>0){
			return true;
		}else{
			return false;
		}
	}
	public boolean isRecordExists(String queryId, Map<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	public Object getRecordByObject(String queryId, Object param) throws Exception {
		
		return this.getSqlSession().selectOne(queryId, param);
	}

	public Long getLong(String queryId, Map<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Object getRecord(String queryId, Long inputId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Object getRecord(String queryId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public List<?> getRecordListById(String queryId, Long inputLong) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public List<?> getRecordListByObject(String queryId, Object obj) throws Exception {

		return this.getSqlSession().selectList(queryId, obj);
	}

	public List<?> getRecordListByMap(String queryId, Map<String, Object> inputMap) throws Exception {
		return this.getSqlSession().selectList(queryId, inputMap);
	}

	public List<?> getRecordListByMapObject(String queryId, Map<Object, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public void startTransaction() throws Exception {
		// TODO Auto-generated method stub

	}

	public void commitTransaction() throws Exception {
		// TODO Auto-generated method stub

	}

	public void endTransaction() throws Exception {
		// TODO Auto-generated method stub

	}

	public int executeBatch() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public void startBatch() throws Exception {
		// TODO Auto-generated method stub

	}

	public int delete(String queryId, Map<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<?> getAllRecordList(String queryId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long getNextId(String queryId, Object obj) throws Exception {

		Long count = 0L;
		count = this.getSqlSession().selectOne(queryId, obj);
		return count;
	}
	
	@Override
	public String getLastValue(String queryId, Object obj) throws Exception {

		String lastValue = null;
		lastValue = (String) this.getSqlSession().selectOne(queryId, obj);
		return lastValue;
	}
	
	public int getCount(String queryId, Map<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> T selectOne(String statement) {
		// TODO Auto-generated method stub
		return (T) this.getSqlSession().selectOne(statement);
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> T selectOne(String statement, Object parameter) {
		// TODO Auto-generated method stub
		return (T) this.getSqlSession().selectOne(statement, parameter);
	}

	@Override
	public <E> List<E> selectList(String statement) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <E> List<E> selectList(String statement, Object parameter) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <E> List<E> selectList(String statement, Object parameter, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <K, V> Map<K, V> selectMap(String statement, String mapKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <K, V> Map<K, V> selectMap(String statement, Object parameter, String mapKey) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <K, V> Map<K, V> selectMap(String statement, Object parameter, String mapKey, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void select(String statement, Object parameter, ResultHandler handler) {
		// TODO Auto-generated method stub

	}

	@Override
	public void select(String statement, ResultHandler handler) {
		// TODO Auto-generated method stub

	}

	@Override
	public void select(String statement, Object parameter, RowBounds rowBounds, ResultHandler handler) {
		// TODO Auto-generated method stub

	}

	@Override
	public int insert(String statement) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(String statement, Object parameter) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(String statement) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(String statement, Object parameter) {
		int count = this.getSqlSession().update(statement, parameter);
		return count;
	}

	@Override
	public int delete(String statement) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String statement, Object parameter) {
		// TODO Auto-generated method stub
		return this.getSqlSession().delete(statement, parameter);
	}

	@Override
	public void commit() {
		// TODO Auto-generated method stub

	}

	@Override
	public void commit(boolean force) {
		// TODO Auto-generated method stub

	}

	@Override
	public void rollback() {
		this.getSqlSession().rollback();
	}

	@Override
	public void rollback(boolean force) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<BatchResult> flushStatements() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void close() {
		// TODO Auto-generated method stub

	}

	@Override
	public void clearCache() {
		// TODO Auto-generated method stub

	}

	@Override
	public Configuration getConfiguration() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> T getMapper(Class<T> type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * /* (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#search(java.lang.Object)
	 * 
	 * @SuppressWarnings("unchecked")
	 * 
	 * public List<Object> search(Object obj, String searchParameterName) throws
	 * Exception { // TODO Auto-generated method stub return (List<Object>)
	 * this.getSqlSession().queryForList( searchParameterName, obj); }
	 * 
	 * 
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#update(java.lang.Object)
	 * 
	 * (java.lang.String id, java.lang.Object parameterObject)
	 * 
	 * 
	 * public Object update(Object obj, String queryId) throws Exception { //
	 * TODO Auto-generated method stub return (Object)
	 * this.getSqlSession().update(queryId, obj);
	 * 
	 * }
	 * 
	 *//**
		 * @param queryId
		 * @param inputMap
		 * @return
		 * @throws Exception
		 */
	/*
	 * 
	 * public int update(String queryId, Map<String, Object> inputMap) throws
	 * Exception { // TODO Auto-generated method stub return
	 * this.getSqlSession().update(queryId, inputMap);
	 * 
	 * }
	 * 
	 * 
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#getList(java.lang.Long,
	 * java.lang.String)
	 * 
	 * @SuppressWarnings("unchecked")
	 * 
	 * public List<Object> getList(Long userOrgId, String listQueryId) throws
	 * Exception { // TODO Auto-generated method stub
	 * 
	 * return (List<Object>) this.getSqlSession().queryForList(listQueryId,
	 * userOrgId);
	 * 
	 * }
	 * 
	 *//**
		 * @param queryId
		 * @param inputObject
		 * @return
		 * @throws Exception
		 */
	/*
	 * 
	 * public Object create(String queryId, Object inputObject) throws Exception
	 * { // TODO Auto-generated method stub Object object = null;
	 * 
	 * object = this.getSqlSession().insert(queryId, inputObject);
	 * 
	 * return object; }
	 * 
	 *//**
		 * @param queryId
		 * @param inputObject
		 * @return
		 * @throws Exception
		 */
	/*
	 * 
	 * public int remove(String queryId, Object inputObject) throws Exception {
	 * // TODO Auto-generated method stub return (int)
	 * this.getSqlSession().delete(queryId, inputObject); }
	 * 
	 * 
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#getRecordList(java.lang.String)
	 * 
	 * 
	 * @SuppressWarnings("unchecked") public List getRecordList(String queryId)
	 * throws Exception { // TODO Auto-generated method stub return
	 * getRecordList(queryId, null); }
	 * 
	 *//**
		 * @param queryId
		 * @param inputMap
		 * @return
		 * @throws Exception
		 */
	/*
	 * @SuppressWarnings("unchecked")
	 * 
	 * public List getRecordList(String queryId, Map inputMap) throws Exception
	 * { // TODO Auto-generated method stub if (inputMap != null &&
	 * !inputMap.isEmpty()) { return this.getSqlSession().queryForList(queryId,
	 * inputMap); } else { return this.getSqlSession().queryForList(queryId); }
	 * }
	 * 
	 * 
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#getRecordsByMap(java.lang.String,
	 * java.util.Map)
	 * 
	 * 
	 * public Map<?, ?> getRecordsByMap(String queryId, Map inputMap) throws
	 * Exception {
	 * 
	 * return this.getSqlMapClient() .queryForMap(queryId, inputMap, "key",
	 * "value");
	 * 
	 * }
	 * 
	 *//**
		 * @param queryId
		 * @param inputMap
		 * @return
		 * @throws Exception
		 */
	/*
	 * 
	 * @SuppressWarnings("unchecked")
	 * 
	 * public Object getRecord(String queryId, Map inputMap) throws Exception {
	 * // TODO Auto-generated method stub if (inputMap != null &&
	 * !inputMap.isEmpty()) { return
	 * this.getSqlSession().queryForObject(queryId, inputMap); } else { return
	 * this.getSqlSession().queryForObject(queryId); } }
	 * 
	 * 
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#getLong(java.lang.String,
	 * java.util.Map)
	 * 
	 * 
	 * public Long getLong(String queryId, Map<String, Object> inputMap) throws
	 * Exception { // TODO Auto-generated method stub if (inputMap != null &&
	 * !inputMap.isEmpty()) { return (Long)
	 * this.getSqlSession().queryForObject(queryId, inputMap); } else { return
	 * (Long) this.getSqlSession().queryForObject(queryId); } }
	 * 
	 * 
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#isExists(java.lang.String,
	 * java.util.Map)
	 * 
	 * @SuppressWarnings("unchecked")
	 * 
	 * public boolean isExists(String queryId, Map<String, Object> inputMap)
	 * throws Exception { // TODO Auto-generated method stub
	 * 
	 * List<Object> list = null; try { list = (List<Object>)
	 * this.getSqlSession().queryForList(queryId, inputMap); } catch (Exception
	 * e) { logger.fatal("Exception at isExists(1) >>>> " + e.toString()); }
	 * 
	 * return (list != null && !list.isEmpty()); }
	 * 
	 * 
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#isRecordExists(java.lang.String,
	 * java.util.Map)
	 * 
	 * 
	 * public boolean isRecordExists(String queryId, Map<String, Object>
	 * inputMap) throws Exception { Integer rowCnt = null; try { rowCnt =
	 * (Integer) this.getSqlSession().queryForObject(queryId, inputMap); if
	 * (rowCnt == 0) { return false; } else { return true; } } catch (Exception
	 * e) { logger.fatal("Exception at isRecordExists(1) >>>> " + e.toString());
	 * }
	 * 
	 * return true; }
	 * 
	 * 
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#getRecord(java.lang.String,
	 * java.lang.Long)
	 * 
	 * 
	 * public Object getRecord(String queryId, Long inputId) throws Exception {
	 * // TODO Auto-generated method stub if (inputId != null) { return
	 * this.getSqlSession().queryForObject(queryId, inputId); } else { return
	 * this.getSqlSession().queryForObject(queryId); } }
	 * 
	 * 
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#getRecord(java.lang.String)
	 * 
	 * 
	 * public Object getRecord(String queryId) throws Exception {
	 * 
	 * return this.getSqlSession().queryForObject(queryId); }
	 * 
	 * 
	 * (non-Javadoc)
	 * 
	 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#getRecordList(java.lang.String,
	 * java.lang.Long)
	 * 
	 * @SuppressWarnings("unchecked")
	 * 
	 * public List<?> getRecordListById(String queryId, Long inputLong) throws
	 * Exception { // TODO Auto-generated method stub List<Object> list = null;
	 * try { list = (List<Object>) this.getSqlSession().queryForList(queryId,
	 * inputLong); } catch (Exception e) { logger.fatal(
	 * "Exception at isExists(1) >>>> " + e.toString()); } return list; }
	 * 
	 *//**
		 * @param queryId
		 * @param inputMap
		 * @return
		 * @throws Exception
		 *//*
		 * 
		 * public List<?> getRecordListByMap(String queryId, Map<String, Object>
		 * inputMap) throws Exception { // TODO Auto-generated method stub
		 * List<?> list = null; try { list = (List<?>)
		 * this.getSqlSession().queryForList(queryId, inputMap); } catch
		 * (Exception e) { logger.fatal("Exception at isExists(1) >>>> " +
		 * e.toString()); } return list; }
		 * 
		 * 
		 * (non-Javadoc)
		 * 
		 * @see
		 * in.cmps.dfv2.dao.CRUDSSCommonDAO#getRecordListByMapObject(java.lang.
		 * String , java.util.Map)
		 * 
		 * 
		 * public List<?> getRecordListByMapObject(String queryId, Map<Object,
		 * Object> inputMap) throws Exception { // TODO Auto-generated method
		 * stub List<?> list = null; try { list = (List<?>)
		 * this.getSqlSession().queryForList(queryId, inputMap); } catch
		 * (Exception e) { logger.fatal("Exception at isExists(1) >>>> " +
		 * e.toString()); } return list; }
		 * 
		 * 
		 * public void commitTransaction() throws Exception { // TODO
		 * Auto-generated method stub this.getSqlSession().commitTransaction();
		 * }
		 * 
		 * 
		 * public void endTransaction() throws Exception { // TODO
		 * Auto-generated method stub this.getSqlSession().endTransaction(); }
		 * 
		 * 
		 * public void startTransaction() throws Exception { // TODO
		 * Auto-generated method stub this.getSqlSession().startTransaction(); }
		 * 
		 * 
		 * public int executeBatch() throws Exception { // TODO Auto-generated
		 * method stub return this.getSqlSession().executeBatch(); }
		 * 
		 * 
		 * public void startBatch() throws Exception { // TODO Auto-generated
		 * method stub this.getSqlSession().startBatch(); }
		 * 
		 * 
		 * (non-Javadoc)
		 * 
		 * @see
		 * in.cmps.dfv2.dao.CRUDSSCommonDAO#getRecordListByObject(java.lang.
		 * String, java.lang.Object)
		 * 
		 * 
		 * public List<?> getRecordListByObject(String queryId, Object obj)
		 * throws Exception { // TODO Auto-generated method stub List<?> list =
		 * null; try { list = (List<?>)
		 * this.getSqlSession().queryForList(queryId, obj); } catch (Exception
		 * e) { logger.fatal("Exception at isExists(1) >>>> " + e.toString()); }
		 * return list; }
		 * 
		 * 
		 * public int delete(String queryId, Map<String, Object> inputMap)
		 * throws Exception { // TODO Auto-generated method stub
		 * 
		 * return (int) this.getSqlSession().delete(queryId, inputMap);
		 * 
		 * }
		 * 
		 * 
		 * public List<?> getAllRecordList(String queryId) { // TODO
		 * Auto-generated method stub List<?> list = null; try { list =
		 * (List<?>) this.getSqlSession().queryForList(queryId); } catch
		 * (Exception e) { logger.fatal("Exception at isExists(1) >>>> " +
		 * e.toString()); } return list; }
		 * 
		 * 
		 * public Long getMaxId(String queryId) throws Exception { // TODO
		 * Auto-generated method stub Long maxId = null; try { maxId = (Long)
		 * this.getSqlSession().queryForObject(queryId); } catch (Exception e) {
		 * logger.fatal("Exception at isExists(1) >>>> " + e.toString()); }
		 * return maxId; }
		 * 
		 * 
		 * (non-Javadoc)
		 * 
		 * @see in.cmps.dfv2.dao.CRUDSSCommonDAO#getCount(java.lang.String,
		 * java.util.Map)
		 * 
		 * 
		 * public int getCount(String queryId, Map<String, Object> inputMap)
		 * throws Exception { // TODO Auto-generated method stub int count = 0;
		 * // "countInternalMail" count =
		 * Integer.parseInt(this.getSqlMapClient() .queryForObject(queryId,
		 * inputMap).toString());
		 * 
		 * return count; }
		 */
}
