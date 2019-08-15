Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56BE28E98A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 13:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731333AbfHOLFR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 07:05:17 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:24976 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727814AbfHOLFQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 07:05:16 -0400
X-IronPort-AV: E=Sophos;i="5.64,388,1559487600"; 
   d="scan'208";a="24088309"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2019 20:05:15 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F1625417763E;
        Thu, 15 Aug 2019 20:05:09 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 5/9] drm/panel: Add timings field to drm_panel
Date:   Thu, 15 Aug 2019 12:04:29 +0100
Message-Id: <1565867073-24746-6-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We need to know if the panel supports dual-link, similarly
to bridges, therefore add a reference to drm_timings in
drm_panel.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v1->v2:
* new patch

 include/drm/drm_panel.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 8c738c0..cd6ff07 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -26,6 +26,7 @@
 
 #include <linux/errno.h>
 #include <linux/list.h>
+#include <drm/drm_timings.h>
 
 struct device_node;
 struct drm_connector;
@@ -81,6 +82,7 @@ struct drm_panel_funcs {
  * struct drm_panel - DRM panel object
  * @drm: DRM device owning the panel
  * @connector: DRM connector that the panel is attached to
+ * @timings: timing information
  * @dev: parent device of the panel
  * @link: link from panel device (supplier) to DRM device (consumer)
  * @funcs: operations that can be performed on the panel
@@ -89,6 +91,7 @@ struct drm_panel_funcs {
 struct drm_panel {
 	struct drm_device *drm;
 	struct drm_connector *connector;
+	const struct drm_timings *timings;
 	struct device *dev;
 
 	const struct drm_panel_funcs *funcs;
-- 
2.7.4

