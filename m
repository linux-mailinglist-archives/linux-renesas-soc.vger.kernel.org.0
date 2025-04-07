Return-Path: <linux-renesas-soc+bounces-15430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4205CA7D9C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 11:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29370168BAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 09:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3F41A0BD6;
	Mon,  7 Apr 2025 09:36:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B136B3C0B;
	Mon,  7 Apr 2025 09:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018598; cv=none; b=r+cgwzlMn1u77bujuHFKRZE/KR0EinxVekJmNC9gJydMLbRqXR7NApvS2hlU2k//ZFqPWgE/zcyQFgJg5MNsn5kW0XQmnt9URb6+WOOBZcQw0+cDHUsN0yzTtosPwHwZ3OP0pJmwLsHhdmdyerSumOBWyTfHz3K9X63jEDrA0gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018598; c=relaxed/simple;
	bh=rzAcUDgONKP1ow3vJytvas8sEzpl4GIfU4xoBZWuE+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O0GoA7TzkWG8om3eqXBJM9AgK150XMQEKtrk9SZf3BihaKnbbhuCKbkg8+4NEupPwlDC6KwlT+8QBnW6syxAB6OwvFfc/fFwWiHCP4slqw8KG+cZEuolJg0oz8IYbf5AiRBSgnhFFQo+f+HPHCy1od1iRMRoUE+9uqqAr+N9c4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: dXUJW/BBTAODBd/mnQ/kPA==
X-CSE-MsgGUID: sjZW0fgtTQKxGLyIYcKm8g==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Apr 2025 18:36:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.133])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2E2F2400B534;
	Mon,  7 Apr 2025 18:36:25 +0900 (JST)
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
Subject: [PATCH v2] clk: davinci: Use of_get_available_child_by_name()
Date: Mon,  7 Apr 2025 10:36:17 +0100
Message-ID: <20250407093623.36974-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Rebased to next as the dependency patch hits on 6.15-rc1.
---
 drivers/clk/davinci/pll.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
index 6807a2efa93b..a236dfeccdb1 100644
--- a/drivers/clk/davinci/pll.c
+++ b/drivers/clk/davinci/pll.c
@@ -763,13 +763,13 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
 		return PTR_ERR(clk);
 	}
 
-	child = of_get_child_by_name(node, "pllout");
-	if (of_device_is_available(child))
+	child = of_get_available_child_by_name(node, "pllout");
+	if (child)
 		of_clk_add_provider(child, of_clk_src_simple_get, clk);
 	of_node_put(child);
 
-	child = of_get_child_by_name(node, "sysclk");
-	if (of_device_is_available(child)) {
+	child = of_get_available_child_by_name(node, "sysclk");
+	if (child) {
 		struct clk_onecell_data *clk_data;
 		struct clk **clks;
 		int n_clks =  max_sysclk_id + 1;
@@ -803,11 +803,11 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
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
@@ -818,11 +818,12 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
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
@@ -833,8 +834,8 @@ int of_davinci_pll_init(struct device *dev, struct device_node *node,
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


