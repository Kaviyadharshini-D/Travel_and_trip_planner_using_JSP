import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/HelloWorldServlet")
public class SERVELET extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the content type and get the session
        response.setContentType("text/html");
        HttpSession session = request.getSession();

        // Get the host name
        String hostName = request.getServerName();

        // Get the session ID
        String sessionId = session.getId();

        // Create the HTML response
        String htmlResponse = "<html><head><title>Hello, World Servlet</title></head><body>";
        htmlResponse += "<h1>Hello, World!</h1>";
        htmlResponse += "<p>Host Name: " + hostName + "</p>";
        htmlResponse += "<p>Session ID: " + sessionId + "</p>";
        htmlResponse += "</body></html>";

        // Write the HTML response to the browser
        response.getWriter().write(htmlResponse);
    }
}
