Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF372D255C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Dec 2020 09:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbgLHIEs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Dec 2020 03:04:48 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:50630 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725927AbgLHIEn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Dec 2020 03:04:43 -0500
X-IronPort-AV: E=Sophos;i="5.78,401,1599490800"; 
   d="scan'208";a="65020046"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Dec 2020 17:04:10 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D5E6842296C4;
        Tue,  8 Dec 2020 17:04:10 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org
Cc:     khiem.nguyen.xt@renesas.com, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Date:   Tue,  8 Dec 2020 17:04:03 +0900
Message-Id: <1607414643-25498-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>

The new PMIC BD9574MWF inherits features from BD9571MWV.
Add the support of new PMIC to existing bd9571mwv driver.

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
[shimoda: rebase and refactor]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mfd/bd9571mwv.c       | 92 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/bd9571mwv.h | 80 +++++++++++++++++++++++++++++++++++++
 2 files changed, 172 insertions(+)

diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index 57bdb6a..f8f0a87 100644
--- a/drivers/mfd/bd9571mwv.c
+++ b/drivers/mfd/bd9571mwv.c
@@ -20,6 +20,7 @@ static const struct mfd_cell bd9571mwv_cells[] = {
 	{ .name = "bd9571mwv-gpio", },
 };
 
+/* Regmap for BD9571MWV */
 static const struct regmap_range bd9571mwv_readable_yes_ranges[] = {
 	regmap_reg_range(BD9571MWV_VENDOR_CODE, BD9571MWV_PRODUCT_REVISION),
 	regmap_reg_range(BD9571MWV_BKUP_MODE_CNT, BD9571MWV_BKUP_MODE_CNT),
@@ -112,6 +113,95 @@ static const struct bd957x_data bd9571mwv_data = {
 	.num_cells = ARRAY_SIZE(bd9571mwv_cells),
 };
 
+static const struct mfd_cell bd9574mwf_cells[] = {
+	{ .name = "bd9571mwv-gpio", },
+};
+
+/* Regmap for BD9574MWF */
+static const struct regmap_range bd9574mwf_readable_yes_ranges[] = {
+	regmap_reg_range(BD9574MWF_VENDOR_CODE, BD9574MWF_PRODUCT_REVISION),
+	regmap_reg_range(BD9574MWF_GPIO_IN, BD9574MWF_GPIO_IN),
+	regmap_reg_range(BD9574MWF_GPIO_INT, BD9574MWF_GPIO_INTMASK),
+	regmap_reg_range(BD9574MWF_GPIO_MUX, BD9574MWF_GPIO_MUX),
+	regmap_reg_range(BD9574MWF_INT_INTREQ, BD9574MWF_INT_INTMASK),
+};
+
+static const struct regmap_access_table bd9574mwf_readable_table = {
+	.yes_ranges	= bd9574mwf_readable_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(bd9574mwf_readable_yes_ranges),
+};
+
+static const struct regmap_range bd9574mwf_writable_yes_ranges[] = {
+	regmap_reg_range(BD9574MWF_GPIO_DIR, BD9574MWF_GPIO_OUT),
+	regmap_reg_range(BD9574MWF_GPIO_INT_SET, BD9574MWF_GPIO_INTMASK),
+	regmap_reg_range(BD9574MWF_INT_INTREQ, BD9574MWF_INT_INTMASK),
+};
+
+static const struct regmap_access_table bd9574mwf_writable_table = {
+	.yes_ranges	= bd9574mwf_writable_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(bd9574mwf_writable_yes_ranges),
+};
+
+static const struct regmap_range bd9574mwf_volatile_yes_ranges[] = {
+	regmap_reg_range(BD9574MWF_GPIO_IN, BD9574MWF_GPIO_IN),
+	regmap_reg_range(BD9574MWF_GPIO_INT, BD9574MWF_GPIO_INT),
+	regmap_reg_range(BD9574MWF_INT_INTREQ, BD9574MWF_INT_INTREQ),
+};
+
+static const struct regmap_access_table bd9574mwf_volatile_table = {
+	.yes_ranges	= bd9574mwf_volatile_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(bd9574mwf_volatile_yes_ranges),
+};
+
+static const struct regmap_config bd9574mwf_regmap_config = {
+	.reg_bits	= 8,
+	.val_bits	= 8,
+	.cache_type	= REGCACHE_RBTREE,
+	.rd_table	= &bd9574mwf_readable_table,
+	.wr_table	= &bd9574mwf_writable_table,
+	.volatile_table	= &bd9574mwf_volatile_table,
+	.max_register	= 0xff,
+};
+
+static const struct regmap_irq bd9574mwf_irqs[] = {
+	REGMAP_IRQ_REG(BD9574MWF_IRQ_MD1, 0,
+		       BD9574MWF_INT_INTREQ_MD1_INT),
+	REGMAP_IRQ_REG(BD9574MWF_IRQ_MD2_E1, 0,
+		       BD9574MWF_INT_INTREQ_MD2_E1_INT),
+	REGMAP_IRQ_REG(BD9574MWF_IRQ_MD2_E2, 0,
+		       BD9574MWF_INT_INTREQ_MD2_E2_INT),
+	REGMAP_IRQ_REG(BD9574MWF_IRQ_PROT_ERR, 0,
+		       BD9574MWF_INT_INTREQ_PROT_ERR_INT),
+	REGMAP_IRQ_REG(BD9574MWF_IRQ_GP, 0,
+		       BD9574MWF_INT_INTREQ_GP_INT),
+	REGMAP_IRQ_REG(BD9574MWF_IRQ_BKUP_HOLD_OF, 0,
+		       BD9574MWF_INT_INTREQ_BKUP_HOLD_OF_INT),
+	REGMAP_IRQ_REG(BD9574MWF_IRQ_WDT_OF, 0,
+		       BD9574MWF_INT_INTREQ_WDT_OF_INT),
+	REGMAP_IRQ_REG(BD9574MWF_IRQ_BKUP_TRG, 0,
+		       BD9574MWF_INT_INTREQ_BKUP_TRG_INT),
+};
+
+static struct regmap_irq_chip bd9574mwf_irq_chip = {
+	.name		= "bd9574mwf",
+	.status_base	= BD9574MWF_INT_INTREQ,
+	.mask_base	= BD9574MWF_INT_INTMASK,
+	.ack_base	= BD9574MWF_INT_INTREQ,
+	.init_ack_masked = true,
+	.num_regs	= 1,
+	.irqs		= bd9574mwf_irqs,
+	.num_irqs	= ARRAY_SIZE(bd9574mwf_irqs),
+};
+
+static const struct bd957x_data bd9574mwf_data = {
+	.product_code_val = BD9574MWF_PRODUCT_CODE_VAL,
+	.part_number = BD9574MWF_PART_NUMBER,
+	.regmap_config = &bd9574mwf_regmap_config,
+	.irq_chip = &bd9574mwf_irq_chip,
+	.cells = bd9574mwf_cells,
+	.num_cells = ARRAY_SIZE(bd9574mwf_cells),
+};
+
 static int bd9571mwv_identify(struct bd9571mwv *bd)
 {
 	struct device *dev = bd->dev;
@@ -182,6 +272,8 @@ static int bd9571mwv_probe(struct i2c_client *client,
 	product_code = (unsigned int)ret;
 	if (product_code == BD9571MWV_PRODUCT_CODE_VAL)
 		bd->data = &bd9571mwv_data;
+	else if (product_code == BD9574MWF_PRODUCT_CODE_VAL)
+		bd->data = &bd9574mwf_data;
 
 	if (!bd->data) {
 		dev_err(bd->dev, "No found supported device %d\n",
diff --git a/include/linux/mfd/bd9571mwv.h b/include/linux/mfd/bd9571mwv.h
index 0126b52..e9e219b 100644
--- a/include/linux/mfd/bd9571mwv.h
+++ b/include/linux/mfd/bd9571mwv.h
@@ -99,6 +99,86 @@ enum bd9571mwv_irqs {
 	BD9571MWV_IRQ_BKUP_TRG,
 };
 
+/* List of registers for BD9574MWF */
+#define BD9574MWF_VENDOR_CODE			0x00
+#define BD9574MWF_VENDOR_CODE_VAL		0xdb
+#define BD9574MWF_PRODUCT_CODE			0x01
+#define BD9574MWF_PRODUCT_CODE_VAL		0x74
+#define BD9574MWF_PRODUCT_REVISION		0x02
+
+#define BD9574MWF_I2C_FUSA_MODE			0x10
+#define BD9574MWF_I2C_MD2_E1_BIT_1		0x11
+#define BD9574MWF_I2C_MD2_E1_BIT_2		0x12
+
+#define BD9574MWF_BKUP_MODE_CNT			0x20
+#define BD9574MWF_BKUP_MODE_STATUS		0x21
+#define BD9574MWF_BKUP_RECOVERY_CNT		0x22
+#define BD9574MWF_BKUP_CTRL_TIM_CNT		0x23
+#define BD9574MWF_WAITBKUP_WDT_CNT		0x24
+#define BD9574MWF_BKUP_HOLD_TIM_CNT1		0x26
+#define BD9574MWF_QLLM_CNT			0x27
+#define BD9574MWF_BKUP_HOLD_TIM_CNT2		0x28
+
+#define BD9574MWF_DCDC_FREQ			0x48
+
+#define BD9574MWF_VDCORE_VINIT			0x50
+#define BD9574MWF_VD09_VINIT			0x51
+#define BD9574MWF_VDCORE_SETVMAX		0x52
+#define BD9574MWF_VDCORE_SETVID			0x54
+#define BD9574MWF_VDCORE_MONIVDAC		0x55
+#define BD9574MWF_VDCORE_PGD_CNT		0x56
+
+#define BD9574MWF_GPIO_DIR			0x60
+#define BD9574MWF_GPIO_OUT			0x61
+#define BD9574MWF_GPIO_IN			0x62
+#define BD9574MWF_GPIO_DEB			0x63
+#define BD9574MWF_GPIO_INT_SET			0x64
+#define BD9574MWF_GPIO_INT			0x65
+#define BD9574MWF_GPIO_INTMASK			0x66
+#define BD9574MWF_GPIO_MUX			0x67
+
+#define BD9574MWF_REG_KEEP(n)			(0x70 + (n))
+
+#define BD9574MWF_PMIC_INTERNAL_STATUS		0x80
+#define BD9574MWF_PROT_ERROR_STATUS0		0x81
+#define BD9574MWF_PROT_ERROR_STATUS1		0x82
+#define BD9574MWF_PROT_ERROR_STATUS2		0x83
+#define BD9574MWF_PROT_ERROR_STATUS3		0x84
+#define BD9574MWF_PROT_ERROR_STATUS4		0x85
+#define BD9574MWF_PROT_ERROR_STATUS5		0x86
+#define BD9574MWF_SYS_ERROR_STATUS		0x87
+
+#define BD9574MWF_INT_INTREQ			0x90
+#define BD9574MWF_INT_INTREQ_MD1_INT		BIT(0)
+#define BD9574MWF_INT_INTREQ_MD2_E1_INT		BIT(1)
+#define BD9574MWF_INT_INTREQ_MD2_E2_INT		BIT(2)
+#define BD9574MWF_INT_INTREQ_PROT_ERR_INT	BIT(3)
+#define BD9574MWF_INT_INTREQ_GP_INT		BIT(4)
+#define BD9574MWF_INT_INTREQ_BKUP_HOLD_OF_INT	BIT(5)
+#define BD9574MWF_INT_INTREQ_WDT_OF_INT		BIT(6)
+#define BD9574MWF_INT_INTREQ_BKUP_TRG_INT	BIT(7)
+#define BD9574MWF_INT_INTMASK			0x91
+
+#define BD9574MWF_SSCG_CNT			0xA0
+#define BD9574MWF_POFFB_MRB			0xA1
+#define BD9574MWF_SMRB_WR_PROT			0xA2
+#define BD9574MWF_SMRB_ASSERT			0xA3
+#define BD9574MWF_SMRB_STATUS			0xA4
+
+#define BD9574MWF_PART_NUMBER			"BD9574MWF"
+
+/* Define the BD9574MWF IRQ numbers */
+enum bd9574mwf_irqs {
+	BD9574MWF_IRQ_MD1,
+	BD9574MWF_IRQ_MD2_E1,
+	BD9574MWF_IRQ_MD2_E2,
+	BD9574MWF_IRQ_PROT_ERR,
+	BD9574MWF_IRQ_GP,
+	BD9574MWF_IRQ_BKUP_HOLD_OF,
+	BD9574MWF_IRQ_WDT_OF,
+	BD9574MWF_IRQ_BKUP_TRG,
+};
+
 /**
  * struct bd957x_data - internal data for the bd957x driver
  *
-- 
2.7.4

