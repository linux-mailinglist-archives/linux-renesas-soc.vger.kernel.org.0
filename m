Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89AB357171B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jul 2022 12:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbiGLKUb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jul 2022 06:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbiGLKUV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jul 2022 06:20:21 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F132ADD67
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Jul 2022 03:20:05 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id uAL22700Q4C55Sk01AL27T; Tue, 12 Jul 2022 12:20:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oBCzq-003Byu-F2; Tue, 12 Jul 2022 12:20:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oBCnN-007hh0-R0; Tue, 12 Jul 2022 12:07:09 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/TEST] cpuidle: psci: Disable on R-Car H3 ES1.0 and R-Car S4-8 ES1.0
Date:   Tue, 12 Jul 2022 12:07:07 +0200
Message-Id: <7369c30e5b1c0d229a72be7df380653857496e66.1657620332.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some systems with early PSCI revisions have bugs in their CPUidle
implementations, causing lock-ups when CONFIG_ARM_PSCI_CPUIDLE is
enabled.

Add a quirk to detect them, and disable CPUidle accordingly:
  - On R-Car H3 ES1.0 with PSCI v1.0, enabling CPUidle causes RCU
    stalls, either during early boot, or while running the PSCI checker,
  - On R-Car S4-8 with early firmware stacks, enabling CPUidle causes
    Linux to lock up during early kernel boot.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
Use only when needed.
---
 drivers/cpuidle/cpuidle-psci.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 540105ca0781f1c3..ba0b90f96f7fe699 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/syscore_ops.h>
+#include <linux/sys_soc.h>
 
 #include <asm/cpuidle.h>
 
@@ -435,11 +436,22 @@ static struct platform_driver psci_cpuidle_driver = {
 	},
 };
 
+static const struct soc_device_attribute psci_cpuidle_broken[] = {
+	{ .soc_id = "r8a7795", .revision = "ES1.0", },	// PSCI v1.0
+	{ .soc_id = "r8a779f0", .revision = "ES1.0", },	// Early PSCI rev
+	{ /* sentinel */ }
+};
+
 static int __init psci_idle_init(void)
 {
 	struct platform_device *pdev;
 	int ret;
 
+	if (soc_device_match(psci_cpuidle_broken)) {
+		pr_info("Skipping %s\n", __func__);
+		return 0;
+	}
+
 	ret = platform_driver_register(&psci_cpuidle_driver);
 	if (ret)
 		return ret;
-- 
2.25.1

