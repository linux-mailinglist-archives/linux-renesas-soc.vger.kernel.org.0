Return-Path: <linux-renesas-soc+bounces-20758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3144B2DA0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 12:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 296F05C1C0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 10:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9594B2E2EFD;
	Wed, 20 Aug 2025 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJD13cvV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC49E2E2EE4;
	Wed, 20 Aug 2025 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755685859; cv=none; b=gwZlcNkaOCIdw8bqDgtnQctFQqpNNyH5gk4q1J7NM9adfIU0rdMYBXbTbz0Xs6sCiI/4zanJv+MogTd7OI/0HOqbUEYeZuvs1J31ngQ+TncnlIIdZVb2HTd1AIUZxjedhOLbOLyiqimWmUsb4fS7ImgWuQQ2VBmKLKkkYTa3EcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755685859; c=relaxed/simple;
	bh=6gndtw2P/WjxutJ+7wqpUMzzDX+XxfO19UIaHAlQWyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F4aOfdRfpM0kz16VxdUGmwlgRAC5aQHb+WPK3YI28hXizP33w6MpY5txOD4FKw5owb+nNjUAgQQkkuyttRKvy//ClURqloaov6c/6Wq9dIVarcCvxBdTgDfK5jujtPzUmNfjByT1/bYkcWo2xTyUAVsF70ab+H9MV3Xm3bG1m5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJD13cvV; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b9d41baedeso3342780f8f.0;
        Wed, 20 Aug 2025 03:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755685856; x=1756290656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BbbmjgSMod8UWJ7SiBMBQoey946xxpLzuXiTRaYhclM=;
        b=LJD13cvVjWnpLD/BcBv4VHXpDvdBiCTBorysJgKIoXERJPjHeoRM9417q8I6Xk5Yn9
         xGnBVFOTYK9+wFVtspRm0QS9AzPkQMb8ZyKizA3a4hD00BT7XEblWWu83KsUWaSrXxFO
         3V5xWMvP4DUfj//yUI6+RV482348kHAQhblf3VyUdvhlnsYKLuiSCHwmlMZFftVdsi/8
         /eQOq8ya6fK6LH2sLiJHV3+ox/Xfjmv7jsEIphWefMFzqQiRav1/BieXX2e6rzjY+IVn
         7HgKCbHTGVRmsr0lw/gVWHZj7PBkJB5joj8/+/kEaZWMEfKNZsjKeqFjIMVA5D6EJ6vj
         Amjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755685856; x=1756290656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbbmjgSMod8UWJ7SiBMBQoey946xxpLzuXiTRaYhclM=;
        b=TLUdKr7rMdjojDmpnUDuU4Z1m+AIn5qsrfeQitXRH8QccT4e8vVdw5l2lREt2UH4Ez
         nksbTfek/2CVnY9+gHdiH3qQHWruDi90e5tSKaHbM03ulru6uFMpS9QtJtE5Itz8qdeK
         h5YD01BoyLVhdhDNo61qh7WCPs3CTwcchl9dG9NqZ413onJ0OgnlDDpSQWYd3Dj00+FQ
         q2+hIIg3R9dhYdtNHZE0gpX/jpXUEG1jAgdUW8y2JQUF0MGuSH26fdhTIpyVloR3BFbF
         596BxCwQ/GWrtzPqkrAoYoUOcCesIlm0SNwYVYmOMP/3sAmOtEM1yn8mmiI0Q3BoBjgK
         vdzA==
X-Forwarded-Encrypted: i=1; AJvYcCVPwNknCA7vcVxMDCUL02Zp3ATfgcGxenudq5vDatiN+O6K5B9RR/7PSWuxHwVlXLf82xMbgKqOLvlqjAoR@vger.kernel.org, AJvYcCWO7XQsg2/RgjS9U7q6MyiQpuoYDEy86lvCc5mS8q+p8rkGwi76x7VVjcTCGC2nmtqgdh+akca5EiU=@vger.kernel.org, AJvYcCWuMzTjEE7RJKJvt0Xq2oCwi7ZsTUCFaR9O6WFCQSIxCYnNg/29zl9+8dCGvMmY65wfE/4mcthNWPF/p6ddhcherL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxBpPdv/FvrGEiIRMqUtGj7JK2izpeQUxYuQuYKLUhmYuZWuzJ
	U8O/mjGCXSw5KjhGbEgMDCgzk5fm/xIGPFpibxrfAnn7G3Iz4VbtH+SN/udM2w==
X-Gm-Gg: ASbGncut893qvRYG6uBFCxEqWi+gu39YASmt7XvV84u90XP0b+onIhlj95Dsq74L9ea
	zYjzap7njAr+GCdlXk0OPrJJIRZmgrZzUP0sfKsAK03xinq/t3lfGrm7HRz6Gggpoop5bWbNtBq
	0Ur4GqeT7TpxMlg3hxA3B4n3Z1gFvacIrXbtmN4xI676q+2SXrorHfKXRbp7G33T3bGO5DWsFsX
	vIk9L412WpUxkbt/7SC8bO9eTYdomstqKcpHz21HgFmst+vGuukgGNhAcC9pCVdKB21LUR6lba9
	Ha5olWNR/r1eAZc5tKZENaKrrwxLajmw37p00Fpuqddj59GLTUVASujS3zKZenfyCUWzACl+ySM
	IaBF0rqXUsEk8gXxwA28e9Wmsop4LSWa45MdCAQYHlA57niLk/5wJseWCtf/qVTqUKJmNX4deaQ
	==
X-Google-Smtp-Source: AGHT+IEVftALDM3YC/sDg6+i/niVwWvzzbeMrUAScggR3/+40jJoXk1gGHmnEij6ccI/R6xCql2K7g==
X-Received: by 2002:a5d:64cb:0:b0:3b7:9c28:f856 with SMTP id ffacd0b85a97d-3c32fe1a17dmr1498439f8f.48.1755685855711;
        Wed, 20 Aug 2025 03:30:55 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0777892f8sm7077119f8f.53.2025.08.20.03.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 03:30:55 -0700 (PDT)
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
Subject: [PATCH v2] clk: renesas: r9a09g047: Add GPT clocks and resets
Date: Wed, 20 Aug 2025 11:30:51 +0100
Message-ID: <20250820103053.93382-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add clock and reset entries for the Renesas RZ/G3E GPT{0,1} IPs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped the series as according to the clock system diagram and clock
   list sheets, gpt_[01]_pclk_sfr and gpt_[01]_clks_gpt are really the
   same clocks.
 * Dropped R9A09G047_GPT_1_CLKS_GPT macro
 * Replaced DEF_MOD_PARENT->DEF_MOD for module clks.
---
 drivers/clk/renesas/r9a09g047-cpg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 4e8881e0006b..afd09b95fb74 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -198,6 +198,10 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP_NONE),
 	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
 						BUS_MSTOP(3, BIT(5))),
+	DEF_MOD("gpt_0_pclk_sfr",		CLK_PLLCLN_DIV8, 3, 1, 1, 17,
+						BUS_MSTOP(6, BIT(11))),
+	DEF_MOD("gpt_1_pclk_sfr",		CLK_PLLCLN_DIV8, 3, 2, 1, 18,
+						BUS_MSTOP(6, BIT(12))),
 	DEF_MOD("wdt_1_clkp",			CLK_PLLCLN_DIV16, 4, 13, 2, 13,
 						BUS_MSTOP(1, BIT(0))),
 	DEF_MOD("wdt_1_clk_loco",		CLK_QEXTAL, 4, 14, 2, 14,
@@ -322,6 +326,10 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(3, 6, 1, 7),		/* ICU_0_PRESETN_I */
 	DEF_RST(3, 8, 1, 9),		/* GIC_0_GICRESET_N */
 	DEF_RST(3, 9, 1, 10),		/* GIC_0_DBG_GICRESET_N */
+	DEF_RST(5, 9, 2, 10),		/* GPT_0_RST_P_REG */
+	DEF_RST(5, 10, 2, 11),		/* GPT_0_RST_S_REG */
+	DEF_RST(5, 11, 2, 12),		/* GPT_1_RST_P_REG */
+	DEF_RST(5, 12, 2, 13),		/* GPT_1_RST_S_REG */
 	DEF_RST(7, 6, 3, 7),		/* WDT_1_RESET */
 	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
 	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
-- 
2.43.0


