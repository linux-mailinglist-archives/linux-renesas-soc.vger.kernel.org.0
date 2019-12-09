Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C506116D28
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 13:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbfLIMd0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 07:33:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60256 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfLIMd0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 07:33:26 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAEC299A;
        Mon,  9 Dec 2019 13:33:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575894804;
        bh=7N/vcjbHUP634pkpqBeAjmGDVE5vc9IYL17LL66ggYA=;
        h=From:To:Cc:Subject:Date:From;
        b=Euv+PyGQo6xXjItwNMtL2j2iPC+a9H64ZcS2oauGOLiv8XmWUexr2gs1k0X60JkI3
         jKeWDaX0yk4pi/ep5Pr7XU/8BR8rjHVYbuDCuhdvQPfQw47t1wnsKQzcyvP2TxDhQ3
         wxxF7Sdcx44jHGPWZllCdDjsSCl0v49UlZVJDP2k=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jiri Kosina <trivial@kernel.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR TI OMAP),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/omapdrm: Fix trivial spelling
Date:   Mon,  9 Dec 2019 12:33:19 +0000
Message-Id: <20191209123320.10186-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix trivial spelling identified while examining the code.

	s/supprted./supported./

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 3c5ddbf30e97..fce7e944a280 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -831,7 +831,7 @@ struct drm_crtc *omap_crtc_init(struct drm_device *dev,
 	 * OMAP_DSS_CHANNEL_DIGIT. X server assumes 256 element gamma
 	 * tables so lets use that. Size of HW gamma table can be
 	 * extracted with dispc_mgr_gamma_size(). If it returns 0
-	 * gamma table is not supprted.
+	 * gamma table is not supported.
 	 */
 	if (priv->dispc_ops->mgr_gamma_size(priv->dispc, channel)) {
 		unsigned int gamma_lut_size = 256;
-- 
2.20.1

