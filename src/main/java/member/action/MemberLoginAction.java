package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.MemberLoginService;
import vo.ActionForward;
import vo.Member;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		Member member = new Member();
		HttpSession session = request.getSession();

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		member.setMember_id(id);
		member.setMember_pw(pw);

		MemberLoginService memberLoginService = new MemberLoginService();

		boolean loginResult = memberLoginService.login(member);
		System.out.println("loginResult:"+loginResult);
		if (loginResult) {
			forward = new ActionForward();
			session.setAttribute("member_id", member.getMember_id());
			forward.setPath("./gonguListHome.go");
			forward.setRedirect(true);
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 실패')");
			out.println("history.back();");
			out.println("</script>");

		}

		return forward;
	}

}
