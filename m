Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5D8979C09B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 02:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236136AbjIKVSK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 17:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237885AbjIKNS0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 09:18:26 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04C5EB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 06:18:21 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a989:d413:f41f:af52])
        by albert.telenet-ops.be with bizsmtp
        id kdJK2A00M43UkUk06dJL6b; Mon, 11 Sep 2023 15:18:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qfgnj-002zwG-IB;
        Mon, 11 Sep 2023 15:18:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qfgnz-007rvo-R8;
        Mon, 11 Sep 2023 15:18:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.6-rc1
Date:   Mon, 11 Sep 2023 15:18:19 +0200
Message-Id: <10a1bd15e35d4407dbb7ab36d98c7d399c6cbf6b.1694438271.git.geert+renesas@glider.be>
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

  - Move CONFIG_KEXEC and CONFIG_CRASH_DUMP (moved in commit
    89cde455915f4611 ("kexec: consolidate kexec and crash options into
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
---
 arch/arm64/configs/renesas_defconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 299a38437083b694..796534fd506d4ed5 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -25,6 +25,8 @@ CONFIG_USER_NS=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
+CONFIG_KEXEC_FILE=y
+CONFIG_CRASH_DUMP=y
 CONFIG_ARCH_RENESAS=y
 # CONFIG_AMPERE_ERRATUM_AC03_CPU_38 is not set
 # CONFIG_ARM64_ERRATUM_1542419 is not set
@@ -54,8 +56,6 @@ CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
 CONFIG_SCHED_CLUSTER=y
 CONFIG_NR_CPUS=8
-CONFIG_KEXEC=y
-CONFIG_CRASH_DUMP=y
 CONFIG_XEN=y
 CONFIG_COMPAT=y
 # CONFIG_ARM64_PTR_AUTH is not set
@@ -277,10 +277,9 @@ CONFIG_DRM_I2C_ADV7511_AUDIO=y
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

