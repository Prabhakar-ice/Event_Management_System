

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import dao.EventDatabase;
import dao.EventQuery;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class imageclass
 */
@MultipartConfig
@WebServlet("/addeventurl")
public class addeventservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		String imagename = getimagename(request.getPart("image"));
		
		session.setAttribute("imagename", imagename);
		
		
		EventQuery addevent = new EventDatabase();
		int rows = addevent.addEvent(request, response);
		
		if(rows > 0){
			session.setAttribute("result","Event is Created");
			response.sendRedirect("results/adminsuccess.jsp");
		}
		else{
			session.setAttribute("result","There was an error creating your event. Please try again.");
			response.sendRedirect("results/adminfail.jsp");
		}
	}
	
	public String getimagename(Part image) {
		 // Get Event Details
        
		String filename = image.getSubmittedFileName();
		String uploadpath="C:/Users/prabh/eclipse workspace jee/Event_Management_System/src/main/webapp/images/";
		
		System.out.println("image add method");
		
		 File uploadDir = new File(uploadpath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdir();
	        }
	        
		try {
			
//			System.out.println(uploadpath+filename);
			
			FileOutputStream fos = new FileOutputStream(uploadpath+filename);
			InputStream is = image.getInputStream();
			
			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		 return filename;
	     
		 
	}
	

}
