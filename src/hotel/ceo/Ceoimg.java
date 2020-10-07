package hotel.ceo;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import hotel.HotelAction;
import hotel.HotelActionF;

public class Ceoimg implements HotelAction{

	@Override
	public HotelActionF execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String saveFolder=request.getRealPath("roomimg"); 
		int maxSize = 1024*1024*10;
		String encType="euc-kr";
		
		try{
			MultipartRequest mrequest 
		             = new MultipartRequest(
		            		 request,
		            		 saveFolder,
		            		 maxSize,
		            		 encType,
		            		 new DefaultFileRenamePolicy() );//파일업로드 완료
			
			String oriname="";
			String sysname="";
			Enumeration files = mrequest.getFileNames();
			while(files.hasMoreElements()){
				String fname=(String)files.nextElement();
				oriname = mrequest.getOriginalFileName(fname);
				// 업로드 할 때 원래 파일명
				sysname = mrequest.getFilesystemName(fname);
				// 실제로 저장된 파일명
				// 이름이 중복되는것을 방지하기 위해서 renamepolicy를 설정했다.
				// 그런 이유로 만일 이름이 같은 파일을 저장하면 파일명+숫자 형태로저장됨.
			}
			
			System.out.println("원래 파일명"+oriname+"<br>");
			System.out.println("저장된 파일명"+sysname+"<br>");
			
			
		}catch(IOException ioe){
			ioe.printStackTrace();
			System.out.println ("입출력 에러");
			//response.sendRedirect("resiter.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

}
