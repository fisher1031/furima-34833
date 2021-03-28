window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;

   const addTaxDom = document.getElementById("add-tax-price");
   addTaxDom.innerHTML = (Math.floor(inputValue / 10).toLocaleString());
 
   const profit = document.getElementById("profit");
   const result = (Math.floor(inputValue / 10));
   profit.innerHTML = (Math.floor(inputValue - result ).toLocaleString())
})
});


