-- Cashbox (id=4, Abril 2024)
INSERT INTO cashbox (id, year, month, total_collected, total_spent, total_balance)
VALUES (4, 2024, 4, 1311500.00, 986067.99, 325432.01);

-- Members (algunos ejemplos)
INSERT INTO member (id, first_name, last_name, slot, status) VALUES
(1, 'Efrain', 'Alaca', '1/4', 'Activo'),
(2, 'Noemi', 'Aliaga', '1', 'Activo'),
(3, 'Cesar', 'Aranda', '1/2', 'Activo'),
(4, 'Alexis', 'Avisa', '1', 'Activo'),
(5, 'Jhony', 'Barco', '1/2', 'Activo');

-- Cashbox fees (algunas cuotas de Abril)
INSERT INTO cashbox_fee (id, id_cashbox, id_member, assigned_amount, paid, status) VALUES
(1, 4, 1, 12500.00, 12500.00, 'Pagado'),
(2, 4, 2, 50000.00, 50000.00, 'Pagado'),
(3, 4, 3, 25000.00, 25000.00, 'Pagado'),
(4, 4, 4, 50000.00, 50000.00, 'Pagado'),
(5, 4, 5, 25000.00, 25000.00, 'Pagado');

-- Cashbox expenses (algunos gastos de Abril)
INSERT INTO cashbox_expense (id, id_cashbox, description, amount, date) VALUES
(1, 4, 'Recibos', 63500.00, NULL),
(2, 4, 'Papel carbon', 500.00, NULL),
(3, 4, 'Cuaderno de Actas', 7000.00, NULL),
(4, 4, 'Asado carne y carbón', 98470.00, '2024-05-03'),
(5, 4, '12 Cervezas', 18000.00, '2024-05-05');
