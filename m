Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C92F3949
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 21:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbfKGULb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 15:11:31 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:14789 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725906AbfKGULb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 15:11:31 -0500
X-IronPort-AV: E=Sophos;i="5.68,279,1569250800"; 
   d="scan'208";a="31108944"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Nov 2019 05:11:30 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E18844008C62;
        Fri,  8 Nov 2019 05:11:25 +0900 (JST)
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
Subject: [PATCH v3 4/7] drm: Define DRM_MODE_CONNECTOR_PARALLEL
Date:   Thu,  7 Nov 2019 20:11:00 +0000
Message-Id: <1573157463-14070-5-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The existing DRM_MODE_CONNECTOR_ definitions don't seem to
describe the connector for RGB/Parallel embedded displays,
hence add DRM_MODE_CONNECTOR_PARALLEL.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v2->v3:
* New patch
---
 drivers/gpu/drm/drm_connector.c | 1 +
 include/uapi/drm/drm_mode.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 2166000..b233029 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -93,6 +93,7 @@ static struct drm_conn_prop_enum_list drm_connector_enum_list[] = {
 	{ DRM_MODE_CONNECTOR_DPI, "DPI" },
 	{ DRM_MODE_CONNECTOR_WRITEBACK, "Writeback" },
 	{ DRM_MODE_CONNECTOR_SPI, "SPI" },
+	{ DRM_MODE_CONNECTOR_PARALLEL, "Parallel" },
 };
 
 void drm_connector_ida_init(void)
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 735c8cf..5852f47 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -362,6 +362,7 @@ enum drm_mode_subconnector {
 #define DRM_MODE_CONNECTOR_DPI		17
 #define DRM_MODE_CONNECTOR_WRITEBACK	18
 #define DRM_MODE_CONNECTOR_SPI		19
+#define DRM_MODE_CONNECTOR_PARALLEL	20
 
 struct drm_mode_get_connector {
 
-- 
2.7.4

