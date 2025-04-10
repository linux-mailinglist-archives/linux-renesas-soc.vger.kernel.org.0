Return-Path: <linux-renesas-soc+bounces-15694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B846A8391C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 08:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 698824676BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 06:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23402202997;
	Thu, 10 Apr 2025 06:20:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB970202C53;
	Thu, 10 Apr 2025 06:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266050; cv=none; b=g0cHulUBFHJYxV+VDahJzGw6wBGxnNll4hR9wznc1gMMOQewbMyQ8Gh9wV+y5gWLJbZObHGynG1RwlhlcXATr1Xi7Z0NXEAgA8HEBDskzKcKqOQIxrPCJcA1HAe5jWgURpMozgFdgTaPV/gLdTqOxSE4gtQsHsDdmqHZrhpnoE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266050; c=relaxed/simple;
	bh=wZHT3uWcUIEVv3uvaO4nFM7/R27wFwB01cKTmzP4plw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OdEuu5JdIW3eK2T5rgIQyQ75ZYh0veoKxoCjMzZK/V5BL1IyZRRSoa72iHbNN/HzqFlQHQmoTj1oW3Gqyf6QZesZXTVGayqSCm7CdvKZ/x5CrgSlXxAAGp7GR8ULzDcNtidv2fIHkIxeKre3DKFnj61qwLrlGn+9fZBcDU988r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: igkLLXlTSzmzqSH3YMHKiA==
X-CSE-MsgGUID: J0tUDzl/SSeORbj0OlziWw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Apr 2025 15:20:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.117])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id BA251401BEE1;
	Thu, 10 Apr 2025 15:20:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Lechner <david@lechnology.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] clk: davinci: Use of_get_available_child_by_name()
Date: Thu, 10 Apr 2025 07:20:38 +0100
Message-ID: <20250410062040.6346-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify of_davinci_pll_init() by using of_get_available_child_by_name().

While at it, move of_node_put(child) inside the if block to avoid
additional check if of_child is NULL.

Reviewed-by: David Lechner <david@lechnology.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Collected tag
 * Moved of_node_put() inside if.
v1->v2:
 * Rebased to next as the dependency patch hits on 6.15-rc1.
---
 drivers/clk/davinci/pll.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
index 6807a2efa93b..bfb6bbdc036c 100644
--- a/drivers/clk/davinci/pll.c
+++ b/drivers/clk/davinci/pll.c
@@ -763,13 +763,14 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
 		return PTR_ERR(clk);
 	}
 
-	child = of_get_child_by_name(node, "pllout");
-	if (of_device_is_available(child))
+	child = of_get_available_child_by_name(node, "pllout");
+	if (child) {
 		of_clk_add_provider(child, of_clk_src_simple_get, clk);
-	of_node_put(child);
+		of_node_put(child);
+	}
 
-	child = of_get_child_by_name(node, "sysclk");
-	if (of_device_is_available(child)) {
+	child = of_get_available_child_by_name(node, "sysclk");
+	if (child) {
 		struct clk_onecell_data *clk_data;
 		struct clk **clks;
 		int n_clks =  max_sysclk_id + 1;
@@ -803,11 +804,11 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
 				clks[(*div_info)->id] = clk;
 		}
 		of_clk_add_provider(child, of_clk_src_onecell_get, clk_data);
+		of_node_put(child);
 	}
-	of_node_put(child);
 
-	child = of_get_child_by_name(node, "auxclk");
-	if (of_device_is_available(child)) {
+	child = of_get_available_child_by_name(node, "auxclk");
+	if (child) {
 		char child_name[MAX_NAME_SIZE];
 
 		snprintf(child_name, MAX_NAME_SIZE, "%s_auxclk", info->name);
@@ -818,11 +819,12 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
 				 child_name, PTR_ERR(clk));
 		else
 			of_clk_add_provider(child, of_clk_src_simple_get, clk);
+
+		of_node_put(child);
 	}
-	of_node_put(child);
 
-	child = of_get_child_by_name(node, "obsclk");
-	if (of_device_is_available(child)) {
+	child = of_get_available_child_by_name(node, "obsclk");
+	if (child) {
 		if (obsclk_info)
 			clk = davinci_pll_obsclk_register(dev, obsclk_info, base);
 		else
@@ -833,8 +835,8 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
 				 PTR_ERR(clk));
 		else
 			of_clk_add_provider(child, of_clk_src_simple_get, clk);
+		of_node_put(child);
 	}
-	of_node_put(child);
 
 	return 0;
 }
-- 
2.43.0


