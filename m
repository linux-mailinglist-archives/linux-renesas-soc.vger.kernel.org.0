Return-Path: <linux-renesas-soc+bounces-13423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3C0A3DE97
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 16:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEE043AD7DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 15:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731A91FF5FE;
	Thu, 20 Feb 2025 15:27:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAAAC1FECC1;
	Thu, 20 Feb 2025 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065266; cv=none; b=Q9dXloGMSBaLS4ABq80VRV5IsUQ+reaYQNAmROhloLGW9HRpxZd9F30LDq8XFgJScv1NPbSrm/u7acDLOFATm0o0shKF3IJB9WK3Q27gOhlJBBlimPSxdmCPKA4rtt7N+mUrEzAKGKempiiabuQJOyvcpvwpgp8SkXKqR+1H1c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065266; c=relaxed/simple;
	bh=SHlChQiznyOyaiXivocQyLCrL1hGRXdORENCrVo8+W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCAfMVFRZWQmYJse7Ftpnsp8HCYkywoNxWTj1Vb8mMTHhNHQSGiGsQkJuh85S1asLiujvzUraZc7L9N9OFvzsleAv21twgUbiG8iOZUh/wSoWiDC9HoICp2NUlwqy+168B6mOVb41r+AfP+26+7X51jOOACOhAl9xgVPPELqaOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Vtl4VarQRXCOXvQgX1p8fQ==
X-CSE-MsgGUID: pBWOkeKqSpOsCaOkL+YiHQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Feb 2025 00:27:43 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.134])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id BDFC840436EB;
	Fri, 21 Feb 2025 00:27:37 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: mturquette@baylibre.com,
	magnus.damm@gmail.com,
	krzk+dt@kernel.org,
	rui.zhang@intel.com,
	daniel.lezcano@linaro.org,
	sboyd@kernel.org,
	geert+renesas@glider.be,
	lukasz.luba@arm.com,
	rafael@kernel.org,
	robh@kernel.org,
	p.zabel@pengutronix.de
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH 1/7] soc: renesas: rz-sysc: add syscon/regmap support
Date: Thu, 20 Feb 2025 16:26:06 +0100
Message-ID: <20250220152640.49010-2-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
References: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RZ/G3E system controller has various registers that control or report
some properties specific to individual IPs. The regmap is registered as a
syscon device to allow these IP drivers to access the registers through the
regmap API.

As other RZ SoCs might have custom read/write callbacks or max-offsets, let's
register a custom regmap configuration.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig         |  1 +
 drivers/soc/renesas/r9a09g047-sys.c |  1 +
 drivers/soc/renesas/rz-sysc.c       | 30 ++++++++++++++++++++++++++++-
 drivers/soc/renesas/rz-sysc.h       |  2 ++
 4 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 49648cf28bd2..3ffd3a4ca18d 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -388,6 +388,7 @@ config RST_RCAR
 
 config SYSC_RZ
 	bool "System controller for RZ SoCs" if COMPILE_TEST
+	select MFD_SYSCON
 
 config SYSC_R9A08G045
 	bool "Renesas RZ/G3S System controller support" if COMPILE_TEST
diff --git a/drivers/soc/renesas/r9a09g047-sys.c b/drivers/soc/renesas/r9a09g047-sys.c
index cd2eb7782cfe..5b010a519fab 100644
--- a/drivers/soc/renesas/r9a09g047-sys.c
+++ b/drivers/soc/renesas/r9a09g047-sys.c
@@ -64,4 +64,5 @@ static const struct rz_sysc_soc_id_init_data rzg3e_sys_soc_id_init_data __initco
 
 const struct rz_sysc_init_data rzg3e_sys_init_data = {
 	.soc_id_init_data = &rzg3e_sys_soc_id_init_data,
+	.max_register_offset = 0x170c,
 };
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index 1c98da37b7d1..bcbc23da954b 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -6,8 +6,10 @@
  */
 
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/sys_soc.h>
 
 #include "rz-sysc.h"
@@ -81,6 +83,14 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
 	return 0;
 }
 
+static struct regmap_config rz_sysc_regmap = {
+	.name = "rz_sysc_regs",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+};
+
 static const struct of_device_id rz_sysc_match[] = {
 #ifdef CONFIG_SYSC_R9A08G045
 	{ .compatible = "renesas,r9a08g045-sysc", .data = &rzg3s_sysc_init_data },
@@ -97,14 +107,21 @@ MODULE_DEVICE_TABLE(of, rz_sysc_match);
 
 static int rz_sysc_probe(struct platform_device *pdev)
 {
+	const struct rz_sysc_init_data *data;
 	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
 	struct rz_sysc *sysc;
+	int ret;
 
 	match = of_match_node(rz_sysc_match, dev->of_node);
 	if (!match)
 		return -ENODEV;
 
+	data = match->data;
+	if (!data)
+		return -EINVAL;
+
 	sysc = devm_kzalloc(dev, sizeof(*sysc), GFP_KERNEL);
 	if (!sysc)
 		return -ENOMEM;
@@ -114,7 +131,18 @@ static int rz_sysc_probe(struct platform_device *pdev)
 		return PTR_ERR(sysc->base);
 
 	sysc->dev = dev;
-	return rz_sysc_soc_init(sysc, match);
+	ret = rz_sysc_soc_init(sysc, match);
+
+	if (data->max_register_offset) {
+		rz_sysc_regmap.max_register = data->max_register_offset;
+		regmap = devm_regmap_init_mmio(dev, sysc->base, &rz_sysc_regmap);
+		if (IS_ERR(regmap))
+			return PTR_ERR(regmap);
+
+		ret = of_syscon_register_regmap(dev->of_node, regmap);
+	}
+
+	return ret;
 }
 
 static struct platform_driver rz_sysc_driver = {
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index aa83948c5117..37a3bb2c87f8 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -34,9 +34,11 @@ struct rz_sysc_soc_id_init_data {
 /**
  * struct rz_sysc_init_data - RZ SYSC initialization data
  * @soc_id_init_data: RZ SYSC SoC ID initialization data
+ * @max_register_offset: Maximum SYSC register offset to be used by the regmap config
  */
 struct rz_sysc_init_data {
 	const struct rz_sysc_soc_id_init_data *soc_id_init_data;
+	u32 max_register_offset;
 };
 
 extern const struct rz_sysc_init_data rzg3e_sys_init_data;
-- 
2.25.1


