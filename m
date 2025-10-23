Return-Path: <linux-renesas-soc+bounces-23544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE5FC037F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 23:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A5E04E23CD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 21:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7546A27057D;
	Thu, 23 Oct 2025 21:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlcTtOgf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B602C0F71
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761253682; cv=none; b=XvNqChhh4q2dinv+jYtxysGDyDbsTTAxyUaN8s6q38oxWEQlLOBUTOvl/J54WdmpLiaU1ZqVdSlP6cf8T1lVKXW5fBwJuKjAKYT3ql2mjjCV7rsR6MC+uVGa5Bil+H3jAiFb1rHxbfITOckzMHfn3kpMX7cYeWkzfHZ8K9QL/Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761253682; c=relaxed/simple;
	bh=fcyAIRG+dgZ03Oba/2dpM7V9lNNGOfWjo3IjttQjkpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=der17xkY62QJTAOBwu4EgRj7jfM3VIIgdggZgWLN+F5pUaLPQpR8FF3UTZSCUz5jJ+ICTBYMH1UOTiVTWyJ6XwJelgp5PFfdq/ubxpTfGQGAmusR+LU5b6wm0jDfR0+W8+B3fghZvHtusE8bpe3ku065FzIfe36XgS+XMJnbWew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlcTtOgf; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781206cce18so1373297b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 14:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761253679; x=1761858479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzpeIbw6BSNHhoq4s0zh4pWGEO2OMapZHrQAySwDiLA=;
        b=TlcTtOgfnQuyqq6skO/2IHU4wwL6thzTxuvGMsILOxm36+y95LL5nBQtxGsxx2ChCR
         bUpL2sGmJvwOeFz7ll5Ehbs+0kRSbLJviqYlQRh83ZjfWw63t7P8T9NJyHwBlfauMq3u
         ZIWv3bCdX4GDJfadpDUvxvxLKlKddyPsbLhDJU5p8uqXXoEMAERSjrGa6p5K09vp8gUf
         TfGYJb7o2Sa9f48l80BDE/6n0jGbCsY8JQ/A1iu7//Fw1xVaGDVEqvM+iSWviFKgwJE6
         bZ4fJp74b70/cbO1SkKcDgqIew8bPH8c/PUEiqZ2mn3UI9gOvpBZhp96isqSBIMsfh3U
         pvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761253679; x=1761858479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzpeIbw6BSNHhoq4s0zh4pWGEO2OMapZHrQAySwDiLA=;
        b=CvdmxVJdsYc6NzwrhWYeen3w0nFK4pfKEd/FIle72ll8cP/0fcuVa98esT1kIo/X0Q
         +IB8qO8sBQbTV44WjZ4Ki57lyI0YhUZwBO3sQwmdn0VrkgZ+eO/qsjkayl8Y92UuJ2mb
         HBitYJNru/SnmyDxZm8sd9PTMx8HzhvI+NkazJphdG2Z7rn124sKV0fQSPG/x4a7Y+jj
         l38C4ygjPWTwwAN3TcEBcJqbEp6a72Gqd5heSeEYdqLAcOk/LKPf5lOCgmH8+zNx9WAr
         E2mGPAr7pC+rLd8xJG9QsdMADcdR2IxBPYMxEUKPHvokbnhBu19LxH9R4pzSrSHNqUH2
         eZLw==
X-Gm-Message-State: AOJu0YzGq2i2rBaI3/THU1sWw9omfD40nNkaBNyQZvD2oimH922lJFHm
	O3vFT5F/Ny+1HpknxzWgWSQoSQr8V1qL/C8FspEAgxV9vH0aXx8JjG0K
X-Gm-Gg: ASbGncv6buBFtzu/EkQZ0YcQSswFzZW/xSLcrH7YaumSMIUZq/RV6q13SL+Ve7yEQjl
	9eMExqZryDj6vYIuhpPGUkRpPcyDIQ6Xf05HhOWP5r7/PW8mgfn5SUth0I1H13hS/gPB/XRZhup
	6nHuat3aijWGogYllYy4RnEMZKfSOumIgt4rQJoSh/lE4ajn+2dvqIaIh5gY5p9/7aL0VVfJOjp
	Bs6VWG5bUJO4WvEUWejYZq8RkJeIMLmAvoHke10p9Fz4HxCq7yUuUiaQioL/r4YGU6zEkD2OKyU
	JftHWof8HJTWY7GckTXtZ+l6vyGVkYlPfH7FcbbWfhHt17fSbpBhr4a2ow5kYtW55nk+h4tXMEd
	qQ3IA2/AqzXpIMjIJ8Qix1bxToOlNh4Qo+/n9qnlGtVUglKmvEaYdABxHBgyn8HGKJD0sCxeFGf
	++IvKw582uWy2r/9Nqilo=
X-Google-Smtp-Source: AGHT+IGw5U9qHAm+G9+MHF38/9bWKPFLlpYC8MlAMkWqeOESX1Tzbl/n7rOnG89OOjPz5VAdF2WApg==
X-Received: by 2002:a05:6a21:32a4:b0:263:4717:559 with SMTP id adf61e73a8af0-33db40e0684mr365224637.20.1761253678756;
        Thu, 23 Oct 2025 14:07:58 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:ef2:36b5:9454:6fa:e888])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274bb2fcasm3461246b3a.58.2025.10.23.14.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 14:07:57 -0700 (PDT)
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
Subject: [PATCH 3/3] clk: renesas: r9a09g056: Add clock and reset entries for ISP
Date: Thu, 23 Oct 2025 22:07:24 +0100
Message-ID: <20251023210724.666476-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023210724.666476-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251023210724.666476-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add entries detailing the clocks and resets for the ISP in the
RZ/V2N SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 9c536f7706ff..e4a6dfd2bec9 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -53,6 +53,7 @@ enum clk_ids {
 	CLK_PLLDTY_DIV16,
 	CLK_PLLVDO_CRU0,
 	CLK_PLLVDO_CRU1,
+	CLK_PLLVDO_ISP,
 	CLK_PLLETH_DIV_250_FIX,
 	CLK_PLLETH_DIV_125_FIX,
 	CLK_CSDIV_PLLETH_GBE0,
@@ -186,6 +187,7 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 
 	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
 	DEF_DDIV(".pllvdo_cru1", CLK_PLLVDO_CRU1, CLK_PLLVDO, CDDIV4_DIVCTL0, dtable_2_4),
+	DEF_DDIV(".pllvdo_isp",  CLK_PLLVDO_ISP,  CLK_PLLVDO, CDDIV2_DIVCTL3, dtable_2_64),
 
 	DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH, 1, 4),
 	DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH_DIV_250_FIX, 1, 2),
@@ -359,6 +361,14 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(5))),
 	DEF_MOD("cru_1_pclk",			CLK_PLLDTY_DIV16, 13, 7, 6, 23,
 						BUS_MSTOP(9, BIT(5))),
+	DEF_MOD("isp_0_reg_aclk",		CLK_PLLDTY_ACPU_DIV2, 14, 2, 7, 2,
+						BUS_MSTOP(9, BIT(8))),
+	DEF_MOD("isp_0_pclk",			CLK_PLLDTY_DIV16, 14, 3, 7, 3,
+						BUS_MSTOP(9, BIT(8))),
+	DEF_MOD("isp_0_vin_aclk",		CLK_PLLDTY_ACPU_DIV2, 14, 4, 7, 4,
+						BUS_MSTOP(9, BIT(9))),
+	DEF_MOD("isp_0_isp_sclk",		CLK_PLLVDO_ISP, 14, 5, 7, 5,
+						BUS_MSTOP(9, BIT(9))),
 	DEF_MOD("dsi_0_pclk",			CLK_PLLDTY_DIV16, 14, 8, 7, 8,
 						BUS_MSTOP(9, BIT(14) | BIT(15))),
 	DEF_MOD("dsi_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
@@ -427,6 +437,10 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(12, 8, 5, 25),		/* CRU_1_PRESETN */
 	DEF_RST(12, 9, 5, 26),		/* CRU_1_ARESETN */
 	DEF_RST(12, 10, 5, 27),		/* CRU_1_S_RESETN */
+	DEF_RST(13, 1, 6, 2),		/* ISP_0_VIN_ARESETN */
+	DEF_RST(13, 2, 6, 3),		/* ISP_0_REG_ARESETN */
+	DEF_RST(13, 3, 6, 4),		/* ISP_0_ISP_SRESETN */
+	DEF_RST(13, 4, 6, 5),		/* ISP_0_PRESETN */
 	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
 	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
 	DEF_RST(13, 12, 6, 13),		/* LCDC_0_RESET_N */
-- 
2.43.0


