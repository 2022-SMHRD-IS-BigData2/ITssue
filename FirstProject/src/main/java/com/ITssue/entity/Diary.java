package com.ITssue.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Diary {

	private int diary_no;
	private String diary_title;
	private String diary_content;
	private String diary_file;
	private String diary_date;
	private String id;
}
