Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80851D743B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 13:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728771AbfJOLKL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 07:10:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54410 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728701AbfJOLKK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 07:10:10 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DFB6324;
        Tue, 15 Oct 2019 13:10:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571137808;
        bh=7N/vcjbHUP634pkpqBeAjmGDVE5vc9IYL17LL66ggYA=;
        h=From:To:Cc:Subject:Date:From;
        b=DMZ18oLzOuFiSYcHagG1uWOS3uDg9Gw9QZ9QyBWya5l/VJuCfw7fj2fs3JPuL1y6s
         ru/54BzQXggP6gL33xbOeeuMaxBCI3TlyYRbwHgPXw/AJF1E/Ye11Eh9xRK19b3FOD
         Thm95Zg/dypdQYxxDFM0GWw53BBQBQYvUgTWOSMg=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jiri Kosina <trivial@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/omapdrm: Fix trivial spelling
Date:   Tue, 15 Oct 2019 12:09:59 +0100
Message-Id: <20191015110959.30605-1-kieran.bingham+renesas@ideasonboard.com>
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

