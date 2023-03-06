namespace DBD_Comp_StoredProcedures
{
    internal interface IStoredProcedures
    {
        int UpdateDepartmentName(int DNumber, string DName);

        void GetAllDepartments();
    }
}
