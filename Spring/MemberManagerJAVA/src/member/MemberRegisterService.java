package member;

import java.util.Date;

public class MemberRegisterService {

	
	private MemberDao memberdao;
	
	public MemberRegisterService (MemberDao memberDao) {
		this.memberdao = memberDao;
	}
	
	public void regist(RegisterRequest request) throws AleadyExstingMemberException {
		
		Member member = memberdao.selectByEmail(request.getEmail());
		
		if(member != null) {
			throw new AleadyExstingMemberException();
		}
		
		Member newMember = new Member(request.getEmail(), request.getPassword(), request.getName(),new Date());
		
		memberdao.insert(newMember);
	}
}
