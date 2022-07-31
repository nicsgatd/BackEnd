package Entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "TeachersTable")
public class Teachers {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column
	private String teachersName;

	private int classId;
	
	public Teachers() {

	}

	public Teachers(String teachersName) {
		
		this.teachersName = teachersName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTeachersName() {
		return teachersName;
	}

	public void setTeachersName(String teachersName) {
		this.teachersName = teachersName;
	}
	
	
	
	
}
