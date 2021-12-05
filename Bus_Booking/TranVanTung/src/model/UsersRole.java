package model;

public enum UsersRole {
	
	CUS(0), TICKET_SELLER(1), ADMIN(2);
	private int value;
	
	UsersRole (int value){
		this.value= value;
	}
	public static UsersRole getStatus(int value) {
		for (UsersRole s : UsersRole.values()) {
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
