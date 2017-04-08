package com.ragavan.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.ragavan.model.Point;
import com.ragavan.util.ConnectionUtil;

public class PointDAO {
	JdbcTemplate jdbcTemplate = ConnectionUtil.getJdbcTemplate();

	public int save(Point point) {
		String sql = "insert into users(name,bus_no,lat,lon)values (?,?,?,?)";
		Object[] params = { point.getPointName(), point.getBusno(), point.getLat(), point.getLon() };
		return jdbcTemplate.update(sql, params);
	}

	public List<Point> list() {
		final String sql = "select id,name,bus_no,lat,lon from points";
		return jdbcTemplate.query(sql, (rs, rowNum) -> {
			final Point point = new Point();
			point.setId(rs.getInt("id"));
			point.setPointName(rs.getString("name"));
			point.setBusno(rs.getString("bus_no"));
			point.setLat(rs.getDouble("lat"));
			point.setLon(rs.getDouble("lon"));

			return point;
		});
	}
}
