Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7E21160F1C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2020 10:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728849AbgBQJrU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Feb 2020 04:47:20 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:57302 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgBQJrU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Feb 2020 04:47:20 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id 3lnH2200D5USYZQ06lnHew; Mon, 17 Feb 2020 10:47:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j3czl-0003YB-EX; Mon, 17 Feb 2020 10:47:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j3czl-0003dD-Ch; Mon, 17 Feb 2020 10:47:17 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] arm64: renesas_defconfig: Refresh for v5.6-rc1
Date:   Mon, 17 Feb 2020 10:47:16 +0100
Message-Id: <20200217094716.13689-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update the defconfig for Renesas R-Car Gen3 boards:
  - Disable CONFIG_ARM64_ERRATUM_1530923 (R-Car Gen3 does not have
    Cortex-A55),
  - Replace CONFIG_ARM64_LSE_ATOMICS by CONFIG_ARM64_USE_LSE_ATOMICS
    (cfr. commit 395af861377d1461 ("arm64: Move the LSE gas support
    detection to Kconfig"),
  - Disable CONFIG_ARM64_E0PD (R-Car Gen3 is not ARMv8.5),
  - Disable CONFIG_ARCH_RANDOM (R-Car Gen3 is not ARMv8.5),
  - Drop CONFIG_ARCH_R8A7796=y (removed in commit 24240845c87185fe
    ("soc: renesas: Remove ARCH_R8A7796")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be applied to topic/renesas-defconfig.
Not intended for upstream merge.

 arch/arm64/configs/renesas_defconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index c62ff4745e89d1f0..b3740e6b1b0a7730 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -27,6 +27,7 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_RENESAS=y
+# CONFIG_ARM64_ERRATUM_1530923 is not set
 # CONFIG_ARM64_ERRATUM_1542419 is not set
 # CONFIG_CAVIUM_ERRATUM_22375 is not set
 # CONFIG_CAVIUM_ERRATUM_23154 is not set
@@ -46,9 +47,11 @@ CONFIG_KEXEC=y
 CONFIG_CRASH_DUMP=y
 CONFIG_XEN=y
 CONFIG_COMPAT=y
-# CONFIG_ARM64_LSE_ATOMICS is not set
+# CONFIG_ARM64_USE_LSE_ATOMICS is not set
 # CONFIG_ARM64_RAS_EXTN is not set
 # CONFIG_ARM64_PTR_AUTH is not set
+# CONFIG_ARM64_E0PD is not set
+# CONFIG_ARCH_RANDOM is not set
 CONFIG_HIBERNATION=y
 CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
 CONFIG_CPU_IDLE=y
@@ -286,7 +289,6 @@ CONFIG_ARCH_R8A774A1=y
 CONFIG_ARCH_R8A774B1=y
 CONFIG_ARCH_R8A774C0=y
 CONFIG_ARCH_R8A7795=y
-CONFIG_ARCH_R8A7796=y
 CONFIG_ARCH_R8A77960=y
 CONFIG_ARCH_R8A77961=y
 CONFIG_ARCH_R8A77965=y
-- 
2.17.1

