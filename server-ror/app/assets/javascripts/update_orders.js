// the javascript code to update the "orders" page with AJAX

var getOrdersJSON_interval1;
var getOrdersJSON_interval2;
var timeSinceLastUpdate = 0;

// the function to kill the update function that run in the background
function killFunctionsWithInterval() {
  clearInterval(getOrdersJSON_interval1);
  clearInterval(getOrdersJSON_interval2);
}

// the function to perform the AJAX request
function getOrdersJSON() {
  // to kill this script when the user went to another page,
  // we check if there is still a element with id="orders-index-table"
  if ($("#orders-index-table").length == 0) {
    killFunctionsWithInterval();
    return;
  }

  $.ajax({
    type: 'GET',
    url: "http://0.0.0.0:3000/orders.json",
    data: { get_param: 'value' },
    dataType: 'json',
    success: function (data) {
      updateOrdersHTML(data);
      timeSinceLastUpdate = 0;
    },
    error: function (xhr, ajaxOptions, thrownError) {
      console.log("DEBUG: Failure");
      console.log("       " + xhr.status);
      console.log("       " + thrownError);
    }
  });
}

// the function to update the HTML code with the data from the AJAX request
function updateOrdersHTML(data) {

  var orders_html = '<div id="orders-index-table">'

  var i = 0;
  while (i < data.length) {
    // for each order, we create a panel, 
    // and we create a table inside it, containing the articles
    order = data[i];

    // we create a new panel
    orders_html += '<div class="panel panel-default">'

    // we create the heading of the panel, and we fill it with order metadata
    orders_html += '<div class="panel-heading"><div class="row">'

    orders_html += '<div class="col-md-2">Commande n° ' + order.order_id + '</div>'
    orders_html += '<div class="col-md-2"> Passée à ' + order.created_at + '</div>'
    orders_html += '<div class="col-md-2"> Table n° ' + order.table + '</div>'

    orders_html += '<div class="col-md-2">'
    // stuff to compute how to display the buttons "paid" and "served"
    var icon; var button_type;
    if (order.is_paid.toString().localeCompare("true") == 0) {
      icon = '<font color="white"> ✔ payé </font>';
      button_type = 'btn-success';
    }
    else {
      icon = '<font color="red"> ✘ non payé </font>';
      button_type = 'btn-default';
    }

    orders_html += '<a class="btn btn-xs ' + button_type + '" \
                       data-remote="true" data-method="patch" \
                       href="/orders/' + order.order_id + '/ispaid" rel="nofollow"> \
                       ' + icon + '</a>';

    if (order.is_served.toString().localeCompare("true") == 0) {
      icon = '<font color="white"> ✔ servi </font>';
      button_type = 'btn-success';
    }
    else {
      icon = '<font color="red"> ✘ non servi </font>';
      button_type = 'btn-default';
    }

    orders_html += '<a class="btn btn-xs ' + button_type + '" \
                       data-remote="true" data-method="patch" \
                       href="/orders/' + order.order_id + '/isserved" rel="nofollow"> \
                       ' + icon + '</a>';

    orders_html += '</div>'

    // the button "suppress"
    orders_html += ' \
          <div class="col-md-2"> \
            <a class="btn btn-xs btn-danger" \
               data-confirm="Êtes-vous sûr de vouloir supprimer cette commande ?" \
               data-method="delete" href="/orders/' + order.order_id + '" rel="nofollow">Supprimer \
            </a> \
          </div>'

    // we compute the total price of the order (sum of all items)
    var j = 0; var price = 0;
    while (j < order.items.length) {
      price += order.items[j].price;
      j++;
    }
    orders_html += '<div class="col-md-2"> Prix total: ' + price.toFixed(2) + ' €</div>'

    // end of the panel heading
    orders_html += '</div></div>'

    // we create a table to display each item in the order
    orders_html += '<table class="table"><tbody>'

    j = 0;
    while (j < order.items.length) {
      item = order.items[j];
      orders_html += ' \
                <tr> \
                  <td>Article: <strong>' + item.article + '</strong></td> \
                  <td width="45%">' + item.comments + '</td> \
                  <td>Quantité: <strong>1</strong></td> \
                  <td width="150px">Prix: ' + item.price + ' €</td> \
                </tr>'
      j++;
    }

    // end of the items table
    orders_html += '</tbody></table>'

    // end of the panel
    orders_html += '</div>'

    i++;
  }

  orders_html += '</div>'

  // we rewrite entirely the part of the page where the orders are displayed
  $("#orders-index-table").html(orders_html);
}

// to display the time since last update
function updateTimeSinceLastUpdate() {
  var time;
  if (timeSinceLastUpdate < 10)
    time = "Dernière mise à jour: maintenant";
  else if (timeSinceLastUpdate >= 10 && timeSinceLastUpdate < 60) {
    // pour ne pas distraire les utilisateurs, on ne rafraichit le timer
    // que toutes les 10 secondes
    var time_tmp = timeSinceLastUpdate - (timeSinceLastUpdate % 10);
    time = "Dernière mise à jour: il y a " + time_tmp + " secondes";
  }
  else {  // donc timeSinceLastUpdate >= 60
    var time_tmp = Math.floor(timeSinceLastUpdate / 60);
    if (time_tmp == 1)
      time = "Dernière mise à jour: il y a " + time_tmp + " minute";
    else
      time = "Dernière mise à jour: il y a " + time_tmp + " minutes";
  }
  $("#time-since-last-update").html('<div id="time-since-last-update">' + time + '</div>');
  timeSinceLastUpdate++;
}


// the functions to launch the update process
function launchUpdateProcess() {
  // we begin by killing the functions that update the page,
  // to be sure that there is only one instance running
  killFunctionsWithInterval();

  getOrdersJSON();  // we launch it the first time at the loading of the page
  getOrdersJSON_interval1 = setInterval(getOrdersJSON, 20000); // interval in milliseconds
  getOrdersJSON_interval2 = setInterval(updateTimeSinceLastUpdate, 1000);
}

// when we go to this page using TurboLinks:
$(document).on("page:load", launchUpdateProcess);

// when we go to this page using a usual HTTP request
$(document).ready(launchUpdateProcess);

