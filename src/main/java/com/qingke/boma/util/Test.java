package com.qingke.boma.util;

import java.util.ArrayList;
import java.util.List;

public class Test {
	public static void main(String args[]) {
		List<Integer> list = new ArrayList<>();
		list.add(1);
		list.add(2);
		list.add(3);
		list.add(4);
		List<Integer> list2 = new ArrayList<>();
		list2 = list.subList(0, 4);
		for(Integer i : list2){
			System.out.println(i);
		}
	}
}
