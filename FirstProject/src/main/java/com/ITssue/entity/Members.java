package com.ITssue.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Members {

	private String id;
	private String pw;
	private String birth;
	private String nick;
	private String joindate;
	private String mb_type;
	
}
