package com.qingke.boma.util;

import java.util.regex.Pattern;

public class CheckMethod {
	
	public static String validatePassword(String password) {
		// 1.length>5
		Pattern lengthPattern = Pattern.compile("[0-9a-zA-Z]{6,}");
		if (!lengthPattern.matcher(password).find()) {
			return "密码长度至少要6位以上!";
		}
		// 2.not all number
		Pattern numPattern = Pattern.compile("[0-9]+");
		if (numPattern.matcher(password).matches()) {
			return "密码不能为全部数字!";
		}
		// 3.not all word
		Pattern wordPattern = Pattern.compile("[a-zA-Z]+");
		if (wordPattern.matcher(password).matches()) {
			return "密码不能为全部字母";
		}
		return "ok";
	}

}
