<%@page import="java.sql.*"%>
<%@page import="oaapDao.*" %>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!--Jquery CDN(Content Delivery Networks) links-->
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap CSS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
     

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

        <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"><!--Link for Icons-->

<link href="https://fonts.googleapis.com/css?family=Dosis" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="admin_panel_update.css">
   

<!---------------------REGISTER--------VALIDATION----------------------->

  </head>

  <body>

  <%    
  
  oaapAdminDao oad=new oaapAdminDao();
   QuestionAnswerJavaBean qajb=new QuestionAnswerJavaBean();

  String subject=request.getParameter("subject");
  String difficulty=request.getParameter("difficulty");  
 
%>
     <div class="container">
<div class="row">________________________________________<h1 style"font-family:Dosis;color:white"><%=subject%><sup><%=difficulty%></sup>Record</h1>______________________________________</div>
<hr style="background-color:#F60100">
<!------------------------------------------------------------DATA FETCH ------------------------------------------------------>
 
 
 <%     
  

  try {
  Connection con=oad.getConnection();  

  PreparedStatement ps=con.prepareStatement("select * from ooa_"+subject+"_"+difficulty);
  
  ResultSet resultset=ps.executeQuery();

	 

     while(resultset.next())
     {

	 qajb.setQid(resultset.getInt(1));
     qajb.setQuestion(resultset.getString(3));
     qajb.setA(resultset.getString(4));
	 qajb.setB(resultset.getString(5));
	 qajb.setC(resultset.getString(6));
	 qajb.setD(resultset.getString(7));
	 qajb.setAnswer(resultset.getString(8));

	 
String opt_a="",opt_b="",opt_c="",opt_d="";

if(qajb.getAnswer().equals("A")){
opt_a="selected";
}
else if(qajb.getAnswer().equals("B")){
opt_b="selected";
}
else if(qajb.getAnswer().equals("C")){
opt_c="selected";
}
else if(qajb.getAnswer().equals("D")){
opt_d="selected";
}


   %>  
     <!-------------------------------UPDATE LAYOUT------------------------------------------------------------->

    <form action="admin_update.jsp">
<div class="row" style="margin-top:40px;margin-left:-20px;height:250px;border:1px solid black">

 <%out.print("<p style='padding-top:70px'>Q</p><textarea name='new_sno' style='margin-top: 70px;margin-left: 20px;height:30px;width:100px;resize:none ' >"+qajb.getQid()+"</textarea>");%>

      <div class="row" style="margin-left:40px;height:250px;">
            
                   
          <div class="row">
            <div class="col" style="margin-left:-100px;">
         
 
           <!-----------QUESTION CARD---------------------->  
             
             <div class="row" id="question_card" style="">
             
               <div class="col" style="padding-left:20px;">
                
             <%out.print("<textarea class='form-control' name='question'  style='resize: none;height: 35px;width: 700px;margin-top: -15px' >"+qajb.getQuestion()+"</textarea>");%>
                
			<%out.print("<input type='hidden' name='old_sno' value="+qajb.getQid()+">");%> 
            
			   </div>

             </div>

           <!-----------QUESTION CARD---------------------->   

          <!-----------OPTION A AND B---------------------->
             <div class="row" id="option_col">

      <div class="col" id="option">
	 <%out.print("<input type='text' name='A' id='option_input' placeholder='A' value="+qajb.getA()+ ">");%>
          </div>
              
              <div class="col" id="option">
           <%out.print("<input type='text' name='B' id='option_input' placeholder='B' value="+qajb.getB()+ ">");%>
				 <!--<input type="text" name="B" id="option_input" placeholder="B">-->
              </div>
               
             </div>

           <!-----------OPTION A AND B---------------------->  

           <!-----------ANSWER SELECT---------------------->     
                <div class="row" style="margin-left:53%;max-width: 50%">
                  <%out.print(' ');%>
                  <select name="answer" id="select_answer">
                   <option value="">Select Answer</option>
                   <% out.print("<option value='A' "+opt_a+">A</option>");%>
                   <% out.print("<option value='B' "+opt_b+">B</option>");%>
				    <% out.print("<option value='C' "+opt_c+">C</option>");%>
				    <% out.print("<option value='D' "+opt_d+">D</option>");%>

                 </select>
              
               </div>
           <!-----------ANSWER SELECT---------------------->    


         <!-----------OPTION C AND D---------------------->
            <div class="row" id="option_col" style="">
            
              <div class="col" id="option">
			  <%out.print("<input type='text' name='C' id='option_input' placeholder='C' value="+qajb.getC()+ ">");%>
              <!-- <input type="text" name="C" id="option_input" placeholder="C">-->
              </div>
            
	
               <div class="col" id="option">
			<%out.print("<input type='text' name='D' id='option_input' placeholder='D' value="+qajb.getD()+ ">");%>
                <!-- <input type="text" name="D" id="option_input" placeholder="D">-->
              </div>
               
            </div>
         <!-----------OPTION C AND D---------------------->   

   		 <input type="hidden" name="subject" value=<%=subject%>>
    	  <input type="hidden" name="difficulty" value=<%=difficulty%>>
       
             <div class="row" style="margin-top:10px;margin-left: 50%">
               <div class="col" style="max-width: 15%"><button type="submit" class="btn btn-success">Update</button></div><!------------update button----------->
        </form>


              <!------------delete form----------->
               <form action="admin_delete.jsp">    
			   <input type='hidden' name='sno' value=<%=qajb.getQid()%>>
			   <input type="hidden" name="subject" value=<%=subject%>>
    	       <input type="hidden" name="difficulty" value=<%=difficulty%>>
       
                 <div class="col" style="margin-left:5%;max-width: 15%"><button type="submit" class="btn btn-danger">Delete</button></div>
                
                 </div>
                  </form>
              <!------------delete form----------->    

                 </div>
              </div> 
           </div>
      </div>

<!---------------------------------------UPDATE LAYOUT--------------------------------------------------------->

<%
       
     }
	 }
	  catch(Exception e){
System.out.println(e);
}





     %>

<!---------------------------------------------------DATA FETCH-------------------------------------------------------------->






       </div>

  </body>

</html>