Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30B923F42F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Aug 2020 23:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgHGVWn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 17:22:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48442 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgHGVWn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 17:22:43 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B9E954E;
        Fri,  7 Aug 2020 23:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596835358;
        bh=PjQnxLstR8J/Vin/vZzG15w+dOZJXyHi4qOTh0mZ0uI=;
        h=From:To:Cc:Subject:Date:From;
        b=vZ9AMhkg3eKN4sy5DCc6tpjatHI7TBcoPKOACbSqEL6t+eVIzjjUNDLc1jZuR/XlW
         TvaAWtZlK+YqW2WFEKoSQepgXSsoIERJwSS7N0T6VEhDyUhEtDafnYBXDj8L91OHxt
         v2i9QDNbrfVDVGz0hRKT+ZnEepaWmVoQIG8WI9VM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Fix crash when enabling a non-visible plane
Date:   Sat,  8 Aug 2020 00:22:18 +0300
Message-Id: <20200807212218.24773-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DU driver handles non-visible planes (fully clipped by the display's
boundaries) by considering them as disabled. It thus disables the plane
at the hardware level when the plane if moved off-screen. However, if
the plane was previously disabled and is non-visible when it gets
enabled, the attempt to disable it crashes, ad the plane wasn't
previously enabled. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index f1a81c9b184d..ff233a7b398d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -279,7 +279,7 @@ static void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
 
 	if (plane->state->visible)
 		rcar_du_vsp_plane_setup(rplane);
-	else
+	else if (old_state->crtc)
 		vsp1_du_atomic_update(rplane->vsp->vsp, crtc->vsp_pipe,
 				      rplane->index, NULL);
 }
-- 
Regards,

Laurent Pinchart

