package view;

public enum Users {
	
	CUS(0), TICKET_SELLER(1), ADMIN(2);
	private int value;
	
	Users (int value){
		this.value= value;
	}
	public static Users getStatus(int value) {
		for (Users s : Users.values()) {
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
