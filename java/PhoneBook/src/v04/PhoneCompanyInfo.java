package v04;

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
	
	
	
	
	
	
	
	
	

}
