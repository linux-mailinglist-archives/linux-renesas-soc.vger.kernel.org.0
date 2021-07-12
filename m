Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54ABC3C5ABE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jul 2021 13:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233166AbhGLKT4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Jul 2021 06:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbhGLKT4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jul 2021 06:19:56 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C731EC0613DD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jul 2021 03:17:07 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:f017:d84b:501f:cdd7])
        by albert.telenet-ops.be with bizsmtp
        id UAH32500a3dzGBx06AH3Cm; Mon, 12 Jul 2021 12:17:05 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m2szn-000WvV-En; Mon, 12 Jul 2021 12:17:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m2szm-00HF1s-Vq; Mon, 12 Jul 2021 12:17:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Restore graphical consoles
Date:   Mon, 12 Jul 2021 12:16:57 +0200
Message-Id: <2a4474be1d2c00c6ca97c2714844ea416a9ea9a9.1626084948.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As of commit f611b1e7624ccdbd ("drm: Avoid circular dependencies for
CONFIG_FB"), CONFIG_FB is no longer auto-enabled.  While CONFIG_FB may
be considered unneeded for systems where graphics is provided by a DRM
driver, R-Mobile A1 still relies on a frame buffer device driver for
graphics support.

Restore support for graphics on R-Mobile A1 and graphical consoles on
DRM-based systems by explicitly enabling CONFIG_FB in the defconfig for
Renesas ARM systems.

Fixes: f611b1e7624ccdbd ("drm: Avoid circular dependencies for CONFIG_FB")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued as a fix for v5.14.
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 66c8b0980a0a744d..d9a27e4e09140b43 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -135,6 +135,7 @@ CONFIG_DRM_SII902X=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_I2C_ADV7511=y
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
+CONFIG_FB=y
 CONFIG_FB_SH_MOBILE_LCDC=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_BACKLIGHT_AS3711=y
-- 
2.25.1

