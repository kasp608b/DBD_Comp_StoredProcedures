﻿
using DBD_Comp_StoredProcedures;
using Microsoft.Data.SqlClient;

IStoredProcedures storedProcedures = new StoredProcedures();
bool run = true;

while (run)
{
    Console.WriteLine("Welcome to the company database");
    Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");

    bool runProcedures = true;
    while (runProcedures)
    {

        Console.WriteLine("Here's a list of all available procedures:");
        Console.WriteLine("1. Update the name of a Department");
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");

        Console.WriteLine("Input the corresponding number then press the enter key to invoke it");
        Console.WriteLine("Or press \"q\" then enter to quit");

        string? userInput = Console.ReadLine();

        if (userInput == "q" || userInput == "Q" || userInput == "quit" || userInput == "Quit")
        {
            run = false;
            break;
        }

        if (userInput != "1")
        {
            Console.WriteLine("Invalid input. Please input a valid procedure number or press \"q\" or input \"quit\" then press the enter key to quit out");
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            continue;
        }

        switch (userInput)
        {
            case "1":
                ConsoleUpdateDepartmentName();
                runProcedures = false;
                break;

            default:
                Console.WriteLine("Reached unreachable code, which means something went wrong");
                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
                break;
        }

    }



}

void ConsoleUpdateDepartmentName()
{

    Console.WriteLine("Update the name of a Department");

    int? DNumber = null;

    while (DNumber == null)
    {

        Console.WriteLine("Please input the departament number and press enter");
        Console.WriteLine("Or press \"b\" or input \"back\" then press the enter key to to go back to the procedure select menu");

        string? userInput = Console.ReadLine();

        if (userInput == "b" || userInput == "B" || userInput == "back" || userInput == "Back")
        {
            return;
        }

        var isNumeric = int.TryParse(userInput, out int number);
        if (!isNumeric)
        {
            Console.WriteLine("Invalid input. Please enter a valid departament number or press b or back to go back to the procedure select");
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            continue;
        }

        DNumber = number;

    }

    string? DName = null;

    while (DName == null)
    {
        Console.WriteLine("Please input the departament name and press enter");
        Console.WriteLine("Or press \"b\" or input \"back\" then press the enter key to to go back to the procedure select menu");

        string? userInput = Console.ReadLine();

        if (userInput == "b" || userInput == "B" || userInput == "back" || userInput == "Back")
        {
            return;
        }


        if (userInput.Length < 1)
        {
            Console.WriteLine("Invalid input. Please enter a valid departament name or press b or back to go back to the procedure select");
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            continue;
        }

        DName = userInput;

    }

    try
    {
        int affectedRows = storedProcedures.UpdateDepartmentName((int)DNumber, DName);
        Console.WriteLine("Succes");
        Console.WriteLine("Affected rows: " + affectedRows);
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
    }
    catch (SqlException e)
    {
        Console.WriteLine("An SQl error occured: " + e);
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
    }
    catch (Exception ex)
    {
        Console.WriteLine("An error occured: " + ex);
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
    }




}

