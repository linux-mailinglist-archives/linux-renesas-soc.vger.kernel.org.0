Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAF0EE4CDC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2019 15:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632814AbfJYN4P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Oct 2019 09:56:15 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:42192 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2632792AbfJYN4N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 09:56:13 -0400
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id HpwB2100X5USYZQ01pwBDx; Fri, 25 Oct 2019 15:56:11 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iO04Z-00052I-I6; Fri, 25 Oct 2019 15:56:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iO04Z-0008TK-Gs; Fri, 25 Oct 2019 15:56:11 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [LOCAL] arm64: renesas_defconfig: Refresh for v5.4-rc1
Date:   Fri, 25 Oct 2019 15:56:10 +0200
Message-Id: <20191025135610.32519-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update the defconfig for Renesas R-Car Gen3 boards:
  - Enable CONFIG_BACKLIGHT_CLASS_DEVICE (needed for
    CONFIG_BACKLIGHT_PWM, and no longer auto-enabled since commit
    bcd69da98e36afcc ("video: backlight: Drop default m for
    {LCD,BACKLIGHT_CLASS_DEVICE}")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be applied to topic/renesas-defconfig.
Not intended for upstream merge.
---
 arch/arm64/configs/renesas_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 2ad65929c95b63bf..22c6f37716f28758 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -215,7 +215,7 @@ CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
 CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
 CONFIG_DRM_DW_HDMI_CEC=y
 CONFIG_FB_MODE_HELPERS=y
-# CONFIG_LCD_CLASS_DEVICE is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_LOGO=y
-- 
2.17.1

