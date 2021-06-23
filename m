Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35BB53B1264
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhFWDtz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:49:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57852 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhFWDty (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:49:54 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9924EE51;
        Wed, 23 Jun 2021 05:47:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420055;
        bh=6NQgtVLndRjF2gy9zkQ6JM1jrFYS1CeXXgFotDV8qbQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=biLAj2toFDm/uPC5WLUYF+eFskgCJJss1OExBD1Xq6DDQ4aBulp31AtWmbX8uZKo6
         788b6ilZt7N0BDfBq/Nc78qGt78qOzOnd8WETzW0MlOus3wjPlu3t7aaU9pDkO1rIq
         EjYKpemuyPNdRU8ORbqNbIYbVJFhY4IbktLIE+dc=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 03/15] drm: rcar-du: dsi: Use the correct compatible
Date:   Wed, 23 Jun 2021 06:46:44 +0300
Message-Id: <20210623034656.10316-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

The compatible imported by the driver does not match the bindings
created.

Update accordingly.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index ef2a9b283b4e..0c9887557761 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -875,7 +875,7 @@ static int rcar_mipi_dsi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id rcar_mipi_dsi_of_table[] = {
-	{ .compatible = "renesas,r8a779a0-mipi-dsi" },
+	{ .compatible = "renesas,r8a779a0-dsi-csi2-tx" },
 	{ }
 };
 
-- 
Regards,

Laurent Pinchart

