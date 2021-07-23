<%-- 
    Document   : index
    Created on : Aug 30, 2020, 7:37:23 PM
    Author     : Luan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Index -JavaServlets</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
      <h1>JavaServlets</h1>
      <h2>Início</h2>
      
      <a href="luan.html" style="text-decoration:none; color: #00f; font-weight: bold;">Luan Silva</a>
      <br><br>
      
      <a href="server-date.html" style="text-decoration:none; color: #00f; font-weight: bold;">Data / hora do servidor</a>
      <br><br>
      
      <a href="greeting.html" style="text-decoration:none; color: #00f; font-weight: bold;">Saudações</a>
      
      <form action="subtraction.html"
        style='display: flex; flex-direction: column; max-width: 150px;'>
        
        <label 
          for="n1" 
          style="margin-top: 20px; font-weight: bold">
          Numero 1:
        </label>
        
        <input 
          type="number" 
          id="n1" 
          name="n1"
          style="padding: 5px"
        />

        <label 
          for="n2" 
          style="margin-top: 20px; font-weight: bold">
          Numero 2:
        </label>
        
        <input 
          type="number" 
          id="n2" 
          name="n2"
          style="padding: 5px"
        />

        <button 
          type="submit" 
          style="margin-top: 20px; color: #fff; background-color: green; font-weight: bold; border: 0; padding: 5px">
          SUBTRAIR
        </button>
      </form>
    </body>
</html>
