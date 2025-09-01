Return-Path: <linux-renesas-soc+bounces-21135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D30AB3EDDD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 20:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28A091A871DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 18:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7074A32ED22;
	Mon,  1 Sep 2025 18:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1A29aKu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9968F320A36;
	Mon,  1 Sep 2025 18:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756751410; cv=none; b=kJXUpOOT+NoJPvzYIgPmX8T1wt98Qqzd/7WLNROKMN8z3TvTuf2hEYZO8TsmtKpKezr3eLJfp2T4Qk/eTaVYb7LgydEkVTuR0CgwZg4TUov/usma8qcEhCrzq5KMU1XdBpTY29qy5LpoDDyrjInatfYGTKYKnhLla/zU4mAUeNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756751410; c=relaxed/simple;
	bh=UKiqQCVsZuvQMoC5LloSCPWdLMatGIjhMmftsNhZKL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d95471OHZUGWCooFxm0fkTXF2gX49LBDTRVVwvGNHBYl+YnvYZ+A+orcaUApeVyHTPhuhgEhkEO6LeK9QEStdrRKM6CoZEAxmij+fQ5WfHEllr4AwGluLBPuNMQefQW23VAqBsW4AySt2mTXHdR+Wq0KKiKnwHEjqANvDy4/OrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1A29aKu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso28005775e9.2;
        Mon, 01 Sep 2025 11:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756751407; x=1757356207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsRg/Mb6HYOj+u/psnqVQ5MEqP38BMpKlTlaK+X2e7o=;
        b=C1A29aKu1i6CFRLyGU2AenYuTpzcEuB1azsiYE8f/jEKAScO34hu7gHa8ib6a2pqaY
         2dNmxgPvkMFUy2CBPqrW1pqEKsmWdTcbZ1FAOBLhkdTMdE1piORh4LE90t3r0JRpMXlQ
         WpV5zNnFSd8USabOhILK9U8eX7WQI1HaEB+RxDNQrUNNcE2rjdQlyS1dXhPJQd5tq+v3
         2Hb/0aqnOByfJ6sBq9NKZ34S57se5KLpPKfWtHk45WBftiavdDm8CJtEKrzAyu+gVas/
         q1lfDfBD70QNfLxcQK+iC8LcvTLxQgnZh6XztjW/ZoBBBaHdzBfHvo3Wptzl97ny60SJ
         GtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756751407; x=1757356207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsRg/Mb6HYOj+u/psnqVQ5MEqP38BMpKlTlaK+X2e7o=;
        b=KvD6kCJLfF003TUbgp4XXQMZtM0Xx7irkQSUbGtzzOisIwHl2NPnV6R2xWaRJ1j79D
         0J6Z7hr+KadjUicwH885T34yRhWdOQhOx7Es6lZ5LcVLbgAmijECFSLO6jtOHfuxW/N1
         /dH9hiIBdBOSwrpztvi5/g763bosjnxyqgMzBb4Y3zGpi29oEd6ENI+NGe4QnZiVqjUH
         H9+7xG6QeSVU3qqjEjyPLTPPpeUP8NV4TvqHDegqvsKHQPkpKo6nj+jrbhtrNA4zcm6/
         p/Rk0KvzS5TuXH8NCaKDHnBZ2nFYjoj03f81f1w1r9e3NwXS/mwj+wPQ+ZnTD7fwsHpd
         Bo0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyZLeL5+rr/PmlROgCMJI8pxvuCNcX/d60SvQQbLd5nWJLtklijRJHhQe3O6Iyd/oaokHNORv6xom3@vger.kernel.org, AJvYcCW2mYjC9a9tRhfrEmYkilEyNt775qGddRengOqTWFUVGsEmv1gX7oWsMSI/2Uj0kl0KLCGyXKTA7ifN@vger.kernel.org, AJvYcCX/qjD3QNmJVRECDyOeAa0O6G7JsxLj87l4P3ZgI9dTuct5uy6D/7ak9dYNhfM9tUcS0ZbsZ6HX6/yUDlHJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzOz3HWncgLGxDC0oy/6gUUNNgL05lrvJvr5JMdybVY5fjfLb3l
	EtS27Ph1fE9AvhGsweGLlyb/cFoy4QE76Q6XjqOh1ui0mzYYOaaBPk8J
X-Gm-Gg: ASbGncuGFuvLURQfrV+GmFofmZl3HAhPMsILdJuQEgs3CJS5daaDtvE6qTi+me+78RX
	zvl06rV8Czf5G+gLg94a9jX5gVtqlC7TFuYjAwer6jYO6S2wUi3vezswY66KpzPfFy9HbY+pBMO
	GLcnCSXnHUVs8+qJ13b0D/0Fgq8uLwekU7Za2Yz+JydiAi+Ym3ldYqGk7Iky+9a9rRG5oEanZ9W
	udi/XRVLlBBBv15gCa6kq7tOMr9bZCF/NWXjKUREu1Zxf1257Mgm0OIj5JhRSLkBS1kwoZwXFgl
	b/tLldwjoSnFEfLtv+tliTDdzgjkEzB6qyTCvOvcXJG6A1KilOdRXtD9pCmfzYVl1ukRjzEV9Fk
	d5KeBBJhGHncImjMAXHRVRo7HfNavq5QDl91QeVqPsgWisAnheWZ3VMmz
X-Google-Smtp-Source: AGHT+IEnsIh6t4OS9eFETYH8kFSZTJm+RPUN40EnFIDMYcz3gbiG4hWFIOhw9wkbVZYQPrfpibUxfA==
X-Received: by 2002:a05:600c:484a:b0:45b:85d0:9a0c with SMTP id 5b1f17b1804b1-45b85d09ccdmr55182745e9.15.1756751406870;
        Mon, 01 Sep 2025 11:30:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7f53a947sm93602505e9.3.2025.09.01.11.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 11:30:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] clk: renesas: r9a09g077: Add Ethernet Subsystem core and module clocks
Date: Mon,  1 Sep 2025 19:30:00 +0100
Message-ID: <20250901183000.1357758-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901183000.1357758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250901183000.1357758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add module and core clocks used by Ethernet Subsystem (Ethernet_SS),
Ethernet MAC (GMAC), Ethernet Switch (ETHSW).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped an unnecessary extra line in core clocks
- Sorted the module clocks in ascending order of their IDs
---
 drivers/clk/renesas/r9a09g077-cpg.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 1fdd764f9b91..8a544ef48397 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -72,7 +72,7 @@ enum rzt2h_clk_types {
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G077_USB_CLK,
+	LAST_DT_CORE_CLK = R9A09G077_GMAC2_PCLKAH,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -166,11 +166,21 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	DEF_DIV("CA55S", R9A09G077_CLK_CA55S, CLK_SEL_CLK_PLL0, DIVCA55S,
 		dtable_1_2),
 	DEF_FIXED("PCLKGPTL", R9A09G077_CLK_PCLKGPTL, CLK_SEL_CLK_PLL1, 2, 1),
+	DEF_FIXED("PCLKH", R9A09G077_CLK_PCLKH, CLK_SEL_CLK_PLL1, 4, 1),
 	DEF_FIXED("PCLKM", R9A09G077_CLK_PCLKM, CLK_SEL_CLK_PLL1, 8, 1),
 	DEF_FIXED("PCLKL", R9A09G077_CLK_PCLKL, CLK_SEL_CLK_PLL1, 16, 1),
+	DEF_FIXED("PCLKAH", R9A09G077_CLK_PCLKAH, CLK_PLL4D1, 6, 1),
 	DEF_FIXED("PCLKAM", R9A09G077_CLK_PCLKAM, CLK_PLL4D1, 12, 1),
 	DEF_FIXED("SDHI_CLKHS", R9A09G077_SDHI_CLKHS, CLK_SEL_CLK_PLL2, 1, 1),
 	DEF_FIXED("USB_CLK", R9A09G077_USB_CLK, CLK_PLL4D1, 48, 1),
+	DEF_FIXED("ETCLKA", R9A09G077_ETCLKA, CLK_SEL_CLK_PLL1, 5, 1),
+	DEF_FIXED("ETCLKB", R9A09G077_ETCLKB, CLK_SEL_CLK_PLL1, 8, 1),
+	DEF_FIXED("ETCLKC", R9A09G077_ETCLKC, CLK_SEL_CLK_PLL1, 10, 1),
+	DEF_FIXED("ETCLKD", R9A09G077_ETCLKD, CLK_SEL_CLK_PLL1, 20, 1),
+	DEF_FIXED("ETCLKE", R9A09G077_ETCLKE, CLK_SEL_CLK_PLL1, 40, 1),
+	DEF_FIXED("GMAC0_PCLKH", R9A09G077_GMAC0_PCLKH, R9A09G077_CLK_PCLKH, 1, 1),
+	DEF_FIXED("GMAC1_PCLKH", R9A09G077_GMAC1_PCLKAH, R9A09G077_CLK_PCLKAH, 1, 1),
+	DEF_FIXED("GMAC2_PCLKH", R9A09G077_GMAC2_PCLKAH, R9A09G077_CLK_PCLKAH, 1, 1),
 };
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
@@ -181,7 +191,12 @@ static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
 	DEF_MOD("sci4fck", 12, CLK_SCI4ASYNC),
 	DEF_MOD("iic0", 100, R9A09G077_CLK_PCLKL),
 	DEF_MOD("iic1", 101, R9A09G077_CLK_PCLKL),
+	DEF_MOD("gmac0", 400, R9A09G077_CLK_PCLKM),
+	DEF_MOD("ethsw", 401, R9A09G077_CLK_PCLKM),
+	DEF_MOD("ethss", 403, R9A09G077_CLK_PCLKM),
 	DEF_MOD("usb", 408, R9A09G077_CLK_PCLKAM),
+	DEF_MOD("gmac1", 416, R9A09G077_CLK_PCLKAM),
+	DEF_MOD("gmac2", 417, R9A09G077_CLK_PCLKAM),
 	DEF_MOD("sci5fck", 600, CLK_SCI5ASYNC),
 	DEF_MOD("iic2", 601, R9A09G077_CLK_PCLKL),
 	DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),
-- 
2.51.0


