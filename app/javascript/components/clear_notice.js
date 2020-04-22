// const clearNotice = () => {
// $(document).ready(function(){
//   $(".notice").animate({opacity:'0'}, 1500);
// };
// };

// export { clearNotice };
const noticeDegage = () => {
  $(".alert").fadeOut(6000);
};

export { noticeDegage }
