CREATE PROCEDURE BalancePerCustomer
    @name NVARCHAR(100) -- parameter @name yang digunakan untuk mencari data customer berdasarkan nama.
AS
BEGIN
    SELECT 
        c.Customer_Name,
        a.Account_Type,
        a.Balance,
        a.Balance + SUM(CASE WHEN t.transaction_type = 'Deposit' THEN t.Amount ELSE -t.Amount END) AS CurrentBalance
		-- CASE WHEN digunakan untuk menentukan apakah transaksi merupakan deposit atau penarikan.
		
    FROM 
        DimAccount a -- INNER JOIN antara tabel DimAccount dan DimCustomer untuk mendapatkan informasi customer.
    INNER JOIN DimCustomer c ON a.customer_id = c.customer_id
    LEFT JOIN FactTransaction t ON a.account_id = t.account_id -- LEFT JOIN digunakan agar semua DimAccount tetap ditampilkan.

    WHERE --  digunakan untuk memfilter data berdasarkan nama customer yang diberikan dan status account yang aktif.
        c.Customer_Name = @name AND
        a.status = 'active'

    GROUP BY 
        c.Customer_Name, a.Account_Type, a.Balance;
END

EXEC BalancePerCustomer 'SHELLY JUWITA';

drop procedure BalancePerCustomer