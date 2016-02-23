package com.orgpoint.android.api;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;

/**
 * Created by Raul on 2/22/2016.
 */
public interface OrgPointService {
    @GET("companies.json")
    Call <List<Company>> fetchCompanies ();
    @GET("users.json")
    Call <List<User>> fetchUsers ();
}