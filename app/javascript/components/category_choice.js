const toggleGenre = () => {
$(document).ready(function(){
  $(".category-choice").click(function(){
    $(this).toggleClass("active");
  });
});
};

export { toggleGenre };
