Return-Path: <linux-renesas-soc+bounces-17056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165BEAB58FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 17:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88EE17A5B6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38A22BEC2A;
	Tue, 13 May 2025 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHwF8iYS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006412BE7A8;
	Tue, 13 May 2025 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151207; cv=none; b=LTZ6H5fSh7yIpWPTAo1JZiZu2S4tVfu3iX+57LAUKj7dkMk4XAZ9IWqtiaQI49GmBhTZBZnzQeJQZK9h6XeRqOvvx9IotjD+7s4Y6jUl3ISArR4FgBo4OqEPe4NkLKCtOjK9ky9mIsksdPaRdx0DpvI8j3OzYQpiNLX0pCEJfXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151207; c=relaxed/simple;
	bh=Ei3c30IkgDbDFBAIgcKxhxiqZ5bn2Gk1/GLZH03kNh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mh0Kpc7x4KIS48dupWb/bBxJZptdWCkb5WvVwboJE3Nnrol9KbMbkxpU1X8Ae5KF70UBmTa1sBhpG3LbMkqTYK4UwKeYDSAFkKLqEILFN+dZz/p04JiJpKVqmHqnss+QeVHmLdUpfE/cLC3M3QSJgzIqpYTjhFBn57dxOnDBk80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHwF8iYS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso61439815e9.0;
        Tue, 13 May 2025 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747151204; x=1747756004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frTcHJ1Ea1WqOcJu3ebjls25uv02kObZU7xmSP4EXMc=;
        b=kHwF8iYSlpdaHEEFWRYzPaiiP3fFqqoA2pEsjOQHeZkyU0pvijA4sPksy84ZC2Fr7N
         4pkVK1PSPPskC/iyCygrm6zL40Wc3/HxyTZyA99YERnW6hmL/tHT53uId7WIOXEhkEgB
         z364N5mUZNuSZkdyVZoo56CrQiZNijVnXfr32xvotsssn3ZoxpyK0to+OZSGZF/hNvq1
         6k3r7pa/5Xf4wD49plsFNiQD7+i9Spjhe7yQknzlcUK2qhtv/N29OkwqZZgq3HeKbn6/
         vKAXXGTI7vQhEo00gh3ApowlEM3SsAH8Oz5bQCVk10zAq4jIuUirodqjgfAG8EPC8W+R
         9wSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151204; x=1747756004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frTcHJ1Ea1WqOcJu3ebjls25uv02kObZU7xmSP4EXMc=;
        b=fwMPpoplCu+D1mLdhrIpYZ9yqoTd0UmT1hR8cq0r7JfsUJ8XNwsrHrszg71qODXuDa
         HeFPFVD4FOpsrxXebB/KU4IE5hnPSEaTGnlluXp8ViBZiTILDrvL6eqJBvBFS8I+7ham
         iEnYhi1RXCel61WP4H+5hM/FHOuAvUSc/Llz+vNmXEd5v8Z0zRkIUa4semVw+aqizHLH
         mDJn0Y6RM8swq2VF52FUuRT7qbJ9DbmcGfmxIMn3PBvN+rbgJHbg02vk5LGoNjl/29V3
         TyqaA/f6E4wXhJ/wMdjI0Bd/lKneMnlGwz/flxMbloY+8YKv1W8ziAYjyxAiKODi0SH1
         5JIA==
X-Forwarded-Encrypted: i=1; AJvYcCUXWI52jhsGw7Np1hfUk8OYjnwadsNd8fmIWx+J8uS6cHYCBmvGPWFN/ItIODtXFukQI8xskcciaKm8kHQ=@vger.kernel.org, AJvYcCWTq7F2Ys0SSbvILbdGVXGLL0XJ+oIn6mHgWVhBk0z83GTOCcRY9I3AOrIjAcZJ9VaFS2yKxk2Oa9okmg+amQe7610=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEWNeFd7oIqmbeY0HHD/bDRnAJoqg8+tCgS7xjvucMqlB9KDJq
	/RBxmPBHQjw65ZEnxTvJ8G6J6kj819CYmZdRtSmChuCBPOBqueoH
X-Gm-Gg: ASbGnctOvG7pbCIkP1ZRlUE7C11GCVqQ81k5sUHgDSCoSY00SyPctK6YLMBdWFDM+9s
	uNtxUi1wbaT+oDmJrUpfx7t3FB0e0VVTQmYD/5k0MMSlS7a9cBrV6WfDKG3UiGWMVyoIOOdElL0
	Fncmqp5xmAws/4oTE6gPPrYWImMO16VcEwR2ZmjmZtPUfo7yzkW1JXpy/+mZfP1mtU0ZR/nIiY+
	paEWeNSQqr2PdOAg4ga603VW/OHYTk5RExzPmme4kSJmKVOj/YSeoHiCQrjCvHH9ogoVaut2am8
	YTKJeVzQ16dYnknrsqhNayvJFCf9YhX7SQIChf64+QnX7eJoBBab84dLamDDowORvzmQU117mTb
	+j2g01US+Vw==
X-Google-Smtp-Source: AGHT+IFlZs4KN3x+jOO4Zys+qXTA4GLl+QCzqzAAx4N+sG7pzBc9R0NdKbUP5Da7aaiajbltT2pLcw==
X-Received: by 2002:a05:600c:6095:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-442d6d0a9ebmr147133625e9.7.1747151204078;
        Tue, 13 May 2025 08:46:44 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c996:6219:e8d3:1274])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d596a5e4sm183724645e9.31.2025.05.13.08.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:46:43 -0700 (PDT)
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
Subject: [PATCH 4/5] clk: renesas: r9a09g056: Add clock and reset entries for WDT controllers
Date: Tue, 13 May 2025 16:46:34 +0100
Message-ID: <20250513154635.273664-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add module clock and reset definitions for WDT0-3, which are available
on the RZ/V2N (R9A09G056) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index a489e718a9c2..7e34c4259a6c 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -152,6 +152,22 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(11, BIT(15))),
 	DEF_MOD("gtm_7_pclk",			CLK_PLLCLN_DIV16, 4, 10, 2, 10,
 						BUS_MSTOP(12, BIT(0))),
+	DEF_MOD("wdt_0_clkp",			CLK_PLLCM33_DIV16, 4, 11, 2, 11,
+						BUS_MSTOP(3, BIT(10))),
+	DEF_MOD("wdt_0_clk_loco",		CLK_QEXTAL, 4, 12, 2, 12,
+						BUS_MSTOP(3, BIT(10))),
+	DEF_MOD("wdt_1_clkp",			CLK_PLLCLN_DIV16, 4, 13, 2, 13,
+						BUS_MSTOP(1, BIT(0))),
+	DEF_MOD("wdt_1_clk_loco",		CLK_QEXTAL, 4, 14, 2, 14,
+						BUS_MSTOP(1, BIT(0))),
+	DEF_MOD("wdt_2_clkp",			CLK_PLLCLN_DIV16, 4, 15, 2, 15,
+						BUS_MSTOP(5, BIT(12))),
+	DEF_MOD("wdt_2_clk_loco",		CLK_QEXTAL, 5, 0, 2, 16,
+						BUS_MSTOP(5, BIT(12))),
+	DEF_MOD("wdt_3_clkp",			CLK_PLLCLN_DIV16, 5, 1, 2, 17,
+						BUS_MSTOP(5, BIT(13))),
+	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18,
+						BUS_MSTOP(5, BIT(13))),
 	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
 						BUS_MSTOP(3, BIT(14))),
 	DEF_MOD("riic_8_ckm",			CLK_PLLCM33_DIV16, 9, 3, 4, 19,
@@ -234,6 +250,10 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(7, 2, 3, 3),		/* GTM_5_PRESETZ */
 	DEF_RST(7, 3, 3, 4),		/* GTM_6_PRESETZ */
 	DEF_RST(7, 4, 3, 5),		/* GTM_7_PRESETZ */
+	DEF_RST(7, 5, 3, 6),		/* WDT_0_RESET */
+	DEF_RST(7, 6, 3, 7),		/* WDT_1_RESET */
+	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
+	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
 	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
 	DEF_RST(9, 8, 4, 9),		/* RIIC_0_MRST */
 	DEF_RST(9, 9, 4, 10),		/* RIIC_1_MRST */
-- 
2.49.0


