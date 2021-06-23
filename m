Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F093B1265
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbhFWDtz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:49:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57852 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbhFWDtz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:49:55 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 740411518;
        Wed, 23 Jun 2021 05:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420056;
        bh=GPca9lm37gKSj2fVV51uF+EvI+9rdDy5phxvV9PtHTk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vdYBAjW8oO/9erhDRVvCDfN24bx0AFY6C0/fItzGOigogGsXLKPcWP65WES1EXYlo
         av4/p6CD+vLZzLVcK8jw5Yv5bSYqe8S2kJEmvlaSzulXLsHn/eT+JiqKtbuy1NLxQb
         wF4zg4iqjyWiy+9Jl7++0T/6lpjvrU1xfK7g9LDw=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 05/15] drm: rcar-du: dsi: Use dev_err_probe()
Date:   Wed, 23 Jun 2021 06:46:46 +0300
Message-Id: <20210623034656.10316-6-laurent.pinchart+renesas@ideasonboard.com>
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
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index 92cd431631bf..17cff0305c6c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -781,9 +781,8 @@ static struct clk *rcar_mipi_dsi_get_clock(struct rcar_mipi_dsi *mipi_dsi,
 	if (PTR_ERR(clk) == -ENOENT && optional)
 		return NULL;
 
-	if (PTR_ERR(clk) != -EPROBE_DEFER)
-		dev_err(mipi_dsi->dev, "failed to get %s clock\n",
-			name ? name : "module");
+	dev_err_probe(mipi_dsi->dev, PTR_ERR(clk), "failed to get %s clock\n",
+		      name ? name : "module");
 
 	return clk;
 }
-- 
Regards,

Laurent Pinchart

