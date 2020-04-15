Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 563671AA214
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 14:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S370402AbgDOMuS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 08:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S370383AbgDOMuC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 08:50:02 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F83BC061A0C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 05:50:02 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:914e:4085:6cfb:e960])
        by baptiste.telenet-ops.be with bizsmtp
        id T0q02200f3Hq6Dg010q0kv; Wed, 15 Apr 2020 14:50:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jOhUO-0002CG-9U; Wed, 15 Apr 2020 14:50:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jOhUO-0000gT-7s; Wed, 15 Apr 2020 14:50:00 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL] arm64: renesas_defconfig: Refresh for v5.7-rc1
Date:   Wed, 15 Apr 2020 14:49:59 +0200
Message-Id: <20200415124959.2588-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update the defconfig for Renesas R-Car Gen3 boards:
  - Disable CONFIG_ARM64_AMU_EXTN (R-Car Gen3 is not ARMv8.4),
  - Enable CONFIG_DRM_DISPLAY_CONNECTOR (for HDMI, VGA, and composite
    display connectors on various boards, since commit 0c275c30176b2e78
    ("drm/bridge: Add bridge driver for display connectors")),
  - Replace CONFIG_DRM_DUMB_VGA_DAC by CONFIG_DRM_SIMPLE_BRIDGE (cfr.
    commit 0411374bdf2b3cc1 ("drm/bridge: dumb-vga-dac: Rename driver to
    simple-bridge")),
  - Disable CONFIG_VHOST_MENU (should not default to yes),
  - Drop CONFIG_ARCH_R8A7795=y (removed in commit 4ff27112282e5482
    ("soc: renesas: Remove ARCH_R8A7795")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be applied to topic/renesas-defconfig.
Not intended for upstream merge.

 arch/arm64/configs/renesas_defconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 1957279892e84ed8..1e01bdc22cedc5d7 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -50,6 +50,7 @@ CONFIG_COMPAT=y
 # CONFIG_ARM64_USE_LSE_ATOMICS is not set
 # CONFIG_ARM64_RAS_EXTN is not set
 # CONFIG_ARM64_PTR_AUTH is not set
+# CONFIG_ARM64_AMU_EXTN is not set
 # CONFIG_ARM64_E0PD is not set
 # CONFIG_ARCH_RANDOM is not set
 CONFIG_HIBERNATION=y
@@ -212,7 +213,8 @@ CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_RCAR_DW_HDMI=y
 CONFIG_DRM_PANEL_LVDS=y
-CONFIG_DRM_DUMB_VGA_DAC=y
+CONFIG_DRM_DISPLAY_CONNECTOR=y
+CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_THINE_THC63LVD1024=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
 CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
@@ -275,6 +277,7 @@ CONFIG_VFIO_PCI=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
+# CONFIG_VHOST_MENU is not set
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_VC5=y
@@ -288,7 +291,6 @@ CONFIG_IOMMU_IO_PGTABLE_LPAE=y
 CONFIG_ARCH_R8A774A1=y
 CONFIG_ARCH_R8A774B1=y
 CONFIG_ARCH_R8A774C0=y
-CONFIG_ARCH_R8A7795=y
 CONFIG_ARCH_R8A77950=y
 CONFIG_ARCH_R8A77951=y
 CONFIG_ARCH_R8A77960=y
-- 
2.17.1

