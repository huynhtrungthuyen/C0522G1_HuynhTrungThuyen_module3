package service.impl;

import model.Position;
import repository.IPositionRepository;
import repository.impl.PositionRepository;
import service.IPositionSercive;

import java.util.List;

public class PositionService implements IPositionSercive {
    private IPositionRepository iPositionRepository = new PositionRepository();

    @Override
    public List<Position> findAll() {
        return iPositionRepository.findAll();
    }
}
