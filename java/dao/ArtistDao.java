package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.ArtistBean;

import db.ArtDB;
public class ArtistDao {
	public void insertUsers(ArtistBean user) throws SQLException {
		String query = "INSERT INTO artist(name, genre, email, phn) VALUES(?,?,?,?)";
		try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
			pst.setString(1, user.getName());
			pst.setString(2, user.getGenre());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getPhn());
			pst.executeUpdate();
		}
	}
	public ArtistBean getUsers(int artistId) throws SQLException {
		String query = "SELECT * FROM artist WHERE userId= ?";
		try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
			pst.setInt(1, artistId);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				return new ArtistBean(rs.getInt("artistId"), rs.getString("name"), rs.getString("genre"),
						rs.getString("email"), rs.getString("phn"));

			}
		}
		return null;
	}

	
	
	/*
	 * public void updateUsers(ArtistBean user) throws SQLException { String query =
	 * "UPDATE artist SET name= ?, genre= ?, email= ?, phn= ? WHERE id= ? "; try
	 * (Connection con = ArtDB.getConnection(); PreparedStatement pst =
	 * con.prepareStatement(query)) { pst.setString(1, user.getName());
	 * pst.setString(2, user.getGenre()); pst.setString(3, user.getEmail());
	 * pst.setString(4, user.getPhn()); pst.setInt(5, user.getArtistId());
	 * pst.executeUpdate(); } }
	 */
	public void updateUsers(ArtistBean artist) throws SQLException {
	    String query = "UPDATE artist SET genre = ?, email = ?, phn = ? WHERE artistId = ?";
	    try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
	        pst.setString(1, artist.getGenre());
	        pst.setString(2, artist.getEmail());
	        pst.setString(3, artist.getPhn());
	        pst.setInt(4, artist.getArtistId());
	        pst.executeUpdate();
	    }
	}
	
	public boolean updateArtist(ArtistBean artist) throws SQLException {
	    String query = "UPDATE artist SET name = ?, genre = ?, email = ?, phn = ? WHERE artistId = ?";
	    try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
	        pst.setString(1, artist.getName());
	        pst.setString(2, artist.getGenre());
	        pst.setString(3, artist.getEmail());
	        pst.setString(4, artist.getPhn());
	        pst.setInt(5, artist.getArtistId());

	        int rowsUpdated = pst.executeUpdate();
	        return rowsUpdated > 0;  // Returns true if at least one row was updated
	    }
	}


	public void deleteUsers(int artistId) throws SQLException {
		String query = "DELETE FROM artist WHERE id= ?";
		try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
			pst.setInt(1, artistId);
			pst.executeUpdate();
		}
	}
	/*
	 * public List<ArtistBean> getAllUsers() throws SQLException { List<ArtistBean>
	 * user = new ArrayList<ArtistBean>(); String query = "SELECT * FROM artist";
	 * try (Connection con = ArtDB.getConnection(); Statement st =
	 * con.createStatement(); ResultSet rs = st.executeQuery(query)) { while
	 * (rs.next()) { user.add(new ArtistBean(rs.getInt("artistId"),
	 * rs.getString("name"), rs.getString("genre"), rs.getString("email"),
	 * rs.getString("phn"))); } } return user; }
	 */
	
	public List<ArtistBean> getAllUsers() throws SQLException {
        List<ArtistBean> artists = new ArrayList<>();
        String query = "SELECT * FROM artist";  // Replace 'artist' with your actual table name

        try (Connection con = ArtDB.getConnection();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                ArtistBean artist = new ArtistBean(
                    rs.getInt("artistId"),
                    rs.getString("name"),
                    rs.getString("genre"),
                    rs.getString("email"),
                    rs.getString("phn")
                );
                artists.add(artist);
            }
        }
        return artists;
    }
}
