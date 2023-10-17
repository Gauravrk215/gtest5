package com.realnet.btest1.Services;
import com.realnet.btest1.Repository.Gter1Repository;
import com.realnet.btest1.Entity.Gter1;import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Service;

@Service
 public class Gter1Service {
@Autowired
private Gter1Repository Repository;
public Gter1 Savedata(Gter1 data) {
				return Repository.save(data);	
			}

			
public List<Gter1> getdetails() {
				return (List<Gter1>) Repository.findAll();
			}


public Gter1 getdetailsbyId(Integer id) {
	return Repository.findById(id).get();
			}


	public void delete_by_id(Integer id) {
 Repository.deleteById(id);
}


public Gter1 update(Gter1 data,Integer id) {
	Gter1 old = Repository.findById(id).get();
old.setName(data.getName());
final Gter1 test = Repository.save(old);
  return test;}}
