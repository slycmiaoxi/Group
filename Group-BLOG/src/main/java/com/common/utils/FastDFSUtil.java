package com.common.utils;

import org.springframework.web.multipart.MultipartFile;

import com.common.global.annotions.Constants;

public class FastDFSUtil {
	
	

	public static String uploadFile(MultipartFile picFile){
		/**空图片上传**/
		if(picFile.isEmpty())return null;
		//上传到图片服务器
				try {
					//取图片扩展名
					String originalFilename = picFile.getOriginalFilename();
					//取扩展名不要“.”
					String extName = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
					FastDFSClientUtil client = new FastDFSClientUtil("classpath:mybatis/client.conf");
					String url = client.uploadFile(picFile.getBytes(), extName);
					//把url响应给客户端
					url=Constants.BASE_URL+url;
					return url;
				} catch (Exception e) {
					return null;
				}
	}
	
}
