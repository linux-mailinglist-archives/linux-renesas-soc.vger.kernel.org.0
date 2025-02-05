Return-Path: <linux-renesas-soc+bounces-12863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 326F1A28A83
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 13:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0900162176
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 12:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6775C22A80B;
	Wed,  5 Feb 2025 12:42:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AB0151987;
	Wed,  5 Feb 2025 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759373; cv=none; b=IGG8av1J2M9xX3F55UYTuPgVn8lV5SFxQAEiguuLw/M2blW/eWqga9aGx0YI5EN0d16wYmK7g0TnC7uGpbQk5NXuQz++PgxsrglRoEiVjHOylXomZciQm00fnjq2w/RtEmtaSYco1COJX1mDlnvkm8mjRQWXyHPx3nV+67qD52s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759373; c=relaxed/simple;
	bh=YEYdw+RFyZttEyYMNGQiwpZ9nMRJRavaUV89oFfVInc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJTT6M8a3edwlJ8yiSG1JdvP1Z5wP134LodXIU47wyC8h7js37oDVSqBDyh/tsADvOCrz9W41bjpABBCLrxzwViyALtllIG8MMTo+Eczq05dzsMmyFP7uEGZzopFyRZUmUwWqO7gTd8+tVc9q7agA5yfldguBMd0Ys9l+SAlY4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: qJDgGzujQ7SrbqbP/MsImQ==
X-CSE-MsgGUID: Pn+2gzssSaqklt7ImdEg4g==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Feb 2025 21:42:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.225])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9599F41F86AF;
	Wed,  5 Feb 2025 21:42:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v2 1/7] of: base: Add of_get_available_child_by_name()
Date: Wed,  5 Feb 2025 12:42:21 +0000
Message-ID: <20250205124235.53285-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
previous v2->v2
 * Added Rb tag from Rob.
v1->previous v2:
 * Updated commit description.
 * Updated kerneldoc comment block
 * Avoided code duplication by using of_get_child_by_name().
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


