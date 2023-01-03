Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D945B65BFAB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jan 2023 13:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbjACMLX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Jan 2023 07:11:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237540AbjACMLR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 07:11:17 -0500
X-Greylist: delayed 377 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 03 Jan 2023 04:11:07 PST
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9683CA446
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Jan 2023 04:11:07 -0800 (PST)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by gauss.telenet-ops.be (Postfix) with ESMTPS id 4NmWcv0K5xz4x4d3
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Jan 2023 13:04:47 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:f1ca:ff0d:9dea:806e])
        by andre.telenet-ops.be with bizsmtp
        id 4C4m2900g2YHDVW01C4m4d; Tue, 03 Jan 2023 13:04:46 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1pCg2A-001yqK-JY; Tue, 03 Jan 2023 13:04:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1pCg2A-001OHg-6E; Tue, 03 Jan 2023 13:04:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [LOCAL] arm64: renesas: defconfig: Enable ARMv8.1 atomic instructions
Date:   Tue,  3 Jan 2023 13:04:45 +0100
Message-Id: <3a4cb7d3ab06b87a22750dc006eff0a21f3872a0.1672747463.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Cortex-A55 and Cortex-A76 support ARMv8.1 atomic instructions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 5698d17b9ff9c265..23d649fdb6e1ac48 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -55,7 +55,6 @@ CONFIG_KEXEC=y
 CONFIG_CRASH_DUMP=y
 CONFIG_XEN=y
 CONFIG_COMPAT=y
-# CONFIG_ARM64_USE_LSE_ATOMICS is not set
 # CONFIG_ARM64_PTR_AUTH is not set
 # CONFIG_ARM64_AMU_EXTN is not set
 # CONFIG_ARM64_TLB_RANGE is not set
-- 
2.25.1

