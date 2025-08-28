DELIMITER ;;
CREATE TRIGGER trg_insert_cashbox_fee
AFTER INSERT ON cashbox_fee
FOR EACH ROW
BEGIN
    UPDATE cashbox
    SET total_collected = IFNULL(total_collected, 0) + NEW.paid
    WHERE id = NEW.id_cashbox;

    CALL sp_update_balance(NEW.id_cashbox);
END ;;

CREATE TRIGGER trg_update_cashbox_fee
AFTER UPDATE ON cashbox_fee
FOR EACH ROW
BEGIN
    UPDATE cashbox
    SET total_collected = IFNULL(total_collected, 0) + (NEW.paid - OLD.paid)
    WHERE id = NEW.id_cashbox
	AND EXISTS (SELECT 1 FROM cashbox WHERE id = NEW.id_cashbox);

    CALL sp_update_balance(NEW.id_cashbox);
END ;;

CREATE TRIGGER trg_delete_cashbox_fee
AFTER DELETE ON cashbox_fee
FOR EACH ROW
BEGIN
    UPDATE cashbox
    SET total_collected = GREATEST(0, IFNULL(total_collected, 0) - OLD.paid)
    WHERE id = OLD.id_cashbox;

    CALL sp_update_balance(OLD.id_cashbox);
END ;;

CREATE TRIGGER trg_insert_cashbox_expense
AFTER INSERT ON cashbox_expense
FOR EACH ROW
BEGIN
    UPDATE cashbox
    SET total_spent = IFNULL(total_spent, 0) + NEW.amount
    WHERE id = NEW.id_cashbox;

    CALL sp_update_balance(NEW.id_cashbox);
END ;;

CREATE TRIGGER trg_update_cashbox_expense
AFTER UPDATE ON cashbox_expense
FOR EACH ROW
BEGIN
    UPDATE cashbox
    SET total_spent = IFNULL(total_spent, 0) + (NEW.amount - OLD.amount)
    WHERE id = NEW.id_cashbox
    AND EXISTS (SELECT 1 FROM cashbox WHERE id = NEW.id_cashbox);

    CALL sp_update_balance(NEW.id_cashbox);
END ;;

CREATE TRIGGER trg_delete_cashbox_expense
AFTER DELETE ON cashbox_expense
FOR EACH ROW
BEGIN
    UPDATE cashbox
    SET total_spent = GREATEST(0, IFNULL(total_spent, 0) - OLD.amount)
    WHERE id = OLD.id_cashbox;

    CALL sp_update_balance(OLD.id_cashbox);
END ;;

DELIMITER ;

