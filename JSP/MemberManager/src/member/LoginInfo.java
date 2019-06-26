package member;

public class LoginInfo {

	private String uId;
	private String uName;
	private String uPhoto;
	
	public LoginInfo(String uId, String uName, String uPhoto) {
		super();
		this.uId = uId;
		this.uName = uName;
		this.uPhoto = uPhoto;
	}

	public String getuId() {
		return uId;
	}

	public String getuName() {
		return uName;
	}

	public String getuPhoto() {
		return uPhoto;
	}

	@Override
	public String toString() {
		return "LoginInfo [uId=" + uId + ", uName=" + uName + ", uPhoto=" + uPhoto + "]";
	}

	
	
	
}
