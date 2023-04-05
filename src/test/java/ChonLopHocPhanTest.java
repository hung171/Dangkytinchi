import controller.ChonLopHocPhanServlet;
import dao.LopHocPhanDAO;
import model.LopHocPhan;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.io.*;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;
public class ChonLopHocPhanTest {
    @Mock
    RequestDispatcher rd;
    @Test
    void testChonLopHocPhan() throws ServletException, IOException {
        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        when(request.getParameter("idmhkh")).thenReturn("1");
        when(request.getSession()).thenReturn(session);
        when(request.getRequestDispatcher("/gdChonLopHocPhan.jsp")).thenReturn(rd);
        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        try {
            when(response.getWriter()).thenReturn(writer);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        try {
            new ChonLopHocPhanServlet().doGet(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

        ArrayList<LopHocPhan> listLopHocPhan = new LopHocPhanDAO().getLHPchoSVdangki(1);

//        verify(request, atLeast(1)).getParameter("listLopHocPhan"); // only if you want to verify username was called...
        verify(session).setAttribute("listLopHocPhan", "abhinav");
        verify(rd).forward(request, response);
        writer.flush(); // it may not have been flushed yet...
        String result = stringWriter.getBuffer().toString().trim();
        assertEquals("Login successful...", result);
    }
}
