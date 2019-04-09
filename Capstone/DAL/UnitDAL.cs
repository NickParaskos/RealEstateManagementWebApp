﻿using Capstone.DAL.Interfaces;
using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAL
{
    public class UnitDAL : IUnitDAL
    {
        private const string SQL_AddUnit = "INSERT INTO Unit (PropertyID, TenantID, MonthlyRent, Sqft, NumOfBaths, NumOfBeds, Description, ApplicationFee, SecurityDeposit, PetDeposit, TagLine, ImageSource, AddressLine1, AddressLine2, City, State, ZipCode) VALUES (@PropertyID, @TenantID, @MonthlyRent, @Sqft, @NumOfBaths, @NumOfBeds, @Description, @ApplicationFee, @SecurityDeposit, @PetDeposit, @TagLine, @ImageSource, @AddressLine1, @AddressLine2, @City, @State, @ZipCode);";

        private string connectionString;

        public UnitDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public bool AddUnit(Unit unit)
        {
            bool result = false;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    SqlCommand cmd = new SqlCommand(SQL_AddUnit, connection);
                    cmd.Parameters.AddWithValue("@PropertyID", unit.PropertyID);
                    cmd.Parameters.AddWithValue("@TenantID", unit.TenantID);
                    cmd.Parameters.AddWithValue("@MonthlyRent", unit.MonthlyRent);
                    cmd.Parameters.AddWithValue("@Sqft", unit.SquareFeet);
                    cmd.Parameters.AddWithValue("@NumOfBaths", unit.NumberOfBaths);
                    cmd.Parameters.AddWithValue("@NumOfBeds", unit.NumberOfBeds);
                    cmd.Parameters.AddWithValue("@Description", unit.UnitDescription);
                    cmd.Parameters.AddWithValue("@ApplicationFee", unit.ApplicationFee);
                    cmd.Parameters.AddWithValue("@SecurityDeposit", unit.SecurityDeposit);
                    cmd.Parameters.AddWithValue("@PetDeposit", unit.PetDeposit);
                    cmd.Parameters.AddWithValue("@TagLine", unit.UnitTagline);
                    cmd.Parameters.AddWithValue("@ImageSource", (unit.ImageSource??(object)DBNull.Value));
                    cmd.Parameters.AddWithValue("@AddressLine1", unit.AddressLine1);
                    cmd.Parameters.AddWithValue("@AddressLine2", (unit.AddressLine2??(object)DBNull.Value));
                    cmd.Parameters.AddWithValue("@City", unit.City);
                    cmd.Parameters.AddWithValue("@State", unit.State);
                    cmd.Parameters.AddWithValue("@ZipCode", unit.ZipCode);

                    cmd.ExecuteNonQuery();
                }

                result = true;
            }
            catch (SqlException ex)
            {
                result = false;
                throw ex;
            }

            return result;
        }
    }
}
