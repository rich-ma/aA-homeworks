document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const handleFavSubmit = e => {
    e.preventDefault();
    const input = document.querySelector(".favorite-input");
    const fav = input.value;
    input.value = "";

    const newLi = document.createElement("li");
    newLi.textContent = fav;

    const favList = document.getElementById("sf-places");
    favList.appendChild(newLi);
  }
  
  const listSubmit = document.querySelector(".favorite-submit");
  listSubmit.addEventListener("click", handleFavSubmit);

  // adding new photos

  // --- your code here!



});
