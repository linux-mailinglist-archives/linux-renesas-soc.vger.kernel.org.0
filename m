Return-Path: <linux-renesas-soc+bounces-20519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A605B265D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 14:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F35BA01E83
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 12:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3903002C0;
	Thu, 14 Aug 2025 12:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwcOjotx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A5374C14;
	Thu, 14 Aug 2025 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755175722; cv=none; b=J52mrNUjhguwbun8fW8WxynifYYzy7VWpJ/JwagTB+bnnBuCljhSBuk2Wv+fJaYIj82nePGW7i7GKcR7QH8JgiUOEyNkkQEoTeA0si5dIMXNGEN4/Ayr7i5q75NrKyFKN33pe6cCI/A6DrDYpquUn5rdUNcwiqzmX1RejIUpttk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755175722; c=relaxed/simple;
	bh=7oPBRsyUdVA2yIOkcUl7sQozN59McESlMod2g7jVOC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4/n3XQpbosenkk6ZQv7NqOuB/lobtUfpZTy9/T+VazlUQzBJb7E7k2+XEoaxmwYbJHm993geWuefh0KR8Lg1sFRUSP5DEwX/GVoHkvNafvbyrOJbCfNA+//MmmlCsZL/+KPpYgBQ75abOWT+S4ZIldPR+SpxmbAkgb/pAe7EgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwcOjotx; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9e4106460so756922f8f.2;
        Thu, 14 Aug 2025 05:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755175718; x=1755780518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpCSYYS4AbTFByWM6JITFXYd4/KbRTwKBb9AZtM76Is=;
        b=DwcOjotxN7ZR+CYo2KyTvkUc3UFSJiqAqqkdZOsTtAmmAVgFxztmVCeW5vvgz8qr/R
         Rhm9VWRho89XgJpChgp4IR4Fk1X3tQqr6TrdrHWC1JARSNFZysWI6hyrnDj7n86ymBOj
         QbjeUayQAYwBPudzfkttMJPyCvjBYecIKadqwROx1Ng1NJLbwv8GAwbX5wSs98OKbCcO
         1WAOhQmTEhkOGooxdOR4ShFou1Zsi0C/M+eSHD6V5OuKV3P/v0KNalww4jWt0369Luh4
         F2uFsfnh24USZBR50eLZaoK/ziJ+rGkPjG5VrMzsJGTREg8x7vChitOfEOAVBGiH/9cu
         RUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755175718; x=1755780518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpCSYYS4AbTFByWM6JITFXYd4/KbRTwKBb9AZtM76Is=;
        b=DRRc+duk/b10FkAqIGMJqHVv3hdA5CCtofVOZW1iUoIT4QGDQVe96Jd30YdNgKmzSF
         mRctwoZ4PukR+obM2X5CP8d5MruA1h3UUXP6Q88zc/ro7l/b7syDOBJQHyXY7FMWag8B
         zYSLn7Cn0lsvVqwiw5BdYg+H8SlcZsoo0c6K7wLjgym1a57H2APZShnw4W+Qy05P8d+2
         PHCrP7ZBbIVtw9oS4qRV68Qx14A3DgiI4iVLatwJbJv/2eCmTWhURkYiOKh6/AOhEtHY
         Pn2IyT7bw8fvGdXRB+JX8PYbuW4yziVU5j3igP/e3E8IEAM7BojqRfAigJH+pgN70BCf
         9rmg==
X-Forwarded-Encrypted: i=1; AJvYcCW9TzPRi20gEVk/dCUhSJnVGv3wfebrhhFBBbpDdyviI0LGLX/gVc7y+Ee+BJIflPaXAwzsR5v844roippPenvYHJU=@vger.kernel.org, AJvYcCWBJhdzSrxsEfTeBumUnYE1RuOVO45rkg7UmaA20wJgQ+VJUlx+vaP1lfxtmfvoBugkZujIxXeAl6MQ23e4@vger.kernel.org, AJvYcCX6AfWN9P5m40YqQmY+Giol7ITvy935W8+vNhrfjXP+XmIQgMO24RtfnOZGG1fBokAl3QMyhIAlXIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYim8LxciSADRZEo3XYX2iyYLMCOlg+gOaK4rF6Yn/aWOq0r3o
	rICvCs55LchbcG9CHy+NeNl7FJZtWYEdMW+Dz7CEr3zAgw7RNhjL90Ki
X-Gm-Gg: ASbGncta04h/oJGmWhOpAaoKTo4WU/IccZnx1HkJzBw/K1O+y7581DX62aVF7PWRGet
	mKUDJX7LB3Zy1B+h7eF59RstujC3oZCm1AZIjr3as+n8gFXJPUhfo9pRf3gEs5nAR0uHp8uBfbc
	QB1VjubNSKyLnici6i0ahZLS1P4mzyqKMQViVVEUohnS0JrARFQkzfJ4X/VEqnL+S78ZMxUC5Uf
	zsLV26gcINl3U5OJNQiA08MJQMBYQB6oHd8TVYOoqbbc2TORdUAZ0yjchc4fF1HoDn+9bh+M8FH
	xZaLER/F/PC4EPmkQ9hPgX5mN81chb4DtGIayocX2ZdsW8Rro39I3KK8PITr+VRNfMax/TAaB67
	Zax4H06HF5wN+ufBSacAC5YGvFM+zLssZS12O3UwpvjJcxXKIWOFAx9BYy8CzO+G0HjDRenUcYg
	==
X-Google-Smtp-Source: AGHT+IHBnnYwR2Lw2GBx5C557dqk0zxsVE2WQZxAs+Au4nkv2cII5k6QQdsJu66cDueqpxczalx32w==
X-Received: by 2002:a5d:5d0c:0:b0:3a5:57b7:cd7b with SMTP id ffacd0b85a97d-3b9e417d3c4mr2441825f8f.22.1755175717411;
        Thu, 14 Aug 2025 05:48:37 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c466838sm53497380f8f.49.2025.08.14.05.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 05:48:37 -0700 (PDT)
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
Subject: [PATCH 4/4] clk: renesas: r9a09g047: Add GPT clocks and resets
Date: Thu, 14 Aug 2025 13:48:27 +0100
Message-ID: <20250814124832.76266-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814124832.76266-1-biju.das.jz@bp.renesas.com>
References: <20250814124832.76266-1-biju.das.jz@bp.renesas.com>
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
 drivers/clk/renesas/r9a09g047-cpg.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 4e8881e0006b..583a2ca116fd 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -16,7 +16,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G047_GBETH_1_CLK_PTP_REF_I,
+	LAST_DT_CORE_CLK = R9A09G047_GPT_1_CLKS_GPT,
 
 	/* External Input Clocks */
 	CLK_AUDIO_EXTAL,
@@ -198,6 +198,10 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP_NONE),
 	DEF_MOD_CRITICAL("gic_0_gicclk",	CLK_PLLDTY_ACPU_DIV4, 1, 3, 0, 19,
 						BUS_MSTOP(3, BIT(5))),
+	DEF_MOD_PARENT("gpt_0_pclk_sfr",	CLK_PLLCLN_DIV8, 3, 1, 1, 17,
+						BUS_MSTOP(6, BIT(11)), "gpt_0_clks_gpt", R9A09G047_GPT_0_CLKS_GPT),
+	DEF_MOD_PARENT("gpt_1_pclk_sfr",	CLK_PLLCLN_DIV8, 3, 2, 1, 18,
+						BUS_MSTOP(6, BIT(12)), "gpt_1_clks_gpt", R9A09G047_GPT_1_CLKS_GPT),
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


