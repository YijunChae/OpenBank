package kopo.aisw.hc.transaction.vo;

import java.util.List;

import kopo.aisw.hc.member.vo.MemberVO;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class TransactionResponseVO {
	private int page;
	private MemberVO member;
	private int size;
	private long amount;
	private List<TransactionVO> transaction;
}
