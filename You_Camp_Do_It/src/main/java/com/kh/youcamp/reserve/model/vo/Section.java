package com.kh.youcamp.reserve.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 모든 매개변수 생성자
@Setter // setter 메소드들
@Getter // getter 메소드들
@ToString // toString 메소드
public class Section {
	
	private String section;
	private String sectionDetail;

}


