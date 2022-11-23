package com.ssafy.user.email;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService{
	@Autowired
	private JavaMailSender javaMailSender;
	
	public String sendMail(String userEmail) {
		System.out.println("sendMail >> 01");
//		수신대상을 담을 ArrayList생성
//		ArrayList<String> toUserList = new ArrayList<String>();
		
//		수신 대상 추가
//		toUserList.add("");
		String target = userEmail;
		System.out.println("sendMail >> 02");
		
		char[] specials =  {'$','@','$','!','%','*','#','?','&'};
		int leftLimit = 48; // numeral '0'
		int rightLimit = 122; // letter 'z'
		int targetStringLength = 13;
		Random random = new Random();
		char rand = specials[(int)Math.floor((Math.random() * 100)/9)];
		System.out.println("rand >>>>>>>>>>>>>> " + rand);
		String generatedString = random.ints(leftLimit,rightLimit + 1)
		  .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
		  .limit(targetStringLength)
		  .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
		  .toString();

		char[] newPass = new char[14];
		for (int j = 0; j < 13; j++) {
			newPass[j] = generatedString.charAt(j);
		}
		newPass[13] = rand;
		String newString = new String(newPass);
		System.out.println(">>>>>>>>>>>>>>>> " + newString);
		
//		수신 대상 개수
//		int toUserSize = toUserList.size();
		
//		SimpleMailMessage 단순 텍스트 구성 메일 메시지 생성
		SimpleMailMessage simleMessage = new SimpleMailMessage();
		System.out.println("sendMail >> 03");
		
//		main receiver
		simleMessage.setTo(target);
		
//	 	mail title
		simleMessage.setSubject("SMTP GOOGLE EMAIL TEST");
		System.out.println("sendMail >> 04");
//		main content
		simleMessage.setText("SMTP GOOGLE EMAIL TEST CONTENT >>>> " + newString);
		System.out.println("sendMail >> 05");
		
		javaMailSender.send(simleMessage);
		System.out.println("sendMail >> 06");
		
		return newString;
	}
	
}