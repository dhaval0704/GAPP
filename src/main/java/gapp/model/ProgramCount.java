package gapp.model;

public class ProgramCount {

	private Integer prgDeptId;
	private int count;

	public Integer getPrgDeptId() {
		return prgDeptId;
	}

	public void setPrgDeptId(Integer prgDeptId) {
		this.prgDeptId = prgDeptId;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public ProgramCount(Integer prgDeptId, int count) {
		super();
		this.prgDeptId = prgDeptId;
		this.count = count;
	}
}
