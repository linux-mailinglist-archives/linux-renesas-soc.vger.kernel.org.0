Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609AA207495
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 15:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403936AbgFXNbC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 09:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403949AbgFXNbB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 09:31:01 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09339C061797
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 06:31:00 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:55d:3294:1dc4:d387])
        by michel.telenet-ops.be with bizsmtp
        id v1Wz2200K3ySsk1061Wz5F; Wed, 24 Jun 2020 15:30:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5UR-0002aD-Ga; Wed, 24 Jun 2020 15:30:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5UR-0001Xd-Fe; Wed, 24 Jun 2020 15:30:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 6/7] arm64: renesas: defconfig: Enable ADV7511 support
Date:   Wed, 24 Jun 2020 15:30:56 +0200
Message-Id: <20200624133057.5860-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624133057.5860-1-geert+renesas@glider.be>
References: <20200624133057.5860-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for the Analog Devices ADV7511 video encoder, which is
used on various boards (Condor, Draak, Eagle, Ebisu, V3HSK, and V3MSK).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index dd1619e8ccd34d96..d761bdfd0b9da95f 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -230,6 +230,8 @@ CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_THINE_THC63LVD1024=y
+CONFIG_DRM_I2C_ADV7511=y
+CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
 CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
 CONFIG_DRM_DW_HDMI_CEC=y
-- 
2.17.1

