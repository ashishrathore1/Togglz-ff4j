package com.lendingkart.hello;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.ff4j.FF4j;
import org.ff4j.security.AuthorizationsManager;
import org.junit.Test;

import com.lendingkart.featurecontrol.AuthManager.CustomAuthorizationManager;
import com.lendingkart.featurecontrol.model.FeatureContext;
import com.lendingkart.featurecontrol.model.FeatureThreadLocal;

public class HelloTest {

	@Test
	public void sampleSecurityTest() {

	 // Create FF4J
	 FF4j ff4j = new FF4j("ff4j.xml");

	 // Add the Authorization Manager Filter
	/* AuthorizationsManager authManager = new CustomAuthorizationManager();
	 ff4j.setAuthorizationsManager(authManager);
	 FeatureContext fctxt = new FeatureContext();
	 fctxt.setUsername("ashish");
	 FeatureThreadLocal.set(fctxt);
	 // Given : Feature exist and enable 
	 assertTrue(ff4j.exist("bankstatement"));
	 assertTrue(ff4j.getFeature("bankstatement").isEnable());*/

	 // Unknow user does not have any permission => check is false 
	 /*System.out.println(authManager.getCurrentUserPermissions());
	 assertFalse(ff4j.check("bankstatement"));*/

	 // userB exist bit he has not role Admin
	 /*CustomAuthorizationManager.currentUserThreadLocal.set("userB");
	 System.out.println(authManager.getCurrentUserPermissions());
	 assertFalse(ff4j.check("sayHello"));*/

	 /*// userA is admin
	 CustomAuthorizationManager.currentUserThreadLocal.set("userA");
	 System.out.println(authManager.getCurrentUserPermissions());
	 assertTrue(ff4j.check("sayHello"));*/
	}
	
}
