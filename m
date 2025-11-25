Return-Path: <linux-renesas-soc+bounces-25135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 23786C874BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 23:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 26AE6353FE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 22:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A460A33BBA0;
	Tue, 25 Nov 2025 22:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5ThUC5T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C094933AD82
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 22:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764108875; cv=none; b=sxcC3PDKzozABzI4puNVdJeQKykOjvnnPDhaqCX1HSYHH2uXihp7wCHJhNTKoOqr1tZRzlLntwq5TopJsLwBy9E6S5KY1ZtZNFmuyccxFNMkFdq35ieEMpUWunYSEEBx89yT+GiahRsrd4Acp3HOKtoisSkrL9Vhi94PjmmGknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764108875; c=relaxed/simple;
	bh=ieVmk/r37DgzjSeGs6qIdtiznjiv1WI5n4EoSx5CaRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWdYLJx2TK9970arb5dMfj4niYGDBiDow0F7PVnntu8SDVgRd57VYSzfCTeG9iiuv6arpvXloBAaRxn/Uo84UFUSWBZuwMs7QXwyggttSCFpWqQBFhLQiFbjwckJ5hPP2uiwudkuD74vy7vZIxI2iggrAvTBfvHu3hus5oOxBXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5ThUC5T; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b566859ecso5321148f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 14:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764108872; x=1764713672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kF9EvNjU2PfrYJ746DaqTgf92wjMqKxNoWSk+rxmmzY=;
        b=g5ThUC5T6EAcAj9EwlS6gsSNxhwHBWNvPWtRvS2S0vEb4tIbn1VZRrbGUl+oY2S8w4
         nfT72IlmTMQU45zJeSOZFuNAZzI8W036TudaB6A6CfBmq72a8qZk2fivUd3I9kTu9tEi
         VTrYytLOxJH1zfHX+jpYPVbUXhu/tnqUYhvGLy44E7Bm6GBIXGdFZ/E+OlIa/j8QPqu1
         WNlH7+zuf0dMBDlXYB3fHRFTAFuTvNHOUQkLE+R8k1s/dXIrYSnbppgeZikhlCi4BSQM
         zGckIegYQRAZlrx/LIFQdv87rpoheRobhb2b6EcwFATT0ZXXX3tvz6xbctr7DCuHVJmt
         +E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764108872; x=1764713672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kF9EvNjU2PfrYJ746DaqTgf92wjMqKxNoWSk+rxmmzY=;
        b=Bhe1JHSx5Dvvti2RqKlDhl/fm7ZWF38hqyXcHk9d1/y/eM7HtJdLmSeA1yoYpou0iq
         CH+qJl3UFyIsVHvY4EMIfyaWOP7skc/hVyLQa9stvz8JPmffk2qLE2iAhNBVk0L+/XU3
         P5Vrg51Cys2ftjCTkvzShZTiLOj1MEIGz+ZrPVt92U5qWxtSmDEgaSyMROBNHYNNik9O
         ftbzviCP5LoFTt8jKrP/25r+D83j8RbY+9YQZj70JcpSjP3Pfj/YuUS98rdmnxd4W7+1
         BnN1prwvUzXYnbFajZSXariucw2eSsyD/ZdafrBrPTqwPleSlnS3Em4k5/uuZCTCjFc9
         nz7g==
X-Gm-Message-State: AOJu0YzLmnltgX7ays0HjA9pMGQOXIfZtVa03l4Vl89OilUTxkdA0atG
	mmh7dg5JYzbItS/TkDX7v8CEbQC+p//yj+mQDqRtwdHpoAulUq3OT4dn
X-Gm-Gg: ASbGncsvG3oR4FhuGmkFt9Nx1usK+K7myEBI3t/9lk1WLChURUBP86oqDndleUrhVOc
	QXFiI56hLwy/MttHgK2jyYobdImCMbHwsRrylCYlQTkGn3C6Nc4clpnNDPsoL8RM4ovPg9KMwNO
	/lKMdEYRZrWWAmlUwPVNTUF72J91kuF9LwBBpG1fGHFgz26qjPHLhomSrtUKQlHwzsYdr/YDafo
	lDHssI9+t3WqUdTDlntGW3AtAFwmp2h8ZsO9tLxie3l0aJCLnfNiJjw9EgeorPrN/g4m7zogzVg
	7OG4tLiCi1sfZI204JA+vbSZ6xTZNnG33jvkcfYIJWvE1mBdX49O3ApFWekuYvZAH9L4CKf+uYt
	uJkpPdRsq1xh62zjeXuLgrlgOhLJOAE1qPAKyKgNpmhlkAhgduHdhYIqRZZbIIP3QoWbNmVxBu3
	KSlWpGOR86QWnUhR/pPHC+SMDywIQB5i+cJQ==
X-Google-Smtp-Source: AGHT+IGMiQmy0R+xrariL0SfMasthEFmrMEpgLOLsaKOLYZfkItc9vHrz4LY83QAaDZW0rLTXgTbvA==
X-Received: by 2002:a05:6000:430d:b0:429:ba48:4d6 with SMTP id ffacd0b85a97d-42e0f1fc42dmr4464560f8f.10.1764108872005;
        Tue, 25 Nov 2025 14:14:32 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm37462121f8f.11.2025.11.25.14.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:14:31 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] clk: renesas: r9a09g056: Add entries for the DMACs
Date: Tue, 25 Nov 2025 22:14:18 +0000
Message-ID: <20251125221420.288809-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for the DMAC IPs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index f48a082e65d7..19b712685a31 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -51,6 +51,8 @@ enum clk_ids {
 	CLK_PLLDTY_ACPU_DIV4,
 	CLK_PLLDTY_DIV8,
 	CLK_PLLDTY_DIV16,
+	CLK_PLLDTY_RCPU,
+	CLK_PLLDTY_RCPU_DIV4,
 	CLK_PLLVDO_CRU0,
 	CLK_PLLVDO_CRU1,
 	CLK_PLLVDO_ISP,
@@ -184,6 +186,8 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
 	DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
 	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
+	DEF_DDIV(".plldty_rcpu", CLK_PLLDTY_RCPU, CLK_PLLDTY, CDDIV3_DIVCTL2, dtable_2_64),
+	DEF_FIXED(".plldty_rcpu_div4", CLK_PLLDTY_RCPU_DIV4, CLK_PLLDTY_RCPU, 1, 4),
 
 	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
 	DEF_DDIV(".pllvdo_cru1", CLK_PLLVDO_CRU1, CLK_PLLVDO, CDDIV4_DIVCTL0, dtable_2_4),
@@ -231,6 +235,16 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 };
 
 static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
+	DEF_MOD("dmac_0_aclk",			CLK_PLLCM33_GEAR, 0, 0, 0, 0,
+						BUS_MSTOP(5, BIT(9))),
+	DEF_MOD("dmac_1_aclk",			CLK_PLLDTY_ACPU_DIV2, 0, 1, 0, 1,
+						BUS_MSTOP(3, BIT(2))),
+	DEF_MOD("dmac_2_aclk",			CLK_PLLDTY_ACPU_DIV2, 0, 2, 0, 2,
+						BUS_MSTOP(3, BIT(3))),
+	DEF_MOD("dmac_3_aclk",			CLK_PLLDTY_RCPU_DIV4, 0, 3, 0, 3,
+						BUS_MSTOP(10, BIT(11))),
+	DEF_MOD("dmac_4_aclk",			CLK_PLLDTY_RCPU_DIV4, 0, 4, 0, 4,
+						BUS_MSTOP(10, BIT(12))),
 	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
 						BUS_MSTOP(3, BIT(5))),
 	DEF_MOD("gtm_0_pclk",			CLK_PLLCM33_DIV16, 4, 3, 2, 3,
@@ -401,6 +415,11 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 
 static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
+	DEF_RST(3, 1, 1, 2),		/* DMAC_0_ARESETN */
+	DEF_RST(3, 2, 1, 3),		/* DMAC_1_ARESETN */
+	DEF_RST(3, 3, 1, 4),		/* DMAC_2_ARESETN */
+	DEF_RST(3, 4, 1, 5),		/* DMAC_3_ARESETN */
+	DEF_RST(3, 5, 1, 6),		/* DMAC_4_ARESETN */
 	DEF_RST(3, 8, 1, 9),		/* GIC_0_GICRESET_N */
 	DEF_RST(3, 9, 1, 10),		/* GIC_0_DBG_GICRESET_N */
 	DEF_RST(6, 13, 2, 30),		/* GTM_0_PRESETZ */
-- 
2.52.0


