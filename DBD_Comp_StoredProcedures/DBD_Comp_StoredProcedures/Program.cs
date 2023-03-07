
using DBD_Comp_StoredProcedures;
using Microsoft.Data.SqlClient;

IStoredProcedures storedProcedures = new StoredProcedures();
bool run = true;

while (run)
{
    Console.WriteLine("\nWelcome to the company database");
    Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");

    bool runProcedures = true;
    while (runProcedures)
    {

        Console.WriteLine("\nHere's a list of all available procedures:");
        Console.WriteLine("1. Update the name of a Department");
        Console.WriteLine("2. Get all Departments");
        Console.WriteLine("3. Create Department");
        Console.WriteLine("4. Delete Department");
        Console.WriteLine("5. Update Department manager Department");
        Console.WriteLine("6. Get Department");
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");

        Console.WriteLine("\nInput the corresponding number then press the enter key to invoke it");
        Console.WriteLine("Or press \"q\" then enter to quit");

        string? userInput = Console.ReadLine();

        if (userInput == "q" || userInput == "Q" || userInput == "quit" || userInput == "Quit")
        {
            run = false;
            break;
        }

        if (userInput != "1" && userInput != "2" && userInput != "3" && userInput != "4" && userInput != "5" && userInput != "6")
        {
            Console.WriteLine("\nInvalid input. Please input a valid procedure number or press \"q\" or input \"quit\" then press the enter key to quit out");
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            continue;
        }

        switch (userInput)
        {
            case "1":
                ConsoleUpdateDepartmentName();
                runProcedures = false;
                break;

            case "2":
                ConsoleGetAllDepartments();
                runProcedures = false;
                break;

            case "3":
                ConsoleCreateDepartment();
                runProcedures = false;
                break;

            case "4":
                ConsoleDeleteDepartment();
                runProcedures = false;
                break;
                
            case "5":
                ConsoleUpdateDepartmentManager();
                runProcedures = false;
                break;

            case "6":
                ConsoleGetDepartment();
                runProcedures = false;
                break;

            default:
                Console.WriteLine("\nReached unreachable code, which means something went wrong");
                Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
                break;
        }

    }



}

void ConsoleGetDepartment()
{
    Console.WriteLine("\nget a Department");

    int? DNumber = null;

    while (DNumber == null)
    {

        Console.WriteLine("\nPlease input the departament number and press enter");
        Console.WriteLine("Or press \"b\" or input \"back\" then press the enter key to to go back to the procedure select menu");

        string? userInput = Console.ReadLine();

        if (userInput == "b" || userInput == "B" || userInput == "back" || userInput == "Back")
        {
            return;
        }

        var isNumeric = int.TryParse(userInput, out int number);
        if (!isNumeric)
        {
            Console.WriteLine("\nInvalid input. Please enter a valid departament number or press b or back to go back to the procedure select");
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            continue;
        }

        DNumber = number;

        try
        {
            storedProcedures.GetDepartment((int)DNumber);
            Console.WriteLine("\nSucces");
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            Console.WriteLine("Press any key to continue");
            Console.ReadLine();
        }
        catch (SqlException e)
        {
            Console.WriteLine("\nAn SQl error occured: " + e.Message);
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            Console.WriteLine("Press any key to continue");
            Console.ReadLine();
        }
        catch (Exception ex)
        {
            Console.WriteLine("\nAn error occured: " + ex.Message);
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            Console.WriteLine("Press any key to continue");
            Console.ReadLine();
        }

    }
}

void ConsoleUpdateDepartmentManager()
{
    Console.WriteLine("\n Update a department manager");

    int? DNumber = null;

    while (DNumber == null)
    {

        Console.WriteLine("\nPlease input the departament number and press enter");
        Console.WriteLine("Or press \"b\" or input \"back\" then press the enter key to to go back to the procedure select menu");

        string? userInput = Console.ReadLine();

        if (userInput == "b" || userInput == "B" || userInput == "back" || userInput == "Back")
        {
            return;
        }

        var isNumeric = int.TryParse(userInput, out int number);
        if (!isNumeric)
        {
            Console.WriteLine("\nInvalid input. Please enter a valid departament number or press b or back to go back to the procedure select");
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            continue;
        }

        DNumber = number;


    }
    
    int? MgrSSN = null;

    while (MgrSSN == null)
    {

        Console.WriteLine("\nPlease input the manager SSN number and press enter");
        Console.WriteLine("Or press \"b\" or input \"back\" then press the enter key to to go back to the procedure select menu");

        string? userInput = Console.ReadLine();

        if (userInput == "b" || userInput == "B" || userInput == "back" || userInput == "Back")
        {
            return;
        }

        var isNumeric = int.TryParse(userInput, out int number);
        if (!isNumeric)
        {
            Console.WriteLine("\nInvalid input. Please enter a valid manager SSN number or press b or back to go back to the procedure select");
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            continue;
        }

        MgrSSN = number;

    }

    try
    {
        int affectedRows = storedProcedures.UpdateDepartmentManager((int)DNumber, (int)MgrSSN);
        Console.WriteLine("\nSucces");
        Console.WriteLine("Affected rows: " + affectedRows);
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
        Console.WriteLine("Press any key to continue");
        Console.ReadLine();
    }
    catch (SqlException e)
    {
        Console.WriteLine("\nAn SQl error occured: " + e.Message);
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
        Console.WriteLine("Press any key to continue");
        Console.ReadLine();
    }
    catch (Exception ex)
    {
        Console.WriteLine("\nAn error occured: " + ex.Message);
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
        Console.WriteLine("Press any key to continue");
        Console.ReadLine();
    }
}

void ConsoleDeleteDepartment()
{
    Console.WriteLine("\n Delete a Department");

    int? DNumber = null;

    while (DNumber == null)
    {

        Console.WriteLine("\nPlease input the departament number and press enter");
        Console.WriteLine("Or press \"b\" or input \"back\" then press the enter key to to go back to the procedure select menu");

        string? userInput = Console.ReadLine();

        if (userInput == "b" || userInput == "B" || userInput == "back" || userInput == "Back")
        {
            return;
        }

        var isNumeric = int.TryParse(userInput, out int number);
        if (!isNumeric)
        {
            Console.WriteLine("\nInvalid input. Please enter a valid departament number or press b or back to go back to the procedure select");
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            continue;
        }

        DNumber = number;

        try
        {
            int affectedRows = storedProcedures.DeleteDepartment((int)DNumber);
            Console.WriteLine("\nSucces");
            Console.WriteLine("Affected rows: " + affectedRows);
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            Console.WriteLine("Press any key to continue");
            Console.ReadLine();
        }
        catch (SqlException e)
        {
            Console.WriteLine("\nAn SQl error occured: " + e.Message);
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            Console.WriteLine("Press any key to continue");
            Console.ReadLine();
        }
        catch (Exception ex)
        {
            Console.WriteLine("\nAn error occured: " + ex.Message);
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            Console.WriteLine("Press any key to continue");
            Console.ReadLine();
        }

    }
}

void ConsoleCreateDepartment()
{

    Console.WriteLine("\nCreate a Department");

    int? MgrSSN = null;

    while (MgrSSN == null)
    {

        Console.WriteLine("\nPlease input the manager SSN number and press enter");
        Console.WriteLine("Or press \"b\" or input \"back\" then press the enter key to to go back to the procedure select menu");

        string? userInput = Console.ReadLine();

        if (userInput == "b" || userInput == "B" || userInput == "back" || userInput == "Back")
        {
            return;
        }

        var isNumeric = int.TryParse(userInput, out int number);
        if (!isNumeric)
        {
            Console.WriteLine("\nInvalid input. Please enter a valid manager SSN number or press b or back to go back to the procedure select");
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            continue;
        }

        MgrSSN = number;

    }

    string? DName = null;

    while (DName == null)
    {
        Console.WriteLine("\nPlease input the departament name and press enter");
        Console.WriteLine("Or press \"b\" or input \"back\" then press the enter key to to go back to the procedure select menu");

        string? userInput = Console.ReadLine();

        if (userInput == "b" || userInput == "B" || userInput == "back" || userInput == "Back")
        {
            return;
        }


        if (userInput.Length < 1)
        {
            Console.WriteLine("\nInvalid input. Please enter a valid departament name or press b or back to go back to the procedure select");
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            continue;
        }

        DName = userInput;

    }

    try
    {
        int depid = storedProcedures.CreateDepartment(DName,(int)MgrSSN);
        Console.WriteLine("\nSucces");
        Console.WriteLine("Department id: " + depid);
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
        Console.WriteLine("Press any key to continue");
        Console.ReadLine();
    }
    catch (SqlException e)
    {
        Console.WriteLine("\nAn SQl error occured: " + e.Message);
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
        Console.WriteLine("Press any key to continue");
        Console.ReadLine();
    }
    catch (Exception ex)
    {
        Console.WriteLine("\nAn error occured: " + ex.Message);
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
        Console.WriteLine("Press any key to continue");
        Console.ReadLine();
    }




}
void ConsoleGetAllDepartments()
{
    try
    {
        storedProcedures.GetAllDepartments();
        Console.WriteLine("\nSucces");
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
        Console.WriteLine("Press any key to continue");
        Console.ReadLine();
    }
    catch (SqlException e)
    {
        Console.WriteLine("\nAn SQl error occured: " + e.Message);
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
        Console.WriteLine("Press any key to continue");
        Console.ReadLine();
    }
    catch (Exception ex)
    {
        Console.WriteLine("\nAn error occured: " + ex.Message);
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
        Console.WriteLine("Press any key to continue");
        Console.ReadLine();
    }
}

void ConsoleUpdateDepartmentName()
{

    Console.WriteLine("\nUpdate the name of a Department");

    int? DNumber = null;

    while (DNumber == null)
    {

        Console.WriteLine("\nPlease input the departament number and press enter");
        Console.WriteLine("Or press \"b\" or input \"back\" then press the enter key to to go back to the procedure select menu");

        string? userInput = Console.ReadLine();

        if (userInput == "b" || userInput == "B" || userInput == "back" || userInput == "Back")
        {
            return;
        }

        var isNumeric = int.TryParse(userInput, out int number);
        if (!isNumeric)
        {
            Console.WriteLine("\nInvalid input. Please enter a valid departament number or press b or back to go back to the procedure select");
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            continue;
        }

        DNumber = number;

    }

    string? DName = null;

    while (DName == null)
    {
        Console.WriteLine("\nPlease input the departament name and press enter");
        Console.WriteLine("Or press \"b\" or input \"back\" then press the enter key to to go back to the procedure select menu");

        string? userInput = Console.ReadLine();

        if (userInput == "b" || userInput == "B" || userInput == "back" || userInput == "Back")
        {
            return;
        }


        if (userInput.Length < 1)
        {
            Console.WriteLine("\nInvalid input. Please enter a valid departament name or press b or back to go back to the procedure select");
            Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
            continue;
        }

        DName = userInput;

    }

    try
    {
        int affectedRows = storedProcedures.UpdateDepartmentName((int)DNumber, DName);
        Console.WriteLine("\nSucces");
        Console.WriteLine("Affected rows: " + affectedRows);
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
        Console.WriteLine("Press any key to continue");
        Console.ReadLine();
    }
    catch (SqlException e)
    {
        Console.WriteLine("\nAn SQl error occured: " + e.Message);
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
        Console.WriteLine("Press any key to continue");
        Console.ReadLine();
    }
    catch (Exception ex)
    {
        Console.WriteLine("\nAn error occured: " + ex.Message);
        Console.WriteLine("-----------------------------------------------------------------------------------------------------------------\n");
        Console.WriteLine("Press any key to continue");
        Console.ReadLine();
    }




}

