
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {

    if (htmlElement.children) {
        Array.from(htmlElement.children).forEach(child => {
            htmlElement.removeChild(child)
        })
    }

    const p = document.createElement("p") 
    p.innerHTML = string;
    htmlElement.appendChild(p);

};

htmlGenerator('Party Time.', partyHeader);
