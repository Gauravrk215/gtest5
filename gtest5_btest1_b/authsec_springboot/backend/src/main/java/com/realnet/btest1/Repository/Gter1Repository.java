package com.realnet.btest1.Repository;


import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;
 

import com.realnet.btest1.Entity.Gter1;

@Repository
public interface  Gter1Repository  extends  JpaRepository<Gter1, Integer>  { 
}