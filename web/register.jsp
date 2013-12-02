<%-- 
    Document   : register
    Created on : Oct 9, 2013, 11:26:00 PM
    Author     : samuelbond
--%>

<%@ include file="header.jsp" %>
    
    <div class="container">
    <div class="row">
    
    <div class="col-xs-6 col-sm-3 col-lg-4" id="sidebar">
          <h2>Login to MySA</h2>
          <div class="well sidebar-nav">
              <form class="form-horizontal" role="form" method="post" action="login" onsubmit="return validateLoginForm()" >
              <div class="form-group">
                <label for="inputemailfield" class="col-lg-3 control-label">Email<span id="emailStat"></span></label>
                <div class="col-lg-8">
                  <input type="email" name="email" class="form-control" id="inputemailfield" placeholder="Email"/>
                </div>
              </div>
              <div class="form-group">
                <label for="inputPass" class="col-lg-3 control-label">Password<span id="passStat"></span></label>
                <div class="col-lg-8">
                  <input type="password" name="password" class="form-control" id="inputPass" placeholder="Password"/>
                </div>
              </div>
              <div class="form-group">
                <div class="col-lg-offset-3 col-lg-10">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox"/> Remember me
                    </label>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="col-lg-offset-3 col-lg-10">
                  <button type="submit" class="btn btn-default">Sign in</button>
                </div>
              </div>
            </form>
          </div><!--/.well -->
        </div><!--/span-->
       <%
String req_name = (String) request.getAttribute("error");
//if name filed is not set then value of the string "req_name" is null
String head = (String) request.getAttribute("errorhead");
if(req_name != null)
{ 
  out.println("<div class=\"alert alert-danger col-lg-7\"><button type=\"button\" class=\"close\" "
          + "data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button><strong>"+head+"</strong><br />"
          + req_name+"</div>");
}

%> 
       <%
String msg_name = (String) request.getAttribute("msg");
//if name filed is not set then value of the string "req_name" is null
String msgHead = (String) request.getAttribute("msghead");
if(msg_name != null)
{ 
  out.println("<div class=\"alert alert-success col-lg-7\"><button type=\"button\" class=\"close\" "
          + "data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button><strong>"+msgHead+"</strong><br />"
          + msg_name+"</div>");
}

%> 
      <h2>Welcome to MySA</h2>
        <p>
        SA POSTAL SERVICE is the leader in International Express Shipping.as an SA
        customer you have access to our easy-to-use, free online shipping and 
        tracking services, all customized to your preferences.
        </p>
        <hr class="divider"/>
        <form class="form-horizontal col-lg-7" role="form" method="post" action="register" onsubmit="return validateForm()">
    
        
              <div class="form-group">
              <label for="inputFuName" class="col-lg-2 control-label">Full Name<span id="name_stat"></span></label>
                <div class="col-lg-10">
                  <input type="text" name="name" class="form-control" id="inputFuName" placeholder="John Smith" onblur="validateForm()"/>
                </div>
              </div>
              <div class="form-group">
                <label for="inputEmail1" class="col-lg-2 control-label">Email<span id="em_stat"></span></label>
                <div class="col-lg-10">
                  <input type="email" class="form-control" name="email" id="inputEmail1" placeholder="email@example.com" />
                
                </div>
              </div>
              <div class="form-group">
              <label for="inputPhn" class="col-lg-2 control-label">Phone<span id="ph_stat"></span></label>
                <div class="col-lg-10">
                  <input type="text" name="phone" class="form-control" id="inputPhn" placeholder="+3620030020" onblur="validateForm()"/>
                  <span id="phnot"></span>
                </div>
              </div>
              <div class="form-group">
              <label for="inputAddr" class="col-lg-2 control-label">Address<span id="addr_stat"></span></label>
                <div class="col-lg-10">
                  <input type="text" name="address" class="form-control" id="inputAddr" placeholder="47 High Street" onblur="validateForm()"/>
                </div>
              </div>
              <div class="form-group">
              <label for="inputCity" class="col-lg-2 control-label">City<span id="city_stat"></span></label>
                <div class="col-lg-10">
                  <input type="text" name="city" class="form-control" id="inputCity" placeholder="London" onblur="validateForm()"/>
                </div>
              </div>
               
              <div class="form-group">
              <label for="inputCountry" class="col-lg-2 control-label">Country</label>
                <div class="col-lg-10">
                  <select class="form-control" name="country">
                    <option value="United States">United States</option> 
                    <option value="United Kingdom">United Kingdom</option> 
                    <option value="Afghanistan">Afghanistan</option> 
                    <option value="Albania">Albania</option> 
                    <option value="Algeria">Algeria</option> 
                    <option value="American Samoa">American Samoa</option> 
                    <option value="Andorra">Andorra</option> 
                    <option value="Angola">Angola</option> 
                    <option value="Anguilla">Anguilla</option> 
                    <option value="Antarctica">Antarctica</option> 
                    <option value="Antigua and Barbuda">Antigua and Barbuda</option> 
                    <option value="Argentina">Argentina</option> 
                    <option value="Armenia">Armenia</option> 
                    <option value="Aruba">Aruba</option> 
                    <option value="Australia">Australia</option> 
                    <option value="Austria">Austria</option> 
                    <option value="Azerbaijan">Azerbaijan</option> 
                    <option value="Bahamas">Bahamas</option> 
                    <option value="Bahrain">Bahrain</option> 
                    <option value="Bangladesh">Bangladesh</option> 
                    <option value="Barbados">Barbados</option> 
                    <option value="Belarus">Belarus</option> 
                    <option value="Belgium">Belgium</option> 
                    <option value="Belize">Belize</option> 
                    <option value="Benin">Benin</option> 
                    <option value="Bermuda">Bermuda</option> 
                    <option value="Bhutan">Bhutan</option> 
                    <option value="Bolivia">Bolivia</option> 
                    <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option> 
                    <option value="Botswana">Botswana</option> 
                    <option value="Bouvet Island">Bouvet Island</option> 
                    <option value="Brazil">Brazil</option> 
                    <option value="British Indian Ocean Territory">British Indian Ocean Territory</option> 
                    <option value="Brunei Darussalam">Brunei Darussalam</option> 
                    <option value="Bulgaria">Bulgaria</option> 
                    <option value="Burkina Faso">Burkina Faso</option> 
                    <option value="Burundi">Burundi</option> 
                    <option value="Cambodia">Cambodia</option> 
                    <option value="Cameroon">Cameroon</option> 
                    <option value="Canada">Canada</option> 
                    <option value="Cape Verde">Cape Verde</option> 
                    <option value="Cayman Islands">Cayman Islands</option> 
                    <option value="Central African Republic">Central African Republic</option> 
                    <option value="Chad">Chad</option> 
                    <option value="Chile">Chile</option> 
                    <option value="China">China</option> 
                    <option value="Christmas Island">Christmas Island</option> 
                    <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option> 
                    <option value="Colombia">Colombia</option> 
                    <option value="Comoros">Comoros</option> 
                    <option value="Congo">Congo</option> 
                    <option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option> 
                    <option value="Cook Islands">Cook Islands</option> 
                    <option value="Costa Rica">Costa Rica</option> 
                    <option value="Cote D'ivoire">Cote D'ivoire</option> 
                    <option value="Croatia">Croatia</option> 
                    <option value="Cuba">Cuba</option> 
                    <option value="Cyprus">Cyprus</option> 
                    <option value="Czech Republic">Czech Republic</option> 
                    <option value="Denmark">Denmark</option> 
                    <option value="Djibouti">Djibouti</option> 
                    <option value="Dominica">Dominica</option> 
                    <option value="Dominican Republic">Dominican Republic</option> 
                    <option value="Ecuador">Ecuador</option> 
                    <option value="Egypt">Egypt</option> 
                    <option value="El Salvador">El Salvador</option> 
                    <option value="Equatorial Guinea">Equatorial Guinea</option> 
                    <option value="Eritrea">Eritrea</option> 
                    <option value="Estonia">Estonia</option> 
                    <option value="Ethiopia">Ethiopia</option> 
                    <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option> 
                    <option value="Faroe Islands">Faroe Islands</option> 
                    <option value="Fiji">Fiji</option> 
                    <option value="Finland">Finland</option> 
                    <option value="France">France</option> 
                    <option value="French Guiana">French Guiana</option> 
                    <option value="French Polynesia">French Polynesia</option> 
                    <option value="French Southern Territories">French Southern Territories</option> 
                    <option value="Gabon">Gabon</option> 
                    <option value="Gambia">Gambia</option> 
                    <option value="Georgia">Georgia</option> 
                    <option value="Germany">Germany</option> 
                    <option value="Ghana">Ghana</option> 
                    <option value="Gibraltar">Gibraltar</option> 
                    <option value="Greece">Greece</option> 
                    <option value="Greenland">Greenland</option> 
                    <option value="Grenada">Grenada</option> 
                    <option value="Guadeloupe">Guadeloupe</option> 
                    <option value="Guam">Guam</option> 
                    <option value="Guatemala">Guatemala</option> 
                    <option value="Guinea">Guinea</option> 
                    <option value="Guinea-bissau">Guinea-bissau</option> 
                    <option value="Guyana">Guyana</option> 
                    <option value="Haiti">Haiti</option> 
                    <option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option> 
                    <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option> 
                    <option value="Honduras">Honduras</option> 
                    <option value="Hong Kong">Hong Kong</option> 
                    <option selected="selected" value="Hungary">Hungary</option> 
                    <option value="Iceland">Iceland</option> 
                    <option value="India">India</option> 
                    <option value="Indonesia">Indonesia</option> 
                    <option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option> 
                    <option value="Iraq">Iraq</option> 
                    <option value="Ireland">Ireland</option> 
                    <option value="Israel">Israel</option> 
                    <option value="Italy">Italy</option> 
                    <option value="Jamaica">Jamaica</option> 
                    <option value="Japan">Japan</option> 
                    <option value="Jordan">Jordan</option> 
                    <option value="Kazakhstan">Kazakhstan</option> 
                    <option value="Kenya">Kenya</option> 
                    <option value="Kiribati">Kiribati</option> 
                    <option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option> 
                    <option value="Korea, Republic of">Korea, Republic of</option> 
                    <option value="Kuwait">Kuwait</option> 
                    <option value="Kyrgyzstan">Kyrgyzstan</option> 
                    <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option> 
                    <option value="Latvia">Latvia</option> 
                    <option value="Lebanon">Lebanon</option> 
                    <option value="Lesotho">Lesotho</option> 
                    <option value="Liberia">Liberia</option> 
                    <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option> 
                    <option value="Liechtenstein">Liechtenstein</option> 
                    <option value="Lithuania">Lithuania</option> 
                    <option value="Luxembourg">Luxembourg</option> 
                    <option value="Macao">Macao</option> 
                    <option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option> 
                    <option value="Madagascar">Madagascar</option> 
                    <option value="Malawi">Malawi</option> 
                    <option value="Malaysia">Malaysia</option> 
                    <option value="Maldives">Maldives</option> 
                    <option value="Mali">Mali</option> 
                    <option value="Malta">Malta</option> 
                    <option value="Marshall Islands">Marshall Islands</option> 
                    <option value="Martinique">Martinique</option> 
                    <option value="Mauritania">Mauritania</option> 
                    <option value="Mauritius">Mauritius</option> 
                    <option value="Mayotte">Mayotte</option> 
                    <option value="Mexico">Mexico</option> 
                    <option value="Micronesia, Federated States of">Micronesia, Federated States of</option> 
                    <option value="Moldova, Republic of">Moldova, Republic of</option> 
                    <option value="Monaco">Monaco</option> 
                    <option value="Mongolia">Mongolia</option> 
                    <option value="Montserrat">Montserrat</option> 
                    <option value="Morocco">Morocco</option> 
                    <option value="Mozambique">Mozambique</option> 
                    <option value="Myanmar">Myanmar</option> 
                    <option value="Namibia">Namibia</option> 
                    <option value="Nauru">Nauru</option> 
                    <option value="Nepal">Nepal</option> 
                    <option value="Netherlands">Netherlands</option> 
                    <option value="Netherlands Antilles">Netherlands Antilles</option> 
                    <option value="New Caledonia">New Caledonia</option> 
                    <option value="New Zealand">New Zealand</option> 
                    <option value="Nicaragua">Nicaragua</option> 
                    <option value="Niger">Niger</option> 
                    <option value="Nigeria">Nigeria</option> 
                    <option value="Niue">Niue</option> 
                    <option value="Norfolk Island">Norfolk Island</option> 
                    <option value="Northern Mariana Islands">Northern Mariana Islands</option> 
                    <option value="Norway">Norway</option> 
                    <option value="Oman">Oman</option> 
                    <option value="Pakistan">Pakistan</option> 
                    <option value="Palau">Palau</option> 
                    <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option> 
                    <option value="Panama">Panama</option> 
                    <option value="Papua New Guinea">Papua New Guinea</option> 
                    <option value="Paraguay">Paraguay</option> 
                    <option value="Peru">Peru</option> 
                    <option value="Philippines">Philippines</option> 
                    <option value="Pitcairn">Pitcairn</option> 
                    <option value="Poland">Poland</option> 
                    <option value="Portugal">Portugal</option> 
                    <option value="Puerto Rico">Puerto Rico</option> 
                    <option value="Qatar">Qatar</option> 
                    <option value="Reunion">Reunion</option> 
                    <option value="Romania">Romania</option> 
                    <option value="Russian Federation">Russian Federation</option> 
                    <option value="Rwanda">Rwanda</option> 
                    <option value="Saint Helena">Saint Helena</option> 
                    <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option> 
                    <option value="Saint Lucia">Saint Lucia</option> 
                    <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option> 
                    <option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option> 
                    <option value="Samoa">Samoa</option> 
                    <option value="San Marino">San Marino</option> 
                    <option value="Sao Tome and Principe">Sao Tome and Principe</option> 
                    <option value="Saudi Arabia">Saudi Arabia</option> 
                    <option value="Senegal">Senegal</option> 
                    <option value="Serbia and Montenegro">Serbia and Montenegro</option> 
                    <option value="Seychelles">Seychelles</option> 
                    <option value="Sierra Leone">Sierra Leone</option> 
                    <option value="Singapore">Singapore</option> 
                    <option value="Slovakia">Slovakia</option> 
                    <option value="Slovenia">Slovenia</option> 
                    <option value="Solomon Islands">Solomon Islands</option> 
                    <option value="Somalia">Somalia</option> 
                    <option value="South Africa">South Africa</option> 
                    <option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option>                    <option value="Spain">Spain</option> 
                    <option value="Sri Lanka">Sri Lanka</option> 
                    <option value="Sudan">Sudan</option> 
                    <option value="Suriname">Suriname</option> 
                    <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option> 
                    <option value="Swaziland">Swaziland</option> 
                    <option value="Sweden">Sweden</option> 
                    <option value="Switzerland">Switzerland</option> 
                    <option value="Syrian Arab Republic">Syrian Arab Republic</option> 
                    <option value="Taiwan, Province of China">Taiwan, Province of China</option> 
                    <option value="Tajikistan">Tajikistan</option> 
                    <option value="Tanzania, United Republic of">Tanzania, United Republic of</option> 
                    <option value="Thailand">Thailand</option> 
                    <option value="Timor-leste">Timor-leste</option> 
                    <option value="Togo">Togo</option> 
                    <option value="Tokelau">Tokelau</option> 
                    <option value="Tonga">Tonga</option> 
                    <option value="Trinidad and Tobago">Trinidad and Tobago</option> 
                    <option value="Tunisia">Tunisia</option> 
                    <option value="Turkey">Turkey</option> 
                    <option value="Turkmenistan">Turkmenistan</option> 
                    <option value="Turks and Caicos Islands">Turks and Caicos Islands</option> 
                    <option value="Tuvalu">Tuvalu</option> 
                    <option value="Uganda">Uganda</option> 
                    <option value="Ukraine">Ukraine</option> 
                    <option value="United Arab Emirates">United Arab Emirates</option> 
                    <option value="United Kingdom">United Kingdom</option> 
                    <option value="United States">United States</option> 
                    <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option> 
                    <option value="Uruguay">Uruguay</option> 
                    <option value="Uzbekistan">Uzbekistan</option> 
                    <option value="Vanuatu">Vanuatu</option> 
                    <option value="Venezuela">Venezuela</option> 
                    <option value="Viet Nam">Viet Nam</option> 
                    <option value="Virgin Islands, British">Virgin Islands, British</option> 
                    <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option> 
                    <option value="Wallis and Futuna">Wallis and Futuna</option> 
                    <option value="Western Sahara">Western Sahara</option> 
                    <option value="Yemen">Yemen</option> 
                    <option value="Zambia">Zambia</option> 
                    <option value="Zimbabwe">Zimbabwe</option>
                    </select>
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword0" class="col-lg-2 control-label">Password<span id="p1_stat"></span></label>
                <div class="col-lg-10">
                  <input type="password" class="form-control" name="password1" id="inputPassword0" placeholder="Password"/>
                <span id="p1not"></span>
                </div>
              </div>
              <div class="form-group">
                <label for="inputPassword2" class="col-lg-2 control-label">Confirm Password<span id="p2_stat"></span></label>
                <div class="col-lg-10">
                  <input type="password" class="form-control" name="password2" id="inputPassword2" placeholder="Password" onblur="validateForm()"/>
                  <span id="pnot"></span>
                </div>
              </div>
              
              <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                  <button type="submit" class="btn btn-default">Sign up</button>
                </div>
              </div>
            </form>
      </div>

    
    <script>
                function validateForm(){
                var passdwd = document.getElementById("inputPassword0").value;
                var confpass = document.getElementById("inputPassword2").value;
                var city = document.getElementById("inputCity").value;
                var phone = document.getElementById("inputPhn").value;
                var address = document.getElementById("inputAddr").value;
                var funame = document.getElementById("inputFuName").value;
  
                
                if(funame.length < 2){
                document.getElementById("name_stat").innerHTML= "<img src=\"images/fail.png\" style=\"margin-left:2px;\" />";                   
                 return false;   
                }
                else{
                document.getElementById("name_stat").innerHTML= "<img src=\"images/pass.png\" style=\"margin-left:2px;\" />";    
                }
                if(phone.length < 10){
                document.getElementById("ph_stat").innerHTML= "<img src=\"images/fail.png\" style=\"margin-left:2px;\" />"; 
                document.getElementById("phnot").innerHTML= 
                "<div class=\"alert alert-danger col-lg-8\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"
                +'Your phone number is empty or not up to valid length</div>';                  
                 return false;   
                }
                if(phone.indexOf("+") == -1){
                document.getElementById("ph_stat").innerHTML= "<img src=\"images/fail.png\" style=\"margin-left:2px;\" />";                   
                 document.getElementById("phnot").innerHTML= 
                "<div class=\"alert alert-danger col-lg-8\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"
                +'Your phone number is not formed well, all phone number must start with a +</div>';
                 return false;   
                }
                else{
                document.getElementById("ph_stat").innerHTML= "<img src=\"images/pass.png\" style=\"margin-left:2px;\" />";
                 document.getElementById("phnot").innerHTML= "";    
                }
                if(address.length < 3){
                document.getElementById("addr_stat").innerHTML= "<img src=\"images/fail.png\" style=\"margin-left:2px;\" />";                   
                 return false;   
                }
                else{
                document.getElementById("addr_stat").innerHTML= "<img src=\"images/pass.png\" style=\"margin-left:2px;\" />";    
                }
                
                if(city.length < 3){
                document.getElementById("city_stat").innerHTML= "<img src=\"images/fail.png\" style=\"margin-left:2px;\" />";                   
                 return false;   
                }
                else{
                document.getElementById("city_stat").innerHTML= "<img src=\"images/pass.png\" style=\"margin-left:2px;\" />";    
                }
                
                
                
                if(passdwd != confpass){
                document.getElementById("p2_stat").innerHTML= "<img src=\"images/fail.png\" style=\"margin-left:2px;\" />";                   
                document.getElementById("pnot").innerHTML= 
                "<div class=\"alert alert-danger col-lg-8\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"
                +'Password mis-match, please check your password </div>';
                    
                    
                    document.getElementById("inputPassword2").focus();
                    return false;
                }
                if(passdwd.length < 1){
                document.getElementById("p1_stat").innerHTML= "<img src=\"images/fail.png\" style=\"margin-left:2px;\" />";                   
                document.getElementById("p1not").innerHTML= 
                "<div class=\"alert alert-danger col-lg-8\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>"
                +'You must provide a password, password is empty</div>';
                    
                    
                    document.getElementById("inputPassword2").focus();
                    return false;
                }
                if(passdwd == confpass && passdwd.length > 0){
                document.getElementById("p2_stat").innerHTML= "<img src=\"images/pass.png\" style=\"margin-left:2px;\" />";
                document.getElementById("p1_stat").innerHTML= "<img src=\"images/pass.png\" style=\"margin-left:2px;\" />";
                document.getElementById("p1not").innerHTML= "";
                document.getElementById("pnot").innerHTML= "";
                }
                
                return true;
                }
                
                
                 function validateLoginForm(){
                var pwd = document.getElementById("inputPass").value;
                var userName = document.getElementById("inputemailfield").value;
                
                if(userName.length < 5){
                document.getElementById("emailStat").innerHTML= "<img src=\"images/fail.png\" style=\"margin-left:2px;\" />"; 
                return false;   
                }
                document.getElementById("emailStat").innerHTML= ""; 
                if(pwd.length < 1){
                document.getElementById("passStat").innerHTML= "<img src=\"images/fail.png\" style=\"margin-left:2px;\" />"; 
                return false;   
                }
                document.getElementById("passStat").innerHTML= "";
                
                 
                return true;
                }
                </script>
    
 <%@ include file="footer.jsp" %>