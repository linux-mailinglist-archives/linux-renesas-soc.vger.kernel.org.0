Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B7944ECC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 19:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235595AbhKLSrO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 13:47:14 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:47244 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229892AbhKLSrN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 13:47:13 -0500
X-IronPort-AV: E=Sophos;i="5.87,230,1631545200"; 
   d="scan'208";a="100419172"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Nov 2021 03:44:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.48])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4CF0340D5E9A;
        Sat, 13 Nov 2021 03:44:20 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/4] reset: Add of_reset_control_get_optional_exclusive()
Date:   Fri, 12 Nov 2021 18:44:10 +0000
Message-Id: <20211112184413.4391-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add optional variant of of_reset_control_get_exclusive(). If the
requested reset is not specified in the device tree, this function
returns NULL instead of an error.

Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
 * Added Geert's Rb tag
---
 include/linux/reset.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/reset.h b/include/linux/reset.h
index db0e6115a2f6..8a21b5756c3e 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -454,6 +454,26 @@ static inline struct reset_control *of_reset_control_get_exclusive(
 	return __of_reset_control_get(node, id, 0, false, false, true);
 }
 
+/**
+ * of_reset_control_get_optional_exclusive - Lookup and obtain an optional exclusive
+ *                                           reference to a reset controller.
+ * @node: device to be reset by the controller
+ * @id: reset line name
+ *
+ * Optional variant of of_reset_control_get_exclusive(). If the requested reset
+ * is not specified in the device tree, this function returns NULL instead of
+ * an error.
+ *
+ * Returns a struct reset_control or IS_ERR() condition containing errno.
+ *
+ * Use of id names is optional.
+ */
+static inline struct reset_control *of_reset_control_get_optional_exclusive(
+				struct device_node *node, const char *id)
+{
+	return __of_reset_control_get(node, id, 0, false, true, true);
+}
+
 /**
  * of_reset_control_get_shared - Lookup and obtain a shared reference
  *                               to a reset controller.
-- 
2.17.1

