Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E669765BF9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jan 2023 13:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237490AbjACMF0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Jan 2023 07:05:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237484AbjACMFP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jan 2023 07:05:15 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D2E9300
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Jan 2023 04:05:13 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:f1ca:ff0d:9dea:806e])
        by baptiste.telenet-ops.be with bizsmtp
        id 4C5C2900Q2YHDVW01C5CWa; Tue, 03 Jan 2023 13:05:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1pCg2a-001yqW-6z; Tue, 03 Jan 2023 13:05:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1pCg2Z-001OJG-Ly; Tue, 03 Jan 2023 13:05:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [LOCAL] arm64: renesas: defconfig: Refresh for v6.2-rc1
Date:   Tue,  3 Jan 2023 13:05:10 +0100
Message-Id: <d396219b7e1dae9dd9e687488e7a3bf7efa61593.1672747489.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

Refresh the defconfig for Renesas ARM64 systems:
  - Enable R-Car S4-8 Ethernet Switch and SERDES support,
  - Enable Marvell Alaska 10Gbit PHY support (Spider),
  - Enable RZ/G2L MIPI CSI-2 Receiver, Camera Receiving Unit, and MIPI
    DSI Encoder support (RZ/G2L SMARC EVK),
  - Drop CONFIG_DRM_RCAR_MIPI_DSI=y (auto-enabled since commit
    a830a15678593948 ("drm: rcar-du: Fix Kconfig dependency between
    RCAR_DU and RCAR_MIPI_DSI")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 23d649fdb6e1ac48..0f73d81f333d3344 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -135,6 +135,8 @@ CONFIG_TUN=y
 CONFIG_VIRTIO_NET=y
 CONFIG_SH_ETH=y
 CONFIG_RAVB=y
+CONFIG_RENESAS_ETHER_SWITCH=y
+CONFIG_MARVELL_10G_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_REALTEK_PHY=y
 CONFIG_CAN_RCAR=y
@@ -205,6 +207,8 @@ CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_RCAR_ISP=y
 CONFIG_VIDEO_RCAR_CSI2=y
 CONFIG_VIDEO_RCAR_VIN=y
+CONFIG_VIDEO_RZG2L_CSI2=y
+CONFIG_VIDEO_RZG2L_CRU=y
 CONFIG_VIDEO_RENESAS_FCP=y
 CONFIG_VIDEO_RENESAS_FDP1=y
 CONFIG_VIDEO_RENESAS_VSP1=y
@@ -256,7 +260,7 @@ CONFIG_DRM=y
 CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_RCAR_DW_HDMI=y
-CONFIG_DRM_RCAR_MIPI_DSI=y
+CONFIG_DRM_RZG2L_MIPI_DSI=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
@@ -377,6 +381,7 @@ CONFIG_PWM=y
 CONFIG_PWM_RCAR=y
 CONFIG_PWM_RENESAS_TPU=y
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
+CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=y
-- 
2.25.1

