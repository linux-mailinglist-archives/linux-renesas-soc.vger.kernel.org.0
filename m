Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A74943B126A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbhFWDt6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:49:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57852 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbhFWDt6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:49:58 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A93A29B1;
        Wed, 23 Jun 2021 05:47:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420058;
        bh=BTf/TnMojDf6fDPiGsLrlSh1rN1RrsT8tdn1Ue0Sc0k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O9VLK4BoUmr6szdx2LXON4CRbS0DNjwMlhitVzORJTP83s7XZzZ5Qsc7nD3aEgE3h
         gXzf5txlFwh2SXZrFVDB3e63BozdqLtwUYeibInOIehhOwUUwX55TzopJo3RX1nd7J
         ZpTo/O29hrR472kTRsXcliIhNWQsqnz2/P5sTCvo=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 10/15] drm: rcar-du: dsi: Add error handling in rcar_mipi_dsi_clk_enable()
Date:   Wed, 23 Jun 2021 06:46:51 +0300
Message-Id: <20210623034656.10316-11-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index d16bf50e8acb..2ef82ef0edc5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -618,13 +618,19 @@ int rcar_mipi_dsi_clk_enable(struct drm_bridge *bridge)
 
 	ret = clk_prepare_enable(dsi->clocks.dsi);
 	if (ret < 0)
-		return ret;
+		goto err_clock_mod;
 
 	ret = rcar_mipi_dsi_startup(dsi);
 	if (ret < 0)
-		return ret;
+		goto err_clock_dsi;
 
 	return 0;
+
+err_clock_dsi:
+	clk_disable_unprepare(dsi->clocks.dsi);
+err_clock_mod:
+	clk_disable_unprepare(dsi->clocks.mod);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(rcar_mipi_dsi_clk_enable);
 
@@ -634,9 +640,7 @@ void rcar_mipi_dsi_clk_disable(struct drm_bridge *bridge)
 
 	rcar_mipi_dsi_shutdown(dsi);
 
-	/* Disable DSI clock and reset HW */
 	clk_disable_unprepare(dsi->clocks.dsi);
-
 	clk_disable_unprepare(dsi->clocks.mod);
 
 	reset_control_assert(dsi->rstc);
-- 
Regards,

Laurent Pinchart

