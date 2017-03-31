package com.zqg.cct;

import org.junit.Test;

import com.zqg.cct.domain.Code;

import static org.junit.Assert.*;

public class PersonTest {
    @Test
    public void canConstructAPersonWithAName() {
        Code person = new Code("Larry");
        assertEquals("Larry", person.getName());
    }
}
