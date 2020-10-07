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
		            		 new DefaultFileRenamePolicy() );//���Ͼ��ε� �Ϸ�
			
			String oriname="";
			String sysname="";
			Enumeration files = mrequest.getFileNames();
			while(files.hasMoreElements()){
				String fname=(String)files.nextElement();
				oriname = mrequest.getOriginalFileName(fname);
				// ���ε� �� �� ���� ���ϸ�
				sysname = mrequest.getFilesystemName(fname);
				// ������ ����� ���ϸ�
				// �̸��� �ߺ��Ǵ°��� �����ϱ� ���ؼ� renamepolicy�� �����ߴ�.
				// �׷� ������ ���� �̸��� ���� ������ �����ϸ� ���ϸ�+���� ���·������.
			}
			
			System.out.println("���� ���ϸ�"+oriname+"<br>");
			System.out.println("����� ���ϸ�"+sysname+"<br>");
			
			
		}catch(IOException ioe){
			ioe.printStackTrace();
			System.out.println ("����� ����");
			//response.sendRedirect("resiter.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

}
