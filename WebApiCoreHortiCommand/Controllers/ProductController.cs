﻿using APPCOREHORTICOMMAND.IAPP;
using APPDTOCOREHORTICOMMAND.SIGNATURE;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace WEBAPICOREHORTICOMMAND.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductCommandApp _productCommandApp;

        public ProductController(IProductCommandApp productCommandApp)
        {
            _productCommandApp = productCommandApp;
        }

        [HttpPost(nameof(CreateProduct))]
        public async Task<IActionResult> CreateProduct([FromBody] ProductCommandSignature signature)
        {
            await _productCommandApp.CreateProduct(signature);
            return Created(string.Empty, null);
        }

        [HttpDelete(nameof(DeleteProduct))]
        public async Task<IActionResult> DeleteProduct([FromBody] ProductCommandSignature signature)
        {
            await _productCommandApp.DeleteProduct(signature);
            return NoContent();
        }

        [HttpPut(nameof(UpdateProduct))]
        public async Task<IActionResult> UpdateProduct([FromBody] ProductCommandSignature signature)
        {
            await _productCommandApp.UpdateProduct(signature);
            return NoContent();
        }
    }
}