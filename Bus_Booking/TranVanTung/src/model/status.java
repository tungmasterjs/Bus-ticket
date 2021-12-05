package model;

public enum status {
	
	 AVAILABLE(0),BOOKED(1);
		private int value;
		status(int value){
			this.value = value;
		}
		public static status getStatus(int value) {
			for (status s : status.values()) {
	            if (s.value == value) {
	                return s;
	            }
	        }
	        return null;
		}
		public int getValue() {
	        return value;
	    }

}
