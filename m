Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33F5E3D9224
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 17:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhG1Phv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jul 2021 11:37:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55974 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhG1Phu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jul 2021 11:37:50 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1727EE;
        Wed, 28 Jul 2021 17:37:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627486667;
        bh=0ZJHvaI8W/1oEbU5Io9P1NcXxlZDJPRKMCm3FF4wyfU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ff0QLuWxbLX3ovtOpdBweNSVtr09z2BE0G2L/NrjbEQ/SkwlJ8q0GyUtBtCbMI7kz
         hLtmV45ObCLrNhtE1NV/MHx9WUrMy7/+Jty/ubeozP4P8TA9RwNuXoU1YfjXvDUAR1
         Nbkco8cNSQVtuDy4nS/O/xkefwycKE0m2KMpA2i8=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Tomi Valkeinen <tomba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>
Subject: [PATCH 1/7] drm/omap: Cast pointer to integer safely
Date:   Wed, 28 Jul 2021 18:37:30 +0300
Message-Id: <20210728153736.15240-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 64-bit platforms, the compiler complains that casting a void pointer
to an unsigned int loses data. Cast the pointer to a uintptr_t unsigned
to fix this.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index f86e20578143..c05d3975cb31 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -572,7 +572,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	priv->dss->mgr_ops_priv = priv;
 
 	soc = soc_device_match(omapdrm_soc_devices);
-	priv->omaprev = soc ? (unsigned int)soc->data : 0;
+	priv->omaprev = soc ? (uintptr_t)soc->data : 0;
 	priv->wq = alloc_ordered_workqueue("omapdrm", 0);
 
 	mutex_init(&priv->list_lock);
-- 
Regards,

Laurent Pinchart

