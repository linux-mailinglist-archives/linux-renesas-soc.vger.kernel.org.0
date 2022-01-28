Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF24D49F8F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jan 2022 13:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348345AbiA1ML2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jan 2022 07:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234483AbiA1ML0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jan 2022 07:11:26 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A6AC061714
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 04:11:26 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:3999:e79d:cb59:f2ec])
        by xavier.telenet-ops.be with bizsmtp
        id oCBQ2600E04fKGS01CBQLZ; Fri, 28 Jan 2022 13:11:24 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nDQ68-00BkzB-4x; Fri, 28 Jan 2022 13:11:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nDQ67-006WpB-Or; Fri, 28 Jan 2022 13:11:23 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v5.16-rc1
Date:   Fri, 28 Jan 2022 13:11:22 +0100
Message-Id: <074756244a653c6576da49c6f69e94a639c58b48.1643371851.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas R-Car Gen3 and RZ/G2 systems:
  - Enable CONFIG_RZG2L_THERMAL (RZ/G2L),
  - Enable CONFIG_RENESAS_RZG2LWDT (RZ/G2L SMARC EVK),
  - Enable CONFIG_DRM_RCAR_MIPI_DSI (R-Car V3U Falcon),
  - Enable CONFIG_RENESAS_OSTM (RZ/G2L SMARC EVK).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 8313526a19534805..ebf1918211dd865b 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -172,8 +172,10 @@ CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
+CONFIG_RZG2L_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_RENESAS_WDT=y
+CONFIG_RENESAS_RZG2LWDT=y
 CONFIG_MFD_BD9571MWV=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
@@ -242,6 +244,7 @@ CONFIG_DRM=y
 CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_RCAR_DW_HDMI=y
+CONFIG_DRM_RCAR_MIPI_DSI=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
@@ -322,6 +325,7 @@ CONFIG_HWSPINLOCK=y
 # CONFIG_FSL_ERRATUM_A008585 is not set
 # CONFIG_HISILICON_ERRATUM_161010101 is not set
 # CONFIG_ARM64_ERRATUM_858921 is not set
+CONFIG_RENESAS_OSTM=y
 CONFIG_MAILBOX=y
 CONFIG_IOMMU_IO_PGTABLE_LPAE=y
 CONFIG_ARCH_R8A77995=y
-- 
2.25.1

