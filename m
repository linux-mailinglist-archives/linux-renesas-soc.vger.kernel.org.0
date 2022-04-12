Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E92BE4FDB7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 12:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbiDLKEU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 06:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355071AbiDLIGz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 04:06:55 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B91824A927;
        Tue, 12 Apr 2022 00:37:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,253,1643641200"; 
   d="scan'208";a="116447079"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 12 Apr 2022 16:37:07 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 40DF5400F501;
        Tue, 12 Apr 2022 16:37:07 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     jejb@linux.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/7] scsi: ufs-renesas: Add support for Renesas R-Car UFS controller
Date:   Tue, 12 Apr 2022 16:36:44 +0900
Message-Id: <20220412073647.3808493-5-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412073647.3808493-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220412073647.3808493-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for Renesas R-Car UFS controller which needs vender specific
initialization.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/scsi/ufs/Kconfig       |  12 +
 drivers/scsi/ufs/Makefile      |   1 +
 drivers/scsi/ufs/ufs-renesas.c | 418 +++++++++++++++++++++++++++++++++
 3 files changed, 431 insertions(+)
 create mode 100644 drivers/scsi/ufs/ufs-renesas.c

diff --git a/drivers/scsi/ufs/Kconfig b/drivers/scsi/ufs/Kconfig
index 9fe27b01904e..7e7ec1b26537 100644
--- a/drivers/scsi/ufs/Kconfig
+++ b/drivers/scsi/ufs/Kconfig
@@ -136,6 +136,18 @@ config SCSI_UFS_HISI
 	  Select this if you have UFS controller on Hisilicon chipset.
 	  If unsure, say N.
 
+config SCSI_UFS_RENESAS
+	tristate "Renesas specific hooks to UFS controller platform driver"
+	depends on (ARCH_RENESAS || COMPILE_TEST) && SCSI_UFSHCD_PLATFORM
+	help
+	  This selects the Renesas specific additions to UFSHCD platform driver.
+	  UFS host on Renesas needs some vendor specific configuration before
+	  accessing the hardware.
+
+	  Select this if you have UFS controller on Renesas chipset.
+
+	  If unsure, say N.
+
 config SCSI_UFS_TI_J721E
 	tristate "TI glue layer for Cadence UFS Controller"
 	depends on OF && HAS_IOMEM && (ARCH_K3 || COMPILE_TEST)
diff --git a/drivers/scsi/ufs/Makefile b/drivers/scsi/ufs/Makefile
index 966048875b50..b7e4a739ea44 100644
--- a/drivers/scsi/ufs/Makefile
+++ b/drivers/scsi/ufs/Makefile
@@ -23,4 +23,5 @@ obj-$(CONFIG_SCSI_UFSHCD_PCI) += ufshcd-pci.o
 obj-$(CONFIG_SCSI_UFSHCD_PLATFORM) += ufshcd-pltfrm.o
 obj-$(CONFIG_SCSI_UFS_HISI) += ufs-hisi.o
 obj-$(CONFIG_SCSI_UFS_MEDIATEK) += ufs-mediatek.o
+obj-$(CONFIG_SCSI_UFS_RENESAS) += ufs-renesas.o
 obj-$(CONFIG_SCSI_UFS_TI_J721E) += ti-j721e-ufs.o
diff --git a/drivers/scsi/ufs/ufs-renesas.c b/drivers/scsi/ufs/ufs-renesas.c
new file mode 100644
index 000000000000..7e9c3dbd3c83
--- /dev/null
+++ b/drivers/scsi/ufs/ufs-renesas.c
@@ -0,0 +1,418 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Renesas UFS host controller driver
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+
+#include "ufshcd.h"
+#include "ufshcd-pltfrm.h"
+
+struct ufs_renesas_priv {
+	bool initialized;	/* The hardware needs initialization once */
+};
+
+enum {
+	SET_PHY_INDEX_LO = 0,
+	SET_PHY_INDEX_HI,
+	TIMER_INDEX,
+	MAX_INDEX
+};
+
+enum ufs_renesas_init_param_mode {
+	MODE_RESTORE,
+	MODE_SET,
+	MODE_SAVE,
+	MODE_POLL,
+	MODE_WAIT,
+	MODE_WRITE,
+};
+
+#define PARAM_RESTORE(_reg, _index) \
+		{ .mode = MODE_RESTORE, .reg = _reg, .index = _index }
+#define PARAM_SET(_index, _set) \
+		{ .mode = MODE_SET, .index = _index, .u.set = _set }
+#define PARAM_SAVE(_reg, _mask, _index) \
+		{ .mode = MODE_SAVE, .reg = _reg, .mask = (u32)(_mask), \
+		  .index = _index }
+#define PARAM_POLL(_reg, _expected, _mask) \
+		{ .mode = MODE_POLL, .reg = _reg, .u.expected = _expected, \
+		  .mask = (u32)(_mask) }
+#define PARAM_WAIT(_delay_us) \
+		{ .mode = MODE_WAIT, .u.delay_us = _delay_us }
+
+#define PARAM_WRITE(_reg, _val) \
+		{ .mode = MODE_WRITE, .reg = _reg, .u.val = _val }
+
+#define PARAM_WRITE_D0_D4(_d0, _d4) \
+		PARAM_WRITE(0xd0, _d0),	PARAM_WRITE(0xd4, _d4)
+
+#define PARAM_WRITE_800_80C_POLL(_addr, _data_800)		\
+		PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),	\
+		PARAM_WRITE_D0_D4(0x00000800, ((_data_800) << 16) | BIT(8) | (_addr)), \
+		PARAM_WRITE(0xd0, 0x0000080c),			\
+		PARAM_POLL(0xd4, BIT(8), BIT(8))
+
+#define PARAM_RESTORE_800_80C_POLL(_index)			\
+		PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),	\
+		PARAM_WRITE(0xd0, 0x00000800),			\
+		PARAM_RESTORE(0xd4, _index),			\
+		PARAM_WRITE(0xd0, 0x0000080c),			\
+		PARAM_POLL(0xd4, BIT(8), BIT(8))
+
+#define PARAM_WRITE_804_80C_POLL(_addr, _data_804)		\
+		PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),	\
+		PARAM_WRITE_D0_D4(0x00000804, ((_data_804) << 16) | BIT(8) | (_addr)), \
+		PARAM_WRITE(0xd0, 0x0000080c),			\
+		PARAM_POLL(0xd4, BIT(8), BIT(8))
+
+#define PARAM_WRITE_828_82C_POLL(_data_828)			\
+		PARAM_WRITE_D0_D4(0x0000082c, 0x0f000000),	\
+		PARAM_WRITE_D0_D4(0x00000828, _data_828),	\
+		PARAM_WRITE(0xd0, 0x0000082c),			\
+		PARAM_POLL(0xd4, _data_828, _data_828)
+
+#define PARAM_WRITE_PHY(_addr16, _data16)			\
+		PARAM_WRITE(0xf0, 1),				\
+		PARAM_WRITE_800_80C_POLL(0x16, (_addr16) & 0xff), \
+		PARAM_WRITE_800_80C_POLL(0x17, ((_addr16) >> 8) & 0xff), \
+		PARAM_WRITE_800_80C_POLL(0x18, (_data16) & 0xff), \
+		PARAM_WRITE_800_80C_POLL(0x19, ((_data16) >> 8) & 0xff), \
+		PARAM_WRITE_800_80C_POLL(0x1c, 0x01),		\
+		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
+		PARAM_WRITE(0xf0, 0)
+
+#define PARAM_SET_PHY(_addr16, _data16)				\
+		PARAM_WRITE(0xf0, 1),				\
+		PARAM_WRITE_800_80C_POLL(0x16, (_addr16) & 0xff), \
+		PARAM_WRITE_800_80C_POLL(0x17, ((_addr16) >> 8) & 0xff), \
+		PARAM_WRITE_800_80C_POLL(0x1c, 0x01),		\
+		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
+		PARAM_WRITE_804_80C_POLL(0x1a, 0),		\
+		PARAM_WRITE(0xd0, 0x00000808),			\
+		PARAM_SAVE(0xd4, 0xff, SET_PHY_INDEX_LO),	\
+		PARAM_WRITE_804_80C_POLL(0x1b, 0),		\
+		PARAM_WRITE(0xd0, 0x00000808),			\
+		PARAM_SAVE(0xd4, 0xff, SET_PHY_INDEX_HI),	\
+		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
+		PARAM_WRITE(0xf0, 0),				\
+		PARAM_WRITE(0xf0, 1),				\
+		PARAM_WRITE_800_80C_POLL(0x16, (_addr16) & 0xff), \
+		PARAM_WRITE_800_80C_POLL(0x17, ((_addr16) >> 8) & 0xff), \
+		PARAM_SET(SET_PHY_INDEX_LO, ((_data16 & 0xff) << 16) | BIT(8) | 0x18), \
+		PARAM_RESTORE_800_80C_POLL(SET_PHY_INDEX_LO),	\
+		PARAM_SET(SET_PHY_INDEX_HI, (((_data16 >> 8) & 0xff) << 16) | BIT(8) | 0x19), \
+		PARAM_RESTORE_800_80C_POLL(SET_PHY_INDEX_HI),	\
+		PARAM_WRITE_800_80C_POLL(0x1c, 0x01),		\
+		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
+		PARAM_WRITE(0xf0, 0)
+
+#define PARAM_INDIRECT_WRITE(_gpio, _addr, _data_800)		\
+		PARAM_WRITE(0xf0, _gpio),			\
+		PARAM_WRITE_800_80C_POLL(_addr, _data_800),	\
+		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
+		PARAM_WRITE(0xf0, 0)
+
+#define PARAM_INDIRECT_POLL(_gpio, _addr, _expected, _mask)	\
+		PARAM_WRITE(0xf0, _gpio),			\
+		PARAM_WRITE_800_80C_POLL(_addr, 0),		\
+		PARAM_WRITE(0xd0, 0x00000808),			\
+		PARAM_POLL(0xd4, _expected, _mask),		\
+		PARAM_WRITE(0xf0, 0)
+
+struct ufs_renesas_init_param {
+	enum ufs_renesas_init_param_mode mode;
+	u32 reg;
+	union {
+		u32 expected;
+		u32 delay_us;
+		u32 set;
+		u32 val;
+	} u;
+	u32 mask;
+	u32 index;
+};
+
+/* This setting is for SERIES B */
+static const struct ufs_renesas_init_param ufs_param[] = {
+	PARAM_WRITE(0xc0, 0x49425308),
+	PARAM_WRITE_D0_D4(0x00000104, 0x00000002),
+	PARAM_WAIT(1),
+	PARAM_WRITE_D0_D4(0x00000828, 0x00000200),
+	PARAM_WAIT(1),
+	PARAM_WRITE_D0_D4(0x00000828, 0x00000000),
+	PARAM_WRITE_D0_D4(0x00000104, 0x00000001),
+	PARAM_WRITE_D0_D4(0x00000940, 0x00000001),
+	PARAM_WAIT(1),
+	PARAM_WRITE_D0_D4(0x00000940, 0x00000000),
+
+	PARAM_WRITE(0xc0, 0x49425308),
+	PARAM_WRITE(0xc0, 0x41584901),
+
+	PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),
+	PARAM_WRITE_D0_D4(0x00000804, 0x00000000),
+	PARAM_WRITE(0xd0, 0x0000080c),
+	PARAM_POLL(0xd4, BIT(8), BIT(8)),
+
+	PARAM_WRITE(REG_CONTROLLER_ENABLE, 0x00000001),
+
+	PARAM_WRITE(0xd0, 0x00000804),
+	PARAM_POLL(0xd4, BIT(8) | BIT(6) | BIT(0), BIT(8) | BIT(6) | BIT(0)),
+
+	PARAM_WRITE(0xd0, 0x00000d00),
+	PARAM_SAVE(0xd4, 0x0000ffff, TIMER_INDEX),
+	PARAM_WRITE(0xd4, 0x00000000),
+	PARAM_WRITE_D0_D4(0x0000082c, 0x0f000000),
+	PARAM_WRITE_D0_D4(0x00000828, 0x08000000),
+	PARAM_WRITE(0xd0, 0x0000082c),
+	PARAM_POLL(0xd4, BIT(27), BIT(27)),
+	PARAM_WRITE(0xd0, 0x00000d2c),
+	PARAM_POLL(0xd4, BIT(0), BIT(0)),
+
+	/* phy setup */
+	PARAM_INDIRECT_WRITE(1, 0x01, 0x001f),
+	PARAM_INDIRECT_WRITE(7, 0x5d, 0x0014),
+	PARAM_INDIRECT_WRITE(7, 0x5e, 0x0014),
+	PARAM_INDIRECT_WRITE(7, 0x0d, 0x0003),
+	PARAM_INDIRECT_WRITE(7, 0x0e, 0x0007),
+	PARAM_INDIRECT_WRITE(7, 0x5f, 0x0003),
+	PARAM_INDIRECT_WRITE(7, 0x60, 0x0003),
+	PARAM_INDIRECT_WRITE(7, 0x5b, 0x00a6),
+	PARAM_INDIRECT_WRITE(7, 0x5c, 0x0003),
+
+	PARAM_INDIRECT_POLL(7, 0x3c, 0, BIT(7)),
+	PARAM_INDIRECT_POLL(7, 0x4c, 0, BIT(4)),
+
+	PARAM_INDIRECT_WRITE(1, 0x32, 0x0080),
+	PARAM_INDIRECT_WRITE(1, 0x1f, 0x0001),
+	PARAM_INDIRECT_WRITE(0, 0x2c, 0x0001),
+	PARAM_INDIRECT_WRITE(0, 0x32, 0x0087),
+
+	PARAM_INDIRECT_WRITE(1, 0x4d, 0x0061),
+	PARAM_INDIRECT_WRITE(4, 0x9b, 0x0009),
+	PARAM_INDIRECT_WRITE(4, 0xa6, 0x0005),
+	PARAM_INDIRECT_WRITE(4, 0xa5, 0x0058),
+	PARAM_INDIRECT_WRITE(1, 0x39, 0x0027),
+	PARAM_INDIRECT_WRITE(1, 0x47, 0x004c),
+
+	PARAM_INDIRECT_WRITE(7, 0x0d, 0x0002),
+	PARAM_INDIRECT_WRITE(7, 0x0e, 0x0007),
+
+	PARAM_WRITE_PHY(0x0028, 0x0061),
+	PARAM_WRITE_PHY(0x4014, 0x0061),
+	PARAM_SET_PHY(0x401c, BIT(2)),
+	PARAM_WRITE_PHY(0x4000, 0x0000),
+	PARAM_WRITE_PHY(0x4001, 0x0000),
+
+	PARAM_WRITE_PHY(0x10ae, 0x0001),
+	PARAM_WRITE_PHY(0x10ad, 0x0000),
+	PARAM_WRITE_PHY(0x10af, 0x0001),
+	PARAM_WRITE_PHY(0x10b6, 0x0001),
+	PARAM_WRITE_PHY(0x10ae, 0x0000),
+
+	PARAM_WRITE_PHY(0x10ae, 0x0001),
+	PARAM_WRITE_PHY(0x10ad, 0x0000),
+	PARAM_WRITE_PHY(0x10af, 0x0002),
+	PARAM_WRITE_PHY(0x10b6, 0x0001),
+	PARAM_WRITE_PHY(0x10ae, 0x0000),
+
+	PARAM_WRITE_PHY(0x10ae, 0x0001),
+	PARAM_WRITE_PHY(0x10ad, 0x0080),
+	PARAM_WRITE_PHY(0x10af, 0x0000),
+	PARAM_WRITE_PHY(0x10b6, 0x0001),
+	PARAM_WRITE_PHY(0x10ae, 0x0000),
+
+	PARAM_WRITE_PHY(0x10ae, 0x0001),
+	PARAM_WRITE_PHY(0x10ad, 0x0080),
+	PARAM_WRITE_PHY(0x10af, 0x001a),
+	PARAM_WRITE_PHY(0x10b6, 0x0001),
+	PARAM_WRITE_PHY(0x10ae, 0x0000),
+
+	PARAM_INDIRECT_WRITE(7, 0x70, 0x0016),
+	PARAM_INDIRECT_WRITE(7, 0x71, 0x0016),
+	PARAM_INDIRECT_WRITE(7, 0x72, 0x0014),
+	PARAM_INDIRECT_WRITE(7, 0x73, 0x0014),
+	PARAM_INDIRECT_WRITE(7, 0x74, 0x0000),
+	PARAM_INDIRECT_WRITE(7, 0x75, 0x0000),
+	PARAM_INDIRECT_WRITE(7, 0x76, 0x0010),
+	PARAM_INDIRECT_WRITE(7, 0x77, 0x0010),
+	PARAM_INDIRECT_WRITE(7, 0x78, 0x00ff),
+	PARAM_INDIRECT_WRITE(7, 0x79, 0x0000),
+
+	PARAM_INDIRECT_WRITE(7, 0x19, 0x0007),
+
+	PARAM_INDIRECT_WRITE(7, 0x1a, 0x0007),
+
+	PARAM_INDIRECT_WRITE(7, 0x24, 0x000c),
+
+	PARAM_INDIRECT_WRITE(7, 0x25, 0x000c),
+
+	PARAM_INDIRECT_WRITE(7, 0x62, 0x0000),
+	PARAM_INDIRECT_WRITE(7, 0x63, 0x0000),
+	PARAM_INDIRECT_WRITE(7, 0x5d, 0x0014),
+	PARAM_INDIRECT_WRITE(7, 0x5e, 0x0017),
+	PARAM_INDIRECT_WRITE(7, 0x5d, 0x0004),
+	PARAM_INDIRECT_WRITE(7, 0x5e, 0x0017),
+	PARAM_INDIRECT_POLL(7, 0x55, 0, BIT(6)),
+	PARAM_INDIRECT_POLL(7, 0x41, 0, BIT(7)),
+	/* end of phy setup */
+
+	PARAM_WRITE(0xf0, 0),
+	PARAM_WRITE(0xd0, 0x00000d00),
+	PARAM_RESTORE(0xd4, TIMER_INDEX),
+};
+
+static void ufs_renesas_dbg_register_dump(struct ufs_hba *hba)
+{
+	ufshcd_dump_regs(hba, 0xc0, 0x40, "regs: 0xc0 + ");
+}
+
+static void ufs_renesas_reg_control(struct ufs_hba *hba,
+				    const struct ufs_renesas_init_param *p)
+{
+	static u32 save[MAX_INDEX];
+	int ret;
+	u32 val;
+
+	pr_debug("%s: %d %04x %08x, %08x, %d\n", __func__, p->mode, p->reg,
+		 p->u.val, p->mask, p->index);
+
+	BUG_ON(p->index >= MAX_INDEX);
+
+	switch (p->mode) {
+	case MODE_RESTORE:
+		ufshcd_writel(hba, save[p->index], p->reg);
+		break;
+	case MODE_SET:
+		pr_debug("%s: %d %x %x\n", __func__, p->index, save[p->index],
+			 p->u.set);
+		save[p->index] |= p->u.set;
+		break;
+	case MODE_SAVE:
+		save[p->index] = ufshcd_readl(hba, p->reg) & p->mask;
+		pr_debug("%s: index = %d, val = %08x\n", __func__,
+			 p->index, val);
+		break;
+	case MODE_POLL:
+		ret = readl_poll_timeout_atomic(hba->mmio_base + p->reg,
+						val,
+						(val & p->mask) == p->u.expected,
+						10, 1000);
+		if (ret)
+			pr_err("%s: poll failed %d (%08x, %08x, %08x)\n",
+			       __func__, ret, val, p->mask, p->u.expected);
+		break;
+	case MODE_WAIT:
+		if (p->u.delay_us > 1000)
+			mdelay(p->u.delay_us / 1000);
+		else
+			udelay(p->u.delay_us);
+		break;
+	case MODE_WRITE:
+		ufshcd_writel(hba, p->u.val, p->reg);
+		break;
+	default:
+		break;
+	}
+}
+
+static void ufs_renesas_pre_init(struct ufs_hba *hba)
+{
+	const struct ufs_renesas_init_param *p = ufs_param;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ufs_param); i++)
+		ufs_renesas_reg_control(hba, &p[i]);
+}
+
+static int ufs_renesas_hce_enable_notify(struct ufs_hba *hba,
+					 enum ufs_notify_change_status status)
+{
+	struct ufs_renesas_priv *priv = ufshcd_get_variant(hba);
+
+	if (priv->initialized)
+		return 0;
+
+	if (status == PRE_CHANGE)
+		ufs_renesas_pre_init(hba);
+
+	priv->initialized = true;
+
+	return 0;
+}
+
+static int ufs_renesas_setup_clocks(struct ufs_hba *hba, bool on,
+				    enum ufs_notify_change_status status)
+{
+	if (on && status == PRE_CHANGE)
+		pm_runtime_get_sync(hba->dev);
+	else if (!on && status == POST_CHANGE)
+		pm_runtime_put(hba->dev);
+
+	return 0;
+}
+
+static int ufs_renesas_init(struct ufs_hba *hba)
+{
+	struct ufs_renesas_priv *priv;
+
+	priv = devm_kmalloc(hba->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	ufshcd_set_variant(hba, priv);
+
+	hba->quirks |= UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS | UFSHCD_QUIRK_HIBERN_FASTAUTO;
+
+	return 0;
+}
+
+static const struct ufs_hba_variant_ops ufs_renesas_vops = {
+	.name		= "renesas",
+	.init		= ufs_renesas_init,
+	.setup_clocks	= ufs_renesas_setup_clocks,
+	.hce_enable_notify = ufs_renesas_hce_enable_notify,
+	.dbg_register_dump = ufs_renesas_dbg_register_dump,
+};
+
+static const struct of_device_id ufs_renesas_of_match[] = {
+	{ .compatible = "renesas,r8a779f0-ufs" },
+};
+MODULE_DEVICE_TABLE(of, ufs_renesas_of_match);
+
+static int ufs_renesas_probe(struct platform_device *pdev)
+{
+	return ufshcd_pltfrm_init(pdev, &ufs_renesas_vops);
+}
+
+static int ufs_renesas_remove(struct platform_device *pdev)
+{
+	struct ufs_hba *hba = platform_get_drvdata(pdev);
+
+	ufshcd_remove(hba);
+
+	return 0;
+}
+
+static struct platform_driver ufs_renesas_platform = {
+	.probe	= ufs_renesas_probe,
+	.remove	= ufs_renesas_remove,
+	.driver	= {
+		.name	= "ufshcd-renesas",
+		.of_match_table	= of_match_ptr(ufs_renesas_of_match),
+	},
+};
+module_platform_driver(ufs_renesas_platform);
+
+MODULE_AUTHOR("Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>");
+MODULE_DESCRIPTION("Renesas UFS host controller driver");
+MODULE_LICENSE("Dual MIT/GPL");
-- 
2.25.1

