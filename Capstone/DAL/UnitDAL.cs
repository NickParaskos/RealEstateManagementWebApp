﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAL
{
    public class UnitDAL
    {
        private string connectionString;

        public UnitDAL(string connectionString)
        {
            this.connectionString = connectionString;
        }
    }
}