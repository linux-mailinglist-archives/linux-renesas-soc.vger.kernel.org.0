Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55EF85017C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Apr 2022 18:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243491AbiDNPuL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Apr 2022 11:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237221AbiDNPJq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Apr 2022 11:09:46 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D82E9952
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Apr 2022 07:46:49 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7915:bbfe:555b:5456])
        by xavier.telenet-ops.be with bizsmtp
        id Jemn2700F4TB7ht01emnRT; Thu, 14 Apr 2022 16:46:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nf0kB-000cHM-GZ; Thu, 14 Apr 2022 16:46:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nf0kA-00EA1F-VC; Thu, 14 Apr 2022 16:46:46 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v5.18-rc1
Date:   Thu, 14 Apr 2022 16:46:41 +0200
Message-Id: <2ca6b74c5a4e954319625281b8e35a16d992ba8f.1649947562.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas ARM systems:
  - Disable CONFIG_ARM64_ERRATUM_2051678 (no Cortex-A510),
  - Disable CONFIG_ARM64_ERRATUM_2077057 (no Cortex-A510),
  - Shuffle media configuration,
  - Enable CONFIG_VIDEO_MAX96712 and dependencies (R-Car V3U Falcon),
  - Enable RZ/V2L (R9A07G054) SoC support,
  - Move CONFIG_DEBUG_KERNEL (moved in commit f9b3cd24578401e7
    ("Kconfig.debug: make DEBUG_INFO selectable from a choice")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 78 +++++++++++++++-------------
 1 file changed, 42 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 8702f71b2e205a87..4f7421ba76fa9fe9 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -29,6 +29,8 @@ CONFIG_PROFILING=y
 CONFIG_ARCH_RENESAS=y
 # CONFIG_ARM64_ERRATUM_1542419 is not set
 # CONFIG_ARM64_ERRATUM_1508412 is not set
+# CONFIG_ARM64_ERRATUM_2051678 is not set
+# CONFIG_ARM64_ERRATUM_2077057 is not set
 # CONFIG_ARM64_ERRATUM_2054223 is not set
 # CONFIG_ARM64_ERRATUM_2067961 is not set
 # CONFIG_CAVIUM_ERRATUM_22375 is not set
@@ -188,58 +190,58 @@ CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_SDR_SUPPORT=y
 CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_SDR_PLATFORM_DRIVERS=y
+CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_RCAR_ISP=y
 CONFIG_VIDEO_RCAR_CSI2=y
 CONFIG_VIDEO_RCAR_VIN=y
-CONFIG_VIDEO_RCAR_ISP=y
-CONFIG_V4L_MEM2MEM_DRIVERS=y
-CONFIG_VIDEO_RENESAS_FDP1=y
 CONFIG_VIDEO_RENESAS_FCP=y
+CONFIG_VIDEO_RENESAS_FDP1=y
 CONFIG_VIDEO_RENESAS_VSP1=y
-CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_RCAR_DRIF=y
+CONFIG_VIDEO_IMX219=y
+CONFIG_VIDEO_OV5645=y
 CONFIG_VIDEO_ADV7180=y
 CONFIG_VIDEO_ADV748X=y
 CONFIG_VIDEO_ADV7604=y
 CONFIG_VIDEO_ADV7604_CEC=y
-CONFIG_VIDEO_IMX219=y
-CONFIG_VIDEO_OV5645=y
-# CONFIG_MEDIA_TUNER_SIMPLE is not set
-# CONFIG_MEDIA_TUNER_TDA18250 is not set
-# CONFIG_MEDIA_TUNER_TDA8290 is not set
-# CONFIG_MEDIA_TUNER_TDA827X is not set
-# CONFIG_MEDIA_TUNER_TDA18271 is not set
-# CONFIG_MEDIA_TUNER_TDA9887 is not set
-# CONFIG_MEDIA_TUNER_TEA5761 is not set
-# CONFIG_MEDIA_TUNER_TEA5767 is not set
+# CONFIG_MEDIA_TUNER_E4000 is not set
+# CONFIG_MEDIA_TUNER_FC0011 is not set
+# CONFIG_MEDIA_TUNER_FC0012 is not set
+# CONFIG_MEDIA_TUNER_FC0013 is not set
+# CONFIG_MEDIA_TUNER_FC2580 is not set
+# CONFIG_MEDIA_TUNER_IT913X is not set
+# CONFIG_MEDIA_TUNER_M88RS6000T is not set
+# CONFIG_MEDIA_TUNER_MAX2165 is not set
+# CONFIG_MEDIA_TUNER_MC44S803 is not set
 # CONFIG_MEDIA_TUNER_MSI001 is not set
-# CONFIG_MEDIA_TUNER_MT20XX is not set
 # CONFIG_MEDIA_TUNER_MT2060 is not set
 # CONFIG_MEDIA_TUNER_MT2063 is not set
-# CONFIG_MEDIA_TUNER_MT2266 is not set
+# CONFIG_MEDIA_TUNER_MT20XX is not set
 # CONFIG_MEDIA_TUNER_MT2131 is not set
-# CONFIG_MEDIA_TUNER_QT1010 is not set
-# CONFIG_MEDIA_TUNER_XC2028 is not set
-# CONFIG_MEDIA_TUNER_XC5000 is not set
-# CONFIG_MEDIA_TUNER_XC4000 is not set
+# CONFIG_MEDIA_TUNER_MT2266 is not set
+# CONFIG_MEDIA_TUNER_MXL301RF is not set
 # CONFIG_MEDIA_TUNER_MXL5005S is not set
 # CONFIG_MEDIA_TUNER_MXL5007T is not set
-# CONFIG_MEDIA_TUNER_MC44S803 is not set
-# CONFIG_MEDIA_TUNER_MAX2165 is not set
-# CONFIG_MEDIA_TUNER_TDA18218 is not set
-# CONFIG_MEDIA_TUNER_FC0011 is not set
-# CONFIG_MEDIA_TUNER_FC0012 is not set
-# CONFIG_MEDIA_TUNER_FC0013 is not set
+# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
+# CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
+# CONFIG_MEDIA_TUNER_QT1010 is not set
+# CONFIG_MEDIA_TUNER_R820T is not set
+# CONFIG_MEDIA_TUNER_SI2157 is not set
+# CONFIG_MEDIA_TUNER_SIMPLE is not set
 # CONFIG_MEDIA_TUNER_TDA18212 is not set
-# CONFIG_MEDIA_TUNER_E4000 is not set
-# CONFIG_MEDIA_TUNER_FC2580 is not set
-# CONFIG_MEDIA_TUNER_M88RS6000T is not set
+# CONFIG_MEDIA_TUNER_TDA18218 is not set
+# CONFIG_MEDIA_TUNER_TDA18250 is not set
+# CONFIG_MEDIA_TUNER_TDA18271 is not set
+# CONFIG_MEDIA_TUNER_TDA827X is not set
+# CONFIG_MEDIA_TUNER_TDA8290 is not set
+# CONFIG_MEDIA_TUNER_TDA9887 is not set
+# CONFIG_MEDIA_TUNER_TEA5761 is not set
+# CONFIG_MEDIA_TUNER_TEA5767 is not set
 # CONFIG_MEDIA_TUNER_TUA9001 is not set
-# CONFIG_MEDIA_TUNER_SI2157 is not set
-# CONFIG_MEDIA_TUNER_IT913X is not set
-# CONFIG_MEDIA_TUNER_R820T is not set
-# CONFIG_MEDIA_TUNER_MXL301RF is not set
-# CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
-# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
+# CONFIG_MEDIA_TUNER_XC2028 is not set
+# CONFIG_MEDIA_TUNER_XC4000 is not set
+# CONFIG_MEDIA_TUNER_XC5000 is not set
 CONFIG_DRM=y
 CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_RCAR_DU=y
@@ -318,6 +320,9 @@ CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
 # CONFIG_XEN_PCIDEV_STUB is not set
+CONFIG_STAGING=y
+CONFIG_STAGING_MEDIA=y
+CONFIG_VIDEO_MAX96712=y
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_VC5=y
@@ -345,6 +350,7 @@ CONFIG_ARCH_R8A774E1=y
 CONFIG_ARCH_R8A774A1=y
 CONFIG_ARCH_R8A774B1=y
 CONFIG_ARCH_R9A07G044=y
+CONFIG_ARCH_R9A07G054=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_MEMORY=y
 CONFIG_RENESAS_RPCIF=y
@@ -382,9 +388,9 @@ CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=128
 CONFIG_CMA_ALIGNMENT=9
 CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-CONFIG_DEBUG_KERNEL=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
 CONFIG_PROVE_LOCKING=y
-- 
2.25.1

