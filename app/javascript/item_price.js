window.addEventListener('turbo:load', () => {
 
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const taxPrice = Math.floor(inputValue * 0.10);  // 計算結果を切り捨て
    addTaxDom.innerHTML = taxPrice;

    const profitDom = document.getElementById("profit");
    const profitValue = Math.floor(inputValue - taxPrice);  // 引き算で計算
    profitDom.innerHTML = profitValue;
    })
 });