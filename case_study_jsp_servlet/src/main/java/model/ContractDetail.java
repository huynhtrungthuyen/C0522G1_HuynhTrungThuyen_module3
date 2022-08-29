package model;

public class ContractDetail {
    private int contractDetailId;
    private int quanity;
    private int contractId;
    private int attachFacilityId;

    public ContractDetail() {
    }

    public ContractDetail(int contractDetailId, int quanity, int contractId, int attachFacilityId) {
        this.contractDetailId = contractDetailId;
        this.quanity = quanity;
        this.contractId = contractId;
        this.attachFacilityId = attachFacilityId;
    }

    public int getContractDetailId() {
        return contractDetailId;
    }

    public void setContractDetailId(int contractDetailId) {
        this.contractDetailId = contractDetailId;
    }

    public int getQuanity() {
        return quanity;
    }

    public void setQuanity(int quanity) {
        this.quanity = quanity;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getAttachFacilityId() {
        return attachFacilityId;
    }

    public void setAttachFacilityId(int attachFacilityId) {
        this.attachFacilityId = attachFacilityId;
    }
}
