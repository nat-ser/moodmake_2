

$( document ).ready(function() {
  window.addEventListener("WebComponentsReady", function() {
      var coolBtn = document.querySelector("#coolBtn");
      coolBtn.addEventListener("click", function(e) {
          alert("coolBtn clicked!");
      });
  });
});
