Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7982BF394B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 21:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfKGULg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 15:11:36 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:32690 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725906AbfKGULg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 15:11:36 -0500
X-IronPort-AV: E=Sophos;i="5.68,279,1569250800"; 
   d="scan'208";a="30895668"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Nov 2019 05:11:35 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 939F64008C62;
        Fri,  8 Nov 2019 05:11:30 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 5/7] drm/panel: panel-simple: Add connector type for etm0700g0dh6
Date:   Thu,  7 Nov 2019 20:11:01 +0000
Message-Id: <1573157463-14070-6-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add connector type for the etm0700g0dh6 from Emerging Display
Technologies (EDT).

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v2->v3:
* New patch
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5d48768..82065ff 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1342,6 +1342,7 @@ static const struct panel_desc edt_etm0700g0dh6 = {
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_PARALLEL,
 };
 
 static const struct panel_desc edt_etm0700g0bdh6 = {
-- 
2.7.4

