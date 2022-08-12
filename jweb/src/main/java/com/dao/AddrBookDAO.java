package com.dao;

import java.util.ArrayList;

public class AddrBookDAO {
	private ArrayList<AddrBook> addrList = new ArrayList<>();
	
	// 주소추가
	public void add(AddrBook addrBook) {
		addrList.add(addrBook);
	}
	
	// 목록 보기
	public ArrayList<AddrBook> getListAll(){
		return addrList;
	}
	
	public AddrBook getAbByUserName(String username) {
		AddrBook addrBook = null;
		for(int i=0; i<addrList.size(); i++) {
			if(username.equals(addrList.get(i).getUsername())) {
				addrBook = addrList.get(i);
				break;
			}
			else {
				addrBook = null;
			}
		}
		return addrBook;
	}
	
	public void delete(String username) {
		for(int i=0; i<addrList.size(); i++) {
			if(username.equals(addrList.get(i).getUsername())) {
				addrList.remove(i);
				break;
			}
		}
	}
}
