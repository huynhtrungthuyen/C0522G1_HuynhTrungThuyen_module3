package service.impl;

import model.CustomerType;
import repository.impl.CustomerTypeRepository;
import repository.ICustomerTypeRepository;
import service.ICustomerTypeService;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {
    private ICustomerTypeRepository iCustomerTypeRepository= new CustomerTypeRepository();

    @Override
    public List<CustomerType> findAll() {
        return iCustomerTypeRepository.findAll();
    }
}
