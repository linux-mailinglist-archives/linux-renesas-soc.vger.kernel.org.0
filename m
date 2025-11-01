Return-Path: <linux-renesas-soc+bounces-23980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CEFC277FD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 06:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D90B421CC0
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 05:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE70927B4EB;
	Sat,  1 Nov 2025 05:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQmJzrvj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645B11E868
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 05:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761973262; cv=none; b=BqKU13ry4Ol9cpRacgodyi5a1QAon1A5YaDU9PwL05Zz6X1McqRN4MJK4MdEt76fWfKuc+S9QdLwenfDEIaL3+pVI/bqQQPsQzCggUN5gJDTZeViUnshNxx0dcVg+KRe1LefbhstrD503mTluzJZBAM3C3zdhjBfJzXokPUDuwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761973262; c=relaxed/simple;
	bh=mmU7WCoMHpBBlDdOEGbM2mXzlQw3CRiu4W4BbEsf90I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZn11vslqlxqxaJeU9yFSU1wcG0foNdNblYuGOnLhLOOIq2o5BBbctdSVNZJuKs1UPYl9xYl2J6j3Zsenvv8UWwJIltw/C+qWnJgo3XKFvdl7aqjeEvqJZUBrviXRtqlAupAnwZwXNuWJkMYhes34LAoA7Gx4dPtyL4qPgkgqGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQmJzrvj; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-340ba29d518so421562a91.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Oct 2025 22:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761973260; x=1762578060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDfOhi/a+fMA4qrrAJ/OYD7QRWDm3djMuAPp7/xxNPo=;
        b=TQmJzrvj4L8iJx3pwT2M5ylCRmrL99wGQ477FV+T17xuamoMWF6AJw2mFJn/Jcy3V0
         J86hDMlr8j6G0Hk1IoaQoQrlJ8G7pb1akTuatctnHx6oLuUV0a+fjbvgy4vZiJwtka3G
         cyafJIiXHOIkb8rZVxCBZFdNtNV+rwClklz01v3kpYa8bZHWOjvaK30c5aCpVUCV23jG
         xwmHOk93+j6um/hYKWsl7+6/RMnO2tHxXEMwI/5GhWFqIdlSwomSzhxYNL3k0yaJgwPf
         ytmvlcgWAXYmIxfLoS3IEJ6+xlq2GkrGoK7reAV8Qt7LPD29LGHT12UGnfu3HoiEvzhj
         ByFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761973260; x=1762578060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDfOhi/a+fMA4qrrAJ/OYD7QRWDm3djMuAPp7/xxNPo=;
        b=iXXMRC+RGbtx163aeKK6h7fxmdfbd2bUqYDyQF+Laa9eZePgU+nE51qT2RdmyWNKnu
         tL58ld2+XgcSc4dtyTSrbQR9e7ieD6aA3jIqjCSlHkPI3HN1CMJSyQZSejG3fKyY11yP
         7yrdayF/fwz1ubG+kZkfVeWQw5BGwOJn+9qgwJcOIBiBJS0WSIzyUmZviYh3a7K9fq8s
         AU5wRgaxM7E/alJLQc5M0mnm90nEXXTOy/ZVQqa9IYLrcRsiz0Kxf8piuw5Mv2f/Rw+9
         OtmsselDgSJ501KgGdPCb98ZZcJLe+kOszvFtxhSDL0pLMVOR4rJ0TPYh9b0Rdx+O9Vn
         urPw==
X-Forwarded-Encrypted: i=1; AJvYcCUewdk3fDlEUEpAGTSdkOcykbzxLzEmjED4EMCOUw/u64jvZRZQfpxLmdyIEhJowq8UtpHY9VdQ1VC0uOY/VqPMBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJeseXrKgU3vAMS0skEib4S5kn7nEAgic7dPuZQV23YXtYnsyE
	cbYBS0oNDi9+5TqDiZGDN054qNjN1/MgbVPo3/jwWs3LZ8OIwAChJP74xoxHYMAM
X-Gm-Gg: ASbGncujFPtd32TQAO/UqRsdhRCheFm9h0Rd6JqWtbYFyYeM+ZkrUb9Y3NzGs8fIJw3
	VOsLWGRFcYowQCoAzpsxXzqDWuL+KNhKvJrHCgQxt5zmwFBXBCMH+U8SLR8ns2Hh2H6GAWl31am
	Yx0GmEF+scYxsbcfqCAD5wdRrN3YVv8dH4pQXuAF113gvYWsj2k2KON6CvNCEFsTGy5grO2jEsH
	Kbm6RuHf+FoWL+bZrhK+XphUel8pIdTYhhfzm5r5YjCfWl3J8YCcmIfX92OI6oWt/ai6I5mVcrO
	Kyc4J9Zb9PVL9U8qMX5bqw5I9GpWryabcpcc5KU54I7nWh3nqUUaTfim3SiUPnJ76EdA/mjLT7e
	KPDJbqPDVMy2EHm7Ua4E9MVKb9JfAamLTgERtIHpmdwJ/v3cm9Rg/KVt6+agn1ALVnaOInXJca/
	N7VP9Kdh2ZjYu/zUYyVgfR
X-Google-Smtp-Source: AGHT+IFVFBkXLeknHGrVPrf+9NXafeqPq51bDE4YzC1y7r8qfI4ybJ4GeXk3WxHgPmovadiop8e7BA==
X-Received: by 2002:a17:90b:3b52:b0:329:cb75:fef2 with SMTP id 98e67ed59e1d1-34082fc69d6mr7936643a91.3.1761973260531;
        Fri, 31 Oct 2025 22:01:00 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:600d:690:cbc4:d4d9:22c2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b8aa3ff1sm3761095a12.14.2025.10.31.22.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 22:00:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] clk: renesas: r9a09g057: Add USB3.0 clocks/resets
Date: Sat,  1 Nov 2025 05:00:33 +0000
Message-ID: <20251101050034.738807-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add USB3.0 clock and reset entries.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index c9f6d91884c3..400d9e94f2e9 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -17,7 +17,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G057_SPI_CLK_SPI,
+	LAST_DT_CORE_CLK = R9A09G057_USB3_1_CLKCORE,
 
 	/* External Input Clocks */
 	CLK_AUDIO_EXTAL,
@@ -235,6 +235,10 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 		  CLK_PLLETH_DIV_125_FIX, 1, 1),
 	DEF_FIXED_MOD_STATUS("spi_clk_spi", R9A09G057_SPI_CLK_SPI, CLK_PLLCM33_XSPI, 1, 2,
 			     FIXED_MOD_CONF_XSPI),
+	DEF_FIXED("usb3_0_ref_alt_clk_p", R9A09G057_USB3_0_REF_ALT_CLK_P, CLK_QEXTAL, 1, 1),
+	DEF_FIXED("usb3_0_core_clk", R9A09G057_USB3_0_CLKCORE, CLK_QEXTAL, 1, 1),
+	DEF_FIXED("usb3_1_ref_alt_clk_p", R9A09G057_USB3_1_REF_ALT_CLK_P, CLK_QEXTAL, 1, 1),
+	DEF_FIXED("usb3_1_core_clk", R9A09G057_USB3_1_CLKCORE, CLK_QEXTAL, 1, 1),
 };
 
 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
@@ -360,6 +364,14 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(4))),
 	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
 						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("usb3_0_aclk",			CLK_PLLDTY_DIV8, 10, 15, 5, 15,
+						BUS_MSTOP(7, BIT(12))),
+	DEF_MOD("usb3_0_pclk_usbtst",		CLK_PLLDTY_ACPU_DIV4, 11, 0, 5, 16,
+						BUS_MSTOP(7, BIT(14))),
+	DEF_MOD("usb3_1_aclk",			CLK_PLLDTY_DIV8, 11, 1, 5, 17,
+						BUS_MSTOP(7, BIT(13))),
+	DEF_MOD("usb3_1_pclk_usbtst",		CLK_PLLDTY_ACPU_DIV4, 11, 2, 5, 18,
+						BUS_MSTOP(7, BIT(15))),
 	DEF_MOD("usb2_0_u2h0_hclk",		CLK_PLLDTY_DIV8, 11, 3, 5, 19,
 						BUS_MSTOP(7, BIT(7))),
 	DEF_MOD("usb2_0_u2h1_hclk",		CLK_PLLDTY_DIV8, 11, 4, 5, 20,
@@ -501,6 +513,8 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
+	DEF_RST(10, 10, 4, 27),		/* USB3_0_ARESETN */
+	DEF_RST(10, 11, 4, 28),		/* USB3_1_ARESETN */
 	DEF_RST(10, 12, 4, 29),		/* USB2_0_U2H0_HRESETN */
 	DEF_RST(10, 13, 4, 30),		/* USB2_0_U2H1_HRESETN */
 	DEF_RST(10, 14, 4, 31),		/* USB2_0_U2P_EXL_SYSRST */
-- 
2.43.0


