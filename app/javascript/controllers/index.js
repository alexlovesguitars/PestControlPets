// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import ScrollTo from '@stimulus-components/scroll-to'

application.register('scroll-to', ScrollTo)

// const searchInput = document.querySelector(".UserInput");
// const searchButton = document.querySelector("#search-button");
// const petDisplay = document.querySelector("#results");

// const fetchPets = (event) => {
//   event.preventDefault();
//   const userInput = searchInput.value.trim();
//   console.log(userInput);
//   if (userInput === '') {
//     alert('Please enter a pet or pest');
//     return;
//   }

//   const searchUrl = "postgresql://localhost";
//   fetch(searchUrl)
//     .then((response) => {
//       if (!response.ok) {
//         throw new Error('Network response was not ok');
//       }
//       return response.json();
//     })
//     .then((data) => {
//       petDisplay.innerHTML = ''; // Clear previous results

//       if (data.Response === 'False') {
//         console.log('No pets found');
//         petsDisplay.innerHTML = '<p>No pets found. Please try another search.</p>';
//         return;
//       }


//       data.Search.forEach((pet) => {
//         pet.innerHTML = `<div class="pet-card">
//          <% if pet.photo.present? && pet.photo.key.present? %>
//          <%= link_to cl_image_tag(pet.photo.key, gravity: "auto", height: 300, width: 300, crop: "auto"), pet %>
//            <% else %>
//          <%= link_to image_tag("placeholder.png", height: 300, width: 300), pet %>
//          <% end %>
//          <p class="m-0"><%= pet.race.capitalize %> </p>
//          <div class="pet-details mt-1">
//            <h2 style="font-size: 25px;"><%= pet.name.capitalize %></h2>
//            <p><%= pet.price_per_day %>€/day</p>
//          </div>
//          <p>Preys on: <strong><%= pet.targets.capitalize %></strong></p>
//          </div>`
//       });
//     })
//     .catch((error) => {
//       console.error('There was a problem with the fetch operation:', error);
//     });
// };

// searchButton.addEventListener("click", fetchPets);
