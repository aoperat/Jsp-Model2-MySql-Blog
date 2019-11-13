package com.cos.util;

public class test {

	public static void main(String[] args) {
		byte b = 117;

		
		//byte 를 String 으로
		String s = Integer.toString(b);
		System.out.println(s);
		
		
		//END 연산이란 ? 
		
		//Test 비트 연산
		//00000000 00000000 00000000 00000001 = int
		//00000000 00000000 00000000 00000001 = binary
		int i = 1;
		System.out.println(Integer.toBinaryString(i));
		
		// 00000000 00000000 00000000 10010110 = int
		// 11111111 11111111 11111111 10010110 = binary
		// 00000000 00000000 00000000 11111111 = 0xff
		int j = 150;
		System.out.println(Integer.toBinaryString(j));
		
		System.out.println(Integer.toBinaryString((byte)j & 0xff));

	}
}
