Return-Path: <linux-renesas-soc+bounces-27843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFBkKe39gWk7NQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:53:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D95FDA303
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB49B30B421F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 13:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E4D3A0B37;
	Tue,  3 Feb 2026 13:52:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C77D39C636;
	Tue,  3 Feb 2026 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126723; cv=none; b=LEdvc3Qmia4L8HvtDzKPgxptYkoH9eqc2bWnoRIi9AW6YkOCjDpvWfx85Yo4EbL6/CCzD+IVS2k3XZi7Db7s4mTCfFi9tL8T0zSFhEdk0KJ+YnyOw8F/b5oMqhtPBl+IlSxetlP48iUWrQWI/Xf5LMzk1WJJWoZ7pMIMQ6hTNS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126723; c=relaxed/simple;
	bh=5E5rs/umqHKRLvBfn2kWJw4MJHkuLU+4u5BenpRw12A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FPKaolyfJXagLJjFxjMli92TaTdrqNwuKWukiWvQVh8nVLo3ut38BBYTB+w+Zci9sv1F7VDpZZ8fLUpWSGcAr9utgzIK/6aW/VAz1VbAfWhHP2yRWJDZ+v0grZ+cyBvX8z2mwYnrvkL6qf5vBJ5+FY5W9l8YPW1WtUQUWJTXi80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: wMkulYr6T9Sz9ihA82Ztqw==
X-CSE-MsgGUID: MTdcizkeTZ64CUc0Cl//IQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Feb 2026 22:51:59 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.93.5])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 250D7421BAEF;
	Tue,  3 Feb 2026 22:51:54 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	biju.das.jz@bp.renesas.com,
	fabrizio.castro.jz@renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 3/8] clk: versaclock3: Reference parent clocks by type and index
Date: Tue,  3 Feb 2026 13:51:34 +0000
Message-ID: <20260203135139.28151-4-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203135139.28151-1-ovidiu.panait.rb@renesas.com>
References: <20260203135139.28151-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27843-lists,linux-renesas-soc=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D95FDA303
X-Rspamd-Action: no action

The current implementation uses direct pointers to clk_hw structures
(via .parent_hws) to define parent-child relationships between clocks.
This works for a single device instance but prevents supporting multiple
devices since all instances would share the same static clk_hw pointers.

Replace direct pointers with parent references using a type and index
pair. For example, VC3_CLK_PARENT(PLL, VC3_PLL1) refers to the first
PLL clock. These references are resolved to actual clk_hw pointers at
probe time by the new vc3_register_clk() function.

This is a preparatory change for adding support for multiple versaclock3
instances, where each device will have its own set of clk_hw structures.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v3 changes: New patch.

 drivers/clk/clk-versaclock3.c | 401 +++++++++++++++++++++++-----------
 1 file changed, 276 insertions(+), 125 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 18ef0f38c85b..d3e23566a38c 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -83,6 +83,8 @@
 #define VC3_2_POW_16			(U16_MAX + 1)
 #define VC3_DIV_MASK(width)		((1 << (width)) - 1)
 
+#define VC3_CLK_PARENT(t, i)		{ .type = VC3_CLK_##t, .idx = (i) }
+
 enum vc3_pfd_mux {
 	VC3_PFD2_MUX,
 	VC3_PFD3_MUX,
@@ -131,6 +133,26 @@ enum vc3_clk_mux {
 	VC3_DIFF2_MUX = VC3_DIFF2 - 1,
 };
 
+enum vc3_clk_type {
+	VC3_CLK_EXT,
+	VC3_CLK_PFD_MUX,
+	VC3_CLK_PFD,
+	VC3_CLK_PLL,
+	VC3_CLK_DIV_MUX,
+	VC3_CLK_DIV,
+	VC3_CLK_CLK_MUX,
+};
+
+struct vc3_clk_parent {
+	enum vc3_clk_type type;
+	u8 idx;
+};
+
+struct vc3_parent_info {
+	const struct vc3_clk_parent *parents;
+	u8 num_parents;
+};
+
 struct vc3_clk_data {
 	u8 offs;
 	u8 bitmsk;
@@ -164,6 +186,7 @@ struct vc3_div_data {
 };
 
 struct vc3_hw_data {
+	const struct vc3_parent_info *parent_info;
 	struct clk_hw hw;
 	struct regmap *regmap;
 	void *data;
@@ -598,11 +621,12 @@ static const struct regmap_config vc3_regmap_config = {
 	.max_register = 0x24,
 };
 
-static struct vc3_hw_data clk_div[5];
-
-static const struct clk_parent_data pfd_mux_parent_data[] = {
-	{ .index = 0, },
-	{ .hw = &clk_div[VC3_DIV2].hw }
+static const struct vc3_parent_info pfd_mux_parents = {
+	.parents = (const struct vc3_clk_parent[]) {
+		VC3_CLK_PARENT(EXT, 0),
+		VC3_CLK_PARENT(DIV, VC3_DIV2),
+	},
+	.num_parents = 2,
 };
 
 static struct vc3_hw_data clk_pfd_mux[] = {
@@ -614,10 +638,9 @@ static struct vc3_hw_data clk_pfd_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "pfd2_mux",
 			.ops = &vc3_pfd_mux_ops,
-			.parent_data = pfd_mux_parent_data,
-			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT
-		}
+		},
+		.parent_info = &pfd_mux_parents,
 	},
 	[VC3_PFD3_MUX] = {
 		.data = &(struct vc3_clk_data) {
@@ -627,13 +650,33 @@ static struct vc3_hw_data clk_pfd_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "pfd3_mux",
 			.ops = &vc3_pfd_mux_ops,
-			.parent_data = pfd_mux_parent_data,
-			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT
-		}
+		},
+		.parent_info = &pfd_mux_parents,
 	}
 };
 
+static const struct vc3_parent_info pfd_parents[] = {
+	[VC3_PFD1] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(EXT, 0),
+		},
+		.num_parents = 1,
+	},
+	[VC3_PFD2] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(PFD_MUX, VC3_PFD2_MUX),
+		},
+		.num_parents = 1,
+	},
+	[VC3_PFD3] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(PFD_MUX, VC3_PFD3_MUX),
+		},
+		.num_parents = 1,
+	},
+};
+
 static struct vc3_hw_data clk_pfd[] = {
 	[VC3_PFD1] = {
 		.data = &(struct vc3_pfd_data) {
@@ -645,12 +688,9 @@ static struct vc3_hw_data clk_pfd[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "pfd1",
 			.ops = &vc3_pfd_ops,
-			.parent_data = &(const struct clk_parent_data) {
-				.index = 0
-			},
-			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &pfd_parents[VC3_PFD1],
 	},
 	[VC3_PFD2] = {
 		.data = &(struct vc3_pfd_data) {
@@ -662,12 +702,9 @@ static struct vc3_hw_data clk_pfd[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "pfd2",
 			.ops = &vc3_pfd_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_pfd_mux[VC3_PFD2_MUX].hw
-			},
-			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &pfd_parents[VC3_PFD2],
 	},
 	[VC3_PFD3] = {
 		.data = &(struct vc3_pfd_data) {
@@ -679,15 +716,33 @@ static struct vc3_hw_data clk_pfd[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "pfd3",
 			.ops = &vc3_pfd_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_pfd_mux[VC3_PFD3_MUX].hw
-			},
-			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &pfd_parents[VC3_PFD3],
 	}
 };
 
+static const struct vc3_parent_info pll_parents[] = {
+	[VC3_PLL1] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(PFD, VC3_PFD1),
+		},
+		.num_parents = 1,
+	},
+	[VC3_PLL2] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(PFD, VC3_PFD2),
+		},
+		.num_parents = 1,
+	},
+	[VC3_PLL3] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(PFD, VC3_PFD3),
+		},
+		.num_parents = 1,
+	},
+};
+
 static struct vc3_hw_data clk_pll[] = {
 	[VC3_PLL1] = {
 		.data = &(struct vc3_pll_data) {
@@ -702,12 +757,9 @@ static struct vc3_hw_data clk_pll[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "pll1",
 			.ops = &vc3_pll_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_pfd[VC3_PFD1].hw
-			},
-			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &pll_parents[VC3_PLL1],
 	},
 	[VC3_PLL2] = {
 		.data = &(struct vc3_pll_data) {
@@ -718,12 +770,9 @@ static struct vc3_hw_data clk_pll[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "pll2",
 			.ops = &vc3_pll_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_pfd[VC3_PFD2].hw
-			},
-			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &pll_parents[VC3_PLL2],
 	},
 	[VC3_PLL3] = {
 		.data = &(struct vc3_pll_data) {
@@ -738,28 +787,34 @@ static struct vc3_hw_data clk_pll[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "pll3",
 			.ops = &vc3_pll_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_pfd[VC3_PFD3].hw
-			},
-			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &pll_parents[VC3_PLL3],
 	}
 };
 
-static const struct clk_parent_data div_mux_parent_data[][2] = {
+static const struct vc3_parent_info div_mux_parents[] = {
 	[VC3_DIV1_MUX] = {
-		{ .hw = &clk_pll[VC3_PLL1].hw },
-		{ .index = 0 }
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(PLL, VC3_PLL1),
+			VC3_CLK_PARENT(EXT, 0),
+		},
+		.num_parents = 2,
 	},
 	[VC3_DIV3_MUX] = {
-		{ .hw = &clk_pll[VC3_PLL2].hw },
-		{ .hw = &clk_pll[VC3_PLL3].hw }
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(PLL, VC3_PLL2),
+			VC3_CLK_PARENT(PLL, VC3_PLL3),
+		},
+		.num_parents = 2,
 	},
 	[VC3_DIV4_MUX] = {
-		{ .hw = &clk_pll[VC3_PLL2].hw },
-		{ .index = 0 }
-	}
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(PLL, VC3_PLL2),
+			VC3_CLK_PARENT(EXT, 0),
+		},
+		.num_parents = 2,
+	},
 };
 
 static struct vc3_hw_data clk_div_mux[] = {
@@ -771,10 +826,9 @@ static struct vc3_hw_data clk_div_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "div1_mux",
 			.ops = &vc3_div_mux_ops,
-			.parent_data = div_mux_parent_data[VC3_DIV1_MUX],
-			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT
-		}
+		},
+		.parent_info = &div_mux_parents[VC3_DIV1_MUX],
 	},
 	[VC3_DIV3_MUX] = {
 		.data = &(struct vc3_clk_data) {
@@ -784,10 +838,9 @@ static struct vc3_hw_data clk_div_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "div3_mux",
 			.ops = &vc3_div_mux_ops,
-			.parent_data = div_mux_parent_data[VC3_DIV3_MUX],
-			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT
-		}
+		},
+		.parent_info = &div_mux_parents[VC3_DIV3_MUX],
 	},
 	[VC3_DIV4_MUX] = {
 		.data = &(struct vc3_clk_data) {
@@ -797,13 +850,45 @@ static struct vc3_hw_data clk_div_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "div4_mux",
 			.ops = &vc3_div_mux_ops,
-			.parent_data = div_mux_parent_data[VC3_DIV4_MUX],
-			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT
-		}
+		},
+		.parent_info = &div_mux_parents[VC3_DIV4_MUX],
 	}
 };
 
+static const struct vc3_parent_info div_parents[] = {
+	[VC3_DIV1] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(DIV_MUX, VC3_DIV1_MUX),
+		},
+		.num_parents = 1,
+	},
+	[VC3_DIV2] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(PLL, VC3_PLL1),
+		},
+		.num_parents = 1,
+	},
+	[VC3_DIV3] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(DIV_MUX, VC3_DIV3_MUX),
+		},
+		.num_parents = 1,
+	},
+	[VC3_DIV4] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(DIV_MUX, VC3_DIV4_MUX),
+		},
+		.num_parents = 1,
+	},
+	[VC3_DIV5] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(PLL, VC3_PLL3),
+		},
+		.num_parents = 1,
+	},
+};
+
 static struct vc3_hw_data clk_div[] = {
 	[VC3_DIV1] = {
 		.data = &(struct vc3_div_data) {
@@ -816,12 +901,9 @@ static struct vc3_hw_data clk_div[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "div1",
 			.ops = &vc3_div_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div_mux[VC3_DIV1_MUX].hw
-			},
-			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &div_parents[VC3_DIV1],
 	},
 	[VC3_DIV2] = {
 		.data = &(struct vc3_div_data) {
@@ -834,12 +916,9 @@ static struct vc3_hw_data clk_div[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "div2",
 			.ops = &vc3_div_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_pll[VC3_PLL1].hw
-			},
-			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &div_parents[VC3_DIV2],
 	},
 	[VC3_DIV3] = {
 		.data = &(struct vc3_div_data) {
@@ -852,12 +931,9 @@ static struct vc3_hw_data clk_div[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "div3",
 			.ops = &vc3_div_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div_mux[VC3_DIV3_MUX].hw
-			},
-			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &div_parents[VC3_DIV3],
 	},
 	[VC3_DIV4] = {
 		.data = &(struct vc3_div_data) {
@@ -870,12 +946,9 @@ static struct vc3_hw_data clk_div[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "div4",
 			.ops = &vc3_div_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div_mux[VC3_DIV4_MUX].hw
-			},
-			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &div_parents[VC3_DIV4],
 	},
 	[VC3_DIV5] = {
 		.data = &(struct vc3_div_data) {
@@ -888,15 +961,50 @@ static struct vc3_hw_data clk_div[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "div5",
 			.ops = &vc3_div_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_pll[VC3_PLL3].hw
-			},
-			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &div_parents[VC3_DIV5],
 	}
 };
 
+static const struct vc3_parent_info clk_mux_parents[] = {
+	[VC3_SE1_MUX] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(DIV, VC3_DIV5),
+			VC3_CLK_PARENT(DIV, VC3_DIV4),
+		},
+		.num_parents = 2,
+	},
+	[VC3_SE2_MUX] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(DIV, VC3_DIV5),
+			VC3_CLK_PARENT(DIV, VC3_DIV4),
+		},
+		.num_parents = 2,
+	},
+	[VC3_SE3_MUX] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(DIV, VC3_DIV2),
+			VC3_CLK_PARENT(DIV, VC3_DIV4),
+		},
+		.num_parents = 2,
+	},
+	[VC3_DIFF1_MUX] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(DIV, VC3_DIV1),
+			VC3_CLK_PARENT(DIV, VC3_DIV3),
+		},
+		.num_parents = 2,
+	},
+	[VC3_DIFF2_MUX] = {
+		.parents = (const struct vc3_clk_parent[]) {
+			VC3_CLK_PARENT(DIV, VC3_DIV1),
+			VC3_CLK_PARENT(DIV, VC3_DIV3),
+		},
+		.num_parents = 2,
+	},
+};
+
 static struct vc3_hw_data clk_mux[] = {
 	[VC3_SE1_MUX] = {
 		.data = &(struct vc3_clk_data) {
@@ -906,13 +1014,9 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "se1_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV5].hw,
-				&clk_div[VC3_DIV4].hw
-			},
-			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &clk_mux_parents[VC3_SE1_MUX],
 	},
 	[VC3_SE2_MUX] = {
 		.data = &(struct vc3_clk_data) {
@@ -921,13 +1025,9 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "se2_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV5].hw,
-				&clk_div[VC3_DIV4].hw
-			},
-			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &clk_mux_parents[VC3_SE2_MUX],
 	},
 	[VC3_SE3_MUX] = {
 		.data = &(struct vc3_clk_data) {
@@ -937,13 +1037,9 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "se3_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV2].hw,
-				&clk_div[VC3_DIV4].hw
-			},
-			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &clk_mux_parents[VC3_SE3_MUX],
 	},
 	[VC3_DIFF1_MUX] = {
 		.data = &(struct vc3_clk_data) {
@@ -953,13 +1049,9 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "diff1_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV1].hw,
-				&clk_div[VC3_DIV3].hw
-			},
-			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &clk_mux_parents[VC3_DIFF1_MUX],
 	},
 	[VC3_DIFF2_MUX] = {
 		.data = &(struct vc3_clk_data) {
@@ -969,16 +1061,81 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "diff2_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV1].hw,
-				&clk_div[VC3_DIV3].hw
-			},
-			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
-		}
+		},
+		.parent_info = &clk_mux_parents[VC3_DIFF2_MUX],
 	}
 };
 
+static struct clk_hw *vc3_clk_get_hw(const struct vc3_clk_parent *parent)
+{
+	switch (parent->type) {
+	case VC3_CLK_EXT:
+		return NULL;
+	case VC3_CLK_PFD_MUX:
+		return &clk_pfd_mux[parent->idx].hw;
+	case VC3_CLK_PFD:
+		return &clk_pfd[parent->idx].hw;
+	case VC3_CLK_PLL:
+		return &clk_pll[parent->idx].hw;
+	case VC3_CLK_DIV_MUX:
+		return &clk_div_mux[parent->idx].hw;
+	case VC3_CLK_DIV:
+		return &clk_div[parent->idx].hw;
+	case VC3_CLK_CLK_MUX:
+		return &clk_mux[parent->idx].hw;
+	}
+
+	return NULL;
+}
+
+static struct clk_parent_data *
+vc3_setup_parent_data(struct vc3_hw_data *hw_data)
+{
+	const struct vc3_parent_info *pinfo = hw_data->parent_info;
+	struct clk_parent_data *pd;
+
+	pd = kcalloc(pinfo->num_parents, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return NULL;
+
+	for (int i = 0; i < pinfo->num_parents; i++) {
+		const struct vc3_clk_parent *parent = &pinfo->parents[i];
+
+		if (parent->type == VC3_CLK_EXT)
+			pd[i].index = parent->idx;
+		else
+			pd[i].hw = vc3_clk_get_hw(parent);
+	}
+
+	return pd;
+}
+
+static int vc3_register_clk(struct device *dev, struct vc3_hw_data *hw_data,
+			    struct regmap *regmap)
+{
+	struct clk_parent_data *pd;
+	struct clk_init_data init;
+	int ret;
+
+	pd = vc3_setup_parent_data(hw_data);
+	if (!pd)
+		return -ENOMEM;
+
+	init = *hw_data->hw.init;
+	init.parent_data = pd;
+	init.num_parents = hw_data->parent_info->num_parents;
+
+	hw_data->regmap = regmap;
+	hw_data->hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &hw_data->hw);
+
+	kfree(pd);
+
+	return ret;
+}
+
 static struct clk_hw *vc3_of_clk_get(struct of_phandle_args *clkspec,
 				     void *data)
 {
@@ -1029,9 +1186,8 @@ static int vc3_probe(struct i2c_client *client)
 
 	/* Register pfd muxes */
 	for (i = 0; i < ARRAY_SIZE(clk_pfd_mux); i++) {
-		clk_pfd_mux[i].regmap = regmap;
 		name = clk_pfd_mux[i].hw.init->name;
-		ret = devm_clk_hw_register(dev, &clk_pfd_mux[i].hw);
+		ret = vc3_register_clk(dev, &clk_pfd_mux[i], regmap);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "failed to register clock %s\n",
@@ -1040,9 +1196,8 @@ static int vc3_probe(struct i2c_client *client)
 
 	/* Register pfd's */
 	for (i = 0; i < ARRAY_SIZE(clk_pfd); i++) {
-		clk_pfd[i].regmap = regmap;
 		name = clk_pfd[i].hw.init->name;
-		ret = devm_clk_hw_register(dev, &clk_pfd[i].hw);
+		ret = vc3_register_clk(dev, &clk_pfd[i], regmap);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "failed to register clock %s\n",
@@ -1053,14 +1208,13 @@ static int vc3_probe(struct i2c_client *client)
 
 	/* Register pll's */
 	for (i = 0; i < ARRAY_SIZE(clk_pll); i++) {
-		clk_pll[i].regmap = regmap;
 		if (i == VC3_PLL2) {
 			struct vc3_pll_data *pll_data = clk_pll[i].data;
 
 			pll_data->vco = data->pll2_vco;
 		}
 		name = clk_pll[i].hw.init->name;
-		ret = devm_clk_hw_register(dev, &clk_pll[i].hw);
+		ret = vc3_register_clk(dev, &clk_pll[i], regmap);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "failed to register clock %s\n",
@@ -1069,9 +1223,8 @@ static int vc3_probe(struct i2c_client *client)
 
 	/* Register divider muxes */
 	for (i = 0; i < ARRAY_SIZE(clk_div_mux); i++) {
-		clk_div_mux[i].regmap = regmap;
 		name = clk_div_mux[i].hw.init->name;
-		ret = devm_clk_hw_register(dev, &clk_div_mux[i].hw);
+		ret = vc3_register_clk(dev, &clk_div_mux[i], regmap);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "failed to register clock %s\n",
@@ -1080,9 +1233,8 @@ static int vc3_probe(struct i2c_client *client)
 
 	/* Register dividers */
 	for (i = 0; i < ARRAY_SIZE(clk_div); i++) {
-		clk_div[i].regmap = regmap;
 		name = clk_div[i].hw.init->name;
-		ret = devm_clk_hw_register(dev, &clk_div[i].hw);
+		ret = vc3_register_clk(dev, &clk_div[i], regmap);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "failed to register clock %s\n",
@@ -1091,14 +1243,13 @@ static int vc3_probe(struct i2c_client *client)
 
 	/* Register clk muxes */
 	for (i = 0; i < ARRAY_SIZE(clk_mux); i++) {
-		clk_mux[i].regmap = regmap;
 		if (i == VC3_SE2_MUX) {
 			struct vc3_clk_data *clk_data = clk_mux[i].data;
 
 			clk_data->bitmsk = data->se2_clk_sel_msk;
 		}
 		name = clk_mux[i].hw.init->name;
-		ret = devm_clk_hw_register(dev, &clk_mux[i].hw);
+		ret = vc3_register_clk(dev, &clk_mux[i], regmap);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "failed to register clock %s\n",
-- 
2.51.0


