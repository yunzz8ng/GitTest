package common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public class FormEx2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FormEx2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//여러장 할때는 session / application 변수 활용
		
		String[] hobbys = request.getParameterValues("hobby");
		String majors = request.getParameter("major");
		String protocol = request.getParameter("protocol");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html><head></head><body>");
		writer.println("이름: " + name + "<br>");
		writer.println("아이디: " + id + "<br>");
		writer.println("비밀번호: " + pw + "<br>");
		writer.println("취미: " + Arrays.toString(hobbys) + "<br>");
		writer.println("전공: " + majors + "<br>");
		writer.println("프로토콜: " + protocol + "<br>");
		writer.println("</body></html>");
	}

}
