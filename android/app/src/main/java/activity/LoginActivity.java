package activity;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;


import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;

import com.orgpoint.android.R;


public class LoginActivity extends AppCompatActivity {

  private Toolbar mToolbar;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_log_in);

    mToolbar = (Toolbar) findViewById(R.id.toolbar);

    setSupportActionBar(mToolbar);
    getSupportActionBar().setDisplayShowHomeEnabled(true);
  }


  @Override
  public boolean onCreateOptionsMenu(Menu menu) {
    // Inflate the menu; this adds items to the action bar if it is present.
    getMenuInflater().inflate(R.menu.menu_main, menu);
    return true;
  }

  @Override
  public boolean onOptionsItemSelected(MenuItem item) {
    // Handle action bar item clicks here. The action bar will
    // automatically handle clicks on the Home/Up button, so long
    // as you specify a parent activity in AndroidManifest.xml.
    int id = item.getItemId();

    //noinspection SimplifiableIfStatement
    if (id == R.id.action_settings) {
      return true;
    }

    return super.onOptionsItemSelected(item);
  }



  //Does stuff when the log in button is pressed
  /*public void logInButtonPress() {
    Button logInButton = (Button) findViewById(R.id.logInButton);
    logInButton.setOnClickListener(new View.OnClickListener() {
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
  }*/
}