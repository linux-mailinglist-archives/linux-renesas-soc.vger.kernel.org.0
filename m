Return-Path: <linux-renesas-soc+bounces-12426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6219A1A881
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 18:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 587303A5774
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 17:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284A021517B;
	Thu, 23 Jan 2025 17:06:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D584B1474C9;
	Thu, 23 Jan 2025 17:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651960; cv=none; b=CY490q7b1a6HO6lcEIHYFpuRCaRfghhewdIXybbyYmUdLAoIeStZTiuhmc2K88iyQqCLaetFulnhVu2reM1+SXQ9mKeZMF5iJTL086t3/6PY9UDe+r9Ne0/P5uXyaocnzaYwEnfzsTRceLSOGQFqeoM1eiSBU2fGTiSLbN7yO14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651960; c=relaxed/simple;
	bh=JsNzwm/ro5/h0lOy/n8sqJjgoFlZ8roQsuJO0Z1YNME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kZwEzAsRq8pdZIVW7a116MDSbSQRozFMUlpjagMJppSrtAMh3R1ujBMlJ7NOjOQBR8Bf5WhkNNK1SFPvR095aT11lnraGYRyp/+hrwtT44xuY3pKm1WbQjFvYxQevMf+eq8E8/0xEv9fRe+fMdpMsUt2qBXXL4EewMqJb7wOmn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: HymK3jQ8RM2A/O70CC/RNg==
X-CSE-MsgGUID: ZJFPcoA2RQyxu2vubh3Y0Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jan 2025 02:05:57 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.50])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E82E0402B11B;
	Fri, 24 Jan 2025 02:05:40 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com
Subject: [PATCH v4 5/9] soc: renesas: rz-sysc: Move RZ/V2H SoC detection to the SYS driver
Date: Thu, 23 Jan 2025 18:05:04 +0100
Message-ID: <20250123170508.13578-6-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com>
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the other SoC variant of the same family, the system controller
provides SoC ID in its own registers.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
Changes:

v3 -> v4: No changes
v3: New patch 

 drivers/soc/renesas/Kconfig         |  5 +++++
 drivers/soc/renesas/Makefile        |  1 +
 drivers/soc/renesas/r9a09g047-sys.c | 22 ++++------------------
 drivers/soc/renesas/r9a09g057-sys.c | 26 ++++++++++++++++++++++++++
 drivers/soc/renesas/renesas-soc.c   | 21 +--------------------
 drivers/soc/renesas/rz-sysc.c       |  3 +++
 drivers/soc/renesas/rz-sysc.h       |  1 +
 drivers/soc/renesas/rzg3e-sys.h     | 28 ++++++++++++++++++++++++++++
 8 files changed, 69 insertions(+), 38 deletions(-)
 create mode 100644 drivers/soc/renesas/r9a09g057-sys.c
 create mode 100644 drivers/soc/renesas/rzg3e-sys.h

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 173d4f60d17a..9f7650e15603 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -355,6 +355,7 @@ config ARCH_R9A09G047
 config ARCH_R9A09G057
 	bool "ARM64 Platform support for RZ/V2H(P)"
 	select RENESAS_RZV2H_ICU
+	select SYS_R9A09G057
 	help
 	  This enables support for the Renesas RZ/V2H(P) SoC variants.
 
@@ -395,4 +396,8 @@ config SYSC_R9A08G045
 config SYS_R9A09G047
 	bool "Renesas RZ/G3E System controller support" if COMPILE_TEST
 	select SYSC_RZ
+
+config SYS_R9A09G057
+	bool "Renesas RZ/V2H System controller support" if COMPILE_TEST
+	select SYSC_RZ
 endif # SOC_RENESAS
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 17b86d3ae478..81d4c5726e4c 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
 endif
 obj-$(CONFIG_SYSC_R9A08G045)	+= r9a08g045-sysc.o
 obj-$(CONFIG_SYS_R9A09G047)	+= r9a09g047-sys.o
+obj-$(CONFIG_SYS_R9A09G057)	+= r9a09g057-sys.o
 
 # Family
 obj-$(CONFIG_PWC_RZV2M)		+= pwc-rzv2m.o
diff --git a/drivers/soc/renesas/r9a09g047-sys.c b/drivers/soc/renesas/r9a09g047-sys.c
index db5406eb9e05..860374cbd2ee 100644
--- a/drivers/soc/renesas/r9a09g047-sys.c
+++ b/drivers/soc/renesas/r9a09g047-sys.c
@@ -11,25 +11,11 @@
 #include <linux/io.h>
 
 #include "rz-sysc.h"
+#include "rzg3e-sys.h"
 
-/* Register Offsets */
-#define SYS_LSI_MODE		0x300
-/*
- * BOOTPLLCA[1:0]
- *	    [0,0] => 1.1GHZ
- *	    [0,1] => 1.5GHZ
- *	    [1,0] => 1.6GHZ
- *	    [1,1] => 1.7GHZ
- */
-#define SYS_LSI_MODE_STAT_BOOTPLLCA55	GENMASK(12, 11)
-#define SYS_LSI_MODE_CA55_1_7GHZ	0x3
-#define SYS_LSI_DEVID		0x304
-#define SYS_LSI_DEVID_REV	GENMASK(31, 28)
-#define SYS_LSI_DEVID_SPECIFIC	GENMASK(27, 0)
-#define SYS_LSI_PRR			0x308
-#define SYS_LSI_PRR_CA55_DIS		BIT(8)
-#define SYS_LSI_PRR_NPU_DIS		BIT(1)
-
+/* RZ/G3E-specific feature bits */
+#define SYS_LSI_PRR_CA55_DIS    BIT(8)
+#define SYS_LSI_PRR_NPU_DIS     BIT(1)
 
 static void rzg3e_sys_print_id(struct device *dev,
 				void __iomem *sysc_base,
diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
new file mode 100644
index 000000000000..dc7885b340c4
--- /dev/null
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/V2H System controller (SYS) driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/io.h>
+
+#include "rz-sysc.h"
+#include "rzg3e-sys.h"
+
+static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initconst = {
+	.family = "RZ/V2H",
+	.id = 0x847a447,
+	.offset = SYS_LSI_DEVID,
+	.revision_mask = SYS_LSI_DEVID_REV,
+	.specific_id_mask = SYS_LSI_DEVID_SPECIFIC,
+};
+
+const struct rz_sysc_init_data rzv2h_sys_init_data = {
+	.soc_id_init_data = &rzv2h_sys_soc_id_init_data,
+};
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 425d9037dcd0..df2b38417b80 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -71,10 +71,6 @@ static const struct renesas_family fam_rzg2ul __initconst __maybe_unused = {
 	.name	= "RZ/G2UL",
 };
 
-static const struct renesas_family fam_rzv2h __initconst __maybe_unused = {
-	.name	= "RZ/V2H",
-};
-
 static const struct renesas_family fam_rzv2l __initconst __maybe_unused = {
 	.name	= "RZ/V2L",
 };
@@ -172,11 +168,6 @@ static const struct renesas_soc soc_rz_g2ul __initconst __maybe_unused = {
 	.id     = 0x8450447,
 };
 
-static const struct renesas_soc soc_rz_v2h __initconst __maybe_unused = {
-	.family = &fam_rzv2h,
-	.id     = 0x847a447,
-};
-
 static const struct renesas_soc soc_rz_v2l __initconst __maybe_unused = {
 	.family = &fam_rzv2l,
 	.id     = 0x8447447,
@@ -280,7 +271,6 @@ static const struct renesas_soc soc_shmobile_ag5 __initconst __maybe_unused = {
 	.id	= 0x37,
 };
 
-
 static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
 #ifdef CONFIG_ARCH_R7S72100
 	{ .compatible = "renesas,r7s72100",	.data = &soc_rz_a1h },
@@ -404,9 +394,6 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
 #ifdef CONFIG_ARCH_R9A09G011
 	{ .compatible = "renesas,r9a09g011",	.data = &soc_rz_v2m },
 #endif
-#ifdef CONFIG_ARCH_R9A09G057
-	{ .compatible = "renesas,r9a09g057",	.data = &soc_rz_v2h },
-#endif
 #ifdef CONFIG_ARCH_SH73A0
 	{ .compatible = "renesas,sh73a0",	.data = &soc_shmobile_ag5 },
 #endif
@@ -432,11 +419,6 @@ static const struct renesas_id id_rzg2l __initconst = {
 	.mask = 0xfffffff,
 };
 
-static const struct renesas_id id_rzv2h __initconst = {
-	.offset = 0x304,
-	.mask = 0xfffffff,
-};
-
 static const struct renesas_id id_rzv2m __initconst = {
 	.offset = 0x104,
 	.mask = 0xff,
@@ -454,7 +436,6 @@ static const struct of_device_id renesas_ids[] __initconst = {
 	{ .compatible = "renesas,r9a07g054-sysc",	.data = &id_rzg2l },
 	{ .compatible = "renesas,r9a08g045-sysc",	.data = &id_rzg2l },
 	{ .compatible = "renesas,r9a09g011-sys",	.data = &id_rzv2m },
-	{ .compatible = "renesas,r9a09g057-sys",	.data = &id_rzv2h },
 	{ .compatible = "renesas,prr",			.data = &id_prr },
 	{ /* sentinel */ }
 };
@@ -519,7 +500,7 @@ static int __init renesas_soc_init(void)
 			eslo = product & 0xf;
 			soc_dev_attr->revision = kasprintf(GFP_KERNEL, "ES%u.%u",
 							   eshi, eslo);
-		}  else if (id == &id_rzg2l || id == &id_rzv2h) {
+		}  else if (id == &id_rzg2l) {
 			eshi =  ((product >> 28) & 0x0f);
 			soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%u",
 							   eshi);
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index cedc2ca51979..874ab6cf36cb 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -84,6 +84,9 @@ static const struct of_device_id rz_sysc_match[] = {
 #endif
 #ifdef CONFIG_SYS_R9A09G047
 	{ .compatible = "renesas,r9a09g047-sys", .data = &rzg3e_sys_init_data },
+#endif
+#ifdef CONFIG_SYS_R9A09G057
+	{ .compatible = "renesas,r9a09g057-sys", .data = &rzv2h_sys_init_data },
 #endif
 	{ }
 };
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index 3f628eb15677..c87fd6ee23f2 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -41,5 +41,6 @@ struct rz_sysc_init_data {
 
 extern const struct rz_sysc_init_data rzg3e_sys_init_data;
 extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
+extern const struct rz_sysc_init_data rzv2h_sys_init_data;
 
 #endif /* __SOC_RENESAS_RZ_SYSC_H__ */
diff --git a/drivers/soc/renesas/rzg3e-sys.h b/drivers/soc/renesas/rzg3e-sys.h
new file mode 100644
index 000000000000..2e492a85baa6
--- /dev/null
+++ b/drivers/soc/renesas/rzg3e-sys.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Renesas RZ/G3E (SYS) System Controller
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#ifndef __RZG3E_SYS_H__
+#define __RZG3E_SYS_H__
+
+/* SYS Common Register Offsets */
+
+#define SYS_LSI_MODE	0x300
+/*
+ * BOOTPLLCA[1:0]
+ *	    [0,0] => 1.1GHZ
+ *	    [0,1] => 1.5GHZ
+ *	    [1,0] => 1.6GHZ
+ *	    [1,1] => 1.7GHZ
+ */
+#define SYS_LSI_MODE_STAT_BOOTPLLCA55	GENMASK(12, 11)
+#define SYS_LSI_MODE_CA55_1_7GHZ	0x3
+#define SYS_LSI_DEVID	0x304
+#define SYS_LSI_DEVID_REV	GENMASK(31, 28)
+#define SYS_LSI_DEVID_SPECIFIC	GENMASK(27, 0)
+#define SYS_LSI_PRR	0x308
+
+#endif /* __RZG3E_SYSC_H__ */
-- 
2.25.1


