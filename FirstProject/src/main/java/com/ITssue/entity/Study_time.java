package com.ITssue.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Study_time {
	private int stud_no;
	private String study_s_time;
	private String study_e_time;
	private String id;
	private String amounts;
}
