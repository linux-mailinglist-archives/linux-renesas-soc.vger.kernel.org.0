Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E11AD2CF688
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Dec 2020 23:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgLDWCa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 17:02:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:52062 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbgLDWCa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 17:02:30 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15E5EF7F;
        Fri,  4 Dec 2020 23:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607119306;
        bh=tAq9o37PSYjRprEYfuzn9Wm7XARcW+0bWrGAcGlGnz8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GrG4rMCGnw3h7uRPkNH0rj45oLPmg+a+JA3bdCDvfPEs1n7I3u2/lCRD9cFOUg9eS
         v0i56OqDaYWTxEBKAi6m7OPED8wJFljw8lmzf7xWTNLSReukD5aDzXylIJWm9+z6+D
         GKjVWIHjkBgXrtT6gp93g2i2zjEPgy+5DTinibzE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/9] drm: rcar-du: Release vsp device reference in all error paths
Date:   Sat,  5 Dec 2020 00:01:32 +0200
Message-Id: <20201204220139.15272-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use drmm_add_action_or_reset() instead of drmm_add_action() to ensure
the vsp device reference is released in case the function call fails.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index f6a69aa116e6..4dcb1bfbe201 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -364,7 +364,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 
 	vsp->vsp = &pdev->dev;
 
-	ret = drmm_add_action(rcdu->ddev, rcar_du_vsp_cleanup, vsp);
+	ret = drmm_add_action_or_reset(rcdu->ddev, rcar_du_vsp_cleanup, vsp);
 	if (ret < 0)
 		return ret;
 
-- 
Regards,

Laurent Pinchart

