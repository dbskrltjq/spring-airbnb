<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">

    

    <link rel="stylesheet" href="/resources/css/rome.css">
    
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="/resources/css/style.css">

    <title>Calendar #7 (inline)</title>
  </head>
  <body>
  

  <div class="content">
    
    <div class="container text-left">
      
      <div class="row justify-content-center">
        <div class="col-md-10 text-center">
          <h2 class="mb-5 text-center">Calendar #7 (Inline + Result + Range)</h2>
          <div class="d-flex">
          <input type="text" class="form-control m-2  mb-3" id="result_from" placeholder="Check in" disabled="">
          <input type="text" class="form-control m-2  mb-3" id="result_to" placeholder="Check out" disabled="">
          </div>
          <form action="#" class="row">
            <div class="col-lg-6 mb-4">
              <div id="inline_cal_from"></div>
            </div>
            <div class="col-lg-6 mb-4">
              <div id="inline_cal_to"></div>
            </div>
          </form>
        </div>
      </div>
          
    </div>
  </div>
    
    

    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/popper.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/rome.js"></script>
    <script src="/resources/js/main.js"></script>
  </body>
</html>