Return-Path: <linux-renesas-soc+bounces-7550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AACFE93D444
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 15:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF0A11C2327E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 13:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED8717C7B0;
	Fri, 26 Jul 2024 13:38:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25931E4A4
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jul 2024 13:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722001105; cv=none; b=lo1oFNdc8bPC6pyysX9h0GjqKmdhCst8X9Di0H1eih2sayR0S1Jfm9BfTV8Vsx8kRpNjZ9+D6OU/6G8TgdgeWJ9+mYDBLhskLKefV0+MBONMu89QSIdo80zBFXANu8exqbp+1jh0pjRS3xyXL/pn48GTUFIU5YSb5dSOWK9RCw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722001105; c=relaxed/simple;
	bh=c0QJusAxP5dOfvfL9mRfUFCS79xP76Q4+6WOV2k+k0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hYYj8pXqiwGAISrvvGwegzGECQP+d5cTbrSG1g96j3yGTdfaSAYzHhnoJbh3wnx+2KsWux1nSPnrt6Uar7TIoejcTz6p0sf0LaZtqJSJzV/XX61jSS4AWakE+cOawD4DTW3pqt6Jd+3Rygu/K9eBdpshk3NoGAoiv3NGEi8NxLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3d94:87cf:603a:d7ae])
	by laurent.telenet-ops.be with bizsmtp
	id sDeD2C00S1mGjv501DeDkH; Fri, 26 Jul 2024 15:38:15 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sXL8p-003cM2-R8;
	Fri, 26 Jul 2024 15:38:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sXL9B-004G6J-KE;
	Fri, 26 Jul 2024 15:38:13 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 2/7] nvmem: Add R-Car E-FUSE driver
Date: Fri, 26 Jul 2024 15:38:07 +0200
Message-Id: <c4645d6c7a14723bec6ffa23bb7a822c3507322f.1721999833.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721999833.git.geert+renesas@glider.be>
References: <cover.1721999833.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R-Car Gen4 SoCs contain fuses indicating hardware support or hardware
(e.g. tuning) parameters.  Add a driver to access the state of the
fuses.  This supports two types of hardware fuse providers:
  1. E-FUSE non-volatile memory accessible through the Pin Function
     Controller on R-Car V3U and S4-8,
  2. E-FUSE non-volatile memory accessible through OTP_MEM on R-Car V4H
     and V4M.

The state of the cells can be read using the NVMEM framework, either
from kernel space (e.g. by the Renesas UFSHCD driver), or from
userspace.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v3:
  - Drop superfluous semicolon,
  - Drop the custom rcar_fuse_read() kernel API, in favor of the
    standard nvmem_cell_*() API,
  - Drop support for explicitly-instantiated platform devices with
    accompanying platform data, which would be needed to support fuses
    tightly integrated with the Pin Function Controller on R-Car Gen3
    SoCs.  It can be added when a use case shows up.
  - Move from drivers/soc/renesas/ to drivers/nvmem/,
  - Register the full register block that contains the E-FUSE data
    registers with the nvmem subsystem, but use keepouts to ignore all
    registers before the first or after the last documented data
    register.  Undocumented registers in between are still accessible.
  - Replace offset/nregs in rcar_fuse_data by start/end,
  - Use __ioread32_copy() helper,
  - Initialize most fields of struct nvmem_config in its declaration,
  - Rename nvmem device from "fuse" to "rcar-fuse",
  - Use NVMEM_DEVID_NONE,
  - Add an entry to the MAINTAINERS file,

v2:
  - Add Reviewed-by.
---
 MAINTAINERS                |   1 +
 drivers/nvmem/Kconfig      |  11 +++
 drivers/nvmem/Makefile     |   2 +
 drivers/nvmem/rcar-efuse.c | 142 +++++++++++++++++++++++++++++++++++++
 4 files changed, 156 insertions(+)
 create mode 100644 drivers/nvmem/rcar-efuse.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8da9c4ee231b4db4..142e1ecf88c19773 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2802,6 +2802,7 @@ F:	arch/arm/mach-shmobile/
 F:	arch/arm/mach-shmobile/
 F:	arch/arm64/boot/dts/renesas/
 F:	arch/riscv/boot/dts/renesas/
+F:	drivers/nvmem/rcar-efuse.c
 F:	drivers/pmdomain/renesas/
 F:	drivers/soc/renesas/
 F:	include/linux/soc/renesas/
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 283134498fbc3315..567baf73be90375e 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -246,6 +246,17 @@ config NVMEM_RAVE_SP_EEPROM
 	help
 	  Say y here to enable Rave SP EEPROM support.
 
+config NVMEM_RCAR_EFUSE
+	tristate "Renesas R-Car Gen4 E-FUSE support"
+	depends on (ARCH_RENESAS && ARM64) || COMPILE_TEST
+	depends on NVMEM
+	help
+	  Enable support for reading the fuses in the E-FUSE or OTP
+	  non-volatile memory block on Renesas R-Car Gen4 SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem-rcar-efuse.
+
 config NVMEM_RMEM
 	tristate "Reserved Memory Based Driver Support"
 	depends on HAS_IOMEM
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index cdd01fbf1313b58c..5b77bbb6488bf89b 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -52,6 +52,8 @@ obj-$(CONFIG_NVMEM_QCOM_SEC_QFPROM)	+= nvmem_sec_qfprom.o
 nvmem_sec_qfprom-y			:= sec-qfprom.o
 obj-$(CONFIG_NVMEM_RAVE_SP_EEPROM)	+= nvmem-rave-sp-eeprom.o
 nvmem-rave-sp-eeprom-y			:= rave-sp-eeprom.o
+obj-$(CONFIG_NVMEM_RCAR_EFUSE)		+= nvmem-rcar-efuse.o
+nvmem-rcar-efuse-y			:= rcar-efuse.o
 obj-$(CONFIG_NVMEM_RMEM) 		+= nvmem-rmem.o
 nvmem-rmem-y				:= rmem.o
 obj-$(CONFIG_NVMEM_ROCKCHIP_EFUSE)	+= nvmem_rockchip_efuse.o
diff --git a/drivers/nvmem/rcar-efuse.c b/drivers/nvmem/rcar-efuse.c
new file mode 100644
index 0000000000000000..f24bdb9cb5a7296f
--- /dev/null
+++ b/drivers/nvmem/rcar-efuse.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Renesas R-Car E-FUSE/OTP Driver
+ *
+ * Copyright (C) 2024 Glider bv
+ */
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+
+struct rcar_fuse {
+	struct nvmem_keepout keepouts[2];
+	struct nvmem_device *nvmem;
+	struct device *dev;
+	void __iomem *base;
+};
+
+struct rcar_fuse_data {
+	unsigned int bank;	/* 0: PFC + E-FUSE, 1: OPT_MEM + E-FUSE */
+	unsigned int start;	/* inclusive */
+	unsigned int end;	/* exclusive */
+};
+
+static int rcar_fuse_reg_read(void *priv, unsigned int offset, void *val,
+			      size_t bytes)
+{
+	struct rcar_fuse *fuse = priv;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(fuse->dev);
+	if (ret < 0)
+		return ret;
+
+	__ioread32_copy(val, fuse->base + offset, bytes / 4);
+
+	pm_runtime_put(fuse->dev);
+
+	return 0;
+}
+
+static int rcar_fuse_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct rcar_fuse_data *data = device_get_match_data(dev);
+	struct nvmem_config config = {
+		.dev = dev,
+		.name = "rcar-fuse",
+		.id = NVMEM_DEVID_NONE,
+		.owner = THIS_MODULE,
+		.type = NVMEM_TYPE_OTP,
+		.read_only = true,
+		.root_only = true,
+		.reg_read = rcar_fuse_reg_read,
+		.word_size = 4,
+		.stride = 4,
+	};
+	struct rcar_fuse *fuse;
+	struct resource *res;
+	int ret;
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret < 0)
+		return ret;
+
+	fuse = devm_kzalloc(dev, sizeof(*fuse), GFP_KERNEL);
+	if (!fuse)
+		return -ENOMEM;
+
+	fuse->base = devm_platform_get_and_ioremap_resource(pdev, data->bank,
+							    &res);
+	if (IS_ERR(fuse->base))
+		return PTR_ERR(fuse->base);
+
+	fuse->dev = dev;
+	fuse->keepouts[0].start = 0;
+	fuse->keepouts[0].end = data->start;
+	fuse->keepouts[1].start = data->end;
+	fuse->keepouts[1].end = resource_size(res);
+
+	config.keepout = fuse->keepouts;
+	config.nkeepout = ARRAY_SIZE(fuse->keepouts);
+	config.size = resource_size(res);
+	config.priv = fuse;
+
+	fuse->nvmem = devm_nvmem_register(dev, &config);
+	if (IS_ERR(fuse->nvmem))
+		return dev_err_probe(dev, PTR_ERR(fuse->nvmem),
+				     "Failed to register NVMEM device\n");
+
+	return 0;
+}
+
+static const struct rcar_fuse_data rcar_fuse_v3u = {
+	.bank = 0,
+	.start = 0x0c0,
+	.end = 0x0e8,
+};
+
+static const struct rcar_fuse_data rcar_fuse_s4 = {
+	.bank = 0,
+	.start = 0x0c0,
+	.end = 0x14c,
+};
+
+static const struct rcar_fuse_data rcar_fuse_v4h = {
+	.bank = 1,
+	.start = 0x100,
+	.end = 0x1a0,
+};
+
+static const struct rcar_fuse_data rcar_fuse_v4m = {
+	.bank = 1,
+	.start = 0x100,
+	.end = 0x110,
+};
+
+static const struct of_device_id rcar_fuse_match[] = {
+	{ .compatible = "renesas,r8a779a0-efuse", .data = &rcar_fuse_v3u },
+	{ .compatible = "renesas,r8a779f0-efuse", .data = &rcar_fuse_s4 },
+	{ .compatible = "renesas,r8a779g0-otp", .data = &rcar_fuse_v4h },
+	{ .compatible = "renesas,r8a779h0-otp", .data = &rcar_fuse_v4m },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver rcar_fuse_driver = {
+	.probe = rcar_fuse_probe,
+	.driver = {
+		.name = "rcar_fuse",
+		.of_match_table = rcar_fuse_match,
+	},
+};
+module_platform_driver(rcar_fuse_driver);
+
+MODULE_DESCRIPTION("Renesas R-Car E-FUSE/OTP driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Geert Uytterhoeven");
-- 
2.34.1


