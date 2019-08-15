Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33A198E98C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 13:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730775AbfHOLFU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 07:05:20 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:24976 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727814AbfHOLFU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 07:05:20 -0400
X-IronPort-AV: E=Sophos;i="5.64,388,1559487600"; 
   d="scan'208";a="24088316"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2019 20:05:19 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BB4DA41773C3;
        Thu, 15 Aug 2019 20:05:15 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 6/9] drm: rcar-du: lvds: Fix companion's mode
Date:   Thu, 15 Aug 2019 12:04:30 +0100
Message-Id: <1565867073-24746-7-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The companion encoder needs to be told to use the same
mode as the primary encoder.

Fixes: e9e8798ab7b8 ("drm: rcar-du: lvds: Add support for dual-link mode")
Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v1->v2:
* reworked according to Laurent's feedback

 drivers/gpu/drm/rcar-du/rcar_lvds.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 3fe0b86..41d28f4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -603,6 +603,11 @@ static void rcar_lvds_mode_set(struct drm_bridge *bridge,
 	lvds->display_mode = *adjusted_mode;
 
 	rcar_lvds_get_lvds_mode(lvds);
+	if (lvds->companion) {
+		struct rcar_lvds *companion_lvds = bridge_to_rcar_lvds(
+							lvds->companion);
+		companion_lvds->mode = lvds->mode;
+	}
 }
 
 static int rcar_lvds_attach(struct drm_bridge *bridge)
-- 
2.7.4

