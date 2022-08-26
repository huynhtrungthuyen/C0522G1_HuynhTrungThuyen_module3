package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    boolean insertUser(User user);

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id);

    boolean updateUser(User user);

    List<User> findByName(String name);
}
