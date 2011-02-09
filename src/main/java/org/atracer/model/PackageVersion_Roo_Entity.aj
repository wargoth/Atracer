// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.atracer.model;

import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.atracer.model.PackageVersion;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PackageVersion_Roo_Entity {
    
    declare @type: PackageVersion: @Entity;
    
    @PersistenceContext
    transient EntityManager PackageVersion.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long PackageVersion.id;
    
    @Version
    @Column(name = "version")
    private Integer PackageVersion.version;
    
    public Long PackageVersion.getId() {
        return this.id;
    }
    
    public void PackageVersion.setId(Long id) {
        this.id = id;
    }
    
    public Integer PackageVersion.getVersion() {
        return this.version;
    }
    
    public void PackageVersion.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void PackageVersion.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PackageVersion.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PackageVersion attached = PackageVersion.findPackageVersion(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PackageVersion.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public PackageVersion PackageVersion.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PackageVersion merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager PackageVersion.entityManager() {
        EntityManager em = new PackageVersion().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PackageVersion.countPackageVersions() {
        return entityManager().createQuery("select count(o) from PackageVersion o", Long.class).getSingleResult();
    }
    
    public static List<PackageVersion> PackageVersion.findAllPackageVersions() {
        return entityManager().createQuery("select o from PackageVersion o", PackageVersion.class).getResultList();
    }
    
    public static PackageVersion PackageVersion.findPackageVersion(Long id) {
        if (id == null) return null;
        return entityManager().find(PackageVersion.class, id);
    }
    
    public static List<PackageVersion> PackageVersion.findPackageVersionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from PackageVersion o", PackageVersion.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
