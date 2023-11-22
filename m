Return-Path: <linux-renesas-soc+bounces-117-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE47F48D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 15:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5ADCCB2123A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 14:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABB44E1B0;
	Wed, 22 Nov 2023 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 84F2E110;
	Wed, 22 Nov 2023 06:23:26 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,219,1695654000"; 
   d="scan'208";a="187742829"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2023 23:23:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 82F2E4280550;
	Wed, 22 Nov 2023 23:23:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/5] clk: versaclock3: Use u8 return type for get_parent() callback
Date: Wed, 22 Nov 2023 14:23:08 +0000
Message-Id: <20231122142310.203169-4-biju.das.jz@bp.renesas.com>
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

The return type of get_parent() member in struct clk_ops is u8.
Use same return type for corresponding callback function as well.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/clk-versaclock3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 058efffd4e01..b66c34f20247 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -210,7 +210,7 @@ static const struct clk_div_table div3_divs[] = {
 
 static struct clk_hw *clk_out[6];
 
-static unsigned char vc3_pfd_mux_get_parent(struct clk_hw *hw)
+static u8 vc3_pfd_mux_get_parent(struct clk_hw *hw)
 {
 	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
 	const struct vc3_clk_data *pfd_mux = vc3->data;
@@ -440,7 +440,7 @@ static const struct clk_ops vc3_pll_ops = {
 	.set_rate = vc3_pll_set_rate,
 };
 
-static unsigned char vc3_div_mux_get_parent(struct clk_hw *hw)
+static u8 vc3_div_mux_get_parent(struct clk_hw *hw)
 {
 	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
 	const struct vc3_clk_data *div_mux = vc3->data;
@@ -558,7 +558,7 @@ static int vc3_clk_mux_determine_rate(struct clk_hw *hw,
 	return ret;
 }
 
-static unsigned char vc3_clk_mux_get_parent(struct clk_hw *hw)
+static u8 vc3_clk_mux_get_parent(struct clk_hw *hw)
 {
 	struct vc3_hw_data *vc3 = container_of(hw, struct vc3_hw_data, hw);
 	const struct vc3_clk_data *clk_mux = vc3->data;
-- 
2.25.1


