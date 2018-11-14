package cn.tekin.web.controller;

import cn.tekin.web.dao.DepartmentDao;
import cn.tekin.web.dao.EmployeeDao;
import cn.tekin.web.entities.Department;
import cn.tekin.web.entities.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;

/**
 * 员工信息处理控制器
 * @author Tekin
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeDao employeeDao;

    @Autowired
    DepartmentDao departmentDao;

    /**
     * 查询所有员工列表
     * @return
     */
    @GetMapping("/emps")
    public String list(Model model){
        //获取员工集合
        Collection<Employee> employees = employeeDao.getAll();
        //将员工集合放到请求域中
        model.addAttribute("emps",employees);
        //返回视图； thymeleaf默认会拼接 classpath:/template/xxx.html
        return "emp/list";
    }

    /**
     * 来到添加员工页面
     * @param model
     * @return
     */
    @GetMapping("/emp")
    public String toAddPage(Model model){
        //获取部门信息，并放入请求域
        Collection<Department> departments = departmentDao.getDepartments();
        model.addAttribute("depts",departments);

        return "emp/add";
    }

    /**
     * 保存员工
     * @param employee
     * @return
     */
    @PostMapping("/emp")
//    public String addEmp(Employee employee, BindingResult bindingResult){
    public String addEmp(Employee employee){
        //来到员工列表页面

        System.out.println("保存的员工信息："+employee);
        //保存员工
        employeeDao.save(employee);
        // redirect: 表示重定向到一个地址  /代表当前项目路径
        // forward: 表示转发到一个地址
        return "redirect:/emps";
    }

    /**
     * 编辑员工
     * 先取出员工信息 回显
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/emp/{id}")
    public String toEditPage(@PathVariable("id") Integer id, Model model){
        //根据员工ID获取员工信息
        Employee employee = employeeDao.get(id);
        model.addAttribute("emp", employee);

        //部门信息
        Collection<Department> departments = departmentDao.getDepartments();
        model.addAttribute("depts", departments);

        //添加修改二合一页面
        return "emp/add";
    }

    /**
     * 保存修改， put方法
     * @param employee
     * @return
     */
    @PutMapping("/emp")
    public String updateEmp(Employee employee, BindingResult bindingResult){
        System.out.println("修改的员工数据"+ employee);
       employeeDao.save(employee);
       return "redirect:/emps";
    }

    /**
     * 删除员工信息， delete 请求方式 必须知道要删除的员工ID
     * @param id
     * @return
     */
    @DeleteMapping("/emp/{id}")
    public String deleteEmp(@PathVariable("id") Integer id) {
        employeeDao.delete(id);
        return "redirect:/emps";
    }


}
