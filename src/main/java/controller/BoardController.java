package controller;

import connector.MySqlConnector;
import model.BoardDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardController {
    private Connection connection;

    public BoardController(MySqlConnector connector) {
        connection = connector.makeConnection();
    }

    // 모든 입력 값 리스트로 출력
    public ArrayList<BoardDTO> selectAll() {
        ArrayList<BoardDTO> list = new ArrayList<>();

        // board_id = user.id 이기 때문에 inner join 으로 값을 가져옴.
        String query = "SELECT * FROM board INNER JOIN user ON board.writer_id = user.id";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                // boardDTO 객체 생성해서 사용
                BoardDTO boardDTO = new BoardDTO();
                boardDTO.setId(resultSet.getInt("id"));
                boardDTO.setWriterId(resultSet.getInt("writer_id"));
                boardDTO.setTitle(resultSet.getString("title"));
                boardDTO.setContent(resultSet.getString("content"));
                boardDTO.setEntryDate(resultSet.getTimestamp("entry_date"));
                boardDTO.setModifyDate(resultSet.getTimestamp("modify_date"));
                boardDTO.setNickname(resultSet.getString("nickname"));

                list.add(boardDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    //상세보기 출력
    public BoardDTO selectOne(int id) {
        String query = "SELECT * FROM board INNER JOIN user ON board.writer_id = user.id WHERE board.id = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                BoardDTO boardDTO = new BoardDTO();
                boardDTO.setId(resultSet.getInt("id"));
                boardDTO.setTitle(resultSet.getString("title"));
                boardDTO.setContent(resultSet.getString("content"));
                boardDTO.setEntryDate(resultSet.getTimestamp("entry_date"));
                boardDTO.setModifyDate(resultSet.getTimestamp("modify_date"));
                boardDTO.setNickname(resultSet.getString("nickname"));
                boardDTO.setWriterId(resultSet.getInt("writer_id"));

                return boardDTO;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // null 을 입력받으면 상세보기 시 입력값 없음을 뜻한..>
        return null;
    }

    public ArrayList<BoardDTO> insert(BoardDTO boardDTO) {
        ArrayList<BoardDTO> list = new ArrayList<>();
        String query = "INSERT INTO board(title, content, nickname) VALUES (?, ? ,?)";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString('2', boardDTO.getTitle());
            preparedStatement.setString('3', boardDTO.getContent());
            preparedStatement.setString('4', boardDTO.getNickname());

            preparedStatement.executeUpdate();
            list.add(boardDTO);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    // update
    // id 값을 제대로 받아와야함 -> BoardDTO.id
    public BoardDTO update(int id) {
        String query = "INSERT INTO board (title, content, nickname) VALUES (?,?,?)";
        try {
            BoardDTO boardDTO = new BoardDTO();
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString('1', boardDTO.getTitle());
            preparedStatement.setString('2', boardDTO.getContent());
            preparedStatement.setString('3', boardDTO.getNickname());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //delete
    public ArrayList<BoardDTO> delete(int id) {
        String query = "DELETE * FROM board WHERE id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}