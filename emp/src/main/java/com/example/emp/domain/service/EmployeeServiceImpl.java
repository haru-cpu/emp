package com.example.emp.domain.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.emp.domain.model.EmployeeBean;
import com.example.emp.domain.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Inject
	EmployeeRepository repository;

	@Override
	@Transactional(readOnly = true)
	public List<EmployeeBean> findAll() {

		return repository.findAll();
	}

	@Override
	public List<EmployeeBean> findById(String id) {

		return repository.findById(id);
	}

	@Override
	public List<EmployeeBean> findByKana(String kana) {

		return repository.findByKana(kana);
	}

	@Override
	public void insert(EmployeeBean bean) {

		repository.insert(bean);

	}

	@Override
	public void update(EmployeeBean bean) {

		repository.update(bean);

	}

}