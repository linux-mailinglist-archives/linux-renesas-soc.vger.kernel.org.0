Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7F01E18DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2020 03:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388360AbgEZBPx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 21:15:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54362 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388348AbgEZBPx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 21:15:53 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC2641C88;
        Tue, 26 May 2020 03:15:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590455749;
        bh=Gqb2ws55rij00jZ+ItJ3UN/h8OQTFGoMoOeB89EWlpY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mNypmlcBjfaI9LdF/l2V22gFhOqnkj37CU+celyhqZf6alBJ7OPNSAZbQzeQNtqjz
         aUuHDM8sa6lRSlr0isaqIs4K7sGo2YkEex++9q1eDYnWpilAOnQDTpTQEJ0bC1PPQ5
         MFZH3HiVI2v4VQseYN/CoP9U98oW/SMSJqxO1VkA=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 25/27] drm: rcar-du: Fix error handling in rcar_du_encoder_init()
Date:   Tue, 26 May 2020 04:15:03 +0300
Message-Id: <20200526011505.31884-26-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When attaching the bridge returns an error, the rcar_du_encoder_init()
function calls drm_encoder_cleanup() manually instead of jumping to the
error handling path that frees memory. Fix it.

Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index b0335da0c161..72bf6e2c7933 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -115,8 +115,9 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 	 */
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret) {
-		drm_encoder_cleanup(encoder);
-		return ret;
+		dev_err(rcdu->dev, "failed to attach bridge for output %u\n",
+			output);
+		goto done;
 	}
 
 done:
-- 
Regards,

Laurent Pinchart

