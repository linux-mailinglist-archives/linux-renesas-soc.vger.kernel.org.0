Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC3CE4CB3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 15:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502085AbfJYNxb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 09:53:31 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:42258 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730937AbfJYNxb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 09:53:31 -0400
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id HptV2100C5USYZQ01ptV5e; Fri, 25 Oct 2019 15:53:29 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iO01x-00051n-74; Fri, 25 Oct 2019 15:53:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iO01x-0008On-4J; Fri, 25 Oct 2019 15:53:29 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v5.4-rc1
Date:   Fri, 25 Oct 2019 15:53:25 +0200
Message-Id: <20191025135325.32242-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update the defconfig for Renesas ARM boards:
  - Drop CONFIG_ARM_ERRATA_754322=y (auto-enabled since commit
    2eced4607a1e6f51 ("soc: renesas: Enable ARM_ERRATA_754322 for
    affected Cortex-A9")),
  - Drop CONFIG_MTD_M25P80=y (removed in commit b35b9a10362d2034 ("mtd:
    spi-nor: Move m25p80 code in spi-nor.c")),
  - Drop CONFIG_LCD_CLASS_DEVICE=n (no longer auto-enabled since commit
    bcd69da98e36afcc ("video: backlight: Drop default m for
    {LCD,BACKLIGHT_CLASS_DEVICE}")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.5.
---
 arch/arm/configs/shmobile_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index c6c70355141c38fa..bda57cafa2bcb9cc 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -9,7 +9,6 @@ CONFIG_PERF_EVENTS=y
 CONFIG_SLAB=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_PL310_ERRATA_588369=y
-CONFIG_ARM_ERRATA_754322=y
 CONFIG_SMP=y
 CONFIG_SCHED_MC=y
 CONFIG_NR_CPUS=8
@@ -50,7 +49,6 @@ CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_EEPROM_AT24=y
 CONFIG_BLK_DEV_SD=y
@@ -130,7 +128,6 @@ CONFIG_DRM_SII902X=y
 CONFIG_DRM_I2C_ADV7511=y
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_FB_SH_MOBILE_LCDC=y
-# CONFIG_LCD_CLASS_DEVICE is not set
 # CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_BACKLIGHT_AS3711=y
-- 
2.17.1

