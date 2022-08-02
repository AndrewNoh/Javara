package com.carrot.marketapp.util;

import java.text.DecimalFormat;

public class CHANGE_UTIL {
	private static DecimalFormat decimalFormat = new DecimalFormat("#,###");

	//원과 , 를 제거하고 int로 변경
	public static int wonToInt(String data) {
		return Integer.valueOf(data.substring(0, data.length() - 1).replaceAll(",", ""));
	}
	
	//숫자를 원과 ,를 붙임
	public static String intToWon(String data) {
		return decimalFormat.format(Integer.parseInt(data)) + "원";
	}
	
	//숫자에 ,만 붙임	
    public static String intToComma(String data){
        return  decimalFormat.format(Long.valueOf(data.replaceAll(",","")));
    }
}
