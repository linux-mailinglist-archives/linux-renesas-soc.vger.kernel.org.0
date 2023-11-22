Return-Path: <linux-renesas-soc+bounces-118-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DA57F48DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 15:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC3631F219D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 14:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630F54E1BA;
	Wed, 22 Nov 2023 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id F24AFD53;
	Wed, 22 Nov 2023 06:23:32 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,219,1695654000"; 
   d="scan'208";a="183887069"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2023 23:23:32 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id DDC694280550;
	Wed, 22 Nov 2023 23:23:29 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/5] clk: versaclock3: Drop ret variable
Date: Wed, 22 Nov 2023 14:23:10 +0000
Message-Id: <20231122142310.203169-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122142310.203169-1-biju.das.jz@bp.renesas.com>
References: <20231122142310.203169-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop ret variable from vc3_clk_mux_determine_rate().

While at it, return the value returned by regmap_*
wherever possible instead of returning 0.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/clk-versaclock3.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 9cf3093c643d..76d7ea1964c3 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -226,9 +226,8 @@ static int vc3_pfd_mux_set_parent(struct clk_hw *hw, u8 index)
 	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
 	const struct vc3_clk_data *pfd_mux = vc3->data;
 
-	regmap_update_bits(vc3->regmap, pfd_mux->offs, pfd_mux->bitmsk,
-			   index ? pfd_mux->bitmsk : 0);
-	return 0;
+	return regmap_update_bits(vc3->regmap, pfd_mux->offs, pfd_mux->bitmsk,
+				  index ? pfd_mux->bitmsk : 0);
 }
 
 static const struct clk_ops vc3_pfd_mux_ops = {
@@ -456,10 +455,8 @@ static int vc3_div_mux_set_parent(struct clk_hw *hw, u8 index)
 	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
 	const struct vc3_clk_data *div_mux = vc3->data;
 
-	regmap_update_bits(vc3->regmap, div_mux->offs, div_mux->bitmsk,
-			   index ? div_mux->bitmsk : 0);
-
-	return 0;
+	return regmap_update_bits(vc3->regmap, div_mux->offs, div_mux->bitmsk,
+				  index ? div_mux->bitmsk : 0);
 }
 
 static const struct clk_ops vc3_div_mux_ops = {
@@ -524,10 +521,9 @@ static int vc3_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	value = divider_get_val(rate, parent_rate, div_data->table,
 				div_data->width, div_data->flags);
-	regmap_update_bits(vc3->regmap, div_data->offs,
-			   VC3_DIV_MASK(div_data->width) << div_data->shift,
-			   value << div_data->shift);
-	return 0;
+	return regmap_update_bits(vc3->regmap, div_data->offs,
+				  VC3_DIV_MASK(div_data->width) << div_data->shift,
+				  value << div_data->shift);
 }
 
 static const struct clk_ops vc3_div_ops = {
@@ -539,11 +535,9 @@ static const struct clk_ops vc3_div_ops = {
 static int vc3_clk_mux_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req)
 {
-	int ret;
 	int frc;
 
-	ret = clk_mux_determine_rate_flags(hw, req, CLK_SET_RATE_PARENT);
-	if (ret) {
+	if (clk_mux_determine_rate_flags(hw, req, CLK_SET_RATE_PARENT)) {
 		/* The below check is equivalent to (best_parent_rate/rate) */
 		if (req->best_parent_rate >= req->rate) {
 			frc = DIV_ROUND_CLOSEST_ULL(req->best_parent_rate,
@@ -552,10 +546,9 @@ static int vc3_clk_mux_determine_rate(struct clk_hw *hw,
 			return clk_mux_determine_rate_flags(hw, req,
 							    CLK_SET_RATE_PARENT);
 		}
-		ret = 0;
 	}
 
-	return ret;
+	return 0;
 }
 
 static u8 vc3_clk_mux_get_parent(struct clk_hw *hw)
@@ -574,9 +567,8 @@ static int vc3_clk_mux_set_parent(struct clk_hw *hw, u8 index)
 	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
 	const struct vc3_clk_data *clk_mux = vc3->data;
 
-	regmap_update_bits(vc3->regmap, clk_mux->offs,
-			   clk_mux->bitmsk, index ? clk_mux->bitmsk : 0);
-	return 0;
+	return regmap_update_bits(vc3->regmap, clk_mux->offs, clk_mux->bitmsk,
+				  index ? clk_mux->bitmsk : 0);
 }
 
 static const struct clk_ops vc3_clk_mux_ops = {
-- 
2.25.1


