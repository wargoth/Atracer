package org.atracer.model;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity(finders = { "findPackageVersionsByName" })
public class PackageVersion {
	@NotNull
	@Column(unique = true)
	private String name;
}
