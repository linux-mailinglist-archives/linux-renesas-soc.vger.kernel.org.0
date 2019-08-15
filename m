Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79FAD8E988
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 13:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731563AbfHOLFL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 07:05:11 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:24976 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727814AbfHOLFL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 07:05:11 -0400
X-IronPort-AV: E=Sophos;i="5.64,388,1559487600"; 
   d="scan'208";a="24088303"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2019 20:05:09 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B1BF1417763E;
        Thu, 15 Aug 2019 20:05:04 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 4/9] drm/timings: Add link flags
Date:   Thu, 15 Aug 2019 12:04:28 +0100
Message-Id: <1565867073-24746-5-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We need more information to describe dual-LVDS links, therefore
introduce link_flags.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v1->v2:
* new patch

 include/drm/drm_timings.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/drm/drm_timings.h b/include/drm/drm_timings.h
index 4af8814..58fbf1b 100644
--- a/include/drm/drm_timings.h
+++ b/include/drm/drm_timings.h
@@ -1,4 +1,6 @@
 /*
+ * Copyright (C) 2019 Renesas Electronics Corporation
+ *
  * Permission to use, copy, modify, distribute, and sell this software and its
  * documentation for any purpose is hereby granted without fee, provided that
  * the above copyright notice appear in all copies and that both that copyright
@@ -21,6 +23,24 @@
 #ifndef __DRM_TIMINGS_H__
 #define __DRM_TIMINGS_H__
 
+#include <linux/bits.h>
+
+/**
+ * enum drm_link_flags - link_flags for &drm_timings
+ *
+ * This enum defines the details of the link.
+ *
+ * @DRM_LINK_DUAL_LVDS_ODD_EVEN:	Dual-LVDS link, with odd pixels (1,3,5,
+ *					etc.) coming through the first port, and
+ *					even pixels (0,2,4,etc.) coming through
+ *					the second port. If not specified for a
+ *					dual-LVDS panel, it is assumed that even
+ *					pixels are coming through the first port
+ */
+enum drm_link_flags {
+	DRM_LINK_DUAL_LVDS_ODD_EVEN = BIT(0),
+};
+
 /**
  * struct drm_timings - timing information
  */
@@ -55,6 +75,12 @@ struct drm_timings {
 	 * and odd-numbered pixels are received on separate links.
 	 */
 	bool dual_link;
+	/**
+	 * @link_flags
+	 *
+	 * Provides detailed information about the link.
+	 */
+	enum drm_link_flags link_flags;
 };
 
 #endif /* __DRM_TIMINGS_H__ */
-- 
2.7.4

