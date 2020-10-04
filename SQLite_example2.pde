// fjenett 20120226

import de.bezier.data.sql.*;

SQLite db;

void setup()
{
  size( 100, 100 );

  db = new SQLite( this, "test.db" );  // open database file

  if ( db.connect() )
  {
    String[] tableNames = db.getTableNames();

    db.query( "SELECT * FROM %s", tableNames[0] );

    while (db.next())
    {
      String name =db.getString("Name");
      String pwd = db.getString("Password"); 

      println("Username: "+ name + "       " + "Password: " + pwd);
    }
  }
  //db.query("INSERT INTO User (Name, Password)"+ "VALUES ('Kieran', 'Theo')");
  db.query("DELETE FROM User"+"WHERE Name='Anders'");
}
