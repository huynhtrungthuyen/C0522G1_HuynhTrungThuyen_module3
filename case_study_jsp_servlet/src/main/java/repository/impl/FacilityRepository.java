package repository.impl;

import model.Customer;
import model.Facility;
import repository.BaseRepository;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private static final String FIND_ALL = "select * from facility where is_delete = 0;";
    private static final String INSERT = "insert into facility(facility_name, facility_area, facility_cost, " +
            "max_people, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free, " +
            "rent_type_id, facility_type_id) values(?,?,?,?,?,?,?,?,?,?,?);";
//    private static final String FIND_BY_ID = "select * from customer where customer_id = ? and is_delete = 0;";
//    private static final String UPDATE = "update customer set customer_name = ?, customer_birthday = ?, " +
//            "customer_gender = ?, customer_id_card = ?, customer_phone = ?, customer_email = ?, " +
//            "customer_address = ?, customer_type_id = ? where customer_id = ? and is_delete = 0;";
//    private static final String DELETE = "update customer set is_delete = 1 where customer_id = ? and is_delete = 0;";
//    private static final String SEARCH = "select * from customer where is_delete = 0 and customer_name like ? and " +
//            "customer_address like ? and customer_phone like ?;";

    @Override
    public List<Facility> findAll() {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("facility_id");
                String name = resultSet.getString("facility_name");
                int area = resultSet.getInt("facility_area");
                double cost = resultSet.getDouble("facility_cost");
                int maxPeople = resultSet.getInt("max_people");
                String standard = resultSet.getString("standard_room");
                String description = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int numberOfFloors = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                int rentType = resultSet.getInt("rent_type_id");
                int facilityType = resultSet.getInt("facility_type_id");

                Facility facility = new Facility(id, name, area, cost, maxPeople, standard, description, poolArea,
                        numberOfFloors, facilityFree, rentType, facilityType);
                facilityList.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return facilityList;
    }

    @Override
    public boolean create(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);

            preparedStatement.setString(1, facility.getFacilityName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7, facility.getPoolArea());
            preparedStatement.setInt(8, facility.getNumberOfFloors());
            preparedStatement.setString(9, facility.getFacilityFree());
            preparedStatement.setInt(10, facility.getRentTypeId());
            preparedStatement.setInt(11, facility.getFacilityTypeId());

            int num = preparedStatement.executeUpdate();
            return (num == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public Facility findById(int idFind) {
        return null;
    }

    @Override
    public boolean edit(Facility facility) {
        return false;
    }

    @Override
    public boolean delete(int idDelete) {
        return false;
    }

    @Override
    public List<Facility> search(String nameSearch, String facilityTypeSearch) {
        return null;
    }
}