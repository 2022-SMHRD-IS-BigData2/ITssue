package com.ITssue.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Score {
	private int score_no;
	private String subname;
	private int grade;
	private String score_date;
	private String id;
	private String score_title;
}
