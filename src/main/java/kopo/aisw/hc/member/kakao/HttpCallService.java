package kopo.aisw.hc.member.kakao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

@Repository
public class HttpCallService {

	public KakaoVO Call(String method, String reqURL, String header, String param) {
		String result = "";
		KakaoVO kakaoProfile;
		try {
			String response = "";
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod(method);
            conn.setRequestProperty("Authorization", header);
            if(param != null) {
            	System.out.println("param : " + param);
            	conn.setDoOutput(true);
                BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
                bw.write(param);
                bw.flush();            	
                
            }
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            
            //System.out.println("reqURL : " + reqURL);
            //System.out.println("method : " + method);
            //System.out.println("Authorization : " + header);            
			InputStream stream = conn.getErrorStream();
		    if (stream != null) {
			    try (Scanner scanner = new Scanner(stream)) {
			        scanner.useDelimiter("\\Z");
			        response = scanner.next();
			    }			
			    System.out.println("error response : " + response);
		    }
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			//System.out.println("response body : " + result);
			
			// ObjectMapper 생성
	        ObjectMapper mapper = new ObjectMapper();

	        // JSON 문자열을 KakaoAccount 객체로 매핑
	        kakaoProfile = mapper.readValue(result, KakaoVO.class);
	
			br.close();
		} catch (IOException e) {
			e.getMessage();
			return null; 
		}
		return kakaoProfile;
	}	
	
	public KakaoVO CallwithToken(String method, String reqURL, String access_Token) {
		return CallwithToken(method, reqURL, access_Token, null);
	}	
	
	public KakaoVO CallwithToken(String method, String reqURL, String access_Token, String param) {
		String header = "Bearer " + access_Token;
		return Call(method, reqURL, header, param);
	}		
}
