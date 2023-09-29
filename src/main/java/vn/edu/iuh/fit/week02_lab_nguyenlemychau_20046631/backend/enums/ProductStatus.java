package vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.enums;

public enum ProductStatus {
    ACTIVE(1),//đang kinh doanh
    IN_ACTIVE(0), //tam ngung
    TERMINATED(-1); //khong ban nua
    private int value;

    ProductStatus(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public String toString() {
        return super.toString();
    }
    public static ProductStatus fromStatus(int value) {
        for (ProductStatus status: vn.edu.iuh.fit.week02_lab_nguyenlemychau_20046631.backend.enums.ProductStatus.values())
            if (status.value == value) {
                return status;
            }
        throw new IllegalArgumentException("Invalid GrantStatus value: " + value);
    }

}
