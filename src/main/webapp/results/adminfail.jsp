<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Failure</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5 d-flex justify-content-center">
        <div class="card shadow p-4 text-center" style="max-width: 500px; width: 100%;">
            <h2 class="text-danger">Failure!</h2>
            <p class="mt-3"><strong>${sessionScope.result}</strong></p>
            <button class="btn btn-primary mt-3" onclick="history.back()">Go Back</button>
        </div>
    </div>
</body>
</html>
