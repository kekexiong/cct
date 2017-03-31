package com.zqg.cct.mapper;

import java.util.List;

import com.zqg.cct.domain.TableDomain;
import com.zqg.cct.domain.TableItem;

public interface TableMapper {
	public List<TableItem> getTableItem(TableDomain param);
}
