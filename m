Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8842207493
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 15:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403954AbgFXNbC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 09:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403940AbgFXNbB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 09:31:01 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8606C0613ED
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 06:31:00 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:55d:3294:1dc4:d387])
        by baptiste.telenet-ops.be with bizsmtp
        id v1Wz2200X3ySsk1011Wzvp; Wed, 24 Jun 2020 15:30:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5UR-0002Zx-Cg; Wed, 24 Jun 2020 15:30:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5UR-0001XO-Bn; Wed, 24 Jun 2020 15:30:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 1/7] arm64: renesas: defconfig: Refresh for v5.8-rc1
Date:   Wed, 24 Jun 2020 15:30:51 +0200
Message-Id: <20200624133057.5860-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624133057.5860-1-geert+renesas@glider.be>
References: <20200624133057.5860-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas R-Car Gen3 and RZ/G2 boards:

  - Drop CONFIG_MEMCG_SWAP=y (auto-enabled since commit 2d1c498072de69e2
    ("mm: memcontrol: make swap tracking an integral part of memory
    control")),
  - Move CONFIG_HISILICON_ERRATUM_161600802 (moved in commit
    ebcea694e69270f5 ("arm64: Sort vendor-specific errata")),
  - Disable CONFIG_ARM64_BTI (R-Car Gen3 is not ARMv8.5),
  - Move CONFIG_MEDIA_SUBDRV_AUTOSELECT (moved in commit
    1b80d36aeb92a767 ("media: Kconfig: move the position of sub-driver
    autoselection")),
  - Drop CONFIG_MEDIA_CONTROLLER=y and CONFIG_VIDEO_V4L2_SUBDEV_API=y
    (auto-enabled since commit 32a363d0b0b142f3 ("media: Kconfig files:
    use select for V4L2 subdevs and MC")),
  - Enable CONFIG_MEDIA_PLATFORM_SUPPORT (needed since commit
    06b93644f4d102bd ("media: Kconfig: add an option to filter in/out
    platform drivers")),
  - Drop CONFIG_EDAC=y (depends on CONFIG_RAS, which is no longer
    auto-enabled since commit 8c8ff55b4da7c614 ("PCI/AER: Don't select
    CONFIG_PCIEAER by default")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 9234ad482fe4c294..8a9dc37a4b32a906 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -13,7 +13,6 @@ CONFIG_TASK_IO_ACCOUNTING=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_MEMCG=y
-CONFIG_MEMCG_SWAP=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_HUGETLB=y
@@ -34,11 +33,11 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_CAVIUM_ERRATUM_27456 is not set
 # CONFIG_CAVIUM_ERRATUM_30115 is not set
 # CONFIG_CAVIUM_TX2_ERRATUM_219 is not set
+# CONFIG_HISILICON_ERRATUM_161600802 is not set
 # CONFIG_QCOM_FALKOR_ERRATUM_1003 is not set
 # CONFIG_QCOM_FALKOR_ERRATUM_1009 is not set
 # CONFIG_QCOM_QDF2400_ERRATUM_0065 is not set
 # CONFIG_SOCIONEXT_SYNQUACER_PREITS is not set
-# CONFIG_HISILICON_ERRATUM_161600802 is not set
 CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
 CONFIG_NR_CPUS=8
@@ -51,6 +50,7 @@ CONFIG_COMPAT=y
 # CONFIG_ARM64_RAS_EXTN is not set
 # CONFIG_ARM64_PTR_AUTH is not set
 # CONFIG_ARM64_AMU_EXTN is not set
+# CONFIG_ARM64_BTI is not set
 # CONFIG_ARM64_E0PD is not set
 # CONFIG_ARCH_RANDOM is not set
 CONFIG_HIBERNATION=y
@@ -156,10 +156,10 @@ CONFIG_REGULATOR_BD9571MWV=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_PWM=y
 CONFIG_MEDIA_SUPPORT=y
+# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_SDR_SUPPORT=y
-CONFIG_MEDIA_CONTROLLER=y
-CONFIG_VIDEO_V4L2_SUBDEV_API=y
+CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_RCAR_CSI2=y
 CONFIG_VIDEO_RCAR_VIN=y
@@ -169,7 +169,6 @@ CONFIG_VIDEO_RENESAS_FCP=y
 CONFIG_VIDEO_RENESAS_VSP1=y
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_RCAR_DRIF=y
-# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_VIDEO_ADV748X=y
 # CONFIG_MEDIA_TUNER_SIMPLE is not set
 # CONFIG_MEDIA_TUNER_TDA18250 is not set
@@ -266,7 +265,6 @@ CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
-CONFIG_EDAC=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_RX8581=y
 CONFIG_DMADEVICES=y
-- 
2.17.1

