package com.cos.util;
	
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


//메일로 접근(사용)할 때 인증 : 구글 아이디. 구글 비밀번호
/*
 * 메일로 접근(사용)할 때
 * 
 * 인증시 필요한것 : 아이디, 비밀번호
 */
public class Gmail extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("aoperat@gmail.com", Password.GOOGLEPASSWORD);
	}
}