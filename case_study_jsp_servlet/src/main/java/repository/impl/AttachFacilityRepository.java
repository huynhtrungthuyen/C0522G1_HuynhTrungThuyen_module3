package repository.impl;

import model.AttachFacility;
import repository.BaseRepository;
import repository.IAttachFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AttachFacilityRepository implements IAttachFacilityRepository {
    private static final String FIND_ALL = "select * from attach_facility;";

    @Override
    public List<AttachFacility> findAll() {
        List<AttachFacility> attachFacilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("attach_facility_id");
                String name = resultSet.getString("attach_facility_name");
                double cost = resultSet.getDouble("attach_facility_costs");
                String unit = resultSet.getString("attach_facility_unit");
                String status = resultSet.getString("attach_facility_status");

                AttachFacility attachFacility = new AttachFacility(id, name, cost,unit, status);
                attachFacilityList.add(attachFacility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return attachFacilityList;
    }
}
