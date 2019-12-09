Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2A16116AA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 11:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbfLIKOT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 05:14:19 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:50488 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfLIKOS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 05:14:18 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id bmEG2100A5USYZQ06mEGNd; Mon, 09 Dec 2019 11:14:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ieG3U-0003mm-CM; Mon, 09 Dec 2019 11:14:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ieG3U-0006x9-AO; Mon, 09 Dec 2019 11:14:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [LOCAL] arm64: renesas_defconfig: Refresh for v5.5-rc1
Date:   Mon,  9 Dec 2019 11:14:13 +0100
Message-Id: <20191209101413.26686-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update the defconfig for Renesas R-Car Gen3 boards:
  - Re-enable CONFIG_DEBUG_FS, as this is needed for e.g. systemd in
    Debian 9 (no longer auto-enabled since commit 0e4a459f56c32d3e
    ("tracing: Remove unnecessary DEBUG_FS dependency")),
  - Disable CONFIG_ARM64_ERRATUM_1542419 (not applicable),
  - Disable CONFIG_CAVIUM_TX2_ERRATUM_219 (not applicable),
  - Remove CONFIG_TASKSTATS=y and CONFIG_TASK_DELAY_ACCT=y
    (auto-enabled since commit c7892db5dd6afe92 ("KVM: arm64: Select
    TASK_DELAY_ACCT+TASKSTATS rather than SCHEDSTATS")),
  - Remove CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y (depends on
    CONFIG_ENERGY_MODEL since commit a4e893e802e6a807 ("thermal:
    cpu_cooling: Migrate to using the EM framework")),

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Should we enable CONFIG_ENERGY_MODEL?
Probably not, as CONFIG_CPU_FREQ_GOV_PERFORMANCE is enabled, cfr. the
description of commit 48da6f80057c3f8d ("arm64: defconfig: Enable
CONFIG_ENERGY_MODEL").
---
 arch/arm64/configs/renesas_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 109aef9c7da45d9a..f509da1473dfe1fa 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -8,8 +8,6 @@ CONFIG_PREEMPT=y
 CONFIG_IRQ_TIME_ACCOUNTING=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
-CONFIG_TASKSTATS=y
-CONFIG_TASK_DELAY_ACCT=y
 CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
 CONFIG_IKCONFIG=y
@@ -29,10 +27,12 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_RENESAS=y
+# CONFIG_ARM64_ERRATUM_1542419 is not set
 # CONFIG_CAVIUM_ERRATUM_22375 is not set
 # CONFIG_CAVIUM_ERRATUM_23154 is not set
 # CONFIG_CAVIUM_ERRATUM_27456 is not set
 # CONFIG_CAVIUM_ERRATUM_30115 is not set
+# CONFIG_CAVIUM_TX2_ERRATUM_219 is not set
 # CONFIG_QCOM_FALKOR_ERRATUM_1003 is not set
 # CONFIG_QCOM_FALKOR_ERRATUM_1009 is not set
 # CONFIG_QCOM_QDF2400_ERRATUM_0065 is not set
@@ -139,7 +139,6 @@ CONFIG_GPIO_RCAR=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_BD9571MWV=y
 CONFIG_THERMAL=y
-CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_RCAR_THERMAL=y
@@ -328,6 +327,7 @@ CONFIG_CMA_SIZE_MBYTES=128
 CONFIG_CMA_ALIGNMENT=9
 CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_KERNEL=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
-- 
2.17.1

