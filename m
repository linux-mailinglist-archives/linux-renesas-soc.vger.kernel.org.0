Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF8E40AB38
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Sep 2021 11:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbhINJ4u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Sep 2021 05:56:50 -0400
Received: from mail.iot.bzh ([51.75.236.24]:36908 "EHLO mail.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231254AbhINJ4u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 05:56:50 -0400
Received: from localhost.localdomain (843280159.box.freepro.com [88.202.238.44])
        by mail.iot.bzh (Postfix) with ESMTPSA id 890F5400A2;
        Tue, 14 Sep 2021 11:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
        t=1631612827;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2aDMs547reqnuyeeQmloygG1E0RRTfZ6mOeL9RoE+QM=;
        b=iN9YPg/kU2vsZKNuZaSeNVXrjSW2AhjP0Q+Opw7VDALZoWkGKFQPNkyWlSL9pibrwfPFtf
        YLhdavIQQfL0OOWy6vSf3NqbKQldg+3pa9ya3QNEXJMXxeumwZvCclO1YpYFIc384117PD
        jr39qXzuwVfQrnfR57gJ5pmCbRsapMb/hxQ0KXkit4jjjsaCZg+lYGV0U/BHeawKtfJmvo
        l8OUdifUYMMeRayPUM/kfjNH9ilU1nqh5MJFBO8YFzANGXUKUq0EP1OenPQ/SYhBe7SGGK
        KGYuWLp0unmuLN1ConP8f+No14r7fMx4bszSorFDmcIoCNpak/zi8bjiPfBjLw==
From:   Julien Massot <julien.massot@iot.bzh>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Julien Massot <julien.massot@iot.bzh>
Subject: [RFC PATCH 1/1] soc: renesas: rcar-rst: Add support to set rproc boot address
Date:   Tue, 14 Sep 2021 11:46:50 +0200
Message-Id: <20210914094650.15235-2-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210914094650.15235-1-julien.massot@iot.bzh>
References: <20210914094650.15235-1-julien.massot@iot.bzh>
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
 drivers/soc/renesas/rcar-rst.c       | 28 +++++++++++++++++++++++++++-
 include/linux/soc/renesas/rcar-rst.h |  2 ++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index 8a1e402ea799..7f8452b07cdf 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -12,6 +12,8 @@
 
 #define WDTRSTCR_RESET		0xA55A0002
 #define WDTRSTCR		0x0054
+#define CR7BAR			0x0070
+#define CR7BAREN		BIT(4)
 
 static int rcar_rst_enable_wdt_reset(void __iomem *base)
 {
@@ -76,7 +78,7 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
 	{ /* sentinel */ }
 };
 
-static void __iomem *rcar_rst_base __initdata;
+static void __iomem *rcar_rst_base;
 static u32 saved_mode __initdata;
 
 static int __init rcar_rst_init(void)
@@ -130,3 +132,27 @@ int __init rcar_rst_read_mode_pins(u32 *mode)
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
+int rcar_rst_set_rproc_boot_addr(u32 boot_addr)
+{
+	if (!rcar_rst_base)
+		return -EIO;
+
+	if (boot_addr % SZ_4K) {
+		pr_warn("Invalid boot address for remote processor, should be aligned on 4k\n");
+		boot_addr -= boot_addr % SZ_4K;
+	}
+
+	boot_addr |= CR7BAREN;
+	iowrite32(boot_addr, rcar_rst_base + CR7BAR);
+
+	return 0;
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

