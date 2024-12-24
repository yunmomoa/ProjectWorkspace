package com.semi.notice.model.dto;

import com.semi.common.model.vo.Attachment;
import com.semi.member.model.vo.Member;
import com.semi.notice.model.vo.Notice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class NoticeDTO {
	private Notice n;
	private Member m;
	private Attachment at;
	
}
