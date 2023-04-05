import controller.DangNhapServlet;
import controller.LichHocServlet;
import junit.framework.TestCase;
import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.io.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class XemLichHocTest {

    @Test
    void testGet() throws ServletException, IOException {
        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        when(request.getParameter("idlhp")).thenReturn("001");
        when(request.getParameter("tenlhp")).thenReturn("D18-001");
        RequestDispatcher rd = mock(RequestDispatcher.class);
        when(request.getRequestDispatcher("gdLichHoc.jsp")).thenReturn(rd);
        when(request.getSession()).thenReturn(session);

        try {
            new LichHocServlet().doGet(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        verify(rd).forward(request, response);
    }
}
