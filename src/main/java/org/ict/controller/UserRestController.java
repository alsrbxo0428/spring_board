package org.ict.controller;

import org.ict.domain.UserVO;
import org.ict.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/chk")
public class UserRestController {
	@Autowired
	private UserService service;
	
	@PostMapping(value = "/{uid}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<UserVO> idChk(@PathVariable("uid") String uid) {
		ResponseEntity<UserVO> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.idChk(uid), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}//class
