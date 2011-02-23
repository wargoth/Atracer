package org.atracer.model;

import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity
public class Record {
	@NotNull
	@ManyToOne
	private PackageName packageName;

	@NotNull
	@ManyToOne
	private PackageVersion packageVersion;

	@NotNull
	private String stacktrace;

	@NotNull
	private int count = 1;
}
