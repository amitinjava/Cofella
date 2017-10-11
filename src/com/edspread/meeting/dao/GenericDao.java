package com.edspread.meeting.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.orm.jpa.EntityManagerFactoryUtils;
import org.springframework.orm.jpa.JpaTemplate;
import org.springframework.orm.jpa.support.JpaDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.edspread.meeting.entity.Domain;
import com.edspread.meeting.entity.ExMessage;
import com.edspread.meeting.util.MeetingException;



public class GenericDao<K, E extends Domain<?>> extends JpaDaoSupport implements
		Serializable {
	private static final long serialVersionUID = 1L;

	protected JpaTemplate getJpaTemplateEx() throws MeetingException {
		JpaTemplate template = null;
		try {
			template = getJpaTemplate();
		} catch (Exception e) {
			throw new MeetingException("failed to acquire JpaTemplate.", e);
		}

		if (template == null) {
			throw new MeetingException("failed to acquire JpaTemplate.");
		}

		return template;
	}

	protected EntityManager getEntityManager() {
		EntityManagerFactory emf ;
		EntityManager em = null;
		try {
			 emf = getJpaTemplate().getEntityManagerFactory();
			 em = EntityManagerFactoryUtils
					.getTransactionalEntityManager(emf);
			if (em == null) {
				System.out
						.println("Warning: got entity manager from jpatemplate. if not on http listener this means we are not using transactions!");
				em = getJpaTemplate().getEntityManager();
			}
			if (em == null) {
				// need to create a brand new entity manager
				em = emf.createEntityManager();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return em;
	}

	public int executeUpdateNative(String query) throws MeetingException {
		return executeUpdateNative(query, null);
	}

	public int executeUpdateNative(String query, List<Object> params)
			throws MeetingException {
		Query jpaQuery = getEntityManager().createNativeQuery(query);
		for (int i = 0; i < params.size(); i++) {
			jpaQuery.setParameter(i + 1, params.get(i));
		}
		return jpaQuery.executeUpdate();
	}

	public E findById(K id, Class<E> klass) throws MeetingException {
		return getEntityManager().find(klass, id); // class is keyword
	}

	@SuppressWarnings("unchecked")
	public List<E> findByNamedQuery(String name) throws MeetingException {
		Query query = getEntityManager().createNamedQuery(name);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<E> findByNamedQuery(String name, int first, int pageSize)
			throws MeetingException {
		Query query = getEntityManager().createNamedQuery(name);
		query.setFirstResult(first);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<E> findByNamedQuery(String name, Map<String, Object> params)
			throws MeetingException {
		Query query = getEntityManager().createNamedQuery(name);

		for (Entry<String, Object> param : params.entrySet()) {
			query.setParameter(param.getKey(), param.getValue());
		}

		return query.getResultList();
	}

	public Object findNumberByNamedQuery(String name, Map<String, Object> params)
			throws MeetingException {
		Query query = getEntityManager().createNamedQuery(name);

		for (Entry<String, Object> param : params.entrySet()) {
			query.setParameter(param.getKey(), param.getValue());
		}

		return (Long) query.getSingleResult();
	}

	@SuppressWarnings("unchecked")
	public List<E> findByNamedQuery(String name, Map<String, Object> params,
			int first, int pageSize) throws MeetingException {
		Query query = getEntityManager().createNamedQuery(name);

		for (Entry<String, Object> param : params.entrySet()) {
			query.setParameter(param.getKey(), param.getValue());
		}

		query.setFirstResult(first);
		query.setMaxResults(pageSize);

		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<E> findByNamedQuery(String name, String param, Object value)
			throws MeetingException {
		Query query = null;
		try {

			query = getEntityManager().createNamedQuery(name);
			query.setParameter(param, value);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<E> findByNamedQuery(String name, String param, Object value,
			int first, int pageSize) throws MeetingException {
		Query query = getEntityManager().createNamedQuery(name);
		query.setParameter(param, value);

		query.setFirstResult(first);
		query.setMaxResults(pageSize);

		return query.getResultList();
	}

	@SuppressWarnings("rawtypes")
	public List findByNamedQueryRaw(String name) throws MeetingException {
		Query query = getEntityManager().createNamedQuery(name);
		return query.getResultList();
	}

	@SuppressWarnings("rawtypes")
	public List findByNamedQueryRaw(String name, int first, int pageSize)
			throws MeetingException {
		Query query = getEntityManager().createNamedQuery(name);

		query.setFirstResult(first);
		query.setMaxResults(pageSize);

		return query.getResultList();
	}

	@SuppressWarnings("rawtypes")
	public List findByNamedQueryRaw(String name, Map<String, Object> params)
			throws MeetingException {
		Query query = getEntityManager().createNamedQuery(name);

		for (Entry<String, Object> param : params.entrySet()) {
			query.setParameter(param.getKey(), param.getValue());
		}

		return query.getResultList();
	}

	@SuppressWarnings("rawtypes")
	public List findByNamedQueryRaw(String name, Map<String, Object> params,
			int first, int pageSize) throws MeetingException {
		Query query = getEntityManager().createNamedQuery(name);

		for (Entry<String, Object> param : params.entrySet()) {
			query.setParameter(param.getKey(), param.getValue());
		}

		query.setFirstResult(first);
		query.setMaxResults(pageSize);

		return query.getResultList();
	}

	@SuppressWarnings("rawtypes")
	public List findByNamedQueryRaw(String name, String param, Object value)
			throws MeetingException {
		Query query = getEntityManager().createNamedQuery(name);
		query.setParameter(param, value);
		return query.getResultList();
	}

	@SuppressWarnings("rawtypes")
	public List findByNamedQueryRaw(String name, String param, Object value,
			int first, int pageSize) throws MeetingException {
		Query query = getEntityManager().createNamedQuery(name);
		query.setParameter(param, value);

		query.setFirstResult(first);
		query.setMaxResults(pageSize);

		return query.getResultList();
	}

	public List<? extends Object> findByNativeQuery(String qry)
			throws MeetingException {
		return findByNativeQuery(qry, null);
	}

	@SuppressWarnings("unchecked")
	public List<? extends Object> findByNativeQuery(String qry,
			List<Object> params) throws MeetingException {
		Query query = getEntityManager().createNativeQuery(qry);
		if (params != null && params.size() > 0) {
			for (int i = 0; i < params.size(); i++) {
				query.setParameter(i + 1, params.get(i));
			}
		}
		return query.getResultList();
	}

	public void flush() throws MeetingException {
		getEntityManager().flush();
	}

	public E merge(E entity) throws MeetingException {
		return getEntityManager().merge(entity);
	}

	public void persist(E entity) throws MeetingException {
		try {
			System.out.println("Enity:::::"+entity);
			getEntityManager().persist(entity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void persist(E entity,int index) throws MeetingException {
		try {
			getEntityManager().persist(entity);
			/*
			if(index%50 == 0){
				getEntityManager().flush();
				getEntityManager().clear();
			}*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void refresh(E entity) throws MeetingException {
		getEntityManager().refresh(entity);
	}

	public void remove(E entity) throws MeetingException {
		getEntityManager().remove(entity);
	}

	public Object findSingleResult(String name) throws MeetingException {
		// Query jpaQuery = getEntityManager().createQuery(query);
		Query jpaQuery = getEntityManager().createNamedQuery(name);
		return ((Object) jpaQuery.getSingleResult());
	}

	public Object findSingleResult(String name, Map<String, Object> params)
			throws MeetingException {
		Query query = getEntityManager().createNamedQuery(name);
		for (Entry<String, Object> param : params.entrySet()) {
			query.setParameter(param.getKey(), param.getValue());
		}
		return (Object) query.getSingleResult();
	}

	public int executeUpdate(String query, Map<String, Object> params)
			throws MeetingException {
		Query jpaQuery = getEntityManager().createQuery(query);
		if (params != null) {
			for (Entry<String, Object> param : params.entrySet()) {
				jpaQuery.setParameter(param.getKey(), param.getValue());
			}
		}
		return jpaQuery.executeUpdate();

	}

	public int executeUpdate(String query) throws MeetingException {
		return executeUpdate(query, null);
	}

	public int executeUpdateByNamedQuery(String name) throws MeetingException {
		Query query = getEntityManager().createNamedQuery(name);
		return query.executeUpdate();
	}

	public int executeUpdateByNamedQuery(String name, Map<String, Object> params)
			throws MeetingException {
		Query jpaQuery = getEntityManager().createNamedQuery(name);
		if (params != null) {
			for (Entry<String, Object> param : params.entrySet()) {
				jpaQuery.setParameter(param.getKey(), param.getValue());
			}
			return jpaQuery.executeUpdate();
		}
		return executeUpdateByNamedQuery(name);
	}

	public Long findTotalPagesByFilters(StringBuilder countQuery,
			Map<String, Object> params) throws MeetingException {
		Query jpaCountQuery = getEntityManager().createQuery(
				countQuery.toString());
		if (params != null) {
			for (Entry<String, Object> param : params.entrySet()) {
				jpaCountQuery.setParameter(param.getKey(), param.getValue());
			}
		}
		return (Long) jpaCountQuery.getSingleResult();
	}
	//@Transactional
	public void saveChannelsExMessage(int channel_id,int sequenceNo, String httpmessagepath, String localmessagepath, String created_by){
		//getEntityManager().getTransaction().begin();
		Query query = getEntityManager().createNativeQuery("INSERT INTO exmessage(  channel_id  ,sequenceNo  ,httpmessagepath  ,localmessagepath  ,created_by   ,active) VALUES (  1   ,2   ,'111'  ,'www'  ,'amit'    ,1 )");
		query = getEntityManager().createQuery("Select em from ExMessage");
	       /* query.setParameter(1, channel_id);
	        query.setParameter(2, sequenceNo);
	        query.setParameter(3, "xx");
	        query.setParameter(4, "yy");
	        query.setParameter(5, created_by);
	        query.setParameter(6, 1);*/
	        //query.executeUpdate();
	        List ls = query.getResultList();
	        System.out.println("size :: "+ls.size());
	       // getEntityManager().getTransaction().commit();
	        //query.
	        try{
	        	/*EntityTransaction trx = getEntityManager().getTransaction();
	        	trx.begin();*/
	        ExMessage entity = new ExMessage();
	        entity.setSequenceNo(1233);
	        getEntityManager().persist(entity);
	       /* trx.commit();
	        getEntityManager().flush();*/
	        System.out.println("id ::"+entity.getId());
	        }catch(Exception e){
	        	e.printStackTrace();
	        }
	        
	}
}