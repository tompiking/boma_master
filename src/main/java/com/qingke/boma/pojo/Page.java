package com.qingke.boma.pojo;

public class Page {
	// 一共有几页
	private Integer totalPage;
	// 当前页码
	private Integer currentPage;
	// 总信息数
	private Integer totalAmount;
	// 每页显示几条
	private Integer pageAmount;
	// 当前显示位置
	private Integer currentPosition;
	
	public Page() {
		currentPosition = 1;
	}

	public Integer getTotalPage() {
		if (totalPage == null) {
			totalPage = totalAmount % pageAmount == 0 ? totalAmount / pageAmount : (totalAmount / pageAmount + 1);
		}
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Integer getPageAmount() {
		return pageAmount;
	}

	public void setPageAmount(Integer pageAmount) {
		this.pageAmount = pageAmount;
	}

	public Integer getCurrentPosition() {
		return (currentPage - 1) * pageAmount;
	}

	public void setCurrentPosition(Integer currentPosition) {
		this.currentPosition = currentPosition;
	}

}
