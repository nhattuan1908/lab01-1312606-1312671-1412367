--CAU 4

CONN BTVN_1/btvn1;

CREATE VIEW V_DU_AN AS
SELECT DA.MADA, DA.TENDA, DA.KINHPHI, PB.TENPHONG, CN.TENCN, NV.HOTEN, SUM(CHI_TIEU.SOTIEN) AS TONGCHI
FROM DU_AN DA, PHONG_BAN PB, CHI_NHANH CN, NHAN_VIEN NV, CHI_TIEU
WHERE DA.PHONGCHUTRI = PB.MAPHONG AND PB.CHINHANH = CN.MACN AND DA.TRUONGDA = NV.MANV AND DA.MADA = CHI_TIEU.DUAN
GROUP BY DA.MADA, DA.TENDA, DA.KINHPHI, PB.TENPHONG, CN.TENCN, NV.HOTEN;

GRANT SELECT ON V_DU_AN TO R_GIAM_DOC;
