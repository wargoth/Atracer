// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.atracer.model;

import java.util.List;
import java.util.Random;
import org.atracer.model.PackageName;
import org.springframework.stereotype.Component;

privileged aspect PackageNameDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PackageNameDataOnDemand: @Component;
    
    private Random PackageNameDataOnDemand.rnd = new java.security.SecureRandom();
    
    private List<PackageName> PackageNameDataOnDemand.data;
    
    public PackageName PackageNameDataOnDemand.getNewTransientPackageName(int index) {
        org.atracer.model.PackageName obj = new org.atracer.model.PackageName();
        obj.setName("name_" + index);
        return obj;
    }
    
    public PackageName PackageNameDataOnDemand.getSpecificPackageName(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        PackageName obj = data.get(index);
        return PackageName.findPackageName(obj.getId());
    }
    
    public PackageName PackageNameDataOnDemand.getRandomPackageName() {
        init();
        PackageName obj = data.get(rnd.nextInt(data.size()));
        return PackageName.findPackageName(obj.getId());
    }
    
    public boolean PackageNameDataOnDemand.modifyPackageName(PackageName obj) {
        return false;
    }
    
    public void PackageNameDataOnDemand.init() {
        data = org.atracer.model.PackageName.findPackageNameEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'PackageName' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new java.util.ArrayList<org.atracer.model.PackageName>();
        for (int i = 0; i < 10; i++) {
            org.atracer.model.PackageName obj = getNewTransientPackageName(i);
            obj.persist();
            obj.flush();
            data.add(obj);
        }
    }
    
}