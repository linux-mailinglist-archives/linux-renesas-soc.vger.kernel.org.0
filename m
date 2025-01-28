Return-Path: <linux-renesas-soc+bounces-12610-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C98FA2034C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 04:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABDEB7A40F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 03:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480B21ACEC7;
	Tue, 28 Jan 2025 03:14:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A75B18B495;
	Tue, 28 Jan 2025 03:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738034065; cv=none; b=A4sOTrSt+W9XjUnw50dDS9H9DO9GxtrMoBlH3+6nsqVzUxjzQlCdRuVc4XENFRXUH5oIXRu5ETHvhSw5bm5ayASRVvvfTEjlddaa18/VaedJFay4g0B4gz8Ss748u7qjURLQyVNRtTZuhSLJInoL+/Ezme6cId5JcagntkctyvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738034065; c=relaxed/simple;
	bh=F96dZsynP9O2UoZ0kBtFmjbAdGkGQxY6VgxRKV9gfNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SfQ/5VA6D86ckAGYc4RxM25l4OfETHuiRIHcHNr53ldP7r+9C30p2nDtAoNhJ9gPEQsH3Z7TPq5edtoZbbG8yPNujQ/6WT+XoDkFQGofMneyUwPI0+YiFSGMZUZLoTZn0FFNLVpEitMWd8Ig3Dq/GTu+NRjkeed2XlaLyFkSLik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: lET9mbazR0mxyabcoSJK/Q==
X-CSE-MsgGUID: nKpmU1btRquTN4XvNk3TXw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jan 2025 12:14:20 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0596E412D601;
	Tue, 28 Jan 2025 12:14:07 +0900 (JST)
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
Subject: [PATCH v5 4/5] soc: renesas: rz-sysc: Move RZ/V2H SoC detection to the SYS driver
Date: Tue, 28 Jan 2025 04:13:41 +0100
Message-ID: <20250128031342.52675-5-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128031342.52675-1-john.madieu.xa@bp.renesas.com>
References: <20250128031342.52675-1-john.madieu.xa@bp.renesas.com>
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

v5: Do not use common included file with RZ/G3E and set proper hex values for
    register offset and mask definition
v3 -> v4: No changes
v3: New patch

 drivers/soc/renesas/Kconfig         |  5 +++++
 drivers/soc/renesas/Makefile        |  1 +
 drivers/soc/renesas/r9a09g057-sys.c | 25 +++++++++++++++++++++++++
 drivers/soc/renesas/renesas-soc.c   | 21 +--------------------
 drivers/soc/renesas/rz-sysc.c       |  3 +++
 drivers/soc/renesas/rz-sysc.h       |  1 +
 6 files changed, 36 insertions(+), 20 deletions(-)
 create mode 100644 drivers/soc/renesas/r9a09g057-sys.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index d3ba74b5fa11..49648cf28bd2 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -355,6 +355,7 @@ config ARCH_R9A09G047
 config ARCH_R9A09G057
 	bool "ARM64 Platform support for RZ/V2H(P)"
 	select RENESAS_RZV2H_ICU
+	select SYS_R9A09G057
 	help
 	  This enables support for the Renesas RZ/V2H(P) SoC variants.
 
@@ -396,4 +397,8 @@ config SYS_R9A09G047
 	bool "Renesas RZ/G3E System controller support" if COMPILE_TEST
 	select SYSC_RZ
 
+config SYS_R9A09G057
+	bool "Renesas RZ/V2H System controller support" if COMPILE_TEST
+	select SYSC_RZ
+
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
diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
new file mode 100644
index 000000000000..fd92947a3174
--- /dev/null
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -0,0 +1,25 @@
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
+
+static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initconst = {
+	.family = "RZ/V2H",
+	.id = 0x847a447,
+	.devid_offset = 0x304,
+	.revision_mask = 0xf0000000,
+	.specific_id_mask = 0x0fffffff,
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
index 9c94e764aef4..1c98da37b7d1 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -87,6 +87,9 @@ static const struct of_device_id rz_sysc_match[] = {
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
index 715c5f6037e4..34c6135435a4 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -41,5 +41,6 @@ struct rz_sysc_init_data {
 
 extern const struct rz_sysc_init_data rzg3e_sys_init_data;
 extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
+extern const struct rz_sysc_init_data rzv2h_sys_init_data;
 
 #endif /* __SOC_RENESAS_RZ_SYSC_H__ */
-- 
2.25.1


