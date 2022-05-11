package com.example.emp.app.emp;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.terasoluna.gfw.common.exception.BusinessException;

import com.example.emp.domain.model.EmployeeBean;
import com.example.emp.domain.service.EmployeeService;
import com.github.dozermapper.core.Mapper;

@Controller
@RequestMapping("/")
@SessionAttributes(value = { "employeeForm" })
public class EmpController {

	@Inject
	EmployeeService service;

	@Inject
	Mapper beanMapper;

	@Inject
	EmployeeBean employeeBean;

	@ModelAttribute("employeeForm")
	public EmployeeForm setUpForm() {
		EmployeeForm employeeForm = new EmployeeForm();
		return employeeForm;
	}

	// 初期画面
	@GetMapping
	public String list(Model model, SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		Collection<EmployeeBean> list = service.findAll();
		model.addAttribute("empList", list);

		return "jsp/employeeList";
	}

	// 新規登録画面へ遷移
	@GetMapping("/register")
	public String register(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "jsp/employeeEditNew";
	}

//	//初期画面から指定のID詳細画面へ
	@GetMapping("show/edit")
	public String editId(EmployeeForm employeeForm, Model model) {

		List<EmployeeBean> list = service.findById(employeeForm.getId());
		model.addAttribute("empList", list);
		return "jsp/employeeEdit";
	}

	// 編集画面から詳細画面
	@GetMapping("edit/show")
	public String backShow(EmployeeForm employeeForm, Model model) {

		List<EmployeeBean> list = service.findById(employeeForm.getId());
		model.addAttribute("empList", list);
		return "jsp/employeeShow";
	}

	// 初期画面から指定のID詳細画面へ
	@GetMapping("/show/{emp.id}")
	public String search(@PathVariable("emp.id") String id, Model model, EmployeeForm employeeForm) {

		List<EmployeeBean> list = service.findById(id);
		model.addAttribute("empList", list);
		employeeForm.setId(id);
		return "jsp/employeeShow";
	}

	// ID検索
	@PostMapping("/list")
	public String idSearch(@RequestParam("radio") String btn, @RequestParam("id") String id,
			@RequestParam("kana") String kana, @Valid EmployeeForm employeeForm, BindingResult bindingResult, // (3)
			Model model, SessionStatus sessionStatus) {

		List<EmployeeBean> list = new ArrayList<>();
		String page;

		if (btn.equals("id_radio")) {

			list = service.findById(id);
			page = "jsp/employeeList";
		} else {
			list = service.findByKana(kana);
			page = "jsp/employeeList";
		}

		if (list.size() == 0) {
			// エラーメッセージをModelに追加
			model.addAttribute("nodata", "該当データがありません。");

		} else {

			model.addAttribute("empList", list);
			sessionStatus.setComplete();
		}

		model.addAttribute("id", id);
		model.addAttribute("kana", kana);

		return page;

	}

	// 新規登録
	@PostMapping("/create")
	public String create(@Valid EmployeeForm employeeForm, BindingResult bindingResult, // (3)
			Model model, RedirectAttributes attributes) {

		EmployeeBean employeeBean = beanMapper.map(employeeForm, EmployeeBean.class);

		if (bindingResult.hasErrors()) {

			// 値を保存するために値をmodelに追加する必要あり
			model.addAttribute("id", employeeBean.getId());
			return "jsp/employeeEditNew";

		}

		// 遷移先
		String page;

		// IDチェック
		List<EmployeeBean> list = service.findById(employeeBean.getId());
		if (list.size() == 1) {
			model.addAttribute("noUniq", "IDが重複しています");
			page = "jsp/employeeEditNew";

		} else {

			service.insert(employeeBean);
			list = service.findById(employeeBean.getId());

			// Modelに追加
			model.addAttribute("empList", list);

			page = "jsp/employeeEdit";

		}

		return page;

	}

//	//編集画面
	@PostMapping("/edit")
	public String edit(@Valid EmployeeForm employeeForm, BindingResult bindingResult, // (3)
			Model model, RedirectAttributes attributes) {

		EmployeeBean employeeBean = beanMapper.map(employeeForm, EmployeeBean.class);

		if (bindingResult.hasErrors()) {

			model.addAttribute("id", employeeBean.getId());
			return "jsp/employeeEdit";
			// return list(model);
		}

		try {
			service.update(employeeBean);
			List<EmployeeBean> list = service.findById(employeeBean.getId());

			model.addAttribute("empList", list);

		} catch (BusinessException e) {
			// 値を残す処理
		}

		return "jsp/employeeShow";
	}

}
