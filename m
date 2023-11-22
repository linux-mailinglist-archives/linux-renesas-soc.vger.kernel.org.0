Return-Path: <linux-renesas-soc+bounces-115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 826847F48D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 15:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 661211C20B01
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 14:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948034E1B5;
	Wed, 22 Nov 2023 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id A0777110;
	Wed, 22 Nov 2023 06:23:20 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,219,1695654000"; 
   d="scan'208";a="187742820"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2023 23:23:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6B96D4280550;
	Wed, 22 Nov 2023 23:23:17 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/5] clk: versaclock3: Update vc3_get_div() to avoid divide by zero
Date: Wed, 22 Nov 2023 14:23:06 +0000
Message-Id: <20231122142310.203169-2-biju.das.jz@bp.renesas.com>
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

Update vc3_get_div() to avoid divide by zero operation on
vc3_div_round_rate() by returning1, if there is no table match
found.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/clk-versaclock3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 00930d7bca77..3aad69a08512 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -477,7 +477,7 @@ static unsigned int vc3_get_div(const struct clk_div_table *table,
 		if (clkt->val == val)
 			return clkt->div;
 
-	return 0;
+	return 1;
 }
 
 static unsigned long vc3_div_recalc_rate(struct clk_hw *hw,
-- 
2.25.1


