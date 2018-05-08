package com.newture.service;

import com.newture.model.Feenbackscore;
import com.newture.model.Users;

public interface FeenbackscoreService extends Feenback1Service<Feenbackscore> {

	Users findClass(int id);

}
