Return-Path: <linux-renesas-soc+bounces-17055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D386DAB58F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 17:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CD5A189BC04
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911702BE7C5;
	Tue, 13 May 2025 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILAYyKUL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9912BE0F4;
	Tue, 13 May 2025 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151206; cv=none; b=GGQ3VcGqbis3IRiZN7XBwWIb3zobxp/2H4HWjRHYSPv/yCMBx9EY2866ZULU9nc1rSmJq2o3pDTEQWFaEbcSDsUUG4r13JElOmqWr+znX++cXcqN9R/9XQhDPTrqrxGGHPS+/U1hvFNa+ZWsHZKxr+g+08UoZnqwD8uAZ/MYVvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151206; c=relaxed/simple;
	bh=7OObJFxfpZp1B8oXL+u4n3UpxgBKQ5XeeE4l+y+8bGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ih+2wsSExvF+6vrfrXMIe/+wr3FZNMuKLXKjqnw+zkFcpzaFELIoBYwR/yS8fP0sy5peT7WJL3jT7Moz7mdA9m/SVcqdP1PjLpJD84NYXmVSI48LdEuu3M+7PpX94W/g1YjeA8KAKmHiMZD8ZypOLqzPT22AAAb0SMLynez3W/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILAYyKUL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d0618746bso44390225e9.2;
        Tue, 13 May 2025 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747151203; x=1747756003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qy89hG9RDC9tHSW4zOkJGpVnZSzDfakkMpz+ikecyME=;
        b=ILAYyKULRth6QB4SQlCtX2eGm7/c9FBAva1o1UukawMywZp3gHveU4zszWpFCs04H3
         Vd2BolGksaKb0gXch709SrNwT0VnQB6jqPcZ08fk6BP+E0o2w7loe/0xzB+1DoEYmtkw
         BP0C1ydJkoyS2s5EwHqh+lmxUWXZAvUQbqY4yicAomNMT8Uez89q3fugjnnzQtjD2z/S
         QO/Fw/9T14O2uBK34ESfAEZky2cr17v98n0EEAMEi4BhbOgvshJl1X2AwLK1kG+rZSD8
         PcS+iYFyJS2WcqlqjAYwcEFZr3ScYqfsFVFGijdhujB/WuuBMgTOflsbrU138tzigFBu
         JOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151203; x=1747756003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qy89hG9RDC9tHSW4zOkJGpVnZSzDfakkMpz+ikecyME=;
        b=F8VYtkxmVEPPkMwUnon6kOez6ikw4Qlh/ll9nwHP3h56gHKExLsfuTo1JoSUlAcM0o
         86nPSEdQYljywE1uspW8oB3QlDe0Hdk/cTN74eyfmfLGAxoboigcqm6tG6mFhuRYjO14
         SIh97FHBhY4YpWsnDjMuxtKZFEujJuhakY3oH24/gfRNhdX1MjMl/+nZDEBbdmyNewFZ
         sZ2n/YJJJBSbBpfWkRklmqsC5bxZ4LOln2UJ99wuw7SkhE4Ggjf2DeRTAm97KWCB2Eej
         GHFBouq5dowbSfHwO2Zzbl1q56KUHUESAgtjGbu0K10uv+IJpBrrn8uclPj6sh41p/2m
         K+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUqC7bDXnlbnkPXkrqbLR/wtjiJDjh2mcPqsIQQKOjeCd8k3qZh6UYQiPAVNJlwFY6tK9DwnhFUobGjyHw=@vger.kernel.org, AJvYcCVZwRjRu8d0U1W4d4ehVc4MnZ+1l6fwDXF3y1y/x+6uc83HZsVhS4mq4JeqprTqsL2Z4DJEXhG3BRdmMqL0gyq73H4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyASbvXfwc6tvCbE/xDfi3TRor85RtwTN6Jmdhx1aeXeT4lsMUG
	uFJNGRg+CZgJXoSqluUyohb4xuyh5wVetxTWc3VcvuFnjUY2bA/5bT9+zKBo
X-Gm-Gg: ASbGncsE4RV/JEtQWwrKdIwU9pVnd+hsoF95kORigX2vqxPYLOtWiWPKeYrv3FI4mkB
	rFq8mgWCPg3lI0r7v0pxiS5XbN8m9PuRb1sd/rdO6/NbWSZ0FjgoL5+Ep2DR35cHQagOqUcZIWv
	RLHuPkQQRW1BnvhOnJXfpgouZbJz0co2Cs4AmoEC56zvbpxHp+cY5dTEU2x7PcLw9jRSopnxPh2
	WHZmEaoUM9Ci30Yxa0vEBEwRXcbq50ytR7rUjcqD5tEwj4wa1MB/18Ez/RFPP3oYXhPMkkNToJJ
	JmaWnMLOfKC9/N6VrOUpxbwNncsgHkapizOP4lm/f//9wPfQJ1xeatAJvzHChxaH4iQMMv0RsHe
	2uWHsnH9T+w==
X-Google-Smtp-Source: AGHT+IGkXKhFbr9hf0yD5nL5be1Q4mtJy3U+YmCf6vFEaqGgeKkNb8K5asqIxkl8QQ0jO3CWgb6AmA==
X-Received: by 2002:a05:600c:8708:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-442d6ddeb99mr179265345e9.31.1747151202588;
        Tue, 13 May 2025 08:46:42 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c996:6219:e8d3:1274])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d596a5e4sm183724645e9.31.2025.05.13.08.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:46:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/5] clk: renesas: r9a09g056-cpg: Add clock and reset entries for OSTM instances
Date: Tue, 13 May 2025 16:46:32 +0100
Message-ID: <20250513154635.273664-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513154635.273664-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250513154635.273664-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce a new fixed divider .pllcln_div16 which is sourced from PLLCLN
and add PCLK module clocks gtm_0_pclk through gtm_7_pclk for OSTM0-7. Add
corresponding reset lines GTM_0_PRESETZ through GTM_7_PRESETZ to control
the OSTM instances.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 5582041455c5..c57583e7f659 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -34,6 +34,7 @@ enum clk_ids {
 	CLK_PLLCM33_DIV16,
 	CLK_PLLCLN_DIV2,
 	CLK_PLLCLN_DIV8,
+	CLK_PLLCLN_DIV16,
 	CLK_PLLDTY_ACPU,
 	CLK_PLLDTY_ACPU_DIV4,
 	CLK_PLLDTY_DIV8,
@@ -98,6 +99,7 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 
 	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
 	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
+	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
 
 	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
 	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
@@ -134,6 +136,22 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
 						BUS_MSTOP(3, BIT(5))),
+	DEF_MOD("gtm_0_pclk",			CLK_PLLCM33_DIV16, 4, 3, 2, 3,
+						BUS_MSTOP(5, BIT(10))),
+	DEF_MOD("gtm_1_pclk",			CLK_PLLCM33_DIV16, 4, 4, 2, 4,
+						BUS_MSTOP(5, BIT(11))),
+	DEF_MOD("gtm_2_pclk",			CLK_PLLCLN_DIV16, 4, 5, 2, 5,
+						BUS_MSTOP(2, BIT(13))),
+	DEF_MOD("gtm_3_pclk",			CLK_PLLCLN_DIV16, 4, 6, 2, 6,
+						BUS_MSTOP(2, BIT(14))),
+	DEF_MOD("gtm_4_pclk",			CLK_PLLCLN_DIV16, 4, 7, 2, 7,
+						BUS_MSTOP(11, BIT(13))),
+	DEF_MOD("gtm_5_pclk",			CLK_PLLCLN_DIV16, 4, 8, 2, 8,
+						BUS_MSTOP(11, BIT(14))),
+	DEF_MOD("gtm_6_pclk",			CLK_PLLCLN_DIV16, 4, 9, 2, 9,
+						BUS_MSTOP(11, BIT(15))),
+	DEF_MOD("gtm_7_pclk",			CLK_PLLCLN_DIV16, 4, 10, 2, 10,
+						BUS_MSTOP(12, BIT(0))),
 	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
 						BUS_MSTOP(3, BIT(14))),
 	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3,
@@ -190,6 +208,14 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
 	DEF_RST(3, 8, 1, 9),		/* GIC_0_GICRESET_N */
 	DEF_RST(3, 9, 1, 10),		/* GIC_0_DBG_GICRESET_N */
+	DEF_RST(6, 13, 2, 30),		/* GTM_0_PRESETZ */
+	DEF_RST(6, 14, 2, 31),		/* GTM_1_PRESETZ */
+	DEF_RST(6, 15, 3, 0),		/* GTM_2_PRESETZ */
+	DEF_RST(7, 0, 3, 1),		/* GTM_3_PRESETZ */
+	DEF_RST(7, 1, 3, 2),		/* GTM_4_PRESETZ */
+	DEF_RST(7, 2, 3, 3),		/* GTM_5_PRESETZ */
+	DEF_RST(7, 3, 3, 4),		/* GTM_6_PRESETZ */
+	DEF_RST(7, 4, 3, 5),		/* GTM_7_PRESETZ */
 	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
-- 
2.49.0


