Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B4F45EB29
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 11:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376667AbhKZKUg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 05:20:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49756 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234676AbhKZKSg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 05:18:36 -0500
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1D3FE2C;
        Fri, 26 Nov 2021 11:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637921722;
        bh=OfttgS/xTaJk42xnYb6koDiIyJnqo0L8BOT6eZE1OgQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VZyFt9FCi9zKXqrILKVXyodaEYAj8d20xeYEKHgPaiK2Xz73/JPCtqNH2tdGA5JYk
         VelPUCSheUNNAWvP8TlYD1EfZ2aNZQZxutM23hRwrIgstuSIRtHSeuupde6pe/71Gc
         kBXCrSmgdA54f9ZfSZEteMdzAPBti9D5HtwO9d/4=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 1/4] drm: rcar-du: Fix Makefile indentation for DSI
Date:   Fri, 26 Nov 2021 10:15:15 +0000
Message-Id: <20211126101518.938783-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index adc1b49d02cf..286bc81b3e7c 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -19,7 +19,7 @@ obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
 obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
-obj-$(CONFIG_DRM_RCAR_MIPI_DSI)	+= rcar_mipi_dsi.o
+obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+= rcar_mipi_dsi.o
 
 # 'remote-endpoint' is fixed up at run-time
 DTC_FLAGS_rcar_du_of_lvds_r8a7790 += -Wno-graph_endpoint
-- 
2.30.2

