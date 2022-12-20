package com.ITssue.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Comments {
	private int cmt_no;
	private int board_no;
	private String cmt_content;
	private String cmt_dt;
	private String id;
}
