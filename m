Return-Path: <linux-renesas-soc+bounces-18732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90476AE8603
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 16:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED0121898596
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 14:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2CC266EF1;
	Wed, 25 Jun 2025 14:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ey/okbx7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5E0265606;
	Wed, 25 Jun 2025 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861042; cv=none; b=JbGTk8rFYteVsEn2D0e62feews2xpPJNWB3HuyUtxBaOORfbAe/ixHsmbQ5DbBMcugxB8mub9tTwP4boaHSnglMoshgJAvMnaaEGBmBnV8yNjKbDrnfjQ16lgX6sF1m2qOzd1RoiCidZdWr0LRyvx82Ufp4cHTbDmaMFeeT0UQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861042; c=relaxed/simple;
	bh=XmB4ktk1+3gx2wgk6Wsb7qgHnAbbhl6LpVFUAaBWUvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l5dUe2WSYpVMFtqbuNvAeGPZRGrI2f4jB3NzKbXP77MubDnLEWAwV66q6FetaPWW1HUs72Csit4b8oObHtu4bXSjsYofAx1MNKvLWZl2anv9VVcxTRbeOPsNJoKt8Wrv7qieZs5kafeNb+GFFHrxVnXjTAouGzhRmAD6ThL5gNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ey/okbx7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-453426170b6so6145245e9.1;
        Wed, 25 Jun 2025 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750861038; x=1751465838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+zr1kxgHJQWvtB5AfJv9ZioY+lWOueC/LNrtpIkYQs=;
        b=ey/okbx71mj+TD9iQrI0wSGSKEXdyOrfox/EXWCwfi1t3nWH+U6J8FN9ypvLTf19N2
         bF9omkcrwL4c36tuPqD6Ll8ksPuTgtrrxDkqovmAQs2MTiWjPWIoLtsMdk0kXAfpVQY+
         g5taAlB9AGLJeZy5uEgC2kxQHI1WSnY/2IPu5pdRXyIY1USDWcv44vEC5aqNsjA5sdo3
         rkYv3qGNn3cYTcVUTn17l0cGK8kTHeU89diV58nSuMC5y214XIRQuxZqyDdeDOWBBwEu
         OKspBdGw/s+QWC8VoDuSTeKYAkSl+I0oya7F/UTV68YgxRDltB7+gv3Y77D9Jfgd+OSm
         Hifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861038; x=1751465838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+zr1kxgHJQWvtB5AfJv9ZioY+lWOueC/LNrtpIkYQs=;
        b=l0/tvyNQy4gfhKGQQCqo/cI9uGEQ6l96pOt7AAKOaipjlUnRvyFFxFE6q4c164UMqP
         BRFaakPXRLdb7znLCf1FP3iea+Ci7cZOyERXU6Bn+uFftmwa9qz0v99eeBWpt7/ptmFK
         yFqeXtzAgn9iLMe0X8vNHleVP2/0tjWWIXq13wc33YNieScX6xJvKk27/jIisVDfgiKz
         pQLrpwbsXlAbo+srw8Zd53SgcBeAPiVmIOP+2niDx8ynvLBarKcuuD5pQBI9ICQkIdA4
         nMcVi/IjeRaYcEJ0DbikW+FpWPLw//eZViMBVEVp4rnm/b3WZFPsazx/+zDbVLHViBik
         CyNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8fGxYzRhbAFnTMR/CPtil8R8+rz5Q/cXH9k79OCPY4NK6TqrIAVkJOmpSQBPUyKZRblsa23NpVwws@vger.kernel.org, AJvYcCUoJQhinX5/TgUQ0N5QhGp+WugPN3AQ992m0DnIo4CJYEgCRhuB/har6VQPx0wgEIR4EzgCCX4cF/1G@vger.kernel.org, AJvYcCWaKl5M27OPDVdMDWqjlkiUGj+fpL28MTySu9c/KNIXgKX0Tw7bkyuXYdm6CsNpQiIoBAhguu7kjJ9S4+1X@vger.kernel.org
X-Gm-Message-State: AOJu0YxyUh/GzVAosW4QaFIJoCSjeN7t3MzxkttcjY7vscvGjZpJD3Zb
	3VY3blld2wyGWf0xJq3b0MDuoDGCyYN44WnAZp2wPG8xfP4C9q6isbtM
X-Gm-Gg: ASbGncvHfWpkg5HE/1P/3MA5Sla2DxAmreVRG4AkEkyBkpjvMkRgejbfibOvs4pI94O
	5uC9/eAvc9DMfdU+j+cDuExKMtvQP1HW8bO7B+13MI1nQo5oy5Qq+O5Dg6LodnjG2yQl19JNywu
	/a5xa21Uw6v95q1A2q87tIfG8TjNRMmp0mIgmmo+WNGBd6B+aYRWWt5JVqoNoHlQALNsmjZMNoR
	PJs7adTtV9IwM15zqCrOq+G4tXiYGQWQ/xBYcw70/yzSe6VKTTD9GBxwJFU2RL3eWuUsjN9Q7Lq
	lNGmDiNcZxkmr/ebv8i/zQbA3wzsDB3Q4akH5eGRWGUPyJ0GVn756GbiN8wz3yT4lVIo57l6kr6
	nLRjj4k+3nmZPI0wHN2bz8I6hTHZu6XI=
X-Google-Smtp-Source: AGHT+IFTks9Fwi66Mu2pUGkVXhuxNzbDbhjbKWJbR3Y+9Awoz4s3x9mIe6L+RSky3zLuU5YppUTE+g==
X-Received: by 2002:a05:600c:4e08:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-4538335ffb6mr19714635e9.10.1750861038035;
        Wed, 25 Jun 2025 07:17:18 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538235a85bsm21609425e9.23.2025.06.25.07.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:17:16 -0700 (PDT)
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
Subject: [PATCH 2/3] clk: renesas: r9a09g077-cpg: Add PLL2 and SDHI clock support
Date: Wed, 25 Jun 2025 15:17:04 +0100
Message-ID: <20250625141705.151383-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625141705.151383-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250625141705.151383-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for PLL2 to the R9A09G077 (RZ/T2H) clock definitions and
register it as the source for the high-speed SDHI clock (SDHI_CLKHS)
operating at 800MHz.

Also add fixed-factor clock PCLKAM derived from CLK_PLL4D1, and define
module clocks for SDHI0 and SDHI1, both of which use PCLKAM as their
clock source.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g077-cpg.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index baf917ff4beb..93862d84f95f 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -67,7 +67,7 @@ enum rzt2h_clk_types {
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G077_CLK_PCLKL,
+	LAST_DT_CORE_CLK = R9A09G077_SDHI_CLKHS,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -76,9 +76,11 @@ enum clk_ids {
 	CLK_LOCO,
 	CLK_PLL0,
 	CLK_PLL1,
+	CLK_PLL2,
 	CLK_PLL4,
 	CLK_SEL_CLK_PLL0,
 	CLK_SEL_CLK_PLL1,
+	CLK_SEL_CLK_PLL2,
 	CLK_SEL_CLK_PLL4,
 	CLK_PLL4D1,
 	CLK_SCI0ASYNC,
@@ -105,6 +107,7 @@ static const struct clk_div_table dtable_24_25_30_32[] = {
 
 static const char * const sel_clk_pll0[] = { ".loco", ".pll0" };
 static const char * const sel_clk_pll1[] = { ".loco", ".pll1" };
+static const char * const sel_clk_pll2[] = { ".loco", ".pll2" };
 static const char * const sel_clk_pll4[] = { ".loco", ".pll4" };
 
 static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
@@ -115,12 +118,15 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	DEF_RATE(".loco", CLK_LOCO, 1000 * 1000),
 	DEF_FIXED(".pll0", CLK_PLL0, CLK_EXTAL, 1, 48),
 	DEF_FIXED(".pll1", CLK_PLL1, CLK_EXTAL, 1, 40),
+	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 1, 32),
 	DEF_FIXED(".pll4", CLK_PLL4, CLK_EXTAL, 1, 96),
 
 	DEF_MUX(".sel_clk_pll0", CLK_SEL_CLK_PLL0, SEL_PLL,
 		sel_clk_pll0, ARRAY_SIZE(sel_clk_pll0), CLK_MUX_READ_ONLY),
 	DEF_MUX(".sel_clk_pll1", CLK_SEL_CLK_PLL1, SEL_PLL,
 		sel_clk_pll1, ARRAY_SIZE(sel_clk_pll1), CLK_MUX_READ_ONLY),
+	DEF_MUX(".sel_clk_pll2", CLK_SEL_CLK_PLL2, SEL_PLL,
+		sel_clk_pll2, ARRAY_SIZE(sel_clk_pll2), CLK_MUX_READ_ONLY),
 	DEF_MUX(".sel_clk_pll4", CLK_SEL_CLK_PLL4, SEL_PLL,
 		sel_clk_pll4, ARRAY_SIZE(sel_clk_pll4), CLK_MUX_READ_ONLY),
 
@@ -142,10 +148,14 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	DEF_FIXED("PCLKGPTL", R9A09G077_CLK_PCLKGPTL, CLK_SEL_CLK_PLL1, 2, 1),
 	DEF_FIXED("PCLKM", R9A09G077_CLK_PCLKM, CLK_SEL_CLK_PLL1, 8, 1),
 	DEF_FIXED("PCLKL", R9A09G077_CLK_PCLKL, CLK_SEL_CLK_PLL1, 16, 1),
+	DEF_FIXED("PCLKAM", R9A09G077_CLK_PCLKAM, CLK_PLL4D1, 12, 1),
+	DEF_FIXED("SDHI_CLKHS", R9A09G077_SDHI_CLKHS, CLK_SEL_CLK_PLL2, 1, 1),
 };
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
 	DEF_MOD("sci0fck", 8, CLK_SCI0ASYNC),
+	DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),
+	DEF_MOD("sdhi1", 1213, R9A09G077_CLK_PCLKAM),
 };
 
 static struct clk * __init
-- 
2.49.0


