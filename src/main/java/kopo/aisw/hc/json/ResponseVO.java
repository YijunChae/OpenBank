package kopo.aisw.hc.json;

import kopo.aisw.hc.member.vo.MemberVO;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ResponseVO {
	private int responseCode;
	private String responseString;
	private MemberVO member;
}
