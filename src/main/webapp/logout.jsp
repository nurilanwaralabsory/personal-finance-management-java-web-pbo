<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Invalidate the session
    session.invalidate();
    
    // Redirect to index (which might redirect to login later if Auth is implemented)
    // Or redirect to a login page if it existed.
    response.sendRedirect("index.jsp");
%>
