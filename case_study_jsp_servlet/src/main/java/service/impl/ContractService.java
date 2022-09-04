package service.impl;

import model.Contract;
import repository.IContractRepository;
import repository.impl.ContractRepository;
import service.IContractService;

import java.util.List;

public class ContractService implements IContractService {
    private IContractRepository iContractRepository = new ContractRepository();

    @Override
    public List<Contract> findAll() {
        return iContractRepository.findAll();
    }

    @Override
    public boolean create(Contract contract) {
        return iContractRepository.create(contract);
    }
//
//    @Override
//    public Contract findById(int idFind) {
//        return iContractRepository.findById(idFind);
//    }
//
//    @Override
//    public boolean edit(Contract contract) {
//        return iContractRepository.edit(contract);
//    }
//
//    @Override
//    public boolean delete(int idDelete) {
//        return iContractRepository.delete(idDelete);
//    }
}
