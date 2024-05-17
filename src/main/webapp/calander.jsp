
<%@page import="ELM.java.Connection.DbCon"%>
<%@page import="ELM.java.Model.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.*"%>
<%@page import="ELM.java.DAO.*"%>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="java.io.*" %>
<%
LocalDate today = LocalDate.now();
Users auth = (Users) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Leave Calender</title>
<%@include file="includes/header.jsp"%>
<style>
* {box-sizing: border-box;}
ul {list-style-type: none;}
body {font-family: Verdana, sans-serif;}

.month {
  padding: 20px 5px;
  width: 80%;
  margin: auto auto;
  background: #1abc9c;
  text-align: center;
}

.month ul {
  margin: 0;
  padding: 0;
}

.month ul li {
  color: black;
  font-size: 25px;
  font-weight: 900;
  text-transform: uppercase;
  letter-spacing: 3px;
}

.month .prev {
  float: left;
  padding-top: 10px;
}

.month .next {
  float: right;
  padding-top: 10px;
}

.weekdays {
  margin: 0;
  padding: 10px 0;
  background-color: #ddd;
  width: 80%;
  margin: auto auto;
}

.weekdays li {
  display: inline-block;
  width: 13.6%;
  color: black;
  text-align: center;
  font-size: 25px;
}

.days {
height:30vh;
  padding:30px 0;
  background: #eee;
  width: 80%;
  margin: auto auto;
}

.days li {
  list-style-type: none;
  display: inline-block;
  width: 13.6%;
  text-align: center;
  margin-bottom: 5px;
  font-size:12px;
  color: #777;
  font-size: 18px;
  font-weight: 700;;
}

.days li .active {
  padding: 5px;
  background: red;
  color: white !important
}
.days li .active1 {
  padding: 5px;
  background: green;
  color: white !important
}
/* Add media queries for smaller screens */
@media screen and (max-width:720px) {
  .weekdays li, .days li {width: 13.1%;}
}

@media screen and (max-width: 420px) {
  .weekdays li, .days li {width: 12.5%;}
  .days li .active {padding: 2px;}
}

@media screen and (max-width: 290px) {
  .weekdays li, .days li {width: 12.2%;}
}
</style>
</head>
<body>

<%@include file="includes/navbar.jsp"%>

<h1 style="text-align: center;margin-top: 7vh; margin-bottom: 2vh; font-size: 60px;">Employee Leave Calender	</h1>
<div class="main-calander" style="height: 90vh; margin-top: 12vh;"> 
<div class="month">      
  <ul>
    <li class="prev">&#10094;</li>
    <li class="next">&#10095;</li>
    <li>
      May<br>
      <span style="font-size:18px">2024</span>
    </li>
  </ul>
</div>

<ul class="weekdays">
  <li>Mo</li>
  <li>Tu</li>
  <li>We</li>
  <li>Th</li>
  <li>Fr</li>
  <li>Sa</li>
  <li>Su</li>
</ul>

<ul class="days">  
    <li>-</li>
    <li>-</li>
  <li>1</li>
  <li>2</li>
  <li>3</li>
  <li>4</li>
  <li>5</li>
  <li>6</li>
  <li>7</li>
  <li>8</li>
  <li>9</li>
  <li>10</li>
  <li>11</li>
  <li>12</li>
  <li>13</li>
  <li>14</li>
  <li><span class="active">15</span></li>
  <li><span class="active">16</span></li>
  <li><span class="active">17</span></li>
  <li><span class="active">18</span></li>
  <li><span class="active">19</span></li>
  <li><span class="active">20</span></li>
  <li>21</li>
  <li>22</li>
  <li>23</li>
  <li>24</li>
  <li><span class="active1">25</span></li>
   <li><span class="active1">26</span></li>
   <li><span class="active1">27</span></li>
   <li><span class="active1">28</span></li>
   <li><span class="active1">29</span></li>
   <li><span class="active1">30</span></li>
   <li><span class="active1">31</span></li>
</ul>
</div>
<br><hr> <br>
<div class="month">      
    <ul>
      <li class="prev">&#10094;</li>
      <li class="next">&#10095;</li>
      <li>
        June<br>
        <span style="font-size:18px">2024</span>
      </li>
    </ul>
  </div>
<ul class="weekdays">
    <li>Mo</li>
    <li>Tu</li>
    <li>We</li>
    <li>Th</li>
    <li>Fr</li>
    <li>Sa</li>
    <li>Su</li>
  </ul>
  
  <ul class="days">  
      <li>-</li>
      <li>-</li>
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
    <li>5</li>
    <li>6</li>
    <li>7</li>
    <li>8</li>
    <li>9</li>
    <li><span class="active">10</span></li>
    <li>11</li>
    <li>12</li>
    <li>13</li>
    <li>14</li>
    <li>15</li>
    <li>16</li>
    <li>17</li>
    <li>18</li>
    <li>19</li>
    <li>20</li>
    <li>21</li>
    <li>22</li>
    <li>23</li>
    <li>24</li>
    <li>25</li>
    <li>26</li>
    <li>27</li>
    <li>28</li>
    <li>29</li>
    <li>30</li>
    <li>31</li>
  </ul>

  <br><hr> <br>
<div class="month">      
    <ul>
      <li class="prev">&#10094;</li>
      <li class="next">&#10095;</li>
      <li>
        July<br>
        <span style="font-size:18px">2024</span>
      </li>
    </ul>
  </div>
<ul class="weekdays">
    <li>Mo</li>
    <li>Tu</li>
    <li>We</li>
    <li>Th</li>
    <li>Fr</li>
    <li>Sa</li>
    <li>Su</li>
  </ul>
  
  <ul class="days">  
      <li>-</li>
      <li>-</li>
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
    <li>5</li>
    <li>6</li>
    <li>7</li>
    <li>8</li>
    <li>9</li>
    <li><span class="active">10</span></li>
    <li>11</li>
    <li>12</li>
    <li>13</li>
    <li>14</li>
    <li>15</li>
    <li>16</li>
    <li>17</li>
    <li>18</li>
    <li>19</li>
    <li>20</li>
    <li>21</li>
    <li>22</li>
    <li>23</li>
    <li>24</li>
    <li>25</li>
    <li>26</li>
    <li>27</li>
    <li>28</li>
    <li>29</li>
    <li>30</li>
    <li>31</li>
  </ul>


  <br><hr> <br>
<div class="month">      
    <ul>
      <li class="prev">&#10094;</li>
      <li class="next">&#10095;</li>
      <li>
        August<br>
        <span style="font-size:18px">2024</span>
      </li>
    </ul>
  </div>
<ul class="weekdays">
    <li>Mo</li>
    <li>Tu</li>
    <li>We</li>
    <li>Th</li>
    <li>Fr</li>
    <li>Sa</li>
    <li>Su</li>
  </ul>
  
  <ul class="days">  
      <li>-</li>
      <li>-</li>
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
    <li>5</li>
    <li>6</li>
    <li>7</li>
    <li>8</li>
    <li>9</li>
    <li><span class="active">10</span></li>
    <li>11</li>
    <li>12</li>
    <li>13</li>
    <li>14</li>
    <li>15</li>
    <li>16</li>
    <li>17</li>
    <li>18</li>
    <li>19</li>
    <li>20</li>
    <li>21</li>
    <li>22</li>
    <li>23</li>
    <li>24</li>
    <li>25</li>
    <li>26</li>
    <li>27</li>
    <li>28</li>
    <li>29</li>
    <li>30</li>
    <li>31</li>
  </ul>


  <br><hr> <br>
<div class="month">      
    <ul>
      <li class="prev">&#10094;</li>
      <li class="next">&#10095;</li>
      <li>
        September<br>
        <span style="font-size:18px">2024</span>
      </li>
    </ul>
  </div>
<ul class="weekdays">
    <li>Mo</li>
    <li>Tu</li>
    <li>We</li>
    <li>Th</li>
    <li>Fr</li>
    <li>Sa</li>
    <li>Su</li>
  </ul>
  
  <ul class="days">  
      <li>-</li>
      <li>-</li>
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
    <li>5</li>
    <li>6</li>
    <li>7</li>
    <li>8</li>
    <li>9</li>
    <li><span class="active">10</span></li>
    <li>11</li>
    <li>12</li>
    <li>13</li>
    <li>14</li>
    <li>15</li>
    <li>16</li>
    <li>17</li>
    <li>18</li>
    <li>19</li>
    <li>20</li>
    <li>21</li>
    <li>22</li>
    <li>23</li>
    <li>24</li>
    <li>25</li>
    <li>26</li>
    <li>27</li>
    <li>28</li>
    <li>29</li>
    <li>30</li>
    <li>31</li>
  </ul>


  <br><hr> <br>
<div class="month">      
    <ul>
      <li class="prev">&#10094;</li>
      <li class="next">&#10095;</li>
      <li>
        October<br>
        <span style="font-size:18px">2024</span>
      </li>
    </ul>
  </div>
<ul class="weekdays">
    <li>Mo</li>
    <li>Tu</li>
    <li>We</li>
    <li>Th</li>
    <li>Fr</li>
    <li>Sa</li>
    <li>Su</li>
  </ul>
  
  <ul class="days">  
      <li>-</li>
      <li>-</li>
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
    <li>5</li>
    <li>6</li>
    <li>7</li>
    <li>8</li>
    <li>9</li>
    <li><span class="active">10</span></li>
    <li>11</li>
    <li>12</li>
    <li>13</li>
    <li>14</li>
    <li>15</li>
    <li>16</li>
    <li>17</li>
    <li>18</li>
    <li>19</li>
    <li>20</li>
    <li>21</li>
    <li>22</li>
    <li>23</li>
    <li>24</li>
    <li>25</li>
    <li>26</li>
    <li>27</li>
    <li>28</li>
    <li>29</li>
    <li>30</li>
    <li>31</li>
  </ul>


  <br><hr> <br>
<div class="month">      
    <ul>
      <li class="prev">&#10094;</li>
      <li class="next">&#10095;</li>
      <li>
        November<br>
        <span style="font-size:18px">2024</span>
      </li>
    </ul>
  </div>
<ul class="weekdays">
    <li>Mo</li>
    <li>Tu</li>
    <li>We</li>
    <li>Th</li>
    <li>Fr</li>
    <li>Sa</li>
    <li>Su</li>
  </ul>
  
  <ul class="days">  
      <li>-</li>
      <li>-</li>
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
    <li>5</li>
    <li>6</li>
    <li>7</li>
    <li>8</li>
    <li>9</li>
    <li><span class="active">10</span></li>
    <li>11</li>
    <li>12</li>
    <li>13</li>
    <li>14</li>
    <li>15</li>
    <li>16</li>
    <li>17</li>
    <li>18</li>
    <li>19</li>
    <li>20</li>
    <li>21</li>
    <li>22</li>
    <li>23</li>
    <li>24</li>
    <li>25</li>
    <li>26</li>
    <li>27</li>
    <li>28</li>
    <li>29</li>
    <li>30</li>
    <li>31</li>
  </ul>

  <br><hr> <br>
<div class="month">      
    <ul>
      <li class="prev">&#10094;</li>
      <li class="next">&#10095;</li>
      <li>
        December<br>
        <span style="font-size:18px">2024</span>
      </li>
    </ul>
  </div>
<ul class="weekdays">
    <li>Mo</li>
    <li>Tu</li>
    <li>We</li>
    <li>Th</li>
    <li>Fr</li>
    <li>Sa</li>
    <li>Su</li>
  </ul>
  
  <ul class="days">  
      <li>-</li>
      <li>-</li>
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
    <li>5</li>
    <li>6</li>
    <li>7</li>
    <li>8</li>
    <li>9</li>
    <li><span class="active">10</span></li>
    <li>11</li>
    <li>12</li>
    <li>13</li>
    <li>14</li>
    <li>15</li>
    <li>16</li>
    <li>17</li>
    <li>18</li>
    <li>19</li>
    <li>20</li>
    <li>21</li>
    <li>22</li>
    <li>23</li>
    <li>24</li>
    <li>25</li>
    <li>26</li>
    <li>27</li>
    <li>28</li>
    <li>29</li>
    <li>30</li>
    <li>31</li>
  </ul>
<div id="footer"
		style="background-color: black; width: 100%; height:16vh;">
		<div style="width: 90%; margin: auto auto; display:flex; justify-content: space-between; padding-top: 5vh;">
			<p style="font-size: 15px;">ELM: Employee Leave Management</p>
			<p style="font-size: 15px;">Created By: Tirtha Sahu</p>
			</div>
		</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>
