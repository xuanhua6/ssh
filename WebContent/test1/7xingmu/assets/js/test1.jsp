
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
    <body>
    	 <%
    		String uname = request.getParameter("username");
    		String pwd = request.getParameter("password");
    		String yes = request.getParameter("yes");
    		String up = uname+"@"+pwd;

    		if(uname.equals(pwd)){
    			if(yes!=null){
    				Cookie un = new Cookie("up",up);
    				un.setMaxAge(60*60);
  					response.addCookie(un);
  					out.print(un);
  					out.print("欢迎");
  				}else{
  					out.print("欢迎");
  				}
    			}else{
    			out.print("登录失败");
   			 }
    //response.sendRedirect("matter5.jsp");
     
     %>
 	</body>
</html>