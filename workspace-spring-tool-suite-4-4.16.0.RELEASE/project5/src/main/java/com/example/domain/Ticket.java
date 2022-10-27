package com.example.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
public class Ticket {

	private int tno;
	private String owner;
	private String grade;
}

