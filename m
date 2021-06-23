Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8A73B126E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 05:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbhFWDuA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 23:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhFWDuA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 23:50:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE790C061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jun 2021 20:47:43 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 981D75FA2;
        Wed, 23 Jun 2021 05:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624420059;
        bh=Cia6PJXee1Tz7rQ/RGq2Ktjc49Qx8YuzAsWMFYVBYq8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JYBHWA/TAVYaqkCvq4vAAmYNgbIzklHM07mf/StIL7tuEEoQu8XzNYjuh2KEmsFuN
         RMhISgadcgf71pxxbIWR1xvAyQFp89EfuYbe9oJ8OMKu7b3Jyv8iTRYizGcwWzq7OU
         r6Fc8ZPscuL2rRb2mw75LK0Ylvnup+DALiHc/Tyc=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: [RFC PATCH 12/15] drm: rcar-du: dsi: Turn container_of() wrappers to inline functions
Date:   Wed, 23 Jun 2021 06:46:53 +0300
Message-Id: <20210623034656.10316-13-laurent.pinchart+renesas@ideasonboard.com>
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
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
index e8db56cc98f4..db31baecde7d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
@@ -49,14 +49,17 @@ struct rcar_mipi_dsi {
 	unsigned int lanes;
 };
 
-#define bridge_to_rcar_mipi_dsi(b) \
-	container_of(b, struct rcar_mipi_dsi, bridge)
+static inline struct rcar_mipi_dsi *
+bridge_to_rcar_mipi_dsi(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct rcar_mipi_dsi, bridge);
+}
 
-#define connector_to_rcar_mipi_dsi(c) \
-	container_of(c, struct rcar_mipi_dsi, connector)
-
-#define host_to_rcar_mipi_dsi(c) \
-	container_of(c, struct rcar_mipi_dsi, host)
+static inline struct rcar_mipi_dsi *
+host_to_rcar_mipi_dsi(struct mipi_dsi_host *host)
+{
+	return container_of(host, struct rcar_mipi_dsi, host);
+}
 
 static const u32 phtw[] = {
 	0x01020114, 0x01600115, /* General testing */
-- 
Regards,

Laurent Pinchart

