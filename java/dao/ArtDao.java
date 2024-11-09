package dao;
import java.sql.*;
import java.util.*;
import bean.ArtBean;
import db.ArtDB;
public class ArtDao {
	
	    // Insert new artwork into the database
	    public boolean addArtwork(ArtBean artwork) {
	        String query = "INSERT INTO artworks (artTitle, artistName, artGenre, artPrice, uloadeImage) VALUES (?, ?, ?, ?, ?)";
	        
	        try (Connection conn = ArtDB.getConnection(); 
	             PreparedStatement ps = conn.prepareStatement(query)) {
	            
	            ps.setString(1, artwork.getArtTitle());
	            ps.setString(2, artwork.getArtistName());
	            ps.setString(3, artwork.getArtGenre());
	            ps.setDouble(4, artwork.getArtPrice());
	            ps.setString(5, artwork.getUploadImage());
	            
	            int result = ps.executeUpdate();
	            return result > 0;  // If 1 or more rows affected, insert is successful
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    // Update an existing artwork in the database
	    public boolean updateArtwork(ArtBean artwork) {
	        String query = "UPDATE artworks SET artTitle = ?, artistName = ?, artGenre = ?, artPrice = ?, uloadeImage = ? WHERE artId = ?";
	        
	        try (Connection conn = ArtDB.getConnection(); 
	             PreparedStatement ps = conn.prepareStatement(query)) {
	            
	            ps.setString(1, artwork.getArtTitle());
	            ps.setString(2, artwork.getArtistName());
	            ps.setString(3, artwork.getArtGenre());
	            ps.setDouble(4, artwork.getArtPrice());
	            ps.setString(5, artwork.getUploadImage());
	            ps.setInt(6, artwork.getArtId());  // Assuming ArtworkBean has getId() method
	            
	            int result = ps.executeUpdate();
	            return result > 0;  // If 1 or more rows affected, update is successful
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    // Delete artwork from the database
	    public boolean deleteArtwork(int artID) {
	        String query = "DELETE FROM artworks WHERE artId = ?";
	        
	        try (Connection conn = ArtDB.getConnection(); 
	             PreparedStatement ps = conn.prepareStatement(query)) {
	            
	            ps.setInt(1, artID);
	            int result = ps.executeUpdate();
	            return result > 0;  // If 1 or more rows affected, delete is successful
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    // Select a single artwork by ID
	    public ArtBean getArtworkById(int artId) {
	        String query = "SELECT * FROM artworks WHERE artId = ?";
	        ArtBean artwork = null;
	        
	        try (Connection conn = ArtDB.getConnection(); 
	             PreparedStatement ps = conn.prepareStatement(query)) {
	            
	            ps.setInt(1, artId);
	            ResultSet rs = ps.executeQuery();
	            
	            if (rs.next()) {
	                artwork = new ArtBean();
	                artwork.setArtId(rs.getInt("artId"));
	                artwork.setArtTitle(rs.getString("artTitle"));
	                artwork.setArtistName(rs.getString("artistName"));
	                artwork.setArtGenre(rs.getString("artGenre"));
	                artwork.setArtPrice(rs.getDouble("artPrice"));
	                artwork.setUploadImage(rs.getString("uloadeImage"));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return artwork;  
	    }

	    public List<ArtBean> getAllArtworks() {
	        List<ArtBean> artworks = new ArrayList<>();
	        String query = "SELECT * FROM artworks";
	        
	        try (Connection conn = ArtDB.getConnection(); 
	             PreparedStatement ps = conn.prepareStatement(query);
	             ResultSet rs = ps.executeQuery()) {
	            
	            while (rs.next()) {
	                ArtBean artwork = new ArtBean();
	                artwork.setArtId(rs.getInt("artId"));
	                artwork.setArtTitle(rs.getString("artTitle"));
	                artwork.setArtistName(rs.getString("artistName"));
	                artwork.setArtGenre(rs.getString("artGenre"));
	                artwork.setArtPrice(rs.getDouble("artPrice"));
	                artwork.setUploadImage(rs.getString("uloadeImage"));
	                artworks.add(artwork);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return artworks;  
	    }
	}


