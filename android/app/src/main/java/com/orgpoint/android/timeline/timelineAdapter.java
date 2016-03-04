package com.orgpoint.android.timeline;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.orgpoint.android.R;

/**
 * Created by JOO-DESKTOP on 2/30/2016.
 */
public class timelineAdapter extends ArrayAdapter<timelineList> {
    Context context;
    int layoutResourceId;
    timelineList data[] = null;
    private static final String TAG = timelineAdapter.class.getSimpleName();

    public timelineAdapter(Context context, int layoutResourceId, timelineList[] data){
        super(context, layoutResourceId, data);
        this.layoutResourceId = layoutResourceId;
        this.context = context;
        this.data = data;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View row = convertView;
        ListElement draw;

        if(row == null)
        {
            LayoutInflater inflater = ((Activity)context).getLayoutInflater();
            row = inflater.inflate(layoutResourceId, parent, false);
            
            draw = new ListElement();
//            draw.profilePic = (ImageView)row.findViewById(R.drawable.glenn);
            row.setTag(draw);
        }
        else
        {
            draw = (ListElement)row.getTag();
        }

        timelineList list = data[position];
        if (position == 0) draw.profilePic.setImageResource(R.drawable.glenn);

        return row;
    }

    static class ListElement
    {
        ImageView profilePic;
        TextView username;
        TextView statusText;
    }
}