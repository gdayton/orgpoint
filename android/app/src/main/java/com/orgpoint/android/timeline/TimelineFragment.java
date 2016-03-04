package com.orgpoint.android.timeline;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.orgpoint.android.R;
import com.orgpoint.android.api.Company;
import com.orgpoint.android.api.OrgPointService;
import com.orgpoint.android.api.ServiceGenerator;

import java.util.List;

import butterknife.Bind;
import butterknife.ButterKnife;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * Created by Raul on 3/2/2016.
 */
public class TimelineFragment extends Fragment{


    @Bind(R.id.company_name)
    TextView companyTitle;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_timeline, container, false);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        //ButterKnife.bind(this, view);

    }

    @Override
    public void onAttach(Context context) {
        super.onAttach(context);
    }

    public static TimelineFragment getInstance() {
        return new TimelineFragment();
    }

}
