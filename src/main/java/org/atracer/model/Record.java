package org.atracer.model;

import javax.persistence.ManyToOne;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity
public class Record {
	@ManyToOne
	private PackageName packageName;

	@ManyToOne
	private PackageVersion packageVersion;
	
	private String stacktrace;
}
