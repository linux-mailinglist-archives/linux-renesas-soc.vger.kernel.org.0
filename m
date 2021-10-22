Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7B24376C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Oct 2021 14:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhJVMXf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Oct 2021 08:23:35 -0400
Received: from mail.iot.bzh ([51.75.236.24]:54461 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230366AbhJVMXe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Oct 2021 08:23:34 -0400
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id B6A27190C9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Oct 2021 14:21:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:message-id
        :mime-version:reply-to:subject:subject:to:to; s=iot.bzh; bh=FCmq
        yNNUvk+uiW7jrwJBOuammkRQV5kh08t1Na3OkR8=; b=M16upVT+w59b669OJh4x
        0PuM6m7iI+zwZeQ6TddlWFS/lMaDiDHWGetnUnQhwmWumQVP1uCJWGR9rE+NcQ4c
        VMx3JSYqYcWMZD3dMPpLo2TEbLwdUAqGshSinTGy365jGXJ5VP5bICIw68Y4EkE/
        1lJjCG6J3F13RgImejtZnLQ3r03Qr6Wc5HNxefMwLnMaqQ73O1v4oSK81TPCp3Ue
        Hmdgn5JZ3/ommm1AVcVKRtId/kQZi7RsrZhbKiE3zvbqug3/iUcCQAVQzLC8UL9Y
        IdMfJZ+PZ8Mka28LVUVNpkPeFiRryU3V+bTXWRe0RZw/4wIFPbLvvVXbYkpyZsXx
        NA==
From:   Julien Massot <julien.massot@iot.bzh>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH v4] soc: renesas: rcar-rst: Add support to set rproc boot address
Date:   Fri, 22 Oct 2021 14:21:01 +0200
Message-Id: <20211022122101.66998-1-julien.massot@iot.bzh>
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
Change since v3:
 - Change boot_addr type to u64 to match remoteproc type
 - Modify boot_addr sanity check to also check for 32 bits address
 - Export function using EXPORT_SYMBOL_GPL macro

---
 drivers/soc/renesas/rcar-rst.c       | 42 ++++++++++++++++++++++++++--
 include/linux/soc/renesas/rcar-rst.h |  2 ++
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index 8a1e402ea799..12db1ce45d33 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -12,6 +12,13 @@
 
 #define WDTRSTCR_RESET		0xA55A0002
 #define WDTRSTCR		0x0054
+#define CR7BAR			0x0070
+#define CR7BAREN		BIT(4)
+#define CR7BAR_MASK		0xFFFC0000
+
+static void __iomem *rcar_rst_base;
+static u32 saved_mode __initdata;
+static int (*rcar_rst_set_rproc_boot_addr_func)(u64 boot_addr);
 
 static int rcar_rst_enable_wdt_reset(void __iomem *base)
 {
@@ -19,9 +26,29 @@ static int rcar_rst_enable_wdt_reset(void __iomem *base)
 	return 0;
 }
 
+/*
+ * Most of the R-Car Gen3 SoCs have an ARM Realtime Core.
+ * Firmware boot address has to be set in CR7BAR before
+ * starting the realtime core.
+ * Boot address must be aligned on a 256k boundary.
+ */
+static int rcar_rst_set_gen3_rproc_boot_addr(u64 boot_addr)
+{
+	if (boot_addr & ~(u64)CR7BAR_MASK) {
+		pr_warn("Invalid boot address got %llx\n", boot_addr);
+		return -EINVAL;
+	}
+
+	iowrite32((u32)boot_addr, rcar_rst_base + CR7BAR);
+	iowrite32((u32)boot_addr | CR7BAREN, rcar_rst_base + CR7BAR);
+
+	return 0;
+}
+
 struct rst_config {
 	unsigned int modemr;		/* Mode Monitoring Register Offset */
 	int (*configure)(void __iomem *base);	/* Platform specific config */
+	int (*set_rproc_boot_addr)(u64 boot_addr);
 };
 
 static const struct rst_config rcar_rst_gen1 __initconst = {
@@ -35,6 +62,7 @@ static const struct rst_config rcar_rst_gen2 __initconst = {
 
 static const struct rst_config rcar_rst_gen3 __initconst = {
 	.modemr = 0x60,
+	.set_rproc_boot_addr = rcar_rst_set_gen3_rproc_boot_addr,
 };
 
 static const struct rst_config rcar_rst_r8a779a0 __initconst = {
@@ -76,9 +104,6 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
 	{ /* sentinel */ }
 };
 
-static void __iomem *rcar_rst_base __initdata;
-static u32 saved_mode __initdata;
-
 static int __init rcar_rst_init(void)
 {
 	const struct of_device_id *match;
@@ -100,6 +125,8 @@ static int __init rcar_rst_init(void)
 
 	rcar_rst_base = base;
 	cfg = match->data;
+	rcar_rst_set_rproc_boot_addr_func = cfg->set_rproc_boot_addr;
+
 	saved_mode = ioread32(base + cfg->modemr);
 	if (cfg->configure) {
 		error = cfg->configure(base);
@@ -130,3 +157,12 @@ int __init rcar_rst_read_mode_pins(u32 *mode)
 	*mode = saved_mode;
 	return 0;
 }
+
+int rcar_rst_set_rproc_boot_addr(u64 boot_addr)
+{
+	if (!rcar_rst_set_rproc_boot_addr_func)
+		return -EIO;
+
+	return rcar_rst_set_rproc_boot_addr_func(boot_addr);
+}
+EXPORT_SYMBOL_GPL(rcar_rst_set_rproc_boot_addr);
diff --git a/include/linux/soc/renesas/rcar-rst.h b/include/linux/soc/renesas/rcar-rst.h
index 7899a5b8c247..1f1fe8bfaa76 100644
--- a/include/linux/soc/renesas/rcar-rst.h
+++ b/include/linux/soc/renesas/rcar-rst.h
@@ -4,8 +4,10 @@
 
 #ifdef CONFIG_RST_RCAR
 int rcar_rst_read_mode_pins(u32 *mode);
+int rcar_rst_set_rproc_boot_addr(u64 boot_addr);
 #else
 static inline int rcar_rst_read_mode_pins(u32 *mode) { return -ENODEV; }
+static inline int rcar_rst_set_rproc_boot_addr(u64 boot_addr) { return -ENODEV; }
 #endif
 
 #endif /* __LINUX_SOC_RENESAS_RCAR_RST_H__ */
-- 
2.31.1


