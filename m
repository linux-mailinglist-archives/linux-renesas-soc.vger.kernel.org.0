Return-Path: <linux-renesas-soc+bounces-12801-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C21A247F9
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Feb 2025 10:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E38E31886C1A
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Feb 2025 09:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FBC13F42A;
	Sat,  1 Feb 2025 09:31:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A378B7DA9C;
	Sat,  1 Feb 2025 09:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738402307; cv=none; b=J1VT9YHtTS5O2re6uT2k3nBzwDqSBDgZ2sUKx9Q4Kn8tvVfCigjK9JFCofue4Qu0c126hRmIKWA1GjB8rK6mVB7FinYodNl/+x3X+Wu+8ZD38vRSzpb2aLpl1ydhJO+yZeRbqqFPSlay1VloCnf5+xUbn0FlnYcXbPB8IohTpLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738402307; c=relaxed/simple;
	bh=5RZtMtNLu0Q41bSJXCFOKdjwtWS9Rl8VTytdJTIKDwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CPz9t708bX/RsoFssFafXyQe/k7/Xcj48cR4fEGGFy+2czYD1d4K1C5PoqhKDWY0Z6Km6F/fKrOJQWJ1ESwrzAlghbLFGeHPwI5t7yuPDW4b/lxFav47LVc8Iyx1hxhg0q6Suj++aijQ8q0oYpdP9gDuLdWIaoWtqLQs/i3huHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: AkWdZp+FTmOL0FXebDBvzw==
X-CSE-MsgGUID: l7gPDljdTleUh2byncMmtA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Feb 2025 18:31:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.62])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8AC2941D4003;
	Sat,  1 Feb 2025 18:31:28 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] of: base: Add of_get_available_child_by_name()
Date: Sat,  1 Feb 2025 09:31:24 +0000
Message-ID: <20250201093126.7322-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are lot of drivers using of_get_child_by_name() followed by
of_device_is_available() to find the available child node by name for a
given parent. Provide a helper for these users to simplify the code.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description.
 * Updated kerneldoc comment block
 * Avoided code duplication by using of_get_child_by_name().

Note:
grep showed the below files will be the users for this new API.
I will be updating these drivers once this patch is in mainline.

drivers/net/dsa/rzn1_a5psw.c
drivers/net/can/rcar/rcar_canfd.c

drivers/net/ethernet/mediatek/mtk_star_emac.c
drivers/net/dsa/mt7530.c
drivers/net/dsa/sja1105/sja1105_mdio.c
drivers/net/dsa/qca/qca8k-8xxx.c
drivers/net/wireless/mediatek/mt76/mac80211.c
drivers/net/ethernet/ibm/emac/core.c
drivers/net/ethernet/ti/am65-cpsw-nuss.c
drivers/net/ethernet/actions/owl-emac.c
drivers/net/ethernet/mediatek/mtk_eth_soc.c
drivers/media/platform/samsung/exynos4-is/media-dev.h
drivers/gpu/drm/tegra/rgb.c
drivers/gpu/drm/msm/adreno/adreno_gpu.c
drivers/clk/davinci/pll.c
---
 drivers/of/base.c  | 27 +++++++++++++++++++++++++++
 include/linux/of.h |  9 +++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index af6c68bbb427..e37b088f1fad 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -824,6 +824,33 @@ struct device_node *of_get_child_by_name(const struct device_node *node,
 }
 EXPORT_SYMBOL(of_get_child_by_name);
 
+/**
+ * of_get_available_child_by_name - Find the available child node by name for a given parent
+ * @node:	parent node
+ * @name:	child name to look for.
+ *
+ * This function looks for child node for given matching name and checks the
+ * device's availability for use.
+ *
+ * Return: A node pointer if found, with refcount incremented, use
+ * of_node_put() on it when done.
+ * Returns NULL if node is not found.
+ */
+struct device_node *of_get_available_child_by_name(const struct device_node *node,
+						   const char *name)
+{
+	struct device_node *child;
+
+	child = of_get_child_by_name(node, name);
+	if (child && !of_device_is_available(child)) {
+		of_node_put(child);
+		return NULL;
+	}
+
+	return child;
+}
+EXPORT_SYMBOL(of_get_available_child_by_name);
+
 struct device_node *__of_find_node_by_path(const struct device_node *parent,
 						const char *path)
 {
diff --git a/include/linux/of.h b/include/linux/of.h
index eaf0e2a2b75c..9d6b8a61607f 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -301,6 +301,8 @@ extern struct device_node *of_get_compatible_child(const struct device_node *par
 					const char *compatible);
 extern struct device_node *of_get_child_by_name(const struct device_node *node,
 					const char *name);
+extern struct device_node *of_get_available_child_by_name(const struct device_node *node,
+							  const char *name);
 
 /* cache lookup */
 extern struct device_node *of_find_next_cache_node(const struct device_node *);
@@ -578,6 +580,13 @@ static inline struct device_node *of_get_child_by_name(
 	return NULL;
 }
 
+static inline struct device_node *of_get_available_child_by_name(
+					const struct device_node *node,
+					const char *name)
+{
+	return NULL;
+}
+
 static inline int of_device_is_compatible(const struct device_node *device,
 					  const char *name)
 {
-- 
2.43.0


