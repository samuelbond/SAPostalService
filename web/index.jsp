<%-- 
    Document   : index
    Created on : Oct 9, 2013, 11:11:46 PM
    Author     : samuelbond
--%>
<%@ include file="header.jsp" %>



    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <!--  <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li> -->
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <img src="images/mapp.PNG"  alt="Our Delivery System">
          <div class="container">
            <div class="carousel-caption">
              <h1 style="color:#333;">New Online Shipping</h1>
              <p>Our new online shipping is now available, sign up to try this new feature</p>
              <p><a class="btn btn-large btn-primary" href="register">Sign up today</a></p>
            </div>
          </div>
        </div>
        <!--
        <div class="item">
          <img src="images/dvguy2.png"  alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-large btn-primary" href="#">Learn more</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="data:image/png;base64," data-src="holder.js/100%x500/auto/#777:#7a7a7a/text:Third slide" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-large btn-primary" href="#">Browse gallery</a></p>
            </div>
          </div>
        </div>
        -->
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div><!-- /.carousel -->



    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4">
          <img class="img-circle" src="images/rader.png" alt="Tracking Package"/>
          <h2>Track Package</h2>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="images/delivery.png"  height="200px" alt="Online Shipping"/>
          <h2>Ship Package</h2>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="images/plane.png" height="200px" alt="Air Mail"/>
          <h2>Priority Mail</h2>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->
<%@ include file="footer.jsp" %>
      