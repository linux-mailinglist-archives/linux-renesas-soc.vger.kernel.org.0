Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 751B620FA3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 19:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387958AbgF3RMm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 13:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729963AbgF3RMm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 13:12:42 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FAD5C061755
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2020 10:12:41 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:503c:ab8:1424:9638])
        by andre.telenet-ops.be with bizsmtp
        id xVCe2200N49uj5301VCe7m; Tue, 30 Jun 2020 19:12:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jqJoE-0002qm-I7; Tue, 30 Jun 2020 19:12:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jqJoE-0002tP-FO; Tue, 30 Jun 2020 19:12:38 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: multi_v7_defconfig: Enable additional support for Renesas platforms
Date:   Tue, 30 Jun 2020 19:12:37 +0200
Message-Id: <20200630171237.11077-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Increase build and test coverage by enabling support for more hardware
present on Renesas SoCs and boards:
  - Dialog DA9063 PMIC "ONKEY", as used on the Stout and Silk boards,
  - Renesas RZ/A watchdog timer, as used on RZ/A1H and RZ/A2M boards,
  - Renesas RZ/A1H Capture Engine Unit, as used on the GR-Peach
    audiocamera shield expansion board,
  - Analog Devices ADV7612 HDMI receiver (incl. CEC), as used on the
    Koelsch and Lager boards,
  - Renesas RZ/A1H Realtime Clock, as used on the Genmai and RSK+RZA1
    boards.

All of the above are modular (CEC support is an optional feature of the
modular ADV7604 driver).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.9.

 arch/arm/configs/multi_v7_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 95543914d3c7f01c..f6dbbdc4be9c66ff 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -314,6 +314,7 @@ CONFIG_INPUT_MAX77693_HAPTIC=m
 CONFIG_INPUT_MAX8997_HAPTIC=m
 CONFIG_INPUT_CPCAP_PWRBUTTON=m
 CONFIG_INPUT_AXP20X_PEK=m
+CONFIG_INPUT_DA9063_ONKEY=m
 CONFIG_INPUT_ADXL34X=m
 CONFIG_INPUT_STPMIC1_ONKEY=y
 CONFIG_SERIO_AMBAKMI=y
@@ -520,6 +521,7 @@ CONFIG_TEGRA_WATCHDOG=m
 CONFIG_MESON_WATCHDOG=y
 CONFIG_DIGICOLOR_WATCHDOG=y
 CONFIG_RENESAS_WDT=m
+CONFIG_RENESAS_RZAWDT=m
 CONFIG_STPMIC1_WATCHDOG=y
 CONFIG_BCM47XX_WDT=y
 CONFIG_BCM2835_WDT=y
@@ -618,6 +620,7 @@ CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_MMP_CAMERA=m
 CONFIG_VIDEO_ASPEED=m
 CONFIG_VIDEO_STM32_DCMI=m
+CONFIG_VIDEO_RENESAS_CEU=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS4_IS=m
 CONFIG_VIDEO_S5P_FIMC=m
 CONFIG_VIDEO_S5P_MIPI_CSIS=m
@@ -640,6 +643,8 @@ CONFIG_VIDEO_VIVID=m
 CONFIG_CEC_PLATFORM_DRIVERS=y
 CONFIG_CEC_SAMSUNG_S5P=m
 CONFIG_VIDEO_ADV7180=m
+CONFIG_VIDEO_ADV7604=m
+CONFIG_VIDEO_ADV7604_CEC=y
 CONFIG_VIDEO_ML86V7667=m
 CONFIG_IMX_IPUV3_CORE=m
 CONFIG_DRM=y
@@ -901,6 +906,7 @@ CONFIG_RTC_DRV_EFI=m
 CONFIG_RTC_DRV_DIGICOLOR=m
 CONFIG_RTC_DRV_S3C=m
 CONFIG_RTC_DRV_SA1100=m
+CONFIG_RTC_DRV_SH=m
 CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_AT91RM9200=m
 CONFIG_RTC_DRV_AT91SAM9=m
-- 
2.17.1

