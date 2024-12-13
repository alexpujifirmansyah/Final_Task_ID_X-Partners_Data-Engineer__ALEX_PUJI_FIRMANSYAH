CREATE PROCEDURE DailyTransaction
    @start_date DATE, -- Parameter input untuk menentukan rentang tanggal yang ingin dihitung.
    @end_date DATE -- Parameter output untuk menentukan rentang tanggal yang ingin dihitung.
AS
BEGIN
    SELECT 
        CAST(Transaction_Date AS DATE) AS Date, --Mengubah tipe data transaction_date menjadi DATE untuk hanya menampilkan tanggal tanpa waktu.
        COUNT(*) AS TotalTransactions, -- Menghitung jumlah total transaksi pada setiap tanggal.
        SUM(Amount) AS TotalAmount -- Menjumlahkan total nominal transaksi pada setiap tanggal.
    FROM 
        FactTransaction
    WHERE 
        Transaction_Date BETWEEN @start_date AND @end_date
    GROUP BY 
        CAST(Transaction_Date AS DATE) --- Mengelompokkan data berdasarkan tanggal.
    ORDER BY 
        Date; -- Mengurutkan hasil berdasarkan tanggal secara ascending.
END

EXEC DailyTransaction '2024-01-01', '2024-01-31'


drop procedure DailyTransaction