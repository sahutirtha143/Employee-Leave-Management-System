package ELM.java.Model;
import java.sql.Date;

public class ApplyLeave extends Users{
		private int l_id;
		private Date startDate;
	    private Date endDate;
	    private String type;
	    private String reason;
	    private String status;
	    
	    	
		public int getL_id() {
			return l_id;
		}
		public void setL_id(int l_id) {
			this.l_id = l_id;
		}
		public Date getStartDate() {
			return startDate;
		}
		public void setStartDate(Date startDate) {
			this.startDate = startDate;
		}
		public Date getEndDate() {
			return endDate;
		}
		public void setEndDate(Date endDate) {
			this.endDate = endDate;
		}
		public String getReason() {
			return reason;
		}
		public void setReason(String reason) {
			this.reason = reason;
		}
		
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}    

}