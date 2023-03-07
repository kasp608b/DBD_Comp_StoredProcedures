namespace DBD_Comp_StoredProcedures
{
    internal interface IStoredProcedures
    {
        int UpdateDepartmentName(int DNumber, string DName);

        void GetAllDepartments();

        void GetDepartment(int DNumber);
        
        int CreateDepartment(string DName, int MgrSSN);

        int UpdateDepartmentManager(int DNumber, int MgrSSN);

        int DeleteDepartment(int DNumber);


    }
}
