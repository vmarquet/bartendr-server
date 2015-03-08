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

    // we compute the total price of the order (sum of all items)
    var j = 0; var price = 0;
    while (j < order.items.length) {
      price += order.items[j].price;
      j++;
    }
    price = price.toFixed(2);

    // première colonne, le tier de gauche
    orders_html += ' \
<div class="row"> \
  <div class="col-md-4"> \
    <div class="panel panel-default"> \
      <div class="panel-heading"> \
        Commande n° ' + order.order_id + ', passée il y a ' + order.created_at + ' \
      </div> \
      <ul class="list-group"> \
        <li class="list-group-item">Prix total: <strong>' + price + '</strong> €</li> \
        <li class="list-group-item">Table ' + order.table + '</li> \
      </ul> \
    </div> \
  </div>';  // fin de la première colonne

  // deuxième colonne, le tier du milieu
  orders_html += ' \
  <div class="col-md-4"> \
    <table class="table"> \
      <tbody>';
    
    // for each item in the command, we create a row in the table
    j = 0;
    while (j < order.items.length) {
      item = order.items[j];
      orders_html += ' \
        <tr> \
          <td><strong>' + item.article + '</strong></td> \
          <td>' + item.comments + '</td> \
          <td width="10%"><span class="badge">' + '1' + '</td> \
        </tr>'
      j++;
    }
    
    orders_html += ' \
      </tboby> \
    </table> \
  </div>';  // fin de la 2e colonne

  // dernière colonne, le tier de droite
  orders_html += ' \
  <div class="col-md-4"> \
    <div class="col-md-4">';

    // we display a label depending on if the order was served
    if (order.is_served.toString().localeCompare("true") == 0)
      orders_html += '<span class="label label-success"> ✔ servi </span>';
    else
      orders_html += '<span class="label label-warning"> ✘ non servi </span>';
      
    orders_html += ' \
    </div> \
    <div class="col-md-4">';

    // we display a label depending on if the order was paid
    if (order.is_paid.toString().localeCompare("true") == 0)
      orders_html += '<span class="label label-success"> ✔ payé </span>';
    else
      orders_html += '<span class="label label-warning"> ✘ non payé </span>';
      
    orders_html += ' \
    </div> \
    <div class="col-md-4"> \
      <a class="btn btn-xs btn-danger" \
        data-confirm="Êtes-vous sûr de vouloir supprimer cette commande ?" \
        data-method="delete" href="/orders/' + order.order_id + '" rel="nofollow">Annuler \
      </a> \
    </div>';

      // on n'affiche le bouton "indiquer comme payé"
      // que si l'article n'est pas déjà payé
      if (order.is_paid.toString().localeCompare("false") == 0) {
        orders_html += ' \
    <div class="col-md-12" style="margin-top: 6px;"> \
      <a class="btn btn-primary btn-lg btn-block" data-remote="true" data-method="patch" \
         href="/orders/' + order.order_id + '/ispaid" rel="nofollow"> \
        Indiquer comme payé \
      </a> \
    </div>';
      }

      // on n'affiche le bouton "indiquer comme servi"
      // que si l'article n'est pas déjà servi
      if (order.is_served.toString().localeCompare("false") == 0) {
        orders_html += ' \
    <div class="col-md-12" style="margin-top: 6px;"> \
      <a class="btn btn-primary btn-lg btn-block" data-remote="true" data-method="patch" \
         href="/orders/' + order.order_id + '/isserved" rel="nofollow"> \
        Indiquer comme servi \
      </a> \
    </div>';
      }

      orders_html += ' \
  </div> \
</div><br />';

    i++;
  }

  orders_html += '</div>'  // end <div id="orders-index-table">

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
  getOrdersJSON_interval1 = setInterval(getOrdersJSON, 10000); // interval in milliseconds
  getOrdersJSON_interval2 = setInterval(updateTimeSinceLastUpdate, 1000);
}

// when we go to this page using TurboLinks:
$(document).on("page:load", launchUpdateProcess);

// when we go to this page using a usual HTTP request
$(document).ready(launchUpdateProcess);

