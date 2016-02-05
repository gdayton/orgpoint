package com.orgpoint.android;

import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.Button;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class HomeActivity extends AppCompatActivity {


  @Override
  protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_home);


      logInButtonPress();
            Log.d("LOG", "This is a test log");
    Log.d("log", "I wrote this");

    }

    //Does stuff when the log in button is pressed
    public void logInButtonPress(){
        Button logInButton = (Button)findViewById(R.id.logInButton);
        logInButton.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view) {
                final EditText username = (EditText) findViewById(R.id.home_Username);
                final EditText password = (EditText) findViewById(R.id.home_Password);
                Log.d("LOG", "BUTTONPRESS LOGGED");

                //CHANGES username and password textviews to
                // whatever is in the username and password fields
                //Can reuse this code when we grab the actual data.
                String temp = username.getText().toString();
                String tempp = password.getText().toString();
                TextView tempz = (TextView) findViewById(R.id.usernameTextView);
                tempz.setText(temp);
                tempz = (TextView) findViewById(R.id.passwordTextView);
                tempz.setText(tempp);

                //DO SOMETHING TO LOG THE USER IN.
            }
        });
    }

}
