Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34C986B0BAC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 15:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbjCHOnX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 09:43:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbjCHOnA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 09:43:00 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5D75A93C
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Mar 2023 06:41:05 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:614d:21b0:703:d0f9])
        by xavier.telenet-ops.be with bizsmtp
        id Vqgx2900g3mNwr401qgya1; Wed, 08 Mar 2023 15:40:58 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZuxr-00BFZ1-N9;
        Wed, 08 Mar 2023 15:40:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pZuyP-00Fb3Q-SV;
        Wed, 08 Mar 2023 15:40:57 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] ARM: multi_v7_defconfig: Enable additional support for RZ/N1 platforms
Date:   Wed,  8 Mar 2023 15:40:53 +0100
Message-Id: <a163e8a9c4ae9cb10b05409f2fc139d09fe440b9.1678286291.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678286291.git.geert+renesas@glider.be>
References: <cover.1678286291.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Increase build and test coverage by enabling support for the A5PSW
Ethernet switch, pin, watchdog, USB Function, RTC, and DMA mux
controllers on the Renesas RZ/N1 SoC and the RZN1D-DB development board.

All drivers for the above are modular, except for the pin control
driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/multi_v7_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 084cc612ea23a1c7..42ff3d5a5198cee8 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -251,6 +251,7 @@ CONFIG_B53_SPI_DRIVER=m
 CONFIG_B53_MDIO_DRIVER=m
 CONFIG_B53_MMAP_DRIVER=m
 CONFIG_NET_DSA_BCM_SF2=m
+CONFIG_NET_DSA_RZN1_A5PSW=m
 CONFIG_SUN4I_EMAC=y
 CONFIG_SPI_AX88796C=m
 CONFIG_BCMGENET=m
@@ -474,6 +475,7 @@ CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
 CONFIG_PINCTRL_RZA2=y
+CONFIG_PINCTRL_RZN1=y
 CONFIG_GPIO_ASPEED_SGPIO=y
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -563,6 +565,7 @@ CONFIG_MESON_WATCHDOG=y
 CONFIG_DIGICOLOR_WATCHDOG=y
 CONFIG_RENESAS_WDT=m
 CONFIG_RENESAS_RZAWDT=m
+CONFIG_RENESAS_RZN1WDT=m
 CONFIG_STPMIC1_WATCHDOG=y
 CONFIG_PM8916_WATCHDOG=m
 CONFIG_BCM47XX_WDT=y
@@ -873,6 +876,7 @@ CONFIG_USB_ISP1301=y
 CONFIG_USB_MXS_PHY=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
+CONFIG_USB_RENESAS_USBF=m
 CONFIG_USB_ASPEED_VHUB=m
 CONFIG_USB_CONFIGFS=m
 CONFIG_USB_CONFIGFS_SERIAL=y
@@ -989,6 +993,7 @@ CONFIG_RTC_DRV_SH=m
 CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_AT91RM9200=m
 CONFIG_RTC_DRV_AT91SAM9=m
+CONFIG_RTC_DRV_RZN1=m
 CONFIG_RTC_DRV_VT8500=y
 CONFIG_RTC_DRV_SUNXI=y
 CONFIG_RTC_DRV_MV=y
@@ -1020,6 +1025,7 @@ CONFIG_UNIPHIER_MDMAC=y
 CONFIG_XILINX_DMA=y
 CONFIG_QCOM_BAM_DMA=y
 CONFIG_DW_DMAC=y
+CONFIG_RZN1_DMAMUX=m
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=m
 CONFIG_VIRTIO_PCI=y
-- 
2.34.1

