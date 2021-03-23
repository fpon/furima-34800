function price() {
  const itemPrice = document.getElementById('item-price');
    itemPrice.addEventListener("input", function(){
      const a = itemPrice.value;
      const addTaxPrice = document.getElementById('add-tax-price').textContent = a / 10;
      const profit = document.getElementById('profit').textContent = a - addTaxPrice;
    })
}

window.addEventListener("load", price)