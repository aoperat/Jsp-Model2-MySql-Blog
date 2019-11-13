package com.cos.util;

import java.security.MessageDigest;

//256bit 길이의 암호 = 해시 = 복호화 안됨
public class SHA256 {

	// password를 암호화해서 return

	public static String getEncrypt(String rawPassword, String salt) {

		/*
		 * // rawPassword = "qw5678qw"; //-> 바이트 배열에 저장 //salt = "cos";
		 * // [q, w, 5, 6, 7, 8, q, w] byte[] a = rawPassword.getBytes(); byte[] b = new
		 * byte[a.length +salt.length()]; // 배열의 크기 = 11 //배열을 복사 !

		 */
		String result = "";
		byte[] b = (rawPassword + salt).getBytes();

		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256"); // 싱글톤이란!!!???
			md.update(b); //MessageDigest가 SHA-256 으로 암호화된 값을 가지고 있음.
			
			byte[] bResult = md.digest();
			
//			for(byte data : bResult) {
//				System.out.print(data + " ");
//			}
//			System.out.println();
			
			
			StringBuffer sb = new StringBuffer();
			for (byte data : bResult) {
				sb.append(Integer.toString(data & 0xff, 16 ));
			}
			result = sb.toString();
//			System.out.println("16진수 값 : " + result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public static void main(String[] args) {
		getEncrypt("qw5678qw", "cos");
	}
}
