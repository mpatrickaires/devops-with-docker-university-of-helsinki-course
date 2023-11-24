using Microsoft.AspNetCore.Mvc;

namespace DotnetApiExample.Controllers;

[ApiController]
[Route("api/hello")]
public class HelloController : ControllerBase
{
    [HttpGet]
    public IActionResult Get() => Ok("Hello, World!");
}
