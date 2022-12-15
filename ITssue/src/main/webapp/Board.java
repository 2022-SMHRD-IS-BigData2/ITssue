package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor //모든 요소를 초기화 해주는 생성자.
@Data
@NoArgsConstructor
public class Board {

	private int num;
	private String title;
	private String writer;
	private String indate;
	private String content;
	private String img;

}
