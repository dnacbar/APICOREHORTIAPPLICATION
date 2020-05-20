﻿using APPDTOCOREHORTIQUERY.RESULT;
using APPDTOCOREHORTIQUERY.SIGNATURE;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace APPCOREHORTIQUERY.IAPP
{
    public interface ICityQueryApp
    {
        Task<CityResult> GetCityById(ConsultCitySignature signature);
        Task<IEnumerable<CityResult>> GetFullListOfCities();
        Task<IEnumerable<CityResult>> GetListOfCities(ConsultCitySignature signature);

    }
}