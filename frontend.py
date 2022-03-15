import psycopg2

conn = psycopg2.connect(database="couriermanage", user = "postgres", password = "1274", host = "127.0.0.1", port = "5432")
cur=conn.cursor()
cid=0
pid=0
cur.execute("SELECT Customer_Id from Customer")
row=cur.fetchall()
cid=max(row)[0]
print(cid)
cur.execute("SELECT Package_Id from CUSTOMER_PACKAGES")
row1=cur.fetchall()
pid=max(row1)[0]
print(pid)

def create_acc():
    a=input("enter customer name ")
    b=input("enter customer address")
    cur.execute("INSERT INTO CUSTOMER (Customer_name,Customer_address,Customer_Id) \
      VALUES (%s,%s,%s)",(a,a,cid+1))
    conn.commit()
    cur.close()
    conn.close()
def track(id):
    cur.execute("SELECT Receiving_date ,Departure_date FROM CUSTOMER_PACKAGES  WHERE Package_id=%s ",(id,))
    r1=cur.fetchall()
    for i in r1:
        print("delivery date \n",i[0])
        print("departure date \n",i[1])
    cur.close()
    conn.close()
    
x=input("enter option 1 for login 2 for track ")
print(x)

if (x=='1'):
    print("in case 1")
    create_acc()
elif (x=='2'):
    print("in case 2")
    y=input("enter package tracking id")
    track(y)
else:
    print("invalid choice")
print("PostgreSQL connection is closed \n")