package com.java5.asm.model;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity 
@Table(name = "Accounts")
public class Account implements Serializable {
	@Id
	@NotEmpty(message = "Username not empty!")
	@Column(columnDefinition = "varchar(50)")
	private String username;
	@NotEmpty(message = "Password not empty!")
	@Size(min = 3, message = "Password phai co 3 ky tu tro len!")
	private String password;
	@NotEmpty(message = "Fullname not empty!")
	@Column(columnDefinition = "nvarchar(50)")
	private String fullname;
	@NotEmpty(message = "Email not empty!")
	@Email(message = "Email khong dung dinh dang!")
	@Column(columnDefinition = "varchar(50)")
	private String email;
	private String photo;
	private Boolean activated;
	@NotNull(message = "Role not empty!")
	private Boolean admin;
	
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Order> orders;
}
