using Microsoft.Data.SqlClient;
using System.Configuration;

try
{
    using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString))
    {
        Console.WriteLine("\nQuery data example:");
        Console.WriteLine("=========================================\n");

        connection.Open();

        String sql = "SELECT TOP (1000) [DName]\r\n      ,[DNumber]\r\n      ,[MgrSSN]\r\n      ,[MgrStartDate]\r\n  FROM [Company].[dbo].[Department]";

        using (SqlCommand command = new SqlCommand(sql, connection))
        {
            using (SqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    Console.WriteLine("\t{0}\t{1}\t{2}\t{3}",
                        reader[0], reader[1], reader[2], reader[3]);
                }
            }
        }
    }
}
catch (SqlException e)
{
    Console.WriteLine(e.ToString());
}
Console.WriteLine("\nDone. Press enter.");
Console.ReadLine();



