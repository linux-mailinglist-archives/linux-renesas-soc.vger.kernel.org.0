Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89EE3752436
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jul 2023 15:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjGMNwI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jul 2023 09:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbjGMNwI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2023 09:52:08 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1E11992
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jul 2023 06:52:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6264:77e5:42e2:477d])
        by baptiste.telenet-ops.be with bizsmtp
        id Lds32A00n3wy6xv01ds4WR; Thu, 13 Jul 2023 15:52:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qJwjc-001Gu5-4G;
        Thu, 13 Jul 2023 15:52:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qJwjj-00GYb5-PY;
        Thu, 13 Jul 2023 15:52:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.5-rc1
Date:   Thu, 13 Jul 2023 15:52:00 +0200
Message-Id: <0bc4270375c10231a202c971465f7f992b8ddff3.1689256294.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas ARM64 systems:
  - Disable CONFIG_AMPERE_ERRATUM_AC03_CPU_38 (not applicable),
  - Enable Renesas RZ/V2M Clocked Serial Interface (CSI) SPI support
    (RZ/V2M Evaluation Kit),
  - Enable Renesas RAA215300 PMIC with integrated ISL1208 RTC, and
    Renesas RZ/G2L Multi-Function Timer Pulse Unit 3 PWM support (RZ/G2L
    SMARC EVK).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 231139e2b8646062..cb145a0cbe2212cb 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -26,6 +26,7 @@ CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_RENESAS=y
+# CONFIG_AMPERE_ERRATUM_AC03_CPU_38 is not set
 # CONFIG_ARM64_ERRATUM_1542419 is not set
 # CONFIG_ARM64_ERRATUM_1508412 is not set
 # CONFIG_ARM64_ERRATUM_2051678 is not set
@@ -177,6 +178,7 @@ CONFIG_I2C_RCAR=y
 CONFIG_SPI=y
 CONFIG_SPI_RPCIF=y
 CONFIG_SPI_RSPI=y
+CONFIG_SPI_RZV2M_CSI=y
 CONFIG_SPI_SH_MSIOF=y
 CONFIG_SPI_SPIDEV=y
 CONFIG_PINCTRL_SINGLE=y
@@ -199,6 +201,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_BD9571MWV=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_PWM=y
+CONFIG_REGULATOR_RAA215300=y
 CONFIG_MEDIA_SUPPORT=y
 # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_MEDIA_CAMERA_SUPPORT=y
@@ -332,6 +335,7 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_ISL1208=y
 CONFIG_RTC_DRV_RX8581=y
 CONFIG_DMADEVICES=y
 CONFIG_RCAR_DMAC=y
@@ -386,6 +390,7 @@ CONFIG_RZG2L_ADC=y
 CONFIG_PWM=y
 CONFIG_PWM_RCAR=y
 CONFIG_PWM_RENESAS_TPU=y
+CONFIG_PWM_RZ_MTU3=y
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_PHY_CAN_TRANSCEIVER=y
 CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
-- 
2.34.1

