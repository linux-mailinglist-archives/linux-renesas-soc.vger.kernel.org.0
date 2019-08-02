Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0612D7ED92
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 09:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389928AbfHBHfO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 03:35:14 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:20347 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389759AbfHBHfN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 03:35:13 -0400
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; 
   d="scan'208";a="22931998"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Aug 2019 16:35:12 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 58AB740078B4;
        Fri,  2 Aug 2019 16:35:09 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH/RFC 08/12] drm: rcar-du: lvds: Fix bridge_to_rcar_lvds
Date:   Fri,  2 Aug 2019 08:34:05 +0100
Message-Id: <1564731249-22671-9-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Using name "bridge" for macro bridge_to_rcar_lvds argument doesn't
work when the pointer name used by the caller is not "bridge".
Rename the argument to "bridge_ptr" to allow for any pointer
name.

Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 97c51c2..edd63f5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -72,8 +72,8 @@ struct rcar_lvds {
 	bool stripe_swap_data;
 };
 
-#define bridge_to_rcar_lvds(bridge) \
-	container_of(bridge, struct rcar_lvds, bridge)
+#define bridge_to_rcar_lvds(bridge_ptr) \
+	container_of(bridge_ptr, struct rcar_lvds, bridge)
 
 #define connector_to_rcar_lvds(connector) \
 	container_of(connector, struct rcar_lvds, connector)
-- 
2.7.4

