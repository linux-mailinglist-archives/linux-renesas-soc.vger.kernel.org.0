Return-Path: <linux-renesas-soc+bounces-8981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B45297B399
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 19:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFB80B227C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 17:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CE4187554;
	Tue, 17 Sep 2024 17:33:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C27186613;
	Tue, 17 Sep 2024 17:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726594413; cv=none; b=D/MaUaoaNakdSWYVbAsSfS4vWoA1O7cBWV/lCnmzbnqItE+G8pVNll15N3n9DcHIMIUVte0MDXjXc+y9oR5lad3yP4yTX6mKOAmwzDg0Q3aVOEgIl+r9zvBqCgARkH9rDqIqBhjnwOTOGjDifXghqyF/WtJaJ1yZ/WuHkS45Jso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726594413; c=relaxed/simple;
	bh=8LS6ufNdRJUNRFVXypRecuCps9qMtNArhdt6bQtPMVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Skgl0bct8798ayteaQLH+muH6s8lGPEaWLd7iRFofvEsc7AMufLwEOeTaLtV0r7JEacDb43kWgPMgeAsXw54TcJKNa/9uIehAc85oM5W+rYnxYQv6ROdOfUMz2ALhwluwGj1UfB7TfEL48ncuVE01qE/hEQTh/J1X5NGLviQJ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.10,235,1719846000"; 
   d="scan'208";a="218976908"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Sep 2024 02:33:29 +0900
Received: from mulinux.example.org (unknown [10.226.92.130])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4E1D04011F7F;
	Wed, 18 Sep 2024 02:33:26 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/6] clk: renesas: r9a09g057: Add clock and reset entries for ICU
Date: Tue, 17 Sep 2024 18:32:47 +0100
Message-Id: <20240917173249.158920-5-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
References: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock and reset entries for the Renesas RZ/V2H(P) ICU IP block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 3ee32db5c0af..b82fee006d65 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -78,6 +78,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 };
 
 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
+	DEF_MOD_CRITICAL("icu_0_pclk_i",	CLK_PLLCM33_DIV16, 0, 5, 0, 5),
 	DEF_MOD("gtm_0_pclk",			CLK_PLLCM33_DIV16, 4, 3, 2, 3),
 	DEF_MOD("gtm_1_pclk",			CLK_PLLCM33_DIV16, 4, 4, 2, 4),
 	DEF_MOD("gtm_2_pclk",			CLK_PLLCLN_DIV16, 4, 5, 2, 5),
@@ -119,6 +120,7 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 };
 
 static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
+	DEF_RST(3, 6, 1, 7),		/* ICU_0_PRESETN_I */
 	DEF_RST(6, 13, 2, 30),		/* GTM_0_PRESETZ */
 	DEF_RST(6, 14, 2, 31),		/* GTM_1_PRESETZ */
 	DEF_RST(6, 15, 3, 0),		/* GTM_2_PRESETZ */
-- 
2.34.1


