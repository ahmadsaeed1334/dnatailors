var form1=document.getElementById("form1");
      var form2=document.getElementById("form2");
      var form3=document.getElementById("form3");
      var form4=document.getElementById("form4");
      var form5=document.getElementById("form5");
      var form6=document.getElementById("form6");
  
      var next1= document.getElementById("Next1");
      var next2= document.getElementById("Next2");
      var next3= document.getElementById("Next3");
      var next4= document.getElementById("Next4");
      var next5= document.getElementById("Next5");
      
  
      var back1= document.getElementById("Back1");
      var back2= document.getElementById("Back2");
      var back3= document.getElementById("Back3");
      var back4= document.getElementById("Back4");
      var back5= document.getElementById("Back5");
     
      var progress=document.getElementById("progress");
  
     next1.onclick=function(){
      form1.style.left="-450px";
      form2.style.left="40px";
      progress.style.width="200px";
     }
  
     back1.onclick=function(){
      form1.style.left="40px";
      form2.style.left="450px";
      progress.style.width="100px";
     }
     next2.onclick=function(){
      form2.style.left="-450px";
      form3.style.left="40px";
      progress.style.width="300px";
     }
     back2.onclick=function(){
      form2.style.left="40px";
      form3.style.left="450px";
      progress.style.width="200px";
     }
     next3.onclick=function(){
      form3.style.left="-450px";
      form4.style.left="40px";
      progress.style.width="400px";
     }
     back3.onclick=function(){
      form3.style.left="40px";
      form4.style.left="450px";
      progress.style.width="300px";
     }
     next4.onclick=function(){
      form4.style.left="-450px";
      form5.style.left="40px"
     }
     back4.onclick=function(){
      form4.style.left="40px";
      form5.style.left="450px";
     }
     next5.onclick=function(){
      form5.style.left="-450px";
      form6.style.left="40px"
     }
     back5.onclick=function(){
      form5.style.left="40px";
      form6.style.left="450px";
     }

var currentForm = null;
function showForm(formId) {
  if (currentForm) {
    currentForm.style.display = 'none'; // Hide the currently displayed form
  }
  
  var form = document.getElementById(formId);
  if (form) {
    form.style.display = 'block'; // Show the selected form
    currentForm = form;
  }
}


     function submitForm(formId) {
    var form = document.getElementById(formId);
    if (form) {
      // Perform form submission logic here, for demonstration, we'll just close the form
      form.style.display = 'none'; // Close the form
      currentForm = null;
    }
  }
  window.onload = function() {
  // Show forms immediately after page load
  document.getElementById("form-container").style.display = "block";
}; 


document.getElementById("departmentSelect").addEventListener("change", function() {
            var department = this.value;
            var programSelect = document.getElementById("programSelect");
    
           
            programSelect.innerHTML = "";
    
            
            var programs = getProgramsForDepartment(department);
    
            
            programs.forEach(function(program) {
                var option = document.createElement("option");
                option.text = program;
                option.value = program;
                programSelect.add(option);
            });
        });
    
      
        function getProgramsForDepartment(department) {
            switch (department) {
                case "life_sciences":
                    return ["BS Medical Lab Technology", "BS Human Nutrition & Dietetics", "BS Food sciences & Technology","BS Microbiology","BS Biochemistry"];
                case "computer_sciences":
                    return ["BS Computer Sciences", "BS Software Engineering", "BS artificial Intelligence"];
                case "management_sciences":
                    return ["BBA Hons", "BBA 2 Years"];
                case "applied_sciences":
                    return ["BS Mathematics"];
                default:
                    return [];
            }
        }



       
        