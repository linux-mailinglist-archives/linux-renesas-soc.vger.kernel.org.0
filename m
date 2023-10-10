Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8A3C7BFD1B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Oct 2023 15:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbjJJNR1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Oct 2023 09:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjJJNR1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 09:17:27 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A39DA4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 06:17:23 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a251:6312:1f1a:2a48])
        by xavier.telenet-ops.be with bizsmtp
        id wDHM2A00e3RY9Je01DHMmJ; Tue, 10 Oct 2023 15:17:22 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qqCbw-005sTC-37;
        Tue, 10 Oct 2023 15:17:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qqCbx-00GveY-L2;
        Tue, 10 Oct 2023 15:17:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.6-rc3
Date:   Tue, 10 Oct 2023 15:17:20 +0200
Message-Id: <527f23d5290c5d62984093e78b4b20ffc212a0c4.1696943815.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas ARM64 systems:
  - Disable CONFIG_ARM64_ERRATUM_2966298 (No Cortex-A520).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 46af31ce514c404a..4df57545923a8ac0 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -37,6 +37,7 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_ARM64_ERRATUM_2067961 is not set
 # CONFIG_ARM64_ERRATUM_2441009 is not set
 # CONFIG_ARM64_ERRATUM_2645198 is not set
+# CONFIG_ARM64_ERRATUM_2966298 is not set
 # CONFIG_CAVIUM_ERRATUM_22375 is not set
 # CONFIG_CAVIUM_ERRATUM_23154 is not set
 # CONFIG_CAVIUM_ERRATUM_27456 is not set
-- 
2.34.1

