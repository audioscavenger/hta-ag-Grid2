<!-- :
:: PasswordSubmitter.bat
@echo off
pushd %~dp0

:: https://github.com/npocmaka/batch.scripts/tree/master/hybrids/mshta/ui.extensions

REM setlocal EnableDelayedExpansion
REM for /f "tokens=* delims=" %%p in ('mshta.exe "%~f0"') do (
for /f "tokens=* delims=" %%p in ('mshta.exe "%~dp0\index.html"') do (
    set "pass=%%p"
)
pushd %~dp0
echo your password is %pass%
setlocal EnableDelayedExpansion
echo your password is not %pass%
setlocal disableDelayedExpansion
echo your password is still %pass%
timeout /t 2 >NUL
exit /b
-->

<!doctype html>
<html lang="en">
<head>
  <title>Ag-Grid Basic Example</title>
  <meta charset="utf-8">
  <link rel="icon" href="./dist/assets/favicon.ico">



  <!-- https://stackoverflow.com/questions/6771258/what-does-meta-http-equiv-x-ua-compatible-content-ie-edge-do -->
  <!-- https://www.robvanderwoude.com/vbstech_hta.php -->
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  
  <!-- https://www.ag-grid.com/javascript-grid/ -->
  <!-- <script src='./dist/assets/ag-grid-community.min.js'></script> -->
  <script src="https://unpkg.com/ag-grid-community/dist/ag-grid-community.min.noStyle.js"></script>
  <link rel="stylesheet" href="https://unpkg.com/ag-grid-community/dist/styles/ag-grid.css">
  <link rel="stylesheet" href="https://unpkg.com/ag-grid-community/dist/styles/ag-theme-alpine.css">

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <link href="./dist/assets/ie10-viewport-bug-workaround.css" rel="stylesheet">

  <script language='javascript' charset='utf-8'>
    window.resizeTo(900,600);
    function entperPressed(e){
      if (e.keyCode == 13) {
        pipePassword();
      }
    }
    function pipePassword() {
      var password=document.getElementById('password').value;
      var fso= new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1);
      close(fso.Write(password));
    }
  </script>

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
  <div class="container">
    <div class="row">
      <div id="myGrid" class="offset-md-1 col-md-16 ag-theme-alpine"></div>
    </div>
    
    <hr>
    <input id='password' type='password' name='password' size='15' onkeypress="return entperPressed(event)" ></input>
    <hr>
    <button onclick='pipePassword()'>
      Submit 
      <img src="data:image/gif;base64,R0lGODlhIAAgAOYAAABbAIiwiER8RADMANbW1gCZAGaZZsXFxR3oHTrWOgCDAK60rgD0AA6dDmm+aRZmFlDBPubm5gDoACKNIr7mvlCeUACjAGb/ZqK0ojz4PAB1ACbUJgC1AESSRA7DDgDeAA+FD9jl2FbSVmmtab29vUS6PhqnGj62Poi2iACZAO7u7hPSE8zMzABmAN3d3VCsUHj4eH6/fqfMp1q+WiL/In6ufh1xHXGccUzXTBqwAADuAAC9AAD/AADVAN7w3gtlC0mHSR3FHYjDiAqnAAWSBQB6AB6nHl62XpWmlQCLADfpN3WwdSJsIkSNRB/4H6fEp1DqUEH/QQicCDPMM0mpSQDDAEmUSSKTIpWxlS1xLQBmAACwAMPqvlCkUFGyUZWwlQuiC3G/ahKlEg+MDz7JPhWvFafWp3u4ewtpCx+rH3a1dv///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAUUAGsALAAAAAAgACAAAAf/gGuCg4SFhoeIiYqLjI2Oj5CRhFwQORSSiBQlQ0NhFjOYhBQnFqVnB0YFXiqYPjMFYAUFSwcuDrIvrI+uBWIiaQ01tWtmBWQFuY0+RwUNODAmUljDgkkJCUnJictJRFMXUA1jXwcRhFRlURtJXbqFKmHdQRlRSkRXGCzmhEJENDQrFLQjpCLGmCQenPxDQGTCAn2GQij4wIPHAAUVWBUEkaQKg4oWFTiEeGgCB5ADilRQA6LIjo8oi3R4uO/QiCQMcjKoUqSIBQk6c/LsQIKAu0MyNHzQwVRHj6VNmVrQ0KToUUQadkjYyrWrhAIablhtZCXJh7No0xZocYNaIxRKYtOi7VGErdtGIVps6cG3L100SO46spFkgGHDVTT8COwCk4EWhwdwaPEACUlJTwBwqFJlSwsmNEMJAlBgh4XPoUWvAVKkAIAsqVUHAABAQNGaqkMAADJWNaEIBIz6Hk68eKhAADs=" alt="Embedded icon" title="Embedded icon" />
    </button>
    <p>Because this HTA includes an X-UA-Compatible header, 
    it is displayed in IE9 Standards mode when Internet 
    Explorer 9 is installed on the system.  As a result,
    SVG can be used to draw a blue star.</p> 
    <img src="./dist/assets/favicon.ico" alt="Embedded icon" title="Embedded icon" />    

    <svg width="12cm" height="4cm" viewBox="0 0 1200 400"
        xmlns="http://www.w3.org/2000/svg" version="1.1">
      <desc>Example Star</desc>
      <polygon 
          fill="blue" stroke="blue" stroke-width="10" 
          points="350,75  379,161 469,161 397,215 423,301 
                  350,250 277,301 303,215 231,161 321,161" />
    </svg>
    
  </div>
  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <script src="./dist/assets/ie10-viewport-bug-workaround.js"></script>

  <script type="text/javascript" charset="utf-8">
    // specify the columns
    var columnDefs = [
      {headerName: "Make", field: "make"},
      {headerName: "Model", field: "model"},
      {headerName: "Price", field: "price"}
    ];

    // specify the data
    var rowData = [
      {make: "Toyota", model: "Celica", price: 35000},
      {make: "Ford", model: "Mondeo", price: 32000},
      {make: "Porsche", model: "Boxter", price: 72000}
    ];

    // let the grid know which columns and what data to use
    var gridOptions = {
      columnDefs: columnDefs,
      rowData: rowData
    };

  // lookup the container we want the Grid to use
  //var gridDiv = document.querySelector('#myGrid');

  // create the grid passing in the div to use together with the columns & data we want to use
  //new agGrid.Grid(gridDiv, gridOptions);
  
  //document.addEventListener('DOMContentLoaded', function() {
    //var gridDiv = document.querySelector('#myGrid');
    var gridDiv = document.getElementById('#myGrid');
    new agGrid.Grid(gridDiv, gridOptions);
  //});

  </script>
</body>
</html>
