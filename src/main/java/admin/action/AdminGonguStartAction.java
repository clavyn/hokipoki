package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import admin.svc.AdminGonguSetStatusService;
import vo.ActionForward;
import vo.Gongu;

public class AdminGonguStartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("loginId")==null || session.getAttribute("loginId").equals("") || 
				session.getAttribute("loginAuthor") == null || (int)session.getAttribute("loginAuthor") > 1) {
			//로그인 이동
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('권한이 없습니다. 다시 로그인해주세요');");
			out.print("location.href='adminLogin.ad';");
			out.print("</script>");

		}else{//권한이 있다면
		
			AdminGonguSetStatusService adminGonguSetStatusService = new AdminGonguSetStatusService();
			
			ArrayList<Gongu> startGonguList = adminGonguSetStatusService.startGonguAll();
			
			String startMsg = "";
			
			if(startGonguList.size() > 0) {
				
			   for(int i=0; i<startGonguList.size();i++) {
				   String gonguName = startGonguList.get(i).getGongu_name();
				   startMsg += gonguName + "\n";
			   }
				
				request.setAttribute("startMsg", startMsg);
				forward = new ActionForward("adminGonguListAction.ad?alert=start", false);
				
			}else if(startGonguList.size() == 0){
				
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('오늘 시작될 공구가 없습니다.');");
				out.print("location.href='adminGonguListAction.ad';");
				out.print("</script>");
				
			}else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('공구일괄시작에 오류가 발생했습니다. 다시 시도해주세요.');");
				out.print("location.href='adminGonguListAction.ad';");
				out.print("</script>");
			}
			 
			
		}
		
		return forward;
	}

}
