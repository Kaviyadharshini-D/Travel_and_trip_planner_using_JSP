import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/VisitCounterServlet")
public class VisitCounterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the user's session or create a new one if it doesn't exist
        HttpSession session = request.getSession();

        // Get the current visit count or initialize it to 1 if it's the first visit
        Integer visitCount = (Integer) session.getAttribute("visitCount");
        if (visitCount == null) {
            visitCount = 1;
        } else {
            visitCount++;
        }

        // Update the session attribute with the new visit count
        session.setAttribute("visitCount", visitCount);

        // Prepare the response
        response.setContentType("text/html");
        response.getWriter().println("<h1>Visit Counter</h1>");
        response.getWriter().println("<p>You have visited this site " + visitCount + " time(s).</p>");
    }
}
