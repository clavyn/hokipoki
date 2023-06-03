package member.action;



import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.IdCheckService;
import vo.ActionForward;

public class MemberIdCheckAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	ActionForward forward = null;
    	boolean flag =false;
    	HttpSession session = request.getSession();
    	
    	String id =request.getParameter("id");
    	
    	IdCheckService idCheckService = new IdCheckService();
    	
    	flag = idCheckService.dupCheck(id);
    	System.out.println(flag);
    	response.setContentType("text/html;charset=utf-8");
    	PrintWriter out =response.getWriter();
    	if(flag) {    		
    		request.setAttribute("useable", "no");
    		
    	}else {
    		request.setAttribute("useable", "yes");
    		request.setAttribute("chkId", id);
    		
    	}
    	
    	forward = new ActionForward("/member/memberIdcheckForm.jsp", false);
    	
    	return forward;
    	

   }

}
