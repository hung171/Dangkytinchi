import controller.DangNhapServlet;
import org.junit.jupiter.api.Test;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.io.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class DangNhapTest {
    @Test
    void testDangNhap() {
        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        when(request.getParameter("username")).thenReturn("hieudh");
        when(request.getParameter("password")).thenReturn("123");
        when(request.getSession()).thenReturn(session);
        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        try {
            when(response.getWriter()).thenReturn(writer);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        try {
            new DangNhapServlet().doPost(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        verify(request, atLeast(1)).getParameter("username"); // only if you want to verify username was called...

        writer.flush(); // it may not have been flushed yet...
        String result = stringWriter.getBuffer().toString().trim();
        assertEquals("Login successful...", result);
    }
}
