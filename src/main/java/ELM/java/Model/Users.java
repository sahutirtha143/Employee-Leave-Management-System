package ELM.java.Model;

public class Users {
	private int id;
	private String name;
	private String email;
	private String role;
	private String department;
	private String password;
	private String conPassword;
	private int leaveDay;
	
	public Users() {
		
	}

	public Users(int id, String name, String email, String role, String department, String password, String conPassword,
			int leaveDay) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.role = role;
		this.department = department;
		this.password = password;
		this.conPassword = conPassword;
		this.leaveDay = leaveDay;
	}
	
	public Users(String name, String email, String role, String department, String password, String conPassword,
			int leaveDay) {
		super();
		this.name = name;
		this.email = email;
		this.role = role;
		this.department = department;
		this.password = password;
		this.conPassword = conPassword;
		this.leaveDay = leaveDay;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getRole() {
		return role;
	}

	public void setRole(String rule) {
		this.role = rule;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConPassword() {
		return conPassword;
	}

	public void setConPassword(String conPassword) {
		this.conPassword = conPassword;
	}

	public int getLeaveDay() {
		return leaveDay;
	}

	public void setLeaveDay(int leaveDay) {
		this.leaveDay = leaveDay;
	}

	@Override
	public String toString() {
		return "Users [id=" + id + ", name=" + name + ", email=" + email + ", rule=" + role + ", department="
				+ department + ", password=" + password + ", conPassword=" + conPassword + ", leaveDay=" + leaveDay
				+ "]";
	}

	
	
	
}
