package controller;

import model.*;
import service.*;
import service.impl.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "ContractServlet", value = "/contract")
public class ContractServlet extends HttpServlet {
    private IContractService iContractService = new ContractService();
    private IFacilityService iFacilityService = new FacilityService();
    private IEmployeeService iEmployeeService = new EployeeService();
    private ICustomerService iCustomerService = new CustomerService();
    private IContractDetailService iContractDetailService = new ContractDetailService();
    private IAttachFacilityService iAttachFacilityService = new AttachFacilityService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "show":
                showAttachFacility(request, response);
                break;
            case "add":
                showAddModal(request, response);
            default:
                findAll(request, response);
        }
    }

    private void showAddModal(HttpServletRequest request, HttpServletResponse response) {
        List<AttachFacility> attachFacilityList = iAttachFacilityService.findAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract/list.jsp");
        request.setAttribute("attachFacilityList", attachFacilityList);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showAttachFacility(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract/list.jsp");

        int id = Integer.parseInt(request.getParameter("idShow"));

        List<ContractDetail> contractDetailList = iContractDetailService.showAttachFacility(id);
        List<AttachFacility> attachFacilityList = iAttachFacilityService.findAll();

        request.setAttribute("contractDetailList", contractDetailList);
        request.setAttribute("attachFacilityList", attachFacilityList);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract/list.jsp");

        List<Contract> contractList = iContractService.findAll();
        List<Facility> facilityList = iFacilityService.findAll();
        List<Employee> employeeList = iEmployeeService.findAll();
        List<Customer> customerList = iCustomerService.findAll();

        for (Contract contract : contractList) {
            String[] start = contract.getStartDate().split("-");
            String[] end = contract.getEndDate().split("-");
            contract.setStartDate(start[2] + "/" + start[1] + "/" + start[0]);
            contract.setEndDate(end[2] + "/" + end[1] + "/" + end[0]);
        }

        request.setAttribute("contractList", contractList);
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("customerList", customerList);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = iFacilityService.findAll();
        List<Employee> employeeList = iEmployeeService.findAll();
        List<Customer> customerList = iCustomerService.findAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract/create.jsp");
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("customerList", customerList);

        LocalDate minAge = LocalDate.now();
        request.setAttribute("minAge", minAge);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createContract(request, response);
                break;
            case "add":
                addContractDetail(request, response);
                break;
            default:
                break;
        }
    }

    private void addContractDetail(HttpServletRequest request, HttpServletResponse response) {
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int contractId = Integer.parseInt(request.getParameter("idAdd"));
        int attachFacilityId = Integer.parseInt(request.getParameter("attachFacilityId"));

        ContractDetail contractDetail = new ContractDetail(quantity, contractId, attachFacilityId);

        boolean check = iContractDetailService.create(contractDetail);
        String mess = "Add new Contract successfully.";
        if (!check) {
            mess = "Add new Contract failed.";
        }

        request.setAttribute("mess", mess);
        request.setAttribute("check", check);

        showCreateForm(request, response);
    }

    private void createContract(HttpServletRequest request, HttpServletResponse response) {
        String startDay = request.getParameter("startDay");
        String endDay = request.getParameter("endDay");
        double deposit = Double.parseDouble(request.getParameter("deposit"));
        double totalMoney = Double.parseDouble(request.getParameter("totalMoney"));
        int employee = Integer.parseInt(request.getParameter("employee"));
        int customer = Integer.parseInt(request.getParameter("customer"));
        int facility = Integer.parseInt(request.getParameter("facility"));

        Contract contract = new Contract(startDay, endDay, deposit, totalMoney, employee, customer, facility);

        boolean check = iContractService.create(contract);
        String mess = "Add new Contract successfully.";
        if (!check) {
            mess = "Add new Contract failed.";
        }

        request.setAttribute("mess", mess);
        request.setAttribute("check", check);

        showCreateForm(request, response);
    }
}
