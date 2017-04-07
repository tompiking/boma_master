package com.qingke.boma.exception;

/**
 * 
 * @time 下午7:33:44
 * @Description 自定义异常
 */
public class BomaException extends Exception{
	/**
	 * @Description: serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;
	private String message;
	public BomaException(String message) {
		super();
		this.message = message;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
