package com.ITssue.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Likes {
	
	private int board_no;
	private String id;
	private String likecheck;

}
