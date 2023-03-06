// See https://aka.ms/new-console-template for more information
using System.Configuration;

Console.WriteLine(ConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString);
