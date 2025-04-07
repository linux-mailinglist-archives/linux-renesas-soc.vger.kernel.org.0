Return-Path: <linux-renesas-soc+bounces-15510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED5A7E788
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 068EF188A035
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8488C218AAA;
	Mon,  7 Apr 2025 16:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwQ0Hxgu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABE9217673;
	Mon,  7 Apr 2025 16:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044749; cv=none; b=TFgu+D5P7qmm98Ibvp+16jQkxpEtUNntsyBe1lI4DcS+Ej8TPWPeZQVRi4hp3q0B4HOHEn8sGsV1e22S7JkPQbj5qiVNBQWsZGLlV/qCqHxhbPvojvWGcTZnnYjzYydZV8QuZIkO22hmNtln0ToeOiFmdmIckUZlP4LlpOAmjDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044749; c=relaxed/simple;
	bh=ugyqHTFe5dAIP8w+jtcX3EeXua5/7kTcCP6vhlCOgAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8JWwUTcRpZi16KDdVJZaqICs5e5J25jgy4zo22nXM0ZZy9Nqcvv8ji8Ri5eaO1kayJyBBS5N7pf/00LbCvYSVRpHa37aTdTNpf/LGzKv1PEGPG9ulOnSo2a6lV7aWsNs4D5Nhe+pbslHT4kbr/SRLdYFkarT7Ogs8wKiz1KnC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwQ0Hxgu; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso4092514f8f.2;
        Mon, 07 Apr 2025 09:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044746; x=1744649546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWPeody0yl6K0oerpL14uBR8W8cRKVcUF0FRIWM0S0M=;
        b=WwQ0Hxgubxbn+p8UmPWcZcZ8pNkD+v2aZlOgx1y6HSMapVvyETvDooxC0OM0iUR/ba
         kUMVCu0F7kHkjRwXFKlDCui21kSMoejgHPTOeVKhqPCw03zniPfoz4H2vRikCUgMBM3o
         dtKjEFS0Us/CVZwK22HI0NiwSmBfQTp6flK5eC89aElts1atS4vyYWGo9j533+eGHALL
         FnEq0uUEwDOZnCo9iPCcDPr4ioCDmnMDTgJYkBZQ9CuhPy4mi21SmE+cgWKVe114K1C0
         yM1iRqwroW3zUUv1XemBSgRTmfaMdGZW05BkJvzNVc6wAQt+9syw4KlHZt3bHJwP8oox
         dY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044746; x=1744649546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWPeody0yl6K0oerpL14uBR8W8cRKVcUF0FRIWM0S0M=;
        b=KC6ihdQrMPaybTQ9VttyIyEOn6dGnYRAjeDlh0WR/fLhV/q7p2DdJ83VcNUV0DfRKE
         HQAFNvOV51c9Zvk2+uk/dUHNzF2/6YKmFlaBs6EJc0NtCHHifEKNQJyFKwxcJVvT9NXS
         K5GT6k/RBZKwKMgEEng0swmKnm5hviXIPqTKNcX7RIhfQr1sQipKLr3sLTrzcMZ+X3De
         PRguoBWTc8oEnVMzHXd2AvesY6TPKkogAKM7TqNiwk/ZeJs0/8IKtnbptecjsrs70ZSE
         cMeCnQO4w4zAoq5noJdto1kVXlUMd0jBuz7PlTpK8Upiaz20aYCIwRNoiW66Hs/E6b7o
         utVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcVYzs1I5dBm6XywZ+2mFcwmEKtkn2KiKsk3nZ1LardLoujsHjGV7E7opBut+ur9W0i1J2i+hbsT99@vger.kernel.org, AJvYcCWnGG3aO2AUJw4J/LwqKUHOfhgYMUi/yLDcCUJhRAAhMWpyXvrWf7At/wmka1VI6AbLMX50QBzYec/yk/fh@vger.kernel.org, AJvYcCXOsmRiOYm0Yp1a/4lIPAUc3w3lNeCNSAOwr/ugvdd/hEhZQcxnkMQO+HTtm4lBY9tYyp0SBm6VLzj2@vger.kernel.org
X-Gm-Message-State: AOJu0YyIwYW1k43R6AIBSvYmheBg6gkDFJv2/LbVI1tJmefqf/wXkpLi
	AT6aEfPgKSFbouVikvdgLaBV2LmI00QlFLe43BwhMnb3J6UgDJxpPH1Jmg==
X-Gm-Gg: ASbGncuxWJWOSNEGE+HTGHs9ffEsgS+XNkAWLhpylxYe/HKtllBvp57sPW4+GHjAxVF
	2RTqLcrBQ7yDMf5/ntjKFtQPxyM2QQxL7oWi4CvyRcMQ5101Q99vVDRbQ8O3AK1+CNGJbsv7bRc
	3vUvwf9hWwzeuBD7EUQXZnscovcazI9quen8fVfDG881SjwMJl+7URmSMMYF7ClWI6/acldm1Nd
	qnVAhs4eq/AnGSAn0D0yK4f9KAyd9sLcNE4+d/LN7rk3h3tG16BsdBk8AaKVfE6gsoK24Pa1slW
	hb93+WTghHlqnpsJDHRjZxaoxKnZGnlkPQrHj4Pv0OY5MmwuZ5xEpAQgvll+4F/+njTz6g==
X-Google-Smtp-Source: AGHT+IHXxY6ovM0ZG5qYlKQeiJq4ZMYZM1+03/DypHLXY5/PcbT/ACLyqKWWwwfBJtc+hiUy5ej0EA==
X-Received: by 2002:a05:6000:1449:b0:39c:30f9:1e57 with SMTP id ffacd0b85a97d-39d0de14297mr11481272f8f.18.1744044745583;
        Mon, 07 Apr 2025 09:52:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm139272305e9.23.2025.04.07.09.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:52:25 -0700 (PDT)
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
Subject: [PATCH v2 8/9] clk: renesas: r9a09g057: Add clock and reset entries for USB2
Date: Mon,  7 Apr 2025 17:52:01 +0100
Message-ID: <20250407165202.197570-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for USB2.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index da20dbaead1f..3c40e36259fe 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -16,7 +16,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G057_IOTOP_0_SHCLK,
+	LAST_DT_CORE_CLK = R9A09G057_GBETH_1_CLK_PTP_REF_I,
 
 	/* External Input Clocks */
 	CLK_AUDIO_EXTAL,
@@ -41,6 +41,7 @@ enum clk_ids {
 	CLK_PLLDTY_ACPU,
 	CLK_PLLDTY_ACPU_DIV2,
 	CLK_PLLDTY_ACPU_DIV4,
+	CLK_PLLDTY_DIV8,
 	CLK_PLLDTY_DIV16,
 	CLK_PLLDTY_RCPU,
 	CLK_PLLDTY_RCPU_DIV4,
@@ -104,6 +105,7 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
 	DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1, 2),
 	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
+	DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
 	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
 	DEF_DDIV(".plldty_rcpu", CLK_PLLDTY_RCPU, CLK_PLLDTY, CDDIV3_DIVCTL2, dtable_2_64),
 	DEF_FIXED(".plldty_rcpu_div4", CLK_PLLDTY_RCPU_DIV4, CLK_PLLDTY_RCPU, 1, 4),
@@ -126,6 +128,8 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
 	DEF_DDIV("ca55_0_coreclk3", R9A09G057_CA55_0_CORE_CLK3, CLK_PLLCA55,
 		 CDDIV1_DIVCTL3, dtable_1_8),
 	DEF_FIXED("iotop_0_shclk", R9A09G057_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
+	DEF_FIXED("usb2_0_clk_core0", R9A09G057_USB2_0_CLK_CORE0, CLK_QEXTAL, 1, 1),
+	DEF_FIXED("usb2_0_clk_core1", R9A09G057_USB2_0_CLK_CORE1, CLK_QEXTAL, 1, 1),
 };
 
 static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
@@ -219,6 +223,16 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(4))),
 	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
 						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("usb2_0_u2h0_hclk",		CLK_PLLDTY_DIV8, 11, 3, 5, 19,
+						BUS_MSTOP(7, BIT(7))),
+	DEF_MOD("usb2_0_u2h1_hclk",		CLK_PLLDTY_DIV8, 11, 4, 5, 20,
+						BUS_MSTOP(7, BIT(8))),
+	DEF_MOD("usb2_0_u2p_exr_cpuclk",	CLK_PLLDTY_ACPU_DIV4, 11, 5, 5, 21,
+						BUS_MSTOP(7, BIT(9))),
+	DEF_MOD("usb2_0_pclk_usbtst0",		CLK_PLLDTY_ACPU_DIV4, 11, 6, 5, 22,
+						BUS_MSTOP(7, BIT(10))),
+	DEF_MOD("usb2_0_pclk_usbtst1",		CLK_PLLDTY_ACPU_DIV4, 11, 7, 5, 23,
+						BUS_MSTOP(7, BIT(11))),
 	DEF_MOD("cru_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
 						BUS_MSTOP(9, BIT(4))),
 	DEF_MOD_NO_PM("cru_0_vclk",		CLK_PLLVDO_CRU0, 13, 3, 6, 19,
@@ -286,6 +300,10 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
+	DEF_RST(10, 12, 4, 29),		/* USB2_0_U2H0_HRESETN */
+	DEF_RST(10, 13, 4, 30),		/* USB2_0_U2H1_HRESETN */
+	DEF_RST(10, 14, 4, 31),		/* USB2_0_U2P_EXL_SYSRST */
+	DEF_RST(10, 15, 5, 0),		/* USB2_0_PRESETN */
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
 	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
-- 
2.49.0


