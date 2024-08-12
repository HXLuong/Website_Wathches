package com.java5.asm.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class MailerHelper {

	public String[] parseStringEmailToArray(String emails) {
		String[] emailArray = emails.split(",");
		for (int i = 0; i < emailArray.length; i++) {
			// Xóa khoảng trắng ở đầu và cuối của mỗi địa chỉ email
			emailArray[i] = emailArray[i].trim();
		}
		return emailArray;
	}

	public File convertMultipartFileToFile(MultipartFile multipartFile) throws IOException {
		File file = new File(multipartFile.getOriginalFilename());
		try (FileOutputStream fos = new FileOutputStream(file)) {
			fos.write(multipartFile.getBytes());
		}
		return file;
	}

}
