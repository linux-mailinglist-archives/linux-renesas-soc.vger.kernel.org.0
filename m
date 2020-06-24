Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B5820744E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 15:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389449AbgFXNTi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 09:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389040AbgFXNTh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 09:19:37 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A29D0C0613ED
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 06:19:37 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:55d:3294:1dc4:d387])
        by laurent.telenet-ops.be with bizsmtp
        id v1KY2200V3ySsk1011KYMg; Wed, 24 Jun 2020 15:19:36 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5JM-00027K-Kc; Wed, 24 Jun 2020 15:19:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5JM-0000yK-K8; Wed, 24 Jun 2020 15:19:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/7] ARM: shmobile: defconfig: Refresh for v5.8-rc1
Date:   Wed, 24 Jun 2020 15:19:25 +0200
Message-Id: <20200624131931.3686-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624131931.3686-1-geert+renesas@glider.be>
References: <20200624131931.3686-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas ARM boards:
  - Drop CONFIG_ZBOOT_ROM_TEXT=0x0 CONFIG_ZBOOT_ROM_BSS=0x0 (no longer
    needed since commit 39c3e304567a013a ("ARM: 8984/1: Kconfig: set
    default ZBOOT_ROM_TEXT/BSS value to 0x0")),
  - Move CONFIG_MEDIA_SUBDRV_AUTOSELECT (moved in commit
    1b80d36aeb92a767 ("media: Kconfig: move the position of sub-driver
    autoselection")),
  - Drop CONFIG_MEDIA_CONTROLLER=y and CONFIG_VIDEO_V4L2_SUBDEV_API=y
    (auto-enabled since commit 32a363d0b0b142f3 ("media: Kconfig files:
    use select for V4L2 subdevs and MC")),
  - Enable CONFIG_MEDIA_PLATFORM_SUPPORT (needed since commit
    06b93644f4d102bd ("media: Kconfig: add an option to filter in/out
    platform drivers")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/shmobile_defconfig | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 9cf3143025e1eea4..99ad932193268ce0 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -13,8 +13,6 @@ CONFIG_SMP=y
 CONFIG_SCHED_MC=y
 CONFIG_NR_CPUS=8
 CONFIG_HIGHMEM=y
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_KEXEC=y
 CONFIG_CPU_FREQ=y
@@ -109,16 +107,15 @@ CONFIG_REGULATOR_DA9210=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_MAX8973=y
 CONFIG_MEDIA_SUPPORT=y
+# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_MEDIA_CAMERA_SUPPORT=y
-CONFIG_MEDIA_CONTROLLER=y
-CONFIG_VIDEO_V4L2_SUBDEV_API=y
+CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_RCAR_VIN=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_RENESAS_FDP1=y
 CONFIG_VIDEO_RENESAS_JPU=y
 CONFIG_VIDEO_RENESAS_VSP1=y
-# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_VIDEO_ADV7180=y
 CONFIG_VIDEO_ADV7604=y
 CONFIG_VIDEO_ML86V7667=y
-- 
2.17.1

