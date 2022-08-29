package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();

    boolean create(Customer customer);

    Customer findById(int customerId);

    boolean edit(Customer customer);

    boolean delete(int customerId);
}