package com.orgpoint.android.login;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import butterknife.Bind;
import butterknife.ButterKnife;
import butterknife.OnClick;
import com.orgpoint.android.R;
import com.orgpoint.android.home.HomeActivity;

public class LoginActivity extends AppCompatActivity {

  @Bind(R.id.email_edit)
  EditText emailEdit;

  @Bind(R.id.password_edit)
  EditText passwordEdit;

  @Bind(R.id.login_button)
  Button loginButton;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_log_in);
    ButterKnife.bind(this);
  }


  @OnClick(R.id.login_button)
  protected void onLoginClicked(View view){
    String email = emailEdit.getText().toString();
    String password = passwordEdit.getText().toString();
    if (password.equals("admin") && email.equals("admin@admin.com")) {
      Toast.makeText(LoginActivity.this, "Success!", Toast.LENGTH_SHORT).show();
      startActivity(new Intent(this, HomeActivity.class));
    } else {
      Toast.makeText(LoginActivity.this, "Wrong", Toast.LENGTH_SHORT).show();
    }
  }


}