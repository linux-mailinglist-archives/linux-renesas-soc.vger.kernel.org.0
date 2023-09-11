Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C41E79C047
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 02:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236761AbjIKVSF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 17:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237882AbjIKNRu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 09:17:50 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC42EE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 06:17:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a989:d413:f41f:af52])
        by laurent.telenet-ops.be with bizsmtp
        id kdHh2A00C43UkUk01dHhaq; Mon, 11 Sep 2023 15:17:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qfgn6-002zwB-WD;
        Mon, 11 Sep 2023 15:17:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qfgnN-007ruf-70;
        Mon, 11 Sep 2023 15:17:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v6.6-rc1
Date:   Mon, 11 Sep 2023 15:17:40 +0200
Message-Id: <1b8aee0cfcb2fa8c6e73c67f1c85c4630d946159.1694438226.git.geert+renesas@glider.be>
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

  - Move CONFIG_KEXEC (moved in commit 89cde455915f4611 ("kexec:
    consolidate kexec and crash options into kernel/Kconfig.kexec")),
  - Enable CONFIG_FRAMEBUFFER_CONSOLE (no longer auto-enabled since
    commit a5ae331edb02b664 ("drm: Drop select FRAMEBUFFER_CONSOLE for
    DRM_FBDEV_EMULATION")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Perhaps this is worthwhile to be queued as a fix for v6.6, due to the
text console regression?
---
 arch/arm/configs/shmobile_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 22205ef0f3768420..bd975d105687be39 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -6,6 +6,7 @@ CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_PERF_EVENTS=y
+CONFIG_KEXEC=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_PL310_ERRATA_588369=y
 CONFIG_SMP=y
@@ -13,7 +14,6 @@ CONFIG_SCHED_MC=y
 CONFIG_NR_CPUS=8
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
-CONFIG_KEXEC=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=y
@@ -148,6 +148,7 @@ CONFIG_FB=y
 CONFIG_FB_SH_MOBILE_LCDC=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_BACKLIGHT_AS3711=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
-- 
2.34.1

