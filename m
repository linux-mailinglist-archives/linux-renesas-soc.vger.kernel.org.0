Return-Path: <linux-renesas-soc+bounces-119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C49C7F48DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 15:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 423DDB21049
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 14:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9D54E1B9;
	Wed, 22 Nov 2023 14:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id BBAC6110;
	Wed, 22 Nov 2023 06:23:29 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,219,1695654000"; 
   d="scan'208";a="187742839"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2023 23:23:29 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D4E0B4280549;
	Wed, 22 Nov 2023 23:23:26 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/5] clk: versaclock3: Add missing space between ')' and '{'
Date: Wed, 22 Nov 2023 14:23:09 +0000
Message-Id: <20231122142310.203169-5-biju.das.jz@bp.renesas.com>
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

Add missing space between ')' and '{' for hw.init initialization.

While at it, update the macro VC3_PLL1_LOOP_FILTER_N_DIV_MSB
0x0a->0xa.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/clk-versaclock3.c | 44 +++++++++++++++++------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index b66c34f20247..9cf3093c643d 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -37,7 +37,7 @@
 #define VC3_PLL1_M_DIV(n)		((n) & GENMASK(5, 0))
 
 #define VC3_PLL1_VCO_N_DIVIDER		0x9
-#define VC3_PLL1_LOOP_FILTER_N_DIV_MSB	0x0a
+#define VC3_PLL1_LOOP_FILTER_N_DIV_MSB	0xa
 
 #define VC3_OUT_DIV1_DIV2_CTRL		0xf
 
@@ -605,7 +605,7 @@ static struct vc3_hw_data clk_pfd_mux[] = {
 			.offs = VC3_PLL_OP_CTRL,
 			.bitmsk = BIT(VC3_PLL_OP_CTRL_PLL2_REFIN_SEL)
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "pfd2_mux",
 			.ops = &vc3_pfd_mux_ops,
 			.parent_data = pfd_mux_parent_data,
@@ -618,7 +618,7 @@ static struct vc3_hw_data clk_pfd_mux[] = {
 			.offs = VC3_GENERAL_CTR,
 			.bitmsk = BIT(VC3_GENERAL_CTR_PLL3_REFIN_SEL)
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "pfd3_mux",
 			.ops = &vc3_pfd_mux_ops,
 			.parent_data = pfd_mux_parent_data,
@@ -636,7 +636,7 @@ static struct vc3_hw_data clk_pfd[] = {
 			.mdiv1_bitmsk = VC3_PLL1_M_DIV1,
 			.mdiv2_bitmsk = VC3_PLL1_M_DIV2
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "pfd1",
 			.ops = &vc3_pfd_ops,
 			.parent_data = &(const struct clk_parent_data) {
@@ -653,7 +653,7 @@ static struct vc3_hw_data clk_pfd[] = {
 			.mdiv1_bitmsk = VC3_PLL2_M_DIV1,
 			.mdiv2_bitmsk = VC3_PLL2_M_DIV2
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "pfd2",
 			.ops = &vc3_pfd_ops,
 			.parent_hws = (const struct clk_hw *[]) {
@@ -670,7 +670,7 @@ static struct vc3_hw_data clk_pfd[] = {
 			.mdiv1_bitmsk = VC3_PLL3_M_DIV1,
 			.mdiv2_bitmsk = VC3_PLL3_M_DIV2
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "pfd3",
 			.ops = &vc3_pfd_ops,
 			.parent_hws = (const struct clk_hw *[]) {
@@ -691,7 +691,7 @@ static struct vc3_hw_data clk_pll[] = {
 			.vco_min = VC3_PLL1_VCO_MIN,
 			.vco_max = VC3_PLL1_VCO_MAX
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "pll1",
 			.ops = &vc3_pll_ops,
 			.parent_hws = (const struct clk_hw *[]) {
@@ -709,7 +709,7 @@ static struct vc3_hw_data clk_pll[] = {
 			.vco_min = VC3_PLL2_VCO_MIN,
 			.vco_max = VC3_PLL2_VCO_MAX
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "pll2",
 			.ops = &vc3_pll_ops,
 			.parent_hws = (const struct clk_hw *[]) {
@@ -727,7 +727,7 @@ static struct vc3_hw_data clk_pll[] = {
 			.vco_min = VC3_PLL3_VCO_MIN,
 			.vco_max = VC3_PLL3_VCO_MAX
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "pll3",
 			.ops = &vc3_pll_ops,
 			.parent_hws = (const struct clk_hw *[]) {
@@ -760,7 +760,7 @@ static struct vc3_hw_data clk_div_mux[] = {
 			.offs = VC3_GENERAL_CTR,
 			.bitmsk = VC3_GENERAL_CTR_DIV1_SRC_SEL
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "div1_mux",
 			.ops = &vc3_div_mux_ops,
 			.parent_data = div_mux_parent_data[VC3_DIV1_MUX],
@@ -773,7 +773,7 @@ static struct vc3_hw_data clk_div_mux[] = {
 			.offs = VC3_PLL3_CHARGE_PUMP_CTRL,
 			.bitmsk = VC3_PLL3_CHARGE_PUMP_CTRL_OUTDIV3_SRC_SEL
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "div3_mux",
 			.ops = &vc3_div_mux_ops,
 			.parent_data = div_mux_parent_data[VC3_DIV3_MUX],
@@ -786,7 +786,7 @@ static struct vc3_hw_data clk_div_mux[] = {
 			.offs = VC3_OUTPUT_CTR,
 			.bitmsk = VC3_OUTPUT_CTR_DIV4_SRC_SEL
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "div4_mux",
 			.ops = &vc3_div_mux_ops,
 			.parent_data = div_mux_parent_data[VC3_DIV4_MUX],
@@ -805,7 +805,7 @@ static struct vc3_hw_data clk_div[] = {
 			.width = 4,
 			.flags = CLK_DIVIDER_READ_ONLY
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "div1",
 			.ops = &vc3_div_ops,
 			.parent_hws = (const struct clk_hw *[]) {
@@ -823,7 +823,7 @@ static struct vc3_hw_data clk_div[] = {
 			.width = 4,
 			.flags = CLK_DIVIDER_READ_ONLY
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "div2",
 			.ops = &vc3_div_ops,
 			.parent_hws = (const struct clk_hw *[]) {
@@ -841,7 +841,7 @@ static struct vc3_hw_data clk_div[] = {
 			.width = 4,
 			.flags = CLK_DIVIDER_READ_ONLY
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "div3",
 			.ops = &vc3_div_ops,
 			.parent_hws = (const struct clk_hw *[]) {
@@ -859,7 +859,7 @@ static struct vc3_hw_data clk_div[] = {
 			.width = 4,
 			.flags = CLK_DIVIDER_READ_ONLY
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "div4",
 			.ops = &vc3_div_ops,
 			.parent_hws = (const struct clk_hw *[]) {
@@ -877,7 +877,7 @@ static struct vc3_hw_data clk_div[] = {
 			.width = 4,
 			.flags = CLK_DIVIDER_READ_ONLY
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "div5",
 			.ops = &vc3_div_ops,
 			.parent_hws = (const struct clk_hw *[]) {
@@ -895,7 +895,7 @@ static struct vc3_hw_data clk_mux[] = {
 			.offs = VC3_SE1_DIV4_CTRL,
 			.bitmsk = VC3_SE1_DIV4_CTRL_SE1_CLK_SEL
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "se1_mux",
 			.ops = &vc3_clk_mux_ops,
 			.parent_hws = (const struct clk_hw *[]) {
@@ -911,7 +911,7 @@ static struct vc3_hw_data clk_mux[] = {
 			.offs = VC3_SE2_CTRL_REG0,
 			.bitmsk = VC3_SE2_CTRL_REG0_SE2_CLK_SEL
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "se2_mux",
 			.ops = &vc3_clk_mux_ops,
 			.parent_hws = (const struct clk_hw *[]) {
@@ -927,7 +927,7 @@ static struct vc3_hw_data clk_mux[] = {
 			.offs = VC3_SE3_DIFF1_CTRL_REG,
 			.bitmsk = VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "se3_mux",
 			.ops = &vc3_clk_mux_ops,
 			.parent_hws = (const struct clk_hw *[]) {
@@ -943,7 +943,7 @@ static struct vc3_hw_data clk_mux[] = {
 			.offs = VC3_DIFF1_CTRL_REG,
 			.bitmsk = VC3_DIFF1_CTRL_REG_DIFF1_CLK_SEL
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "diff1_mux",
 			.ops = &vc3_clk_mux_ops,
 			.parent_hws = (const struct clk_hw *[]) {
@@ -959,7 +959,7 @@ static struct vc3_hw_data clk_mux[] = {
 			.offs = VC3_DIFF2_CTRL_REG,
 			.bitmsk = VC3_DIFF2_CTRL_REG_DIFF2_CLK_SEL
 		},
-		.hw.init = &(struct clk_init_data){
+		.hw.init = &(struct clk_init_data) {
 			.name = "diff2_mux",
 			.ops = &vc3_clk_mux_ops,
 			.parent_hws = (const struct clk_hw *[]) {
-- 
2.25.1


