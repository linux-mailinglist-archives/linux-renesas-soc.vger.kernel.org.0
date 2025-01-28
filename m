Return-Path: <linux-renesas-soc+bounces-12611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD522A2034E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 04:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D510A1887B99
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 03:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F181B4248;
	Tue, 28 Jan 2025 03:14:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886911B042C;
	Tue, 28 Jan 2025 03:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738034068; cv=none; b=UOFojzIyft4TtwavesDx4DoteUuIUrMvpAfEDajhhAZgbsjZbBB3jCXiCUSWfgGkhbiw8fn1/haAHfnp49YTO4rcWhJ7ib2csjFcumOrNu8BbfgctpI+t0oVbWlfsIz3Tdy1v8W45CWksUHUxcco6q2ykEDF9L8KYQdcIMHRRX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738034068; c=relaxed/simple;
	bh=g4/VUMyM5IER38Ho0f5QojQXjPYQPPWwFWwbp9uh4Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0V/ahq16z/IYSH1WdTtWgxEDbHSuYmtsYJt+vyarBWTxeR19aqSWtOauUx8FpP9L6oknQ093JwhKQVRGsiwpNUSv92YLVaq2HMhFq08dnqS+maG+aCkaf5nXCJOC78Z9pniiV2I0V/3+81w6qmJqsKAeVHRwsGHGYToVGHdkCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: phzikNTjSsSw84ltEsrfCQ==
X-CSE-MsgGUID: bhhHG2t6QHqRUFeYpwK8+g==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jan 2025 12:14:26 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0BA91412D771;
	Tue, 28 Jan 2025 12:14:12 +0900 (JST)
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
Subject: [PATCH v5 5/5] soc: renesas: rzv2h: Add a callback to print SoC-specific extra features
Date: Tue, 28 Jan 2025 04:13:42 +0100
Message-ID: <20250128031342.52675-6-john.madieu.xa@bp.renesas.com>
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

Some RZ/V2H SoC variants feature a Mali-G31 (GPU) and/or a Mali-C55 (ISP)
IP(s). Detect and inform about their presence during SoC identification.
Also detect PLL frequency and warn in case of mismatch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
Changes:

v5: Use proper hex value to populate rzv2h_sys_soc_id_init_data and put as much
    variable as possible on the same line while printing messages
v4: No changes
v3: New patch

 drivers/soc/renesas/r9a09g057-sys.c | 41 +++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index fd92947a3174..378aa0030b6a 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -12,12 +12,53 @@
 
 #include "rz-sysc.h"
 
+/* Register Offsets */
+#define SYS_LSI_MODE		0x300
+/*
+ * BOOTPLLCA[1:0]
+ *	    [0,0] => 1.1GHZ
+ *	    [0,1] => 1.5GHZ
+ *	    [1,0] => 1.6GHZ
+ *	    [1,1] => 1.7GHZ
+ */
+#define SYS_LSI_MODE_STAT_BOOTPLLCA55	GENMASK(12, 11)
+#define SYS_LSI_MODE_CA55_1_7GHZ	0x3
+
+#define SYS_LSI_PRR		0x308
+#define SYS_LSI_PRR_GPU_DIS	BIT(0)
+#define SYS_LSI_PRR_ISP_DIS	BIT(4)
+
+static void rzv2h_sys_print_id(struct device *dev,
+				void __iomem *sysc_base,
+				struct soc_device_attribute *soc_dev_attr)
+{
+	bool gpu_enabled, isp_enabled;
+	u32 prr_val, mode_val;
+
+	prr_val = readl(sysc_base + SYS_LSI_PRR);
+	mode_val = readl(sysc_base + SYS_LSI_MODE);
+
+	/* Check GPU and ISP configuration */
+	gpu_enabled = !(prr_val & SYS_LSI_PRR_GPU_DIS);
+	isp_enabled = !(prr_val & SYS_LSI_PRR_ISP_DIS);
+
+	dev_info(dev, "Detected Renesas %s %s Rev %s%s%s\n",
+		 soc_dev_attr->family, soc_dev_attr->soc_id, soc_dev_attr->revision,
+		 gpu_enabled ? " with GE3D (Mali-G31)" : "",
+		 isp_enabled ? " with ISP (Mali-C55)" : "");
+
+	/* Check CA55 PLL configuration */
+	if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHZ)
+		dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n");
+}
+
 static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initconst = {
 	.family = "RZ/V2H",
 	.id = 0x847a447,
 	.devid_offset = 0x304,
 	.revision_mask = 0xf0000000,
 	.specific_id_mask = 0x0fffffff,
+	.print_id = rzv2h_sys_print_id,
 };
 
 const struct rz_sysc_init_data rzv2h_sys_init_data = {
-- 
2.25.1


