Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF74879FD97
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Sep 2023 09:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234255AbjINH5Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Sep 2023 03:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236206AbjINH5J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Sep 2023 03:57:09 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9551FC0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Sep 2023 00:57:04 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f674:9611:cd05:f25a])
        by andre.telenet-ops.be with bizsmtp
        id ljx22A0033fvA4V01jx2Cg; Thu, 14 Sep 2023 09:57:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qghDP-003fq1-VY;
        Thu, 14 Sep 2023 09:57:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qghDh-00G6tu-TN;
        Thu, 14 Sep 2023 09:57:01 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL v2] arm64: renesas: defconfig: Refresh for v6.6-rc1
Date:   Thu, 14 Sep 2023 09:57:00 +0200
Message-Id: <2a3b0ea40d21895bcfe5e9545d1de3309a1b4c11.1694678131.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas ARM64 systems:

  - Move CONFIG_CRASH_DUMP (moved in commit 89cde455915f4611 ("kexec:
    consolidate kexec and crash options into kernel/Kconfig.kexec")),
  - Drop CONFIG_KEXEC=y (auto-enabled since commit 89cde455915f4611
    ("kexec: consolidate kexec and crash options into
    kernel/Kconfig.kexec")),
  - Disable frame buffer device drivers and related support (no longer
    needed since commit 55bffc8170bb5813 ("fbdev: Split frame buffer
    support in FB and FB_CORE symbols")),
  - Enable CONFIG_FRAMEBUFFER_CONSOLE (no longer auto-enabled since
    commit a5ae331edb02b664 ("drm: Drop select FRAMEBUFFER_CONSOLE for
    DRM_FBDEV_EMULATION")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.

v2:
  - Drop accidental enable of CONFIG_KEXEC_FILE,
  - Update description for auto-enabled CONFIG_KEXEC.
---
 arch/arm64/configs/renesas_defconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 299a38437083b694..78d5d35ae9a12d6e 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -25,6 +25,7 @@ CONFIG_USER_NS=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
+CONFIG_CRASH_DUMP=y
 CONFIG_ARCH_RENESAS=y
 # CONFIG_AMPERE_ERRATUM_AC03_CPU_38 is not set
 # CONFIG_ARM64_ERRATUM_1542419 is not set
@@ -54,8 +55,6 @@ CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
 CONFIG_SCHED_CLUSTER=y
 CONFIG_NR_CPUS=8
-CONFIG_KEXEC=y
-CONFIG_CRASH_DUMP=y
 CONFIG_XEN=y
 CONFIG_COMPAT=y
 # CONFIG_ARM64_PTR_AUTH is not set
@@ -277,10 +276,9 @@ CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
 CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
 CONFIG_DRM_DW_HDMI_CEC=y
-CONFIG_FB=y
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
-- 
2.34.1

