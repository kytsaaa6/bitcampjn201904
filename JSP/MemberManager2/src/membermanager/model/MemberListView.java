package membermanager.model;

import java.util.List;

public class MemberListView {

	
	private int memberTotalCount;
	private int currentPageNumber;
	private List<MemberInfo> memberList;
	private int pageTotalCount;
	private int memberCountPerPage;
	private int firstRow;
	private int endRow;
	
	
	public MemberListView(int memberTotalCount, int currentPageNumber, List<MemberInfo> memberList,
			int memberCountPerPage, int firstRow, int endRow) {
		super();
		this.memberTotalCount = memberTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.memberList = memberList;
		this.memberCountPerPage = memberCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calcuratePageTotalCount();
	}


	private void calcuratePageTotalCount() {
		
		if(memberTotalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = memberTotalCount / memberCountPerPage;
			if(memberTotalCount % memberCountPerPage > 0) {
				pageTotalCount++;
			}
			
		}
	}


	public int getMemberTotalCount() {
		return memberTotalCount;
	}


	public int getCurrentPageNumber() {
		return currentPageNumber;
	}


	public List<MemberInfo> getMemberList() {
		return memberList;
	}


	public int getPageTotalCount() {
		return pageTotalCount;
	}


	public int getMemberCountPerPage() {
		return memberCountPerPage;
	}


	public int getFirstRow() {
		return firstRow;
	}


	public int getEndRow() {
		return endRow;
	}
	
	public boolean isEmpty() {
		return memberTotalCount == 0;
	}
	
	
}
