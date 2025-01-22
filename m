Return-Path: <linux-renesas-soc+bounces-12327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A18AA18FF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 11:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 814701638D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 10:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18560211A18;
	Wed, 22 Jan 2025 10:40:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1F72116E8;
	Wed, 22 Jan 2025 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737542413; cv=none; b=ojr/Gpwv8UIIt7C/HzaW2/ByCeJEyKqYX0ZML5oolqEGU6In0ZHzIbySNPfqGAv8EXfng2IYfTsk3CkXpngonodzasV9uqXh3IkaVhbJaZMVzc/AZh1DRrIT1VLJr/TORT8ACNMfkIPF5/fJ2Bp/XCmWQ+mla9cBkjFSrwUOu9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737542413; c=relaxed/simple;
	bh=OToF6orM4/HCnEz/PdwoXHcLm5sD/MLg2j6FsO1aFTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqP/4xvsJE3uveneqjxgZgdC0jSpJqmHNQggJ8i8aNFULegHdm3dHupmld3BcFv9d3GUkjI03ZG4oqrEzFSaWP3G6reW+PhBPuhn3gnZkwO8AsgAVIoeOvLvTxg8koBxv7sh2imlYOVN8vd3+ROltB6T0EOUEaUNngYK3acv/7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 8TdJl0tDR4CVoUYeNcdj+A==
X-CSE-MsgGUID: R6jxYWAyQ22WDBzWBJE9fQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Jan 2025 19:40:05 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.193])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 88E9840065B9;
	Wed, 22 Jan 2025 19:40:00 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	robh@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	john.madieu@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	magnus.damm@gmail.com,
	john.madieu.xa@bp.renesas.com
Subject: [PATCH v3 3/9] soc: renesas: rz-sysc: Move RZ/G3S SoC detection to the SYSC driver
Date: Wed, 22 Jan 2025 11:39:05 +0100
Message-ID: <20250122103911.517484-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250122103911.517484-1-john.madieu.xa@bp.renesas.com>
References: <20250122103911.517484-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Now that we have SoC detection in the RZ SYSC driver, move the RZ/G3S
SoC detection to it. The SYSC provides SoC ID in its own registers.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig          |  5 +++++
 drivers/soc/renesas/Makefile         |  1 +
 drivers/soc/renesas/r9a08g045-sysc.c | 28 ++++++++++++++++++++++++++++
 drivers/soc/renesas/renesas-soc.c    | 12 ------------
 drivers/soc/renesas/rz-sysc.c        |  3 +++
 drivers/soc/renesas/rz-sysc.h        |  2 ++
 6 files changed, 39 insertions(+), 12 deletions(-)
 create mode 100644 drivers/soc/renesas/r9a08g045-sysc.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 937ab43fae6a..a792a3e915fe 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -334,6 +334,7 @@ config ARCH_R9A07G054
 config ARCH_R9A08G045
 	bool "ARM64 Platform support for RZ/G3S"
 	select ARCH_RZG2L
+	select SYSC_R9A08G045
 	help
 	  This enables support for the Renesas RZ/G3S SoC variants.
 
@@ -386,4 +387,8 @@ config RST_RCAR
 config SYSC_RZ
 	bool "System controller for RZ SoCs" if COMPILE_TEST
 
+config SYSC_R9A08G045
+	bool "Renesas RZ/G3S System controller support" if COMPILE_TEST
+	select SYSC_RZ
+
 endif # SOC_RENESAS
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 3d5f847ed889..8cd139b3dd0a 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_SOC_RENESAS)	+= renesas-soc.o
 ifdef CONFIG_SMP
 obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
 endif
+obj-$(CONFIG_SYSC_R9A08G045)	+= r9a08g045-sysc.o
 
 # Family
 obj-$(CONFIG_PWC_RZV2M)		+= pwc-rzv2m.o
diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
new file mode 100644
index 000000000000..babcf1cbcb49
--- /dev/null
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G3S System controller driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include <linux/bits.h>
+#include <linux/init.h>
+
+#include "rz-sysc.h"
+
+#define SYS_LSI_DEVID		0xa04
+#define SYS_LSI_DEVID_REV	GENMASK(31, 28)
+#define SYS_LSI_DEVID_SPECIFIC	GENMASK(27, 0)
+#define SYS_MAX_REG		0xe20
+
+static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initconst = {
+	.family = "RZ/G3S",
+	.id = 0x85e0447,
+	.offset = SYS_LSI_DEVID,
+	.revision_mask = SYS_LSI_DEVID_REV,
+	.specific_id_mask = SYS_LSI_DEVID_SPECIFIC
+};
+
+const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
+	.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
+};
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 172d59e6fbcf..425d9037dcd0 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -71,10 +71,6 @@ static const struct renesas_family fam_rzg2ul __initconst __maybe_unused = {
 	.name	= "RZ/G2UL",
 };
 
-static const struct renesas_family fam_rzg3s __initconst __maybe_unused = {
-	.name	= "RZ/G3S",
-};
-
 static const struct renesas_family fam_rzv2h __initconst __maybe_unused = {
 	.name	= "RZ/V2H",
 };
@@ -176,11 +172,6 @@ static const struct renesas_soc soc_rz_g2ul __initconst __maybe_unused = {
 	.id     = 0x8450447,
 };
 
-static const struct renesas_soc soc_rz_g3s __initconst __maybe_unused = {
-	.family = &fam_rzg3s,
-	.id	= 0x85e0447,
-};
-
 static const struct renesas_soc soc_rz_v2h __initconst __maybe_unused = {
 	.family = &fam_rzv2h,
 	.id     = 0x847a447,
@@ -410,9 +401,6 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
 #ifdef CONFIG_ARCH_R9A07G054
 	{ .compatible = "renesas,r9a07g054",	.data = &soc_rz_v2l },
 #endif
-#ifdef CONFIG_ARCH_R9A08G045
-	{ .compatible = "renesas,r9a08g045",	.data = &soc_rz_g3s },
-#endif
 #ifdef CONFIG_ARCH_R9A09G011
 	{ .compatible = "renesas,r9a09g011",	.data = &soc_rz_v2m },
 #endif
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index 64fc56229440..c0d4aca4c2b6 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -74,6 +74,9 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
 }
 
 static const struct of_device_id rz_sysc_match[] = {
+#ifdef CONFIG_SYSC_R9A08G045
+	{ .compatible = "renesas,r9a08g045-sysc", .data = &rzg3s_sysc_init_data },
+#endif
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rz_sysc_match);
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index d74047686988..1ee25c78ba8b 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -34,4 +34,6 @@ struct rz_sysc_init_data {
 	const struct rz_sysc_soc_id_init_data *soc_id_init_data;
 };
 
+extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
+
 #endif /* __SOC_RENESAS_RZ_SYSC_H__ */
-- 
2.25.1


