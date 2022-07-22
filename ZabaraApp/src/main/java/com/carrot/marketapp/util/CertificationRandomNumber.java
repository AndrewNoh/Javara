package com.carrot.marketapp.util;

import java.util.Random;

public class CertificationRandomNumber {

	private static int size = 20;

	// 이메일 난수 만드는 메서드
	public static String random() {
		Random ran = new Random();
		StringBuffer buf = new StringBuffer();
		int num = 0;
		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				buf.append((char) num);// 숫자, 영문자만
			} else
				continue;
		} while (buf.length() < size); // 20글자

		return buf.toString();
	}
}
