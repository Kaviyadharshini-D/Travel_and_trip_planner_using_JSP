<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Grade Calculation</title>
</head>
<body>
    <h1>Student Grade Calculation</h1>

    <%
        String action = request.getParameter("action");

        if (action == null || action.isEmpty() || action.equals("index")) {
    %>
        <!-- Index Page: Enter Subject Marks -->
        <form action="?action=calculate" method="post">
            <label for="maths">Maths:</label>
            <input type="number" name="maths" required><br>
            
            <label for="science">Science:</label>
            <input type="number" name="science" required><br>
            
            <label for="english">English:</label>
            <input type="number" name="english" required><br>
            
            <input type="submit" value="Calculate Grade">
        </form>

    <%
        } else if (action.equals("calculate")) {
            int maths = Integer.parseInt(request.getParameter("maths"));
            int science = Integer.parseInt(request.getParameter("science"));
            int english = Integer.parseInt(request.getParameter("english"));
            
            int totalMarks = maths + science + english;
    %>
        <!-- Calculate Page: Determine Eligibility for Grade Calculation -->
        <p>Total Marks: <%= totalMarks %></p>
        
        <%
            if (maths >= 80 && science >= 80 && english >= 80) {
        %>
                <p>Congratulations! You are eligible for grade calculation.</p>
                <form action="?action=calculateGrade" method="post">
                    <input type="hidden" name="totalMarks" value="<%= totalMarks %>">
                    <input type="submit" value="Calculate Grade">
                </form>
        <%
            } else {
        %>
                <p>Grade cannot be calculated. You have failed in one or more subjects.</p>
                <a href="?action=index">Go back</a>
        <%
            }
        %>

    <%
        } else if (action.equals("calculateGrade")) {
            int totalMarks = Integer.parseInt(request.getParameter("totalMarks"));
            String grade;

            if (totalMarks >= 240) {
                grade = "A";
            } else if (totalMarks >= 180) {
                grade = "B";
            } else if (totalMarks >= 120) {
                grade = "C";
            } else {
                grade = "F";
            }
    %>
        <!-- Calculate Grade Page: Display Calculated Grade -->
        <p>Total Marks: <%= totalMarks %></p>
        <p>Grade: <%= grade %></p>
    <%
        }
    %>

</body>
</html.>
