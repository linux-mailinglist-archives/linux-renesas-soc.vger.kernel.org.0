Return-Path: <linux-renesas-soc+bounces-12775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8725A23B96
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 10:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 616F018884A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 09:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E316158875;
	Fri, 31 Jan 2025 09:48:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6054322B;
	Fri, 31 Jan 2025 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738316908; cv=none; b=s7Us+DfIyo/NI8p+7OnhwDt2mLTnrRcjt6xRQuN6iZ762j3wAcZmaNp+Bp8R0eM6GvyWWzF0YOW7zy5tgbDdyHcLL9H30N8PSUwJ/f3pjpDRR3U6sRR62vm3nSjecyn9IXvdjQx74OyFYbv3P71+zna4GjsLawlRw/idV7MafhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738316908; c=relaxed/simple;
	bh=xRljolmy4EZjS4PJvqMfPGESDbrhnm1m1LnJSC7HGq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bQetQE6Dii+pHULnMyntfBqc0w/EpVtfvCWGNHRuxcbGxTMewVfmFWANJjIvWCf/9wJ/ezjNKTCzI8fkjSzlBaJ6R3D0nnRxYqt5r5vs65a42bc4ONoec5bj9RRDw6j+bBCPOq7Jvv3Cy110ax42rEPiFio71Tx3ijo8teQe4Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Z+PrpjS4SYKuLNBTu5ZRNg==
X-CSE-MsgGUID: VxM4iI87TweP3hHFzGXvqg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 31 Jan 2025 18:48:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.122])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E4CBC40165B8;
	Fri, 31 Jan 2025 18:48:14 +0900 (JST)
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
Subject: [PATCH] of: base: Add of_get_available_child_by_name()
Date: Fri, 31 Jan 2025 09:48:10 +0000
Message-ID: <20250131094812.118340-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are lot of drivers using of_get_child_by_name() followed
by of_device_is_available() to check the child node availabilty
by name for a given parent. Provide a helper for these users to
simplify the code.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
grep showed the below files will be the user for this new API.
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
 drivers/of/base.c  | 28 ++++++++++++++++++++++++++++
 include/linux/of.h |  9 +++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index af6c68bbb427..3f5119fbfdb4 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -824,6 +824,34 @@ struct device_node *of_get_child_by_name(const struct device_node *node,
 }
 EXPORT_SYMBOL(of_get_child_by_name);
 
+/**
+ * of_get_available_child_by_name - Find the child node availabilty by name for a given parent
+ * @node:	parent node
+ * @name:	child name to look for.
+ *
+ * This function looks for child node for given matching name and check the
+ * device availability for use.
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
+	for_each_child_of_node(node, child)
+		if (of_node_name_eq(child, name))
+			break;
+
+	if (child && !of_device_is_available(child))
+		of_node_put(child);
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


