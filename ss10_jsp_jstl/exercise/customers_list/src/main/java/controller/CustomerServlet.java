package controller;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Customer> customerList = new ArrayList<>();

        customerList.add(new Customer(1, "Đặng Thị Thủy Tiên", "20/03/2000", "Quảng Nam", "https://andy.codegym.vn/storage/images/avatars/38cba5c3296a2935a26f2dc896be48e2.jpeg"));
        customerList.add(new Customer(2, "Bùi Hùng", "22/08/1993", "Đà Nẵng", "https://andy.codegym.vn/storage/images/avatars/e3564fafb5098fee1f4de7f534895abe.jpeg"));
        customerList.add(new Customer(3, "Lê Đại Lợi", "11/11/1997", "Đà Nẵng", "https://andy.codegym.vn/storage/images/avatars/fe4ef841c2aa37ea4058a39b62342083.jpeg"));
        customerList.add(new Customer(4, "Võ Văn Tý", "03/12/2001", "Gia Lai", "https://andy.codegym.vn/storage/images/avatars/19de912f5eebc4a3f23c2b3d3d256bdf.jpeg"));
        customerList.add(new Customer(5, "Nguyễn Văn Phúc", "18/10/1998", "Quảng Bình", "https://andy.codegym.vn/storage/images/avatars/ae23548049f8654635bcdb639653445c.jpeg"));

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("display.jsp");
        request.setAttribute("customerList", customerList);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
