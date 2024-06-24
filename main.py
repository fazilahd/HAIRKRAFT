from flask import Flask, render_template, request, redirect, url_for, session, jsonify, g
from flask_mysqldb import MySQL
import random
from random import sample

app = Flask(__name__, static_folder='static')


app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'

app.config['MYSQL_DB'] = 'haircare'

mysql = MySQL(app)
username = "admin"
password = "admin123"


@app.route('/')
def index():
    return render_template('homepage.html')
@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/admin',methods=['GET', 'POST'])
def admin():
    return render_template('admin.html')
@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('/'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        
        
        if request.form['username'] == username and request.form['password'] == password:
            
            return redirect(url_for('admin'))
        else:
            
            return render_template('login.html', error='Invalid username or password')
    else:
        
        return render_template('login.html')
@app.route('/add_entry', methods=['POST'])
def add_entry():
    if request.method == 'POST':
        table_name = request.form['table_name']
        
        cur = mysql.connection.cursor()
        if table_name == 'shampoo':
            s_id=request.form['s_id']
            s_brand=request.form['s_brand']
            s_name = request.form['s_name']
            hair_type=request.form['hair_type']
            sulphate_shampoo = request.form['sulphate_shampoo']
            paraben_shampoo = request.form['paraben_shampoo']
            s_price = request.form['s_price']
            s_rating = request.form['s_rating']
            image_name = request.form['image_name']
            cur.execute("INSERT INTO shampoo (s_id, s_brand, s_name, hair_type,sulphate_shampoo,paraben_shampoo,s_price, s_rating,image_name) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)", (s_id, s_brand, s_name, hair_type, sulphate_shampoo, paraben_shampoo, s_price, s_rating, image_name))
        elif table_name == 'conditioner':
            c_id=request.form['c_id']
            c_brand=request.form['c_brand']
            c_name = request.form['c_name']
            hair_type=request.form['hair_type']
            c_price = request.form['c_price']
            c_rating = request.form['c_rating']
            image_name = request.form['image_name']
            cur.execute("INSERT INTO conditioner (c_id, c_brand, c_name, hair_type,c_price, c_rating,image_name) VALUES (%s, %s, %s, %s, %s, %s, %s)", (c_id, c_brand, c_name, hair_type, c_price, c_rating, image_name))
        
        
        elif table_name == 'cream':
            cr_id=request.form['cr_id']
            cr_brand=request.form['cr_brand']
            cr_name = request.form['cr_name']
            hair_type=request.form['hair_type']
            cr_price = request.form['cr_price']
            cr_rating = request.form['cr_rating']
            image_name = request.form['image_name']
            cur.execute("INSERT INTO cream (cr_id, cr_brand, cr_name, hair_type,cr_price, cr_rating,image_name) VALUES (%s, %s, %s, %s, %s, %s, %s)", (cr_id, cr_brand, cr_name, hair_type, cr_price, cr_rating, image_name))
            
        elif table_name == 'oil':
            o_id=request.form['o_id']
            o_brand=request.form['o_brand']
            o_name = request.form['o_name']
            hair_type=request.form['hair_type']
            o_price = request.form['o_price']
            o_rating = request.form['o_rating']
            image_name = request.form['image_name']
            cur.execute("INSERT INTO oil (o_id, o_brand, o_name, hair_type,o_price, o_rating,image_name) VALUES (%s, %s, %s, %s, %s, %s, %s)", (o_id, o_brand, o_name, hair_type, o_price, o_rating, image_name))
            
        elif table_name == 'gel':
            g_id=request.form['g_id']
            g_brand=request.form['g_brand']
            g_name = request.form['g_name']
            hair_type=request.form['hair_type']
            g_price = request.form['g_price']
            g_rating = request.form['g_rating']
            image_name = request.form['image_name']
            cur.execute("INSERT INTO gel (g_id, g_brand, g_name, hair_type,g_price, g_rating,image_name) VALUES (%s, %s, %s, %s, %s, %s, %s)", (g_id, g_brand, g_name, hair_type, g_price, g_rating, image_name))
            
        elif table_name == 'serum':
            se_id=request.form['se_id']
            se_brand=request.form['se_brand']
            se_name = request.form['se_name']
            hair_type=request.form['hair_type']
            se_price = request.form['se_price']
            se_rating = request.form['se_rating']
            image_name = request.form['image_name']
            cur.execute("INSERT INTO serum (se_id, se_brand, se_name, hair_type,se_price, se_rating,image_name) VALUES (%s, %s, %s, %s, %s, %s, %s)", (se_id, se_brand, se_name, hair_type, se_price, se_rating, image_name))
            
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('admin'))
@app.route('/delete_entry', methods=['POST'])
def delete_entry():
    if request.method == 'POST':
        try:
            table_name = request.form['delete_table_name']
            product_id = request.form['delete_product_id']  
            id_column = ''
            
            if table_name in ['shampoo', 'conditioner', 'cream', 'gel', 'oil', 'serum']:
                if table_name == 'shampoo':
                    id_column = 's_id'
                elif table_name == 'conditioner':
                    id_column = 'c_id'
                elif table_name == 'cream':
                    id_column = 'cr_id'
                elif table_name == 'oil':
                    id_column = 'o_id'
                elif table_name == 'gel':
                    id_column = 'g_id'
                elif table_name == 'serum':
                    id_column = 'se_id'
                
                cur = mysql.connection.cursor()
                
                cur.execute("SET FOREIGN_KEY_CHECKS=0")
                
                cur.execute(f"DELETE FROM {table_name} WHERE {id_column} = %s", (product_id,))
                
                mysql.connection.commit()
                
                cur.execute("SET FOREIGN_KEY_CHECKS=1")
                
                cur.close()
                return redirect(url_for('admin'))
            else:
                return "Invalid table name"
        except Exception as e:
            
            mysql.connection.rollback()
            print("Error deleting row:", e)
            return "Error deleting row"


@app.route('/get-product-ids/<table_name>', methods=['GET'])
def get_product_ids(table_name):
    try:
        
        cur = mysql.connection.cursor()

        
        id_column = f'{table_name[0]}_id'
        if table_name in ['cream', 'serum']:
            id_column = f'{table_name[:2]}_id'

        
        cur.execute(f"SELECT {id_column} FROM {table_name}")
        product_ids = [row[0] for row in cur.fetchall()]

        
        cur.close()

        
        return jsonify(product_ids)
    except Exception as e:
    
        print("Error fetching product IDs:", e)
        return jsonify(error=str(e)), 500
@app.route('/fetch-product-ids/<table_name>', methods=['GET'])
def fetch_product_ids(table_name):
    try:
        
        cur = mysql.connection.cursor()

        
        id_column = f'{table_name[0]}_id'
        if table_name in ['cream', 'serum']:
            id_column = f'{table_name[:2]}_id'

        
        cur.execute(f"SELECT {id_column} FROM {table_name}")
        product_ids = [row[0] for row in cur.fetchall()]

        
        cur.close()

        
        return jsonify(product_ids)
    except Exception as e:
        
        print("Error fetching product IDs:", e)
        return jsonify(error=str(e)), 500


@app.route('/get-row-data/<table_name>/<product_id>', methods=['GET'])
def get_row_data(table_name, product_id):
    try:
        
        cur = mysql.connection.cursor()

        
        id_column = f'{table_name[0]}_id'
        if table_name in ['cream', 'serum']:
            id_column = f'{table_name[:2]}_id'
        cur.execute(f"SELECT * FROM {table_name} WHERE {id_column} = %s", (product_id,))
        row_data = cur.fetchone()

        
        cur.close()

        
        return jsonify(row_data)
    except Exception as e:
        
        print("Error fetching row data:", e)
        return jsonify(error=str(e)), 500

@app.route('/alter_entry', methods=['POST'])
def alter_entry():
    try:
        table_name = request.form.get('alter_table_name')
        product_id = request.form.get('alter_product_id')
        new_hair_type = request.form.get('new_hair_type')

        if table_name and product_id and new_hair_type:
            
            cur = mysql.connection.cursor()

            
            cur.execute("SET FOREIGN_KEY_CHECKS=0")

            
            id_column = f'{table_name[0]}_id'
            if table_name in ['cream', 'serum']:
                id_column = f'{table_name[:2]}_id'

            
            cur.execute(f"UPDATE {table_name} SET hair_type = %s WHERE {id_column} = %s", (new_hair_type, product_id))

            
            mysql.connection.commit()

            
            cur.execute("SET FOREIGN_KEY_CHECKS=1")

            
            cur.close()

            return redirect(url_for('admin'))
        else:
            return jsonify(error="Missing table name, product ID, or new hair type"), 400
    except Exception as e:
        print("Error altering entry:", e)
        return jsonify(error=str(e)), 500


@app.route('/questionnaire', methods=['GET', 'POST'])
def questionnaire():
        if request.method == 'POST':
            hair_type = request.form['hair_type']
            return redirect(url_for('index'))
        return render_template('index.html', question="What's your hair type?")
@app.route('/get-columns/<table_name>', methods=['GET'])
def get_columns(table_name):
    cur = mysql.connection.cursor()
    cur.execute("SHOW COLUMNS FROM {}".format(table_name))
    columns = [row[0] for row in cur.fetchall()]
    cur.close()
    return jsonify(columns)


@app.route('/shampoo-info', methods=['POST'])
def get_hair_info():
    
    hair_type = request.form['hair_type']

    
    cur = mysql.connection.cursor()

    
    cur.execute('SELECT s_id, s_brand, s_name, hair_type, sulphate_shampoo, paraben_shampoo, s_price, s_rating, image_name FROM shampoo WHERE hair_type = %s', (hair_type,))
    shampoo_info_list = cur.fetchall()

    
    cur.execute('SELECT c_id, c_name, c_brand,hair_type, c_price, c_rating, image_name FROM conditioner WHERE hair_type = %s', (hair_type,))
    conditioner_info_list = cur.fetchall()

    cur.execute('SELECT se_id, se_brand, se_name, hair_type, se_price, se_rating, image_name FROM serum WHERE hair_type = %s', (hair_type,))
    serums_info_list = cur.fetchall()

    cur.execute('SELECT o_id, o_brand, o_name, hair_type, o_price, o_rating, image_name FROM oil WHERE hair_type = %s', (hair_type,))
    oil_info_list = cur.fetchall()

    cur.execute('SELECT cr_id, cr_brand, cr_name, hair_type, cr_price, cr_rating, image_name FROM cream WHERE hair_type = %s', (hair_type,))
    cream_info_list = cur.fetchall()

    cur.execute('SELECT g_id, g_brand, g_name, hair_type, g_price, g_rating, image_name FROM gel WHERE hair_type = %s', (hair_type,))
    gel_info_list = cur.fetchall()
    
    cur.close()

    if shampoo_info_list or conditioner_info_list or serums_info_list or oil_info_list or cream_info_list or gel_info_list:
       
        random_shampoos = sample(shampoo_info_list, min(2, len(shampoo_info_list)))
        random_conditioners = sample(conditioner_info_list, min(2, len(conditioner_info_list)))
        random_serums = sample(serums_info_list, min(2, len(serums_info_list)))
        random_cream = sample(cream_info_list, min(2, len(cream_info_list)))
        random_oil = sample(oil_info_list, min(2, len(oil_info_list)))
        random_gel = sample(gel_info_list, min(2, len(gel_info_list)))
        return render_template('shampoo_info.html', hair_type=hair_type, shampoo_info_list=random_shampoos, conditioner_info_list=random_conditioners, serums_info_list=random_serums, oil_info_list=random_oil, cream_info_list=random_cream, gel_info_list=random_gel)
    else:
        return render_template('shampoo_info.html', hair_type=hair_type, shampoo_info_list=None, conditioner_info_list=None, serums_info_list=None, oil_info_list=None, cream_info_list=None, gel_info_list=None)

if __name__ == '__main__':
    app.run(debug=True)
