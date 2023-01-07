const airlines = {
  airlines_data: [
    {
      Code: "GA",
      Name: "Garuda Indonesia",
      Image: "public/img/garuda_indonesia_logo.png",
    },
    {
      Code: "SQ",
      Name: "Singapore Airlines",
      Image: "public/img/singapore_airlines_logo.png",
    },
    {
      Code: "QZ",
      Name: "Air Asia Indonesia",
      Image: "public/img/air_asia_logo.png",
    },
  ],
};

const airport = {
  airport_data: [
    {
      Code: "CGK",
      Name: "Soekarno Hatta International Airport",
      City: "Jakarta",
    },
    {
      Code: "YIA",
      Name: "Yogyakarta International Airport",
      City: "Yogyakarta",
    },
    {
      Code: "DPS",
      Name: "Ngurah Rai International Airport",
      City: "Denpasar",
    },

    {
      Code: "SIN",
      Name: "Changi International Airport",
      City: "Singapore",
    },
  ],
};

const flights = [
  {
    airlines: "SQ",
    departure_airport: "CGK",
    departure_time: "2021-08-17T17:00",
    arival_airport: "SIN",
    arival_time: "2021-08-17T19:30",
  },
  {
    airlines: "QZ",
    departure_airport: "CGK",
    departure_time: "2021-08-17T10:05",
    arival_airport: "DPS",
    arival_time: "2021-08-17T12:20",
  },
  {
    airlines: "GA",
    departure_airport: "CGK",
    departure_time: "2021-08-16T08:20",
    arival_airport: "SIN",
    arival_time: "2021-08-16T10:50",
  },
  {
    airlines: "GA",
    departure_airport: "CGK",
    departure_time: "2021-08-17T13:10",
    arival_airport: "YIA",
    arival_time: "2021-08-17T14:20",
  },
];

let dropdownSortState = false;
let dropdownFilterState = false;
let schedAsc = false;

const renderTemplate = (arr) => {
  let container = document.querySelector(".container");
  let res = "";

  if (arr !== undefined) {
    arr.map((data) => {
      let departureDate = convertToDateTime(data.departure_time, "Date");
      let arivalDate = convertToDateTime(data.arival_time, "Date");
      let departureTime = convertToDateTime(data.departure_time, "Time");
      let arivallTime = convertToDateTime(data.arival_time, "Time");
      let departureCity = findCity(data.departure_airport);
      let arivalCity = findCity(data.arival_airport);
      let imgSrc = findAirlines(data.airlines, "Image");
      let airlinesName = findAirlines(data.airlines, "Name");

      res += `<div class="card-container" data-id=${airlinesName}>
        <div class="img-container">
          <img src="${imgSrc}" alt="${airlinesName}" />
        </div>
        <div class="information-container">
          <div id="departure">
            <div id="departure_city"><span>${departureCity}</span></div>
            <div id="departure_time"><h1>${departureTime}</h1></div>
            <div id="departure_date"><span>${departureDate}</span></div>
          </div>
          <div id="icon">
            <img src="/public/img/plane_icon.png" alt="" srcset="" />
          </div>
          <div id="arrival">
            <div id="arrival_city"><span>${arivalCity}</span></div>
            <div id="arrival_time"><h1>${arivallTime}</h1></div>
            <div id="arrival_date"><span>${arivalDate}</span></div>
          </div>
        </div>
      </div>`;
    });
  }

  container.innerHTML = res;
};

const findAirlines = (code, type) => {
  const airlinesData = airlines.airlines_data;
  const searchIndex = airlinesData.findIndex((data) => data.Code === code);

  let res = "";
  if (type === "Image") {
    res = airlinesData[searchIndex].Image;
  } else if (type === "Name") {
    res = airlinesData[searchIndex].Name;
  } else if (type === "Code") {
    res = airlinesData[searchIndex].Code;
  }

  return res;
};

const findCity = (code) => {
  const airportData = airport.airport_data;
  const searchIndex = airportData.findIndex((data) => data.Code === code);

  return airportData[searchIndex].City;
};

const convertToDateTime = (val, type) => {
  let conv = val.split("T");
  const year = conv[0].split("-")[0];
  const month = conv[0].split("-")[1];
  const date = conv[0].split("-")[2];

  let dateTime = new Date();
  dateTime.setMonth(month - 1);
  const longMonth = dateTime.toLocaleString("en-US", { month: "long" });
  const currTime = conv[1];

  if (type === "Date") {
    return longMonth + " " + date;
  } else if (type === "Time") {
    return currTime;
  }
};

const renderData = async () => {
  renderTemplate(flights);
  renderDropdownFilter();
};

const renderDropdownFilter = () => {
  let obj = [
    { param: "All" },
    { param: "Morning flight" },
    { param: "Night flight" },
  ];

  airlines.airlines_data.map((data) => {
    let temp = {};
    temp["param"] = data.Code + " " + data.Name;
    obj.push(temp);
  });

  let res = "";
  let getUl = document.querySelector("#dropdown-filter");

  obj.map((data) => {
    res += `<li onclick={handleFilter("${data.param.split(" ")[0]}")}>${
      data.param
    }</li>`;
  });

  getUl.innerHTML = res;
};

const handleDropdown = (value) => {
  const sortingContainer = document.querySelector(
    ".top-container .sorting-container"
  );
  const filterContainer = document.querySelector(
    ".top-container .filter-container"
  );

  if (value === "sort") {
    if (!dropdownSortState) {
      sortingContainer.classList.add("active");
      document.getElementById("dropdown-sort").style.display = "block";
      dropdownSortState = true;
    } else {
      sortingContainer.classList.remove("active");
      document.getElementById("dropdown-sort").style.display = "none";
      dropdownSortState = false;
    }
  } else if (value === "filter") {
    if (!dropdownSortState) {
      filterContainer.classList.add("active");
      document.getElementById("dropdown-filter").style.display = "block";
      dropdownSortState = true;
    } else {
      filterContainer.classList.remove("active");
      document.getElementById("dropdown-filter").style.display = "none";
      dropdownSortState = false;
    }
  }
};

const addNewKey = (arr) => {
  arr.map((data, idx) => {
    for (let index = 0; index < airlines.airlines_data.length; index++) {
      if (data.airlines === airlines.airlines_data[index].Code) {
        arr[idx]["airlines_name"] = airlines.airlines_data[index].Name;
        break;
      }
    }
  });

  return arr;
};

const handleSortingByName = () => {
  const newData = addNewKey(flights);
  console.log("new data", newData);
};

const handleSortingBySchedule = () => {
  if (!schedAsc) {
    flights.sort((a, b) => {
      const sched1 = new Date(a.departure_time);
      const sched2 = new Date(b.departure_time);

      return sched1 - sched2;
    });
    schedAsc = true;
  } else {
    flights.sort((a, b) => {
      const sched1 = new Date(a.departure_time);
      const sched2 = new Date(b.departure_time);

      return sched2 - sched1;
    });
    schedAsc = false;
  }
  renderData();
};

handleFilter = (value) => {
  let temp = [];
  let container = document.querySelector(".container");

  if (value !== "All") {
    flights.map((data) => {
      const sched = new Date(data.departure_time).getHours();
      if (sched > 0 && sched < 17 && value === "Morning") {
        temp.push(data);
      } else if (sched >= 17 && value === "Night") {
        temp.push(data);
      } else {
        const code = data.airlines;
        if (code === value) {
          temp.push(data);
        }
      }
    });
  } else {
    temp = [...flights];
  }

  renderTemplate(temp);
};
