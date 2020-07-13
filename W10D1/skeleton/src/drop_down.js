
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};


const dogLinkCreator = (dogs) => {
  const dogLinks = [];
  Object.keys(dogs).forEach(name => {
    const a = document.createElement('a')
    a.innerHTML = name;
    a.href = dogs[name];
    const li = document.createElement('li')
    li.classList.add('dog-link'); 
    // li.className = 'dog-link' 
    li.appendChild(a)
    dogLinks.push(li);
  });
  return dogLinks;
}


const attachDogLinks = () => {
  let dogLinks = dogLinkCreator(dogs);
  // let list = document.getElementsByClassName("drop-down-dog-list")
  let list = document.querySelector(".drop-down-dog-list")
  dogLinks.forEach(link => {
    list.appendChild(link)
  });
}

attachDogLinks();

const dropdownNav = document.querySelector(".drop-down-dog-nav")
const list = document.querySelectorAll("li")

dropdownNav.addEventListener('mouseenter', e => {
  list.forEach(li => li.classList.add('appear'))
})

dropdownNav.addEventListener('mouseleave', e => {
  list.forEach(li => li.classList.remove('appear'))
})




