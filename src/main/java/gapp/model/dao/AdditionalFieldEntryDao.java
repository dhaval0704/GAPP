package gapp.model.dao;


import java.util.List;

import gapp.model.AdditionalFieldEntry;

public interface AdditionalFieldEntryDao {
	AdditionalFieldEntry saveFieldEntry(AdditionalFieldEntry addfield);
	List<AdditionalFieldEntry> getAdditionalFieldValuesByAppId(Integer id);
	void removeAdditionalFieldEntry(AdditionalFieldEntry c);
}
