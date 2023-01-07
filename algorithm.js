function findSubset(arr, int) {
  let subset = [];
  for (let i = 0; i <= arr.length - int; i++) {
    let temp = new Array();
    for (let j = 0; j < int; j++) {
      temp.push(arr[i + j]);
    }
    subset.push(temp);
  }

  return subset;
}

function findMaxInMin(arr, int) {
  let collectionOfSubset = findSubset(arr, int);
  let minimumSubset = [];
  for (let j = 0; j < collectionOfSubset.length; j++) {
    let minElement = collectionOfSubset[j].reduce((a, b) => {
      return Math.min(a, b);
    });
    minimumSubset.push(minElement);
  }

  return minimumSubset;
}

console.log(findMaxInMin([1, 2, 6, 3, 24, 1, 6, 2], 3));
