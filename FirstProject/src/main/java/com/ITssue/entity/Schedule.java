package com.ITssue.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Schedule {

	private int sche_no;
	private String sche_content;
	private String sche_s_dt;
	private String sche_e_dt;
	private String id;
	
}
