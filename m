Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61EA414C77
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 16:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235464AbhIVOyC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 10:54:02 -0400
Received: from mail.iot.bzh ([51.75.236.24]:11900 "EHLO mail.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236272AbhIVOx5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 10:53:57 -0400
Received: from localhost.localdomain (lfbn-ren-1-1868-231.w83-199.abo.wanadoo.fr [83.199.51.231])
        by mail.iot.bzh (Postfix) with ESMTPSA id 36162400A2;
        Wed, 22 Sep 2021 16:52:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
        t=1632322340;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=jbVrntzMQo+CXlZFyf9Y/H+27TSuJgt7VlQihSUuG3A=;
        b=IZP9j158pXxFyrZt0BYc0s9JtDgz5WOzPFQJFRaXSVYwlnifa7YvvLPjkGeu47aY0U/C/V
        Wg5M26x9NBXvRbxf8WWiMhYN6wE67nkdpcZt1lZVsks7/uJb9n3tf1Snu2EY4XDFrLAUvC
        DNjQos1ccGiJ0a5ExqJj0QBAIqCP+7lehJCMNcTH9LAtsLGIh54sm6YyiPN8YxwWt1jlgD
        VbbG9vUfdcMz4klOf5vM6WDW9Rxmp5DepOM83EzQq2qBcNxHeBjd36vO9k6v9fBL/GN1L6
        hyd2UslGF1FkgRLv1ETLV9KrQR80Zz0ySO9Yg4gKDW7Uwbn0xTVNnWEKo2rDZA==
From:   Julien Massot <julien.massot@iot.bzh>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH v2] soc: renesas: rcar-rst: Add support to set rproc boot address
Date:   Wed, 22 Sep 2021 16:52:12 +0200
Message-Id: <20210922145212.333541-1-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car Gen3 SoC series has a realtime processor, the boot
address of this processor can be set thanks to CR7BAR register
of the reset module.

Export this function so that it's possible to set the boot
address from a remoteproc driver.

Also drop the __initdata qualifier on rcar_rst_base,
since we will use this address later than init time.

Signed-off-by: Julien Massot <julien.massot@iot.bzh>
---

Change since RFC:
Introduce set_rproc_boot_addr function pointer, so that
it can be reused for other R-Car SoC generation.

---
 drivers/soc/renesas/rcar-rst.c       | 48 ++++++++++++++++++++++++----
 include/linux/soc/renesas/rcar-rst.h |  2 ++
 2 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index 8a1e402ea799..49200cdfe633 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -12,6 +12,8 @@
 
 #define WDTRSTCR_RESET		0xA55A0002
 #define WDTRSTCR		0x0054
+#define CR7BAR			0x0070
+#define CR7BAREN		BIT(4)
 
 static int rcar_rst_enable_wdt_reset(void __iomem *base)
 {
@@ -19,25 +21,29 @@ static int rcar_rst_enable_wdt_reset(void __iomem *base)
 	return 0;
 }
 
+static int rcar_rst_set_gen3_rproc_boot_addr(u32 boot_addr);
+
 struct rst_config {
 	unsigned int modemr;		/* Mode Monitoring Register Offset */
 	int (*configure)(void __iomem *base);	/* Platform specific config */
+	int (*set_rproc_boot_addr)(u32 boot_addr);
 };
 
-static const struct rst_config rcar_rst_gen1 __initconst = {
+static const struct rst_config rcar_rst_gen1 = {
 	.modemr = 0x20,
 };
 
-static const struct rst_config rcar_rst_gen2 __initconst = {
+static const struct rst_config rcar_rst_gen2 = {
 	.modemr = 0x60,
 	.configure = rcar_rst_enable_wdt_reset,
 };
 
-static const struct rst_config rcar_rst_gen3 __initconst = {
+static const struct rst_config rcar_rst_gen3 = {
 	.modemr = 0x60,
+	.set_rproc_boot_addr = rcar_rst_set_gen3_rproc_boot_addr,
 };
 
-static const struct rst_config rcar_rst_r8a779a0 __initconst = {
+static const struct rst_config rcar_rst_r8a779a0 = {
 	.modemr = 0x00,		/* MODEMR0 and it has CPG related bits */
 };
 
@@ -76,13 +82,13 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
 	{ /* sentinel */ }
 };
 
-static void __iomem *rcar_rst_base __initdata;
+static void __iomem *rcar_rst_base;
 static u32 saved_mode __initdata;
+static const struct rst_config *cfg;
 
 static int __init rcar_rst_init(void)
 {
 	const struct of_device_id *match;
-	const struct rst_config *cfg;
 	struct device_node *np;
 	void __iomem *base;
 	int error = 0;
@@ -130,3 +136,33 @@ int __init rcar_rst_read_mode_pins(u32 *mode)
 	*mode = saved_mode;
 	return 0;
 }
+
+/*
+ * Most of R-Car Gen3 SoCs have an ARM Realtime Core.
+ * Firmware boot address can be set before starting,
+ * the realtime core thanks to CR7BAR register.
+ * Boot address is on 32bit, and should be aligned on
+ * 4k boundary.
+ */
+int rcar_rst_set_gen3_rproc_boot_addr(u32 boot_addr)
+{
+	if (boot_addr % SZ_4K) {
+		pr_warn("Invalid boot address for CR7 processor,"
+		       "should be aligned on 4k got %x\n", boot_addr);
+		return -EINVAL;
+	}
+
+	iowrite32(boot_addr, rcar_rst_base + CR7BAR);
+	iowrite32(boot_addr | CR7BAREN, rcar_rst_base + CR7BAR);
+
+	return 0;
+}
+
+int rcar_rst_set_rproc_boot_addr(u32 boot_addr)
+{
+	if (!rcar_rst_base || !cfg->set_rproc_boot_addr)
+		return -EIO;
+
+	return cfg->set_rproc_boot_addr(boot_addr);
+}
+EXPORT_SYMBOL(rcar_rst_set_rproc_boot_addr);
diff --git a/include/linux/soc/renesas/rcar-rst.h b/include/linux/soc/renesas/rcar-rst.h
index 7899a5b8c247..7c97c2c4bba6 100644
--- a/include/linux/soc/renesas/rcar-rst.h
+++ b/include/linux/soc/renesas/rcar-rst.h
@@ -4,8 +4,10 @@
 
 #ifdef CONFIG_RST_RCAR
 int rcar_rst_read_mode_pins(u32 *mode);
+int rcar_rst_set_rproc_boot_addr(u32 boot_addr);
 #else
 static inline int rcar_rst_read_mode_pins(u32 *mode) { return -ENODEV; }
+static inline int rcar_rst_set_rproc_boot_addr(u32 boot_addr) { return -ENODEV; }
 #endif
 
 #endif /* __LINUX_SOC_RENESAS_RCAR_RST_H__ */
-- 
2.31.1

