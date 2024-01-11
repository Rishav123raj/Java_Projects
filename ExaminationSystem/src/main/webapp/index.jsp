<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #8fbc8f;
    margin: 0;
}

header {
    background-color: #333;
    color: #fff;
    padding: 10px;
    text-align: center;
}

a {
    color: #fff;
    text-decoration: none;
}

div {
    max-width: 800px;
    margin: 20px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #333;
}

h2 {
    color: #555;
    margin-bottom: 10px;
}

h3 {
    color: #777;
}

    </style>
</head>
<body>

    <header>
        <a href="<%= request.getContextPath() %>/ExamController?action=login">Login</a>
    </header>

    <div>
    
        <h1>Welcome to Online Examination Portal of GGI College.</h1><br/><br/>
       <h2>Guidelines for Exam:</h2><br/>
       <h3> 1. Candidate should login their account using desktop / laptop with webcam access.</br></br>
            2. The exam will be of 30 minutes.</br></br>
            3. Candidate's face will be verified before the start of the exam.</br></br>
            4. Any sort of movement from the screen will result in exam cancellation.</br></br>
            5. Questions will be asked from Logical Reasoning , Grooming and Verbal Aptitude.
       </h3>
    </div>

</body>
</html>