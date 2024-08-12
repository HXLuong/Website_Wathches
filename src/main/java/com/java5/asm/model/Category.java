package com.java5.asm.model;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Categories")
public class Category implements Serializable {
	@Id
	@NotEmpty(message = "Id not empty!")
	private String Id;
	@NotEmpty(message = "Name not empty!")
	@Column(columnDefinition = "nvarchar(50)")
	private String name;
	@JsonIgnore
	@OneToMany(mappedBy = "category")
	List<Product> products;
}
