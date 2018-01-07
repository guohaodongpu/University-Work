package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserLoginFilter implements Filter {
    public void destroy() {
        
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        String requesturi = httpServletRequest.getRequestURI();
        HttpSession session = httpServletRequest.getSession();
        Object currentUser = session.getAttribute("user");
        if (currentUser == null
                && !requesturi.endsWith("/login.do")
                && !requesturi.endsWith("/logout.do")
                && !requesturi.endsWith("/login.jsp")
                && !requesturi.endsWith(httpServletRequest.getContextPath()
                        + "/")
                        ) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/login.jsp");
            return;
        }
        chain.doFilter(request, response);
    }
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }
}
