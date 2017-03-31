package com.zqg.cct.domain;

import org.apache.commons.collections.list.GrowthList;

public class Code {
    private final String name;

    public Code(String name) {
        this.name = name;
        new GrowthList();
    }

    public String getName() {
        return name;
    }
}
