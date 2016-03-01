package com.orgpoint.android.home;

import android.os.Bundle;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.MenuItem;
import android.view.View;
import butterknife.Bind;
import butterknife.ButterKnife;
import com.orgpoint.android.R;
import com.orgpoint.android.company.CompanyFragment;
import com.orgpoint.android.profile.ProfileFragment;

public class HomeActivity extends AppCompatActivity {

  @Bind(R.id.toolbar)
  Toolbar toolbar;

  @Bind(R.id.navigation_view)
  NavigationView navigationView;

  @Bind(R.id.drawer)
  DrawerLayout drawerLayout;


  private int currentItem;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_home);
    ButterKnife.bind(this);
    setSupportActionBar(toolbar);
    setupDrawerLayout();
    setupNavigationView();
  }

  private void setupNavigationView() {
    if (getSupportActionBar() != null) {
      navigationView.setNavigationItemSelectedListener(
          new NavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(MenuItem item) {
              drawerLayout.closeDrawer(GravityCompat.START);
              handleDrawerItemClick(item);
              return true;
            }
          });
    }
  }

  private void handleDrawerItemClick(MenuItem item) {
    if (currentItem != item.getItemId()) {
      getSupportActionBar().setTitle(item.getTitle().toString());
      currentItem = item.getItemId();
      swapFragment(item.getItemId());

    } else {
      drawerLayout.closeDrawer(GravityCompat.START);
    }
  }

  private void swapFragment(int itemId){
    switch (itemId){
      case R.id.profile_item:
        ProfileFragment profileFragment = ProfileFragment.getInstance();
        getSupportFragmentManager().beginTransaction().replace(R.id.fragment_container, profileFragment).commit();
        break;
      case R.id.company_item:
        CompanyFragment companyFragment = CompanyFragment.getInstance();
        getSupportFragmentManager().beginTransaction().replace(R.id.fragment_container, companyFragment).commit();
        break;
      case R.id.timeline_item:

        break;

    }
  }

  private void setupDrawerLayout() {
    if (getSupportActionBar() != null) {
      getSupportActionBar().setDisplayHomeAsUpEnabled(true);
      toolbar.setNavigationIcon(R.drawable.menu_item);
      toolbar.setNavigationOnClickListener(new View.OnClickListener() {
        @Override
        public void onClick(View v) {
          drawerLayout.openDrawer(GravityCompat.START);
        }
      });
    }
  }

  @Override
  public void onBackPressed() {
    if (drawerLayout.isDrawerOpen(GravityCompat.START)) {
      drawerLayout.closeDrawer(GravityCompat.START);
    } else {
      super.onBackPressed();
    }
  }
}
