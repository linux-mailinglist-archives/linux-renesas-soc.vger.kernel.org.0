Return-Path: <linux-renesas-soc+bounces-18082-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C76FCAD5029
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 11:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 664141694AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 09:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A997A2609FB;
	Wed, 11 Jun 2025 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S1Js/26N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15131E1A16
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634801; cv=none; b=KUxohg0m62FCVv8vnVxW0dxGlwK2df/qaJ6qostvYy6husJWFDlHaE6xK+UlR7qoW6aSiKv2M0UIZBQIfAafRksBFPpd7SCihFw29cSLCvelncVoImjvkIPoA5QBJY+15BHY14B1BiJfVlw7U4DLtgZisXq9rmoxA573vwgmAL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634801; c=relaxed/simple;
	bh=F8ZsRYc4t7D9nMCh4U8wknMtX9Zqpdj7+tL9h3vM9d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hrid+gQLt5x6+MSch74CbKaufP//TtKbHArkMkyuoS1Rs8aZXLSaBz1TS/qs6YWyCOZT1QnTYPwQmrjU6rJimItWXPf7IGuc+I0bsaRQ7NLIRb7epBPN0C6h/3Ly6pCNzJmnQH/eimeWhc2CFJ+NOreVc5gSeWQ64Cigz+fIobA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S1Js/26N; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=mTyIkW7jrdC/3TA5WvLd1QxAsTPlEc6dF3FZAR7ZyJk=; b=S1Js/2
	6Nyksfb+uAsGIY1dB5q87IMCGrFBSsnNkoz64xBZAwmUvbde0IZAwhrkMPlt0vi0
	d9rF/4TOJ07FvZ801IGyFKRo2/90szeZ6TWXwaF8+TZYAv4SXpTvigx9uhlsU+iQ
	eLufeJitKO2ADWXi8cJP0tGlQlV8/sUKAKXN/CvgKUOsz3WgqoOkg5vohJou9+8S
	4CF2uaVSFFE0Ob4AKDmMH+4O4jQXLt9UZYYIkHFP/bEGJybPirgYJ92nRDmix3sC
	GnMdknEPsM9hTf9rn3pBch/daeqcJDmIoIh/9P1lcv2RnvI75hWGS9YvJPZ79Dib
	uQNW9oOeuv/W4kUw==
Received: (qmail 3186393 invoked from network); 11 Jun 2025 11:39:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2025 11:39:50 +0200
X-UD-Smtp-Session: l3s3148p1@OHklmEg37LAgAwDPXy2/ACpZfVCNKldR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH RFC 2/7] clk: renesas: r9a09g047: Add I3C0 clocks and resets
Date: Wed, 11 Jun 2025 11:39:26 +0200
Message-ID: <20250611093934.4208-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Add Renesas RZ/G3E R9A09G047 I3C0 clocks and reset support into
cpg driver.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 21699999cedd..3e50447ed9f3 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -160,6 +160,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(5, BIT(13))),
 	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
 						BUS_MSTOP(3, BIT(14))),
+	DEF_MOD("i3c_0_pclkrw",			CLK_PLLCLN_DIV16, 9, 0, 4, 16,
+						BUS_MSTOP(10, BIT(15))),
+	DEF_MOD("i3c_0_pclk",			CLK_PLLCLN_DIV16, 9, 1, 4, 17,
+						BUS_MSTOP(10, BIT(15))),
+	DEF_MOD("i3c_0_tclk",			CLK_PLLCLN_DIV8, 9, 2, 4, 18,
+						BUS_MSTOP(10, BIT(15))),
 	DEF_MOD("riic_8_ckm",			CLK_PLLCM33_DIV16, 9, 3, 4, 19,
 						BUS_MSTOP(3, BIT(13))),
 	DEF_MOD("riic_0_ckm",			CLK_PLLCLN_DIV16, 9, 4, 4, 20,
@@ -239,6 +245,8 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
 	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
 	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
+	DEF_RST(9, 6, 4, 7),		/* I3C_0_PRESETN */
+	DEF_RST(9, 7, 4, 8),		/* I3C_0_TRESETN */
 	DEF_RST(9, 8, 4, 9),		/* RIIC_0_MRST */
 	DEF_RST(9, 9, 4, 10),		/* RIIC_1_MRST */
 	DEF_RST(9, 10, 4, 11),		/* RIIC_2_MRST */
-- 
2.47.2


