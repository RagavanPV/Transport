package com.ragavan.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.ragavan.dao.PointDAO;
import com.ragavan.model.Point;

@Controller
@RequestMapping("/")
public class HomeController {

	@GetMapping
	public String home(ModelMap map) {
PointDAO dao=new PointDAO();
List<Point> list=dao.list();
map.addAttribute("route_list", list);
		return "index.jsp";
	}
	@GetMapping("/assign")
	public String assign(@RequestParam("points") String point,ModelMap map) {
System.out.println(point);
/*Gson gson = new Gson();
System.out.println(gson.fromJson(point, Point.class));*/
		return "index.jsp";
	}
}