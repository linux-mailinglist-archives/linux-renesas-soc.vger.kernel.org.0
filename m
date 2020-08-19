Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88D092499DF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Aug 2020 12:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgHSKKB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Aug 2020 06:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbgHSKJ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Aug 2020 06:09:59 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4DEC061342
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2020 03:09:57 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id HN9v230034C55Sk06N9vr5; Wed, 19 Aug 2020 12:09:55 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8L2Y-0008SS-Vs; Wed, 19 Aug 2020 12:09:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8L2Y-00037C-Uy; Wed, 19 Aug 2020 12:09:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 2/2] arm64: renesas: defconfig: Refresh for v5.9-rc1
Date:   Wed, 19 Aug 2020 12:09:52 +0200
Message-Id: <20200819100952.11913-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819100952.11913-1-geert+renesas@glider.be>
References: <20200819100952.11913-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas R-Car Gen3 and RZ/G2 systems:
  - Disable CONFIG_ARM64_TLB_RANGE (R-Car Gen3 is not ARMv8.4-TLBI),
  - Disable CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER (should not
    default to yes),
  - Drop CONFIG_BACKLIGHT_GENERIC=n (removed in commit 7ecdea4a0226f6c5
    ("backlight: generic_bl: Remove this driver as it is unused")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to topic/renesas-defconfig.
---
 arch/arm64/configs/renesas_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index c96094352bee6756..04fc9365af4872db 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -50,6 +50,7 @@ CONFIG_COMPAT=y
 # CONFIG_ARM64_RAS_EXTN is not set
 # CONFIG_ARM64_PTR_AUTH is not set
 # CONFIG_ARM64_AMU_EXTN is not set
+# CONFIG_ARM64_TLB_RANGE is not set
 # CONFIG_ARM64_BTI is not set
 # CONFIG_ARM64_E0PD is not set
 # CONFIG_ARCH_RANDOM is not set
@@ -60,6 +61,7 @@ CONFIG_ARM_CPUIDLE=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
 # CONFIG_DMIID is not set
+# CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER is not set
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=y
 CONFIG_ARM64_CRYPTO=y
@@ -238,7 +240,6 @@ CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
 CONFIG_DRM_DW_HDMI_CEC=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
-- 
2.17.1

