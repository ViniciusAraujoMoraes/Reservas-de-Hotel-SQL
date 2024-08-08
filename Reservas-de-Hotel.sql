CREATE TABLE Hospedes (
    HospedeID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    DataNascimento DATE
);

CREATE TABLE Reservas (
    ReservaID INT PRIMARY KEY,
    HospedeID INT,
    QuartoID INT,
    DataEntrada DATE,
    DataSaida DATE,
    FOREIGN KEY (HospedeID) REFERENCES Hospedes(HospedeID)
);

CREATE OR REPLACE PROCEDURE RegistrarReserva(
    p_HospedeID INT,
    p_QuartoID INT,
    p_DataEntrada DATE,
    p_DataSaida DATE
) IS
BEGIN
    INSERT INTO Reservas (ReservaID, HospedeID, QuartoID, DataEntrada, DataSaida)
    VALUES (seq_reservas.NEXTVAL, p_HospedeID, p_QuartoID, p_DataEntrada, p_DataSaida);
END;
/
