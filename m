Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB1E2A09AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2019 20:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfH1ShH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Aug 2019 14:37:07 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:45272 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727025AbfH1ShH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 14:37:07 -0400
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; 
   d="scan'208";a="25166335"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2019 03:37:05 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8C043400A897;
        Thu, 29 Aug 2019 03:37:01 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, sam@ravnborg.org
Subject: [PATCH v3 3/8] drm: Add bus timings helper
Date:   Wed, 28 Aug 2019 19:36:37 +0100
Message-Id: <1567017402-5895-4-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Helper to provide bus timing information.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v2->v3:
* new patch
---
 drivers/gpu/drm/Makefile          |  3 +-
 drivers/gpu/drm/drm_bus_timings.c | 97 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_bus_timings.h     | 21 +++++++++
 3 files changed, 120 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_bus_timings.c
 create mode 100644 include/drm/drm_bus_timings.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 9f0d2ee..a270063 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -17,7 +17,8 @@ drm-y       :=	drm_auth.o drm_cache.o \
 		drm_plane.o drm_color_mgmt.o drm_print.o \
 		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
 		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
-		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o
+		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
+		drm_bus_timings.o
 
 drm-$(CONFIG_DRM_LEGACY) += drm_legacy_misc.o drm_bufs.o drm_context.o drm_dma.o drm_scatter.o drm_lock.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
diff --git a/drivers/gpu/drm/drm_bus_timings.c b/drivers/gpu/drm/drm_bus_timings.c
new file mode 100644
index 0000000..e2ecd22
--- /dev/null
+++ b/drivers/gpu/drm/drm_bus_timings.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <drm/drm_bus_timings.h>
+#include <linux/errno.h>
+#include <linux/of_graph.h>
+#include <linux/of.h>
+#include <linux/types.h>
+
+#define DRM_OF_LVDS_ODD		1
+#define DRM_OF_LVDS_EVEN	2
+
+static int drm_of_lvds_get_port_pixels_type(struct device_node *port_node)
+{
+	bool even_pixels, odd_pixels;
+
+	even_pixels = of_property_read_bool(port_node, "dual-lvds-even-pixels");
+	odd_pixels = of_property_read_bool(port_node, "dual-lvds-odd-pixels");
+	return  even_pixels * DRM_OF_LVDS_EVEN + odd_pixels * DRM_OF_LVDS_ODD;
+}
+
+/**
+ * drm_of_lvds_get_dual_link_configuration - get the dual-LVDS configuration
+ * @p1: device tree node corresponding to the first port of the source
+ * @p2: device tree node corresponding to the second port of the source
+ *
+ * An LVDS dual-link bus is made of two connections, even pixels transit on one
+ * connection, and odd pixels transit on the other connection.
+ * This function walks the DT (from the source ports to the sink ports) looking
+ * for a dual-LVDS bus. A dual-LVDS bus is identfied by markers found on the DT
+ * ports of the sink device(s). If such a bus is found, this function returns
+ * its configuration (either p1 connected to the even pixels port and p2
+ * connected to the odd pixels port, or p1 connected to the odd pixels port and
+ * p2 connected to the even pixels port).
+ *
+ * Return: A code describing the bus configuration when a valid dual-LVDS bus is
+ * found, or an error code when no valid dual-LVDS bus is found
+ *
+ * Possible codes for the bus configuration are:
+ *
+ * - DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS: when p1 is connected to the even pixels
+ *   port and p2 is connected to the odd pixels port
+ * - DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS: when p1 is connected to the odd pixels
+ *   port and p2 is connected to the even pixels port
+ *
+ */
+int drm_of_lvds_get_dual_link_configuration(const struct device_node *p1,
+					    const struct device_node *p2)
+{
+	struct device_node *remote_p1 = NULL, *remote_p2 = NULL;
+	struct device_node *parent_p1 = NULL, *parent_p2 = NULL;
+	struct device_node *ep1 = NULL, *ep2 = NULL;
+	u32 reg_p1, reg_p2;
+	int ret = -EINVAL, remote_p1_pt, remote_p2_pt;
+
+	if (!p1 || !p2)
+		return ret;
+	if (of_property_read_u32(p1, "reg", &reg_p1) ||
+	    of_property_read_u32(p2, "reg", &reg_p2))
+		return ret;
+	parent_p1 = of_get_parent(p1);
+	parent_p2 = of_get_parent(p2);
+	if (!parent_p1 || !parent_p2)
+		goto done;
+	ep1 = of_graph_get_endpoint_by_regs(parent_p1, reg_p1, 0);
+	ep2 = of_graph_get_endpoint_by_regs(parent_p2, reg_p2, 0);
+	if (!ep1 || !ep2)
+		goto done;
+	remote_p1 = of_graph_get_remote_port(ep1);
+	remote_p2 = of_graph_get_remote_port(ep2);
+	if (!remote_p1 || !remote_p2)
+		goto done;
+	remote_p1_pt = drm_of_lvds_get_port_pixels_type(remote_p1);
+	remote_p2_pt = drm_of_lvds_get_port_pixels_type(remote_p2);
+	/*
+	 * A valid dual-lVDS bus is found when one remote port is marked with
+	 * "dual-lvds-even-pixels", and the other remote port is marked with
+	 * "dual-lvds-odd-pixels", bail out if the markers are not right.
+	 */
+	if (!remote_p1_pt || !remote_p2_pt ||
+	    remote_p1_pt + remote_p2_pt != DRM_OF_LVDS_EVEN + DRM_OF_LVDS_ODD)
+		goto done;
+	if (remote_p1_pt == DRM_OF_LVDS_EVEN)
+		/* The sink expects even pixels through the first port */
+		ret = DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS;
+	else
+		/* The sink expects odd pixels through the first port */
+		ret = DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
+
+done:
+	of_node_put(ep1);
+	of_node_put(ep2);
+	of_node_put(parent_p1);
+	of_node_put(parent_p2);
+	of_node_put(remote_p1);
+	of_node_put(remote_p2);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_configuration);
diff --git a/include/drm/drm_bus_timings.h b/include/drm/drm_bus_timings.h
new file mode 100644
index 0000000..db8a385
--- /dev/null
+++ b/include/drm/drm_bus_timings.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DRM_BUS_TIMINGS__
+#define __DRM_BUS_TIMINGS__
+
+struct device_node;
+
+#define DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS	0
+#define DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS	1
+
+#ifdef CONFIG_OF
+int drm_of_lvds_get_dual_link_configuration(const struct device_node *p1,
+					    const struct device_node *p2);
+#else
+int drm_of_lvds_get_dual_link_configuration(const struct device_node *p1,
+					    const struct device_node *p2)
+{
+	return -EINVAL;
+}
+#endif
+
+#endif /* __DRM_BUS_TIMINGS__ */
-- 
2.7.4

