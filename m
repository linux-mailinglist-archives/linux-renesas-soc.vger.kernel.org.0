Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646CE45EB95
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 11:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377239AbhKZKcu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 05:32:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376831AbhKZKat (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 05:30:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D15C0619F1;
        Fri, 26 Nov 2021 02:17:25 -0800 (PST)
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 082271253;
        Fri, 26 Nov 2021 11:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637921723;
        bh=/NxkguvbJpSme2X46XXvrov0xFXe3nBtHvsHHSVlCss=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pzzdZM+hekooz75iasjEsORioKOkxcFKn+cnUM0/LeFsdcLL+1vEv7atZ0R+MF5p7
         qf+lNFkA+1ZhnlpSAuUFmLYzA1jUsRtu2AN/xeK7QsBTgJ8peNLsGft4RkBsBDAzLo
         6/Zb9BqVBOKdwRDrAASuIXalJxDy+Jp8dCoFqcIo=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 2/4] drm: rcar-du: Select DRM_MIPI_DSI with DRM_RCAR_MIPI_DSI
Date:   Fri, 26 Nov 2021 10:15:16 +0000
Message-Id: <20211126101518.938783-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RCAR_MIPI_DSI uses the DRM_MIPI_DSI interface.

Ensure that it is selected when the option is enabled.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 8cb94fe90639..8145c6d4cbc8 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -41,6 +41,7 @@ config DRM_RCAR_LVDS
 config DRM_RCAR_MIPI_DSI
 	tristate "R-Car DU MIPI DSI Encoder Support"
 	depends on DRM && DRM_BRIDGE && OF
+	select DRM_MIPI_DSI
 	help
 	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
 
-- 
2.30.2

