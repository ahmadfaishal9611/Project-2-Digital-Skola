# make sure you fill the host name by the postgres container name and connect to the exposed port (check in Dockerfile.postgres)
db_url = 'postgresql://postgres:1234@postgres_container:5432/db_test1'

# make sure you fill the folder_path based on the directory in docker container (check in Dockerfile.extractload)
folder_path = '/app/data_source/'

# table_name, csv_file, unique_columns
csv_files = {
    'categories': (f'{folder_path}categories.csv', ['categoryID']),
    'shippers': (f'{folder_path}shippers.csv', ['shipperID']),
    'customers': (f'{folder_path}customers.csv', ['customerID']),
    'regions': (f'{folder_path}regions.csv', ['regionID']),
    'suppliers': (f'{folder_path}suppliers.csv', ['supplierID']),
    'employees': (f'{folder_path}employees.csv', ['employeeID']),
    'products': (f'{folder_path}products.csv', ['productID']),
    'territories': (f'{folder_path}territories.csv', ['territoryID']),
    'employee_territories': (f'{folder_path}employee_territories.csv', ['employeeID', 'territoryID']),
    'orders': (f'{folder_path}orders.csv', ['orderID']),
    'order_details': (f'{folder_path}order_details.csv', ['orderID', 'productID'])
}
