Return-Path: <linux-renesas-soc+bounces-21667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409DB504E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 20:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A34F81C6197B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 18:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF2835E4C9;
	Tue,  9 Sep 2025 18:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8+jyCII"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F32750E3;
	Tue,  9 Sep 2025 18:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441290; cv=none; b=GhlUH08G1Vokf2dagBmPRK+TQqbV5acyaTHv2VHwoJ74z04aqGvkdCX8HdYN7ZG/4ufSS1UF9WmWnlmofZDKNZpQCbkzqxvRHgjld7TQIpeDvvB4cvdv8OhEDIf7YSVdoMbc2ePE0S3db9/JIlWj8+TToLTP1h8/Kyyo6T6A12k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441290; c=relaxed/simple;
	bh=8ltFDpXpOdzbdrwPp1Ji1R7J74XgUCaZ2w1+XEVzwy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YT5lstQyUty/NSRY30Vv5iSupna0MzpsWn5IOs8u7E1oYCsm55QlKRHI22mzq66s4eYXKKk0HbQ7A13DKWEhrdlqDQsXbw6kezVC7zJTJdL7yHz0quevK7gIH7NcBM9bMHnox/j6LFuDfiftpLPBkAtp96Hv6dq/4z5vVQhcL+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8+jyCII; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45de6415102so22449525e9.1;
        Tue, 09 Sep 2025 11:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757441287; x=1758046087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFI2u9ZURnT55vQHiWPuS7jVXiaWLnjk54INMg0gHO8=;
        b=U8+jyCII8/wVjjF3SMEXd7DNxEy0R8Zg/WzXdw9Rfn009+SPu2bG9Yiba075pw6aVk
         eBy5yvzssinyG+D5bktpbGJ80Q0S2D022XfwUX3tkbVdzW9HJbsLsexuyGwXD+4+Fqug
         KhyHxhings/8ML3qxFjKB3XYdvZe/KtaQXnOfN79spm3EZXefMud6jVAMuj4gmwt6VEO
         FsWO4RGS0e/xCVSZgQckmtrzkkt3HrMPx9lVzH2zpy4IJd4eLWkIjGb7hLWPEfyIGDL9
         hlADzUvxbMOJGLYTTn0muwjmWttyU+Ye3anmb8exv3FIWMH12WVPeIsdZokoRTvdaUxN
         VgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441287; x=1758046087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFI2u9ZURnT55vQHiWPuS7jVXiaWLnjk54INMg0gHO8=;
        b=uhn4gVMm2h96Z0zfrHsn1y9lb2zvHl96TM7s1GkgC1p544Y5QleN3xdwMf3F/0j9EY
         sRs6wY2cn7N+4FTlXOPACtxcjK1YEhcJUy2FQm2ZOxtVSC4b0JO7qwwtNXKgLiA+53IJ
         QwrFrSmhfBBeMSvqHACnSo5rkbqN0cSAZQseTPJP41liv+Xvk/rVxvTD1p0xsVz8J7X9
         hGGwpV+2vHSK3EBnvjxSRlKKCqsSMS2WhzhIZ+BSGVaNlHiPUXnjxbTxLfq577Q0kebv
         XU6x5+vib7N5Rbb9idqJMEbdqnI3s7nbxCJr2DjJi2wzdmFNDrrrgMC22aXcpg1HDKOP
         X19w==
X-Forwarded-Encrypted: i=1; AJvYcCU/TzLNJ5PVcO235sTcmaVLeDGViJOeoAinfTi4LQQQL0cKv5R97Qec35yDKTELrcHv5ebqE4LU0t0=@vger.kernel.org, AJvYcCUfGowBpxtmF7HFzEzF+iHrO6OCntZwV8PDVuTS5SGs/MY1/LI5HERADyGnsGytt+U4z1Qd/+QGbqAzK81k@vger.kernel.org, AJvYcCVYJfSQiRX6Q4Sl4j5hmbu8LW+nwhJvZWScK8YWPMq8Z5tyimx7onc7+trFwHazp3/AnBsKjLTFVFV4sb/3BwhwniE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4zo0Og66Pe0aNAvz/86FSfkbKeKXOPTbsIS6plZghaGTYBx/8
	pOZ3LSINT3VPHs1bwf/7NEIdhAq0pzXU/BXOgwp+X8aRPKTCnxx0+zQV
X-Gm-Gg: ASbGncsfjuRnYwiqQytTHBHiZP/GcHIvQJKounvrtID4+okj1xkI6KG2g0MspQi4ShM
	114fetvsLj3l8FiqBO6MHRuPlzsrYTZvx4cmT/FomxbXlQnLbb0gk2ui/U7wuc5triEgSS0Htr9
	tFwZ+QSoHX+Si6/VXzZeZsOPfFaQNdTOKPKzJU04iWjyO8u7En3wvHEi1BiWscv57wtd1j3yeIT
	C+7jq8O5vQ4al2hSbXAiRj5KQphxdK6bkK7MhsKG9TqAoWftt357OXCAedfROkMNlooUSWjJcqz
	DqMzR0Yq4c2fWbYArPL0a0SSNTU3iBcoWBemo4SQsztek9a1FFJtpfXvf1BE0sgDQTBSfcW5HL+
	je722dXR4t1nkTA0KGUtDV9q3Bv/Gtvhj5UOE9PXO7HviCla4aEpvcH58XMjzFuisp8xhu+ZiKy
	TfBA==
X-Google-Smtp-Source: AGHT+IHr+/UOVyBCtLjfKkcgPuuoR8eG32ZhEuMGomi+U8PG46ww0tpw+MY021IrxXTEIgHGV0Uhug==
X-Received: by 2002:a05:6000:40d9:b0:3da:d8a1:9b86 with SMTP id ffacd0b85a97d-3e645e85aafmr8409604f8f.50.1757441287173;
        Tue, 09 Sep 2025 11:08:07 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df679a4c9sm4174015e9.3.2025.09.09.11.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:08:06 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 02/11] clk: renesas: r9a09g047: Add USB3.0 clocks/resets
Date: Tue,  9 Sep 2025 19:07:47 +0100
Message-ID: <20250909180803.140939-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
References: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB3.0 clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Replaced usb30->usb3_0 for clocks and resets.
---
 drivers/clk/renesas/r9a09g047-cpg.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index afd09b95fb74..ef115f9ec0e6 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -16,7 +16,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G047_GBETH_1_CLK_PTP_REF_I,
+	LAST_DT_CORE_CLK = R9A09G047_USB3_0_CLKCORE,
 
 	/* External Input Clocks */
 	CLK_AUDIO_EXTAL,
@@ -181,6 +181,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 		  CLK_PLLETH_DIV_125_FIX, 1, 1),
 	DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G047_GBETH_1_CLK_PTP_REF_I,
 		  CLK_PLLETH_DIV_125_FIX, 1, 1),
+	DEF_FIXED("usb3_0_ref_alt_clk_p", R9A09G047_USB3_0_REF_ALT_CLK_P, CLK_QEXTAL, 1, 1),
+	DEF_FIXED("usb3_0_core_clk", R9A09G047_USB3_0_CLKCORE, CLK_QEXTAL, 1, 1),
 };
 
 static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
@@ -276,6 +278,10 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(4))),
 	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
 						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("usb3_0_aclk",			CLK_PLLDTY_DIV8, 10, 15, 5, 15,
+						BUS_MSTOP(7, BIT(12))),
+	DEF_MOD("usb3_0_pclk_usbtst",		CLK_PLLDTY_ACPU_DIV4, 11, 0, 5, 16,
+						BUS_MSTOP(7, BIT(14))),
 	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_tx_i", CLK_SMUX2_GBE0_TXCLK, 11, 8, 5, 24,
 						BUS_MSTOP(8, BIT(5)), 1),
 	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_rx_i", CLK_SMUX2_GBE0_RXCLK, 11, 9, 5, 25,
@@ -352,6 +358,7 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
+	DEF_RST(10, 10, 4, 27),		/* USB3_0_ARESETN */
 	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
 	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
-- 
2.43.0


