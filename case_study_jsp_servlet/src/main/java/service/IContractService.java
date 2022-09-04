package service;

import model.Contract;

import java.util.List;

public interface IContractService {
    List<Contract> findAll();

    boolean create(Contract contract);

//    Contract findById(int idFind);
//
//    boolean edit(Contract contract);
//
//    boolean delete(int idDelete);
}
