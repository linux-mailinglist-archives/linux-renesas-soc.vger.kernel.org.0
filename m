Return-Path: <linux-renesas-soc+bounces-23394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE94EBF7FAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 19:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A2DB150613D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 17:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9400C34E778;
	Tue, 21 Oct 2025 17:53:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5C734E747;
	Tue, 21 Oct 2025 17:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761069209; cv=none; b=h4r+fWm0Exn9Ne3/DmhyYZ//ts/5jetnS1ZucL/zIfF+peh9ih9FEubpADJQ/H5OoIQSi1WVh0V+lBnUn2VRyNeCGoXgxiUlyuP0HLBMv02yMJv5otGIpy5kKO9g4jZD5y/TTJwaa/BjtOUpBoMgX+Rgt04Nx+Sa8gTQyakOG7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761069209; c=relaxed/simple;
	bh=y4MDWrNqZag2Mkte0eo6FhZHumLel9G7FbxSVHUyORU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t6GWtMjyqj15STeYxgpkJMQ5IiLWpx9DpugA+BMzaOha1zYnA70B5rA2c25/F1TaOPEZKFy2itZKUk/nCyw2aYwJnj4wnNZDcN/9adJsnjXSyn8WDkUzvVWqKI/cLSkAHFWDAvtMQO5FmQxB/FgZr7Q1PIeNXG8ixvuT4LMegws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: M8+e2ADUQpafgz4i+ZwjUg==
X-CSE-MsgGUID: 1NJwh5H+Rc6rabUjXKuzMA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Oct 2025 02:53:25 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id F0F434031C11;
	Wed, 22 Oct 2025 02:53:21 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: biju.das.jz@bp.renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/4] clk: versaclock3: Use clk_parent_data arrays for clk_mux
Date: Tue, 21 Oct 2025 17:53:09 +0000
Message-ID: <20251021175311.19611-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021175311.19611-1-ovidiu.panait.rb@renesas.com>
References: <20251021175311.19611-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the inline parent_hws initializers with static clk_parent_data
arrays for the clk muxes. This provides more flexibility in how
parents are described and will simplify extending the parent lists in
the next commit.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/clk/clk-versaclock3.c | 48 ++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index f387cdb12f48..ebd9d75d7f55 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -900,6 +900,29 @@ static struct vc3_hw_data clk_div[] = {
 	}
 };
 
+static const struct clk_parent_data clk_mux_parent_data[][2] = {
+	[VC3_SE1_MUX] = {
+		{ .hw = &clk_div[VC3_DIV5].hw },
+		{ .hw = &clk_div[VC3_DIV4].hw }
+	},
+	[VC3_SE2_MUX] = {
+		{ .hw = &clk_div[VC3_DIV5].hw },
+		{ .hw = &clk_div[VC3_DIV4].hw }
+	},
+	[VC3_SE3_MUX] = {
+		{ .hw = &clk_div[VC3_DIV2].hw },
+		{ .hw = &clk_div[VC3_DIV4].hw }
+	},
+	[VC3_DIFF1_MUX] = {
+		{ .hw = &clk_div[VC3_DIV1].hw },
+		{ .hw = &clk_div[VC3_DIV3].hw }
+	},
+	[VC3_DIFF2_MUX] = {
+		{ .hw = &clk_div[VC3_DIV1].hw },
+		{ .hw = &clk_div[VC3_DIV3].hw }
+	},
+};
+
 static struct vc3_hw_data clk_mux[] = {
 	[VC3_SE1_MUX] = {
 		.data = &(struct vc3_clk_data) {
@@ -909,10 +932,7 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "se1_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV5].hw,
-				&clk_div[VC3_DIV4].hw
-			},
+			.parent_data = clk_mux_parent_data[VC3_SE1_MUX],
 			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
 		}
@@ -924,10 +944,7 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "se2_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV5].hw,
-				&clk_div[VC3_DIV4].hw
-			},
+			.parent_data = clk_mux_parent_data[VC3_SE2_MUX],
 			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
 		}
@@ -940,10 +957,7 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "se3_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV2].hw,
-				&clk_div[VC3_DIV4].hw
-			},
+			.parent_data = clk_mux_parent_data[VC3_SE3_MUX],
 			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
 		}
@@ -956,10 +970,7 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "diff1_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV1].hw,
-				&clk_div[VC3_DIV3].hw
-			},
+			.parent_data = clk_mux_parent_data[VC3_DIFF1_MUX],
 			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
 		}
@@ -972,10 +983,7 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "diff2_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV1].hw,
-				&clk_div[VC3_DIV3].hw
-			},
+			.parent_data = clk_mux_parent_data[VC3_DIFF2_MUX],
 			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
 		}
-- 
2.51.0


