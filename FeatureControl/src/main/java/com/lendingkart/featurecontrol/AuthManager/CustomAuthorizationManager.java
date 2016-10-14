package com.lendingkart.featurecontrol.AuthManager;


import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.ff4j.security.AuthorizationsManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.lendingkart.featurecontrol.model.FeatureContext;
import com.lendingkart.featurecontrol.model.FeatureThreadLocal;

public class CustomAuthorizationManager implements AuthorizationsManager {
	  	
	    JdbcTemplate jdbcTemplate;
		
	    @Autowired
		public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
			this.jdbcTemplate = jdbcTemplate;
		}

	  /** {@inheritDoc} */
	  @Override
	  public Set<String> getCurrentUserPermissions() { 
		  FeatureContext featureContext = FeatureThreadLocal.get();
		  String currentUser = featureContext.getUsername();
		  String SQL = "select ROLE from FF4J_USER_ROLES where username=?";
		  List<String> rolesList =jdbcTemplate.queryForList(SQL,String.class,currentUser);
		  return (rolesList.size()==0)?new HashSet<String>():new HashSet<String>(rolesList);
		  
	  }

	  /** {@inheritDoc} */
	  @Override
	  public Set<String> listAllPermissions() {

		  String SQL = "select ROLE from FF4J_USER_ROLES";
		  List<String> allrolesList =jdbcTemplate.queryForList(SQL,String.class);
		  return (allrolesList.size()==0)?new HashSet<String>(allrolesList):new HashSet<String>();
	  }

	  @Override
	  public String toJson() {
		  // TODO Auto-generated method stub
		  return null;
	  }


	

	  
	
}
