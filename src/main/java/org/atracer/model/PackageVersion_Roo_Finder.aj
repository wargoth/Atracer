// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.atracer.model;

import java.lang.String;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.atracer.model.PackageVersion;

privileged aspect PackageVersion_Roo_Finder {
    
    public static TypedQuery<PackageVersion> PackageVersion.findPackageVersionsByName(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        EntityManager em = PackageVersion.entityManager();
        TypedQuery<PackageVersion> q = em.createQuery("SELECT PackageVersion FROM PackageVersion AS packageversion WHERE packageversion.name = :name", PackageVersion.class);
        q.setParameter("name", name);
        return q;
    }
    
}