Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1597B0367
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Sep 2023 13:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjI0L6Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Sep 2023 07:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230496AbjI0L6Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2023 07:58:24 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D37BC180
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Sep 2023 04:58:22 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:cafc:ec85:941b:7b06])
        by michel.telenet-ops.be with bizsmtp
        id qzyL2A00D56e2kz06zyLYr; Wed, 27 Sep 2023 13:58:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qlTAx-004iu8-Re;
        Wed, 27 Sep 2023 13:58:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qlTBM-000sW0-93;
        Wed, 27 Sep 2023 13:58:20 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.6-rc3
Date:   Wed, 27 Sep 2023 13:58:19 +0200
Message-Id: <deff2f201f0c47e35aa324a1a973427b80d0839b.1695815858.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refresh the defconfig for Renesas ARM64 systems:

  - Enable CONFIG_DRM_FBDEV_EMULATION and CONFIG_FB_DEVICE (no longer
    auto-enabled since commit bb6c4507fe825f1b ("drm: fix up fbdev
    Kconfig defaults")),
  - Drop CONFIG_FRAMEBUFFER_CONSOLE=y (auto-enabled since commit
    bb6c4507fe825f1b ("drm: fix up fbdev Kconfig defaults")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 78d5d35ae9a12d6e..46af31ce514c404a 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -262,6 +262,7 @@ CONFIG_VIDEO_ADV7604_CEC=y
 # CONFIG_MEDIA_TUNER_XC4000 is not set
 # CONFIG_MEDIA_TUNER_XC5000 is not set
 CONFIG_DRM=y
+CONFIG_DRM_FBDEV_EMULATION=y
 CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_RCAR_DW_HDMI=y
@@ -276,9 +277,9 @@ CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
 CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
 CONFIG_DRM_DW_HDMI_CEC=y
+CONFIG_FB_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
-- 
2.34.1

