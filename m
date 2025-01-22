Return-Path: <linux-renesas-soc+bounces-12330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FEA19007
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 11:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99D593A3E62
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 10:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449F6212B11;
	Wed, 22 Jan 2025 10:40:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF5221171F;
	Wed, 22 Jan 2025 10:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737542442; cv=none; b=vCEHTb9xiI/HkExhc9KhYCF32Mdw/Cwo6juymDAuVHR8joQHtw0ckgI3hT/RiNE9bSTdQdQJBdlST52CUFw/F4swmwCJ8yALbXJxOD8zORlUgixFd4yPjmmSFKHZA850AOMvC+4fTe0/8YMHJCyUCtCCigQsZxkKEL5RkaGbxQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737542442; c=relaxed/simple;
	bh=lMymBWpxiLkE0u2AskUo/QiExu/+RCZqw5191ouJq7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EugcG7KjHSGKGbG97AKNGDhk5lgTPNy52eVLa2f1Lv54jzgIdBihG1psspouZm5ovdwgigb5jocnSnHXauoJtDgdwVpAMqFcHbIJX+Kb7ArQh4AWB0xdZORfpNrkmcdhAfO90ZNVu6tElzT0jC1Bp0ANKjiDigb5qHpP07Sv2fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: JDVc6oeUT8Co5AK6ACTWPA==
X-CSE-MsgGUID: ezPnPT1MRyuvxv3MoexUug==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Jan 2025 19:40:39 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.193])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id AC0064007F45;
	Wed, 22 Jan 2025 19:40:16 +0900 (JST)
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
Subject: [PATCH v3 6/9] soc: renesas: rzv2h: Add a callback to print SoC-specific extra features
Date: Wed, 22 Jan 2025 11:39:08 +0100
Message-ID: <20250122103911.517484-7-john.madieu.xa@bp.renesas.com>
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

Some RZ/V2H SoC variants feature a Mali-G31 (GPU) and/or a Mali-C55 (ISP) IP(s).
Detect and inform about their presence during SoC identification. Also detect
PLL frequency and warn in case of mismatch.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 drivers/soc/renesas/r9a09g057-sys.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index dc7885b340c4..18a79e68bade 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -13,12 +13,41 @@
 #include "rz-sysc.h"
 #include "rzg3e-sys.h"
 
+/* RZ/V2H-specific feature bits */
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
 	.offset = SYS_LSI_DEVID,
 	.revision_mask = SYS_LSI_DEVID_REV,
 	.specific_id_mask = SYS_LSI_DEVID_SPECIFIC,
+	.print_id = rzv2h_sys_print_id,
 };
 
 const struct rz_sysc_init_data rzv2h_sys_init_data = {
-- 
2.25.1


