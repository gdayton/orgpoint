package com.orgpoint.android;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class HomeActivity extends AppCompatActivity {
  public final static String EXTRA_MESSAGE = "com.orgpoint.android.MESSAGE";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_home);

    Button button = new Button(this);

    Log.d("LOG", "This is a test log");
    Log.d("log", "I wrote this");

  }

  public void logIn(View view){
    Intent intent = new Intent(this, secondActivity.class);
    EditText user = (EditText) findViewById(R.id.username);
    String userString = user.getText().toString();
    intent.putExtra(EXTRA_MESSAGE, userString);
    startActivity(intent);
  }



}
