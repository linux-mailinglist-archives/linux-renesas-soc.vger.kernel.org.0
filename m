Return-Path: <linux-renesas-soc+bounces-9691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A73D099A8CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 18:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66C7A283728
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 16:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05067197A9F;
	Fri, 11 Oct 2024 16:20:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5976779E1;
	Fri, 11 Oct 2024 16:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728663654; cv=none; b=OYTNVszJdrNyB/ZBVHpfBEc3uSdiLfd4XPQwoEk6U0TLRZrmEHuo/ozHi3o65aePQiqO8IIazSe98eGQC1nbWn12Lp5nYtjvu7vdusSl7c/7hw2aRpxDlPABEy45LQk6vKnO5co1ekK8KubWHhsi4mlLO0jpIAMyVz/KtU9GwwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728663654; c=relaxed/simple;
	bh=PcTJe+5YAXcwnzKBFdT1PrygqIthYzACWMgO77uYbbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tusKXSEUS6MDDabEsgagUgFeZBNNoZEerSDdn5MkRZVI67j2Q0N1ObUI0E1U2BqYqq4UNfwFRdRmvCUwC1kVnX7IYT3PYSxebu4FHRJ9FfCkQE1q5ZCw+JZWLV428uEJXM1PTBkkTFhQyj01i+MiXhGZj2U91c25V9+w6b3kyuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,196,1725289200"; 
   d="scan'208";a="225672738"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Oct 2024 01:20:44 +0900
Received: from localhost.localdomain (unknown [10.226.92.53])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E7E584018A17;
	Sat, 12 Oct 2024 01:20:32 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Hien Huynh <hien.huynh.px@renesas.com>
Subject: [PATCH v2] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
Date: Fri, 11 Oct 2024 17:20:27 +0100
Message-ID: <20241011162030.104489-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While computing foutpostdiv_rate, the value of params->pl5_fracin
is discarded, which results in the wrong refresh rate. Fix the formula
for computing foutpostdiv_rate.

Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk support")
Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Improved the precision by division of params->pl5_refdiv
   done after all multiplication.
---
 drivers/clk/renesas/rzg2l-cpg.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 88bf39e8c79c..a1e22d353689 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -548,7 +548,7 @@ static unsigned long
 rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
 			       unsigned long rate)
 {
-	unsigned long foutpostdiv_rate;
+	unsigned long foutpostdiv_rate, foutvco_rate;
 
 	params->pl5_intin = rate / MEGA;
 	params->pl5_fracin = div_u64(((u64)rate % MEGA) << 24, MEGA);
@@ -557,10 +557,12 @@ rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
 	params->pl5_postdiv2 = 1;
 	params->pl5_spread = 0x16;
 
-	foutpostdiv_rate =
-		EXTAL_FREQ_IN_MEGA_HZ * MEGA / params->pl5_refdiv *
-		((((params->pl5_intin << 24) + params->pl5_fracin)) >> 24) /
-		(params->pl5_postdiv1 * params->pl5_postdiv2);
+	foutvco_rate =
+		(EXTAL_FREQ_IN_MEGA_HZ * MEGA *
+		((params->pl5_intin << 24) + params->pl5_fracin) /
+		params->pl5_refdiv) >> 24;
+	foutpostdiv_rate = DIV_ROUND_CLOSEST_ULL(foutvco_rate,
+						 params->pl5_postdiv1 * params->pl5_postdiv2);
 
 	return foutpostdiv_rate;
 }
-- 
2.43.0


