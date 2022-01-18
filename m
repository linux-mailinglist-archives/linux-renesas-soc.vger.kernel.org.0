Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44CF492BAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jan 2022 17:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234020AbiARQzJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jan 2022 11:55:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347020AbiARQyn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 11:54:43 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EAA9C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jan 2022 08:54:42 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:76d0:2bff:fec8:549])
        by andre.telenet-ops.be with bizsmtp
        id kGug260060kcUhD01GugUo; Tue, 18 Jan 2022 17:54:40 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9rkl-00AGxf-R9; Tue, 18 Jan 2022 17:54:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n9rkl-001BJ1-At; Tue, 18 Jan 2022 17:54:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL v2] soc: renesas: rcar-rst: Allow WDT reset on R-Car Gen4
Date:   Tue, 18 Jan 2022 17:54:28 +0100
Message-Id: <39005cf749a99afc6d3ba96ff155fd2a231418a8.1642524743.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Other Gen3 SoCs do this in the bootloader. Maybe R-Car V3U and S4-8 will
also later?  For now, add it so we can properly reboot via remote.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
[geert: Generalize for R-Car Gen4]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.

v2:
  - Generalize for R-Car Gen4
---
 drivers/soc/renesas/rcar-rst.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index 4d293eb2d8f315d9..c9f2910361255fc5 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -12,6 +12,7 @@
 
 #define WDTRSTCR_RESET		0xA55A0002
 #define WDTRSTCR		0x0054
+#define GEN4_WDTRSTCR		0x0010
 
 #define CR7BAR			0x0070
 #define CR7BAREN		BIT(4)
@@ -27,6 +28,12 @@ static int rcar_rst_enable_wdt_reset(void __iomem *base)
 	return 0;
 }
 
+static int rcar_rst_gen4_enable_wdt_reset(void __iomem *base)
+{
+	iowrite32(WDTRSTCR_RESET, base + GEN4_WDTRSTCR);
+	return 0;
+}
+
 /*
  * Most of the R-Car Gen3 SoCs have an ARM Realtime Core.
  * Firmware boot address has to be set in CR7BAR before
@@ -68,6 +75,7 @@ static const struct rst_config rcar_rst_gen3 __initconst = {
 
 static const struct rst_config rcar_rst_gen4 __initconst = {
 	.modemr = 0x00,		/* MODEMR0 and it has CPG related bits */
+	.configure = rcar_rst_gen4_enable_wdt_reset,
 };
 
 static const struct of_device_id rcar_rst_matches[] __initconst = {
-- 
2.25.1

