Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A197F124994
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 15:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfLRO2D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 09:28:03 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:33254 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727114AbfLRO2D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 09:28:03 -0500
X-IronPort-AV: E=Sophos;i="5.69,329,1571670000"; 
   d="scan'208";a="34762563"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 18 Dec 2019 23:28:01 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5A464423740B;
        Wed, 18 Dec 2019 23:27:59 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ebiharaml@si-linux.co.jp
Subject: [PATCH LOCAL] arm64: renesas_defconfig: Enable DRM_PANEL_LVDS
Date:   Wed, 18 Dec 2019 14:27:39 +0000
Message-Id: <1576679259-20535-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The EK874 supports dual-LVDS panels, therefore enable the
corresponding panel driver in renesas_defconfig.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index e9730f6..c62ff47 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -208,6 +208,7 @@ CONFIG_DRM=y
 CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_RCAR_DW_HDMI=y
+CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_DUMB_VGA_DAC=y
 CONFIG_DRM_THINE_THC63LVD1024=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
-- 
2.7.4

