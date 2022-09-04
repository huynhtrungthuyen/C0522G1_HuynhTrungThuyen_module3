package repository;

import model.Contract;

import java.util.List;

public interface IContractRepository {
    List<Contract> findAll();

    boolean create(Contract contract);
//
//    Contract findById(int idFind);
//
//    boolean edit(Contract contract);
//
//    boolean delete(int idDelete);
}
