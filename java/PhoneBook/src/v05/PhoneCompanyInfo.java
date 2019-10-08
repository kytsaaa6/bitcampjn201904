package v05;

public class PhoneCompanyInfo extends PhoneInfo{
	
	String company;
	String email;
	
	public PhoneCompanyInfo(
			String name, 
			String phoneNumber, 
			String company, 
			String email) {
		
		super(name, phoneNumber);
		
		this.company = company;
		this.email = email;
	}
	
	
	public void showData() {
		super.showData();
		System.out.println("회사이름 : " + company);
		System.out.println("이메일 : " + email);
	}


	@Override
	public void showBasicInfo() {

		System.out.printf("회사 동료 %s의 정보 입니다.\n",this.name);
		System.out.println("전화번호는 " + this.phoneNumber + "입니다.");
		
	
		
	}
	
	
	
	
	
	
	
	
	

}
