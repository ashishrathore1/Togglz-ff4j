package com.lendingkart.featurecontrol.model;

public class FeatureThreadLocal {

	public static final ThreadLocal<FeatureContext> userThreadLocal = new ThreadLocal<FeatureContext>();
	
	public static void set(FeatureContext user) {
		userThreadLocal.set(user);
	}

	public static void unset() {
		userThreadLocal.remove();
	}

	public static FeatureContext get() {
		return (FeatureContext) userThreadLocal.get();
	}
	
}
