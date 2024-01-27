<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact</title>
<style>
body {
    font-family: 'Arial', sans-serif;
    background-color: #f2f2f2;
    margin: 0;
}

header {
    background-color: #666;
    color: #fff;
    text-align: center;
    padding: 10px;
}

section {
    background-color: #fff;
    padding: 20px;
    margin: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1, h2 {
    color: #333;
}

ul {
    list-style: none;
    padding: 0;
}

li {
    margin-bottom: 10px;
}

a {
    color: #007bff;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}

address {
    font-style: normal;
}

footer {
    background-color: #666;
    color: #fff;
    text-align: center;
    padding: 10px;
    position: fixed;
    bottom: 0;
    width: 100%;
}

/* Optional: Add hover effect to sections */
section:hover {
    background-color: #f0f0f0;
    transition: background-color 0.3s ease;
}
</style>
</head>
<body>

    <header>
        <h1>Contact Information</h1>
    </header>

    <section>
        <h2>Customer Support</h2>
        <p>
            For any assistance or inquiries, please contact our customer support team:
        </p>
        <ul>
            <li>Email: <a href="mailto:support@example.com">support@example.com</a></li>
            <li>Phone: +1 (123) 456-7890</li>
            <!-- Add more contact details as needed -->
        </ul>
    </section>

    <section>
        <h2>Technical Support</h2>
        <p>
            If you have technical questions or issues related to the ATM Management System, reach out to our technical support:
        </p>
        <ul>
            <li>Email: <a href="mailto:techsupport@example.com">techsupport@example.com</a></li>
            <li>Phone: +1 (123) 789-0123</li>
            <!-- Add more technical support details as needed -->
        </ul>
    </section>

    <section>
        <h2>Address</h2>
        <p>
            Visit our office at the following address:
        </p>
        <address>
            ATM Management Solutions<br>
            123 Main Street<br>
            Cityville, State 12345<br>
            Country
        </address>
    </section>

    <footer>
        <p>&copy; 2024 ATM Management Project. All rights reserved.</p>
    </footer>

</body>
</html>