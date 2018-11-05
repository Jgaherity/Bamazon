//js file will first display all of the items available for sale. include the IDs, names, & prices for sale 
//app then prompts:
// * The first should ask them the ID of the product they would like to buy.
// * The second message should ask how many units of the product they would like to buy.

var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    database: "bamazon"
});

connection.connect(function(err) {
    if (err) throw err;
    printStock();
});


function printStock() {
    connection.query("SELECT * FROM products", function(err, res) {
        //console.log(res.length);
        for (var i = 0; i < res.length; i++) {
            console.log(res[i].item_id + " | " + res[i].product_name + " | " + res[i].department_name + " | " + res[i].price + " | " + res[i].stock_quantity);
        }
        console.log("-------------\n");
        runBamazon();
    });
}

function runBamazon() {
    inquirer.prompt([{
            type: "input",
            name: "item_id",
            message: "Please provide the id of the item you wish to purchase.",
            validate: function(input) {
                if (input === "") {
                    console.log("Item id invaled. Please provide the id number of the item you are interested in.");
                    return false;
                } else {
                    return true;
                }
            }
        },
        {
            type: "input",
            name: "quantity",
            message: "How many items of this product would you like to purchase? (Please provide integer only)",
            validate: function(input) {
                if (input === "") {
                    console.log("Please specify how many units you'd like.");
                    return false;
                } else {
                    return true;
                }
            }

        }
    ]).then(function(input) {
        connection.query("SELECT * FROM products WHERE ?", { item_id: input.item_id }, function(err, res) {
            if (err) throw err;
            if (input.quantity < res[0].stock_quantity) {
                // Update the inventory
                connection.query("UPDATE products SET stock_quantity = " + (res[0].stock_quantity - input.quantity) + " WHERE item_id = " + input.item_id, function(err, data) {
                    if (err) throw err;
                    console.log("Thank you for your order,  your total is $" + res[0].price * input.quantity);
                    console.log("-------------\n");
                    printStock();
                    // End the database connection
                    connection.end();
                })
            } else {
                console.log("Insufficient quantity!");
                console.log("-------------\n");
            }
        })
    })
}
