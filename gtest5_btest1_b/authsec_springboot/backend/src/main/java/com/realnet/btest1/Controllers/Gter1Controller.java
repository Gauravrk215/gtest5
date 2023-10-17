package com.realnet.btest1.Controllers;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.web.bind.annotation.CrossOrigin;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.realnet.config.EmailService;
import com.realnet.users.entity1.AppUser;
import com.realnet.users.service1.AppUserServiceImpl;import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.*;
import com.realnet.btest1.Entity.Gter1;
import com.realnet.btest1.Services.Gter1Service ;
@RequestMapping(value = "/Gter1")
 @CrossOrigin("*") 
@RestController
public class Gter1Controller {
	@Autowired
	private Gter1Service Service;

@Value("${projectPath}")
	private String projectPath;

	public final String UPLOAD_DIREC = "/Files"; 
	@PostMapping("/Gter1")
		  public Gter1 Savedata(@RequestBody Gter1 data) {
		Gter1 save = Service.Savedata(data)	;
			System.out.println(save);
	 return save;
	  }
@PutMapping("/Gter1/{id}")
	public  Gter1 update(@RequestBody Gter1 data,@PathVariable Integer id ) {
		Gter1 update = Service.update(data,id);
		return update;
	}	 
	
	@GetMapping("/Gter1")
	public List<Gter1> getdetails() {
		 List<Gter1> get = Service.getdetails();		
		return get;
}
@GetMapping("/Gter1/{id}")
	public  Gter1  getdetailsbyId(@PathVariable Integer id ) {
		Gter1  get = Service.getdetailsbyId(id);
		return get;
	}
@DeleteMapping("/Gter1/{id}")
	public  void delete_by_id(@PathVariable Integer id ) {
	Service.delete_by_id(id);
		
	}

}