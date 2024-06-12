package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connector.MySqlConnector;
import model.UserDTO;

public class UserController {
    private Connection connection;

    public UserController(MySqlConnector connector) {
        connection = connector.makeConnection();
    }

    public UserDTO auth(UserDTO userDTO) {
        UserDTO result = null;
        String query = "SELECT * FROM user WHERE username = ? AND password = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userDTO.getUsername());
            preparedStatement.setString(2, userDTO.getPassword());

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                result = new UserDTO();
                result.setId(resultSet.getInt("id"));
                result.setUsername(resultSet.getString("username"));
                result.setPassword(resultSet.getString("password"));
                result.setNickname(resultSet.getString("nickname"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public boolean register(UserDTO userDTO) {
        String query = "INSERT INTO user(username, password, nicjname) VALUES (?, ?, ?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userDTO.getUsername());
            preparedStatement.setString(2, userDTO.getPassword());
            preparedStatement.setString(3, userDTO.getNickname());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /*public UserDTO register(UserDTO userDTO){
        UserDTO register = new UserDTO();
        String query = "INSERT INTO user VALUE username = ? AND password = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userDTO.getUsername());
            preparedStatement.setString(2, userDTO.getPassword());
            preparedStatement.setString(3, userDTO.getNickname());

            ResultSet resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                register = new UserDTO();
                register.setUsername(resultSet.getString("username"));
                register.setPassword(resultSet.getString("password"));
                register.setNickname(resultSet.getString("nickname"));
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return register;
    }*/
}
