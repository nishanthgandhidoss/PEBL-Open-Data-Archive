package com.erp.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import com.erp.service.CommonService;
public class PasswordEncoderGenerator {

	public static void main(String[] args) throws Exception {

		int i = 0;
		while (i < 10) {
			String password = "malliga.G26";
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String hashedPassword = passwordEncoder.encode(password);

			System.out.println(hashedPassword);
			i++;
		}
		
		/*CommonService commonService = new CommonService();
		String nextNo = commonService.getNextNo(TableNames.TBL_GRN, "GRN_NO", (long) 1, Constants.GRN_PREFIX);
		System.out.println(nextNo);*/
	
	}
}