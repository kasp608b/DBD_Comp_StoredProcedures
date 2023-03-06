using Microsoft.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace DBD_Comp_StoredProcedures
{
    internal class StoredProcedures : IStoredProcedures
    {
        public void GetAllDepartments()
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString))
            {
                // Create command and set its properties
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = "usp_GetAllDepartments";
                command.CommandType = CommandType.StoredProcedure;

                // Open the connection and execute procedure
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            Console.WriteLine("{0}: {1:C}", reader[0], reader[1]);
                        }
                    }
                    else
                    {
                        Console.WriteLine("No rows found.");
                    }
                    reader.Close();
                }

            }
        }

        public int UpdateDepartmentName(int DNumber, string DName)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString))
            {
                // Create command and set its properties
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = "usp_UpdateDepartmentName";
                command.CommandType = CommandType.StoredProcedure;

                // Add the DNumber input parameter and set its properties.
                SqlParameter DNumberParam = new SqlParameter();
                DNumberParam.ParameterName = "@DNumber";
                DNumberParam.SqlDbType = SqlDbType.Int;
                DNumberParam.Direction = ParameterDirection.Input;
                DNumberParam.Value = DNumber;

                // Add the parameter tot the parameters collection.
                command.Parameters.Add(DNumberParam);

                // Add the DName input parameter and set its properties.
                SqlParameter DNameParam = new SqlParameter();
                DNameParam.ParameterName = "@DName";
                DNameParam.SqlDbType = SqlDbType.VarChar;
                DNameParam.Direction = ParameterDirection.Input;
                DNameParam.Value = DName;

                // Add the parameter tot the parameters collection.
                command.Parameters.Add(DNameParam);

                // Open the connection and execute procedure
                connection.Open();
                int affectedRows = command.ExecuteNonQuery();

                return affectedRows;
            }
        }
    }
}

