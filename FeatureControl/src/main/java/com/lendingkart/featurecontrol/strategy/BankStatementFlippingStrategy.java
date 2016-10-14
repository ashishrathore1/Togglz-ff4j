package com.lendingkart.featurecontrol.strategy;

import java.util.Map;

import org.ff4j.core.FeatureStore;
import org.ff4j.core.FlippingExecutionContext;
import org.ff4j.strategy.AbstractFlipStrategy;

public class BankStatementFlippingStrategy extends AbstractFlipStrategy{

	@Override
	public void init(String featureName, Map<String, String> initParam) {
		
		super.init(featureName, initParam);
	}
	
	@Override
	public boolean evaluate(String arg0, FeatureStore arg1, FlippingExecutionContext arg2) {
		
		return false;
	}

}
