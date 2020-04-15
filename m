Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1031AA20B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 14:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S370366AbgDOMtg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 08:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S370360AbgDOMtb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 08:49:31 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB96C061A0C
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2020 05:49:30 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:914e:4085:6cfb:e960])
        by andre.telenet-ops.be with bizsmtp
        id T0pS2200P3Hq6Dg010pS0M; Wed, 15 Apr 2020 14:49:28 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jOhTq-0002Bg-G8; Wed, 15 Apr 2020 14:49:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jOhTq-0000fD-DM; Wed, 15 Apr 2020 14:49:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v5.7-rc1
Date:   Wed, 15 Apr 2020 14:49:23 +0200
Message-Id: <20200415124923.2510-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update the defconfig for Renesas ARM boards:
  - Enable CONFIG_DRM_DISPLAY_CONNECTOR (for HDMI, VGA, and composite
    display connectors on various R-Car H1, Gen2, and RZ/G1 boards,
    since commit 0c275c30176b2e78 ("drm/bridge: Add bridge driver for
    display connectors")),
  - Disable CONFIG_VIRTIO_MENU and CONFIG_VHOST_MENU (should not default
    to yes).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.8.

 arch/arm/configs/shmobile_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 838307a9bb922c36..361e8ffad829303b 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -125,6 +125,7 @@ CONFIG_VIDEO_ML86V7667=y
 CONFIG_DRM=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_LVDS_CODEC=y
 CONFIG_DRM_SII902X=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
@@ -170,6 +171,8 @@ CONFIG_RTC_DRV_DA9063=y
 CONFIG_DMADEVICES=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
 CONFIG_STAGING=y
 CONFIG_STAGING_BOARD=y
 # CONFIG_IOMMU_SUPPORT is not set
-- 
2.17.1

