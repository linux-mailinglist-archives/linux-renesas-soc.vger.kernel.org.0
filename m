Return-Path: <linux-renesas-soc+bounces-9629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A73E996D2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 16:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB954286A41
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 14:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8870519AD71;
	Wed,  9 Oct 2024 14:03:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02207199FDE;
	Wed,  9 Oct 2024 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728482591; cv=none; b=YFHGesbWqc5/p/Vycl4f/y/ebHRrSD7ei5Ju5c4bijqhEXZmNpq9OYkqUo0AvS8THwmWBOpqdE9/fkVb2SrB3qmEJ/YZD8dZdgHrYvNQWJBnSsj7ElbG+HOryUueGdrWMwHOtPZM+4kfmyCS+j12qOBehyzEUuPC1QG86UlxO9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728482591; c=relaxed/simple;
	bh=hJeZDcakfe3CkAuKBsUIafm3NiYmVbj0BnQvMMSUKJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NEmGytomnaBsXrnvcSK0bVnjuNx+u6fRriajRSHkmpxV4faWW09jAtzR/b/1rc4wNOvTz4hXlYgjU+5SH0N3CWHVmpNeg3FAwjNevFrcgvkfE/qf5fyiYI1bVL5eHh8XFPt7HfS7w/ABUS97IK730G4s5tvWOMofS28bdd1c8n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="225436968"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Oct 2024 23:03:02 +0900
Received: from localhost.localdomain (unknown [10.226.93.118])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 238A24006DE9;
	Wed,  9 Oct 2024 23:02:53 +0900 (JST)
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
Subject: [PATCH] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
Date: Wed,  9 Oct 2024 15:02:46 +0100
Message-ID: <20241009140251.135085-1-biju.das.jz@bp.renesas.com>
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
Display resolution:1920x1080@60-->148.5 MHz dot clock
Before applying patch:
foutpostdiv_rate=1776000000
Dot clock = 1776000000/12 = 148 MHz
After applying patch:
foutpostdiv_rate=1782000000
Dot clock = 1782000000/12 = 148.5 MHz
---
 drivers/clk/renesas/rzg2l-cpg.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 88bf39e8c79c..58b7cbb24b5a 100644
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
+	foutvco_rate = EXTAL_FREQ_IN_MEGA_HZ * MEGA / params->pl5_refdiv;
+	foutvco_rate = mul_u64_u32_shr(foutvco_rate,
+				       (params->pl5_intin << 24) + params->pl5_fracin,
+				       24);
+	foutpostdiv_rate = DIV_ROUND_CLOSEST_ULL(foutvco_rate,
+						 params->pl5_postdiv1 * params->pl5_postdiv2);
 
 	return foutpostdiv_rate;
 }
-- 
2.43.0


