package com.ITssue.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Board {

	private int board_no;
	private String board_title;
	private String board_content;
	private String hash_tag;
	private String board_date;
	private int likes;
	private String id;
	private String board_file;
	
}
