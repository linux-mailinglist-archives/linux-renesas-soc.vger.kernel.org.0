Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC7E44BBBCD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Feb 2022 16:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234762AbiBRPGW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Feb 2022 10:06:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233904AbiBRPGV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Feb 2022 10:06:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C562B2FF4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Feb 2022 07:06:03 -0800 (PST)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38FE0482;
        Fri, 18 Feb 2022 16:06:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645196761;
        bh=rwwMKqwZZbpT+GB+iWjjccJ4CPGmW7NoOwERBtmZDs0=;
        h=From:To:Cc:Subject:Date:From;
        b=IKgla2C0sf5pyVsMJ35nj9dF9BZNP7vfveQU7LmoHhZO5nJYbJ+peGKqRnQml8Kpn
         cWimKa2WUHn0Z4ao+fAdbpiN3tXReHZwH/VxA+vRgcraeL3XHNgmeLAt04/NuPmHIn
         ThKcyvkgIsYECFaOqFiTZ9zr8L7DqCc/fdSC9K64=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] [LOCAL] arm64: renesas: defconfig: Add DRM_TI_SN65DSI86
Date:   Fri, 18 Feb 2022 15:05:58 +0000
Message-Id: <20220218150558.1748594-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the TI SN65DSI86 to the renesas defconfig to support the V3U
platform which uses it.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 02e9546c3bea..2c597d368769 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -256,6 +256,7 @@ CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
 CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
 CONFIG_DRM_DW_HDMI_CEC=y
+CONFIG_DRM_TI_SN65DSI86=y
 CONFIG_FB=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-- 
2.32.0

