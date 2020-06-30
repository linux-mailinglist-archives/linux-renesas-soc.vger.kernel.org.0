Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5990C20FA44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 19:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbgF3RPE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Jun 2020 13:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728044AbgF3RPE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jun 2020 13:15:04 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDF7C061755
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2020 10:15:04 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:503c:ab8:1424:9638])
        by baptiste.telenet-ops.be with bizsmtp
        id xVF22200549uj5301VF2sA; Tue, 30 Jun 2020 19:15:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jqJqY-0002rd-9U; Tue, 30 Jun 2020 19:15:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jqJqY-0002zE-6w; Tue, 30 Jun 2020 19:15:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: defconfig: Enable additional support for Renesas platforms
Date:   Tue, 30 Jun 2020 19:15:00 +0200
Message-Id: <20200630171500.11438-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Increase build and test coverage by enabling support for more hardware
present on Renesas SoCs and boards:
  - Renesas Gigabit Ethernet Controller on R-Car V3H, as used on the
    Condor and V3HSK boards,
  - Sony IMX219 and OmniVision OV5645 cameras, as used on the
    AISTARVISION MIPI Adapter V2.1,
  - Analog Devices ADV7511 HDMI audio, as used on various boards
    (Condor, Draak, Eagle, Ebisu, V3HSK, and V3MSK).

All of the above are modular, except for Ethernet support (HDMI Audio
support is an optional feature of the modular ADV7511 driver).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.9.

I would also like to enable support for the Analog Devices ADV7180 video
decoder and ADV7604 HDMI receiver, as used on the Draak board:

    CONFIG_VIDEO_ADV7180=m
    CONFIG_VIDEO_ADV7604=m
    CONFIG_VIDEO_ADV7604_CEC=y

But these are unselectable (invisible) with MEDIA_SUBDRV_AUTOSELECT and
MEDIA_HIDE_ANCILLARY_SUBDRV, and I'm not brave enough to dare touching
the latter.
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 883e8bace3ed2567..1a0e59d6fb374602 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -309,6 +309,7 @@ CONFIG_MLX5_CORE=m
 CONFIG_MLX5_CORE_EN=y
 CONFIG_QCOM_EMAC=m
 CONFIG_RMNET=m
+CONFIG_SH_ETH=y
 CONFIG_RAVB=y
 CONFIG_SMC91X=y
 CONFIG_SMSC911X=y
@@ -593,6 +594,8 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_IMX219=m
+CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_QCOM_CAMSS=m
 CONFIG_DRM=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
@@ -628,6 +631,7 @@ CONFIG_DRM_SII902X=m
 CONFIG_DRM_THINE_THC63LVD1024=m
 CONFIG_DRM_TI_SN65DSI86=m
 CONFIG_DRM_I2C_ADV7511=m
+CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
 CONFIG_DRM_DW_HDMI_CEC=m
 CONFIG_DRM_VC4=m
-- 
2.17.1

