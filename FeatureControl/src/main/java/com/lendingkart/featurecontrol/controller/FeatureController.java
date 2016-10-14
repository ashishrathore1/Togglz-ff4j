package com.lendingkart.featurecontrol.controller;


import org.ff4j.FF4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.lendingkart.featurecontrol.model.FeatureContext;
import com.lendingkart.featurecontrol.model.FeatureThreadLocal;
import com.lendingkart.featurecontrol.model.ResponseBean;

@RestController
public class FeatureController {
	
	@Autowired
	FF4j ff4j;
	
	public static final String ACCESS_GRANTED = "{ \"access\" :true}";
	public static final String ACCESS_DENIED = "{ \"access\" :false}";
	Gson gson = new GsonBuilder().setPrettyPrinting().create();
	
	
	@RequestMapping(value={"/hello"},method = RequestMethod.GET)
	public String hello(){
		
		return "Hello";
	}
	
	@RequestMapping(value={"/"},method = RequestMethod.GET)
	public String index(){
		
		return "WELCOME TO FEATURE CONTROL";
	}
	
	
	/*For feature configured with username permission*/
	@RequestMapping(value="getPermission/{featureID}/{username}",method=RequestMethod.POST)
	public String getPermissionOnUsername(@PathVariable("featureID") String featureID,@PathVariable("username") String username){
		
		ResponseBean response = new ResponseBean();	
		FeatureContext fctxt = new FeatureContext();
		fctxt.setUsername(username);
		FeatureThreadLocal.set(fctxt);
		try{
			if(ff4j.exist(featureID) && ff4j.getFeature(featureID).isEnable()){
				if(ff4j.check(featureID)){
					response.setAccess("true");
					response.setMessage("success");
					response.setCode("200");
					return gson.toJson(response);
				}
			}
		}catch(Exception ex){
			response.setAccess("unknown");
			response.setMessage("Improper Request/ Internal server Error");
			response.setCode("500");
			return gson.toJson(response);
		}
		response.setAccess("false");
		response.setMessage("success");
		response.setCode("200");
		return gson.toJson(response);
	}
	
	
	/*for feature configured without username permission*/
	@RequestMapping(value="getPermission/{featureID}",method=RequestMethod.POST)
	public String getPermissionOnFeature(@PathVariable("featureID") String featureID){

		ResponseBean response = new ResponseBean();	
		try{
			if(ff4j.exist(featureID) && ff4j.getFeature(featureID).isEnable()){
				if(ff4j.check(featureID)){
					response.setAccess("true");
					response.setMessage("success");
					response.setCode("200");
					return gson.toJson(response);
				}
			}
		}catch(Exception ex){
			response.setAccess("unknown");
			response.setMessage("Improper Request/ Internal server Error");
			response.setCode("500");
			return gson.toJson(response);
		}
		response.setAccess("false");
		response.setMessage("success");
		response.setCode("200");
		return gson.toJson(response);
	}
	

}
