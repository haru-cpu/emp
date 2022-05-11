package com.example.emp.domain.repository;

import java.util.List;

import com.example.emp.domain.model.EmployeeBean;

public interface EmployeeRepository {
	// 全件取得
	List<EmployeeBean> findAll();

//	//Id検索
	List<EmployeeBean> findById(String id);

	// カナ（あいまい）検索
	List<EmployeeBean> findByKana(String kana);

	// 登録
	void insert(EmployeeBean bean);

	// 更新
	void update(EmployeeBean bean);

}