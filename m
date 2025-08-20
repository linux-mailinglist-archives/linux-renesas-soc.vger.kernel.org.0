Return-Path: <linux-renesas-soc+bounces-20767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A3BB2E3B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 19:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EEFE585DAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 17:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079E034AB0B;
	Wed, 20 Aug 2025 17:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJyRCVNj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A19524EF76;
	Wed, 20 Aug 2025 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710299; cv=none; b=Lb9vZNHDlem2DK3tsc4j4cHyjwGZPkmTdq6tiWbbIKPw8jl0WQHpnCO0vPsFzkDNuVcRmm73OLXulCfmUeJsoV5cyH0LUrSjMZN31xEsqBDe0xZbd8U9Gs02T9PUSiA5M1OW85lEfXOJUbCcTB5yYzMkk3ehENwFIvw7ZWW6PMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710299; c=relaxed/simple;
	bh=WpUmFWXY6NnzHEdbMSItdoDnXAcjkNwL4XgJcUCxLOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JfOk9q9Y9ssl/8C6AdHi3AJWHOhTC3zKYXbkbxnkUAuKT9rIUXLao9m5q9zp5g/u+/3oUutOdw0XuAgMtEbFKCIbqOkMFDXyEHwEJzW1gX04+NEVoJarekhFeS/9f8oPAnVx69FPl7hYV/3DNnvZy6MoMj7KFWWV2Z/VtIgO/NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJyRCVNj; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3bb2fb3a436so44676f8f.1;
        Wed, 20 Aug 2025 10:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755710296; x=1756315096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7k+74s62+ie2qI3stkXXLEjnb9GMMj3Q5b9Z4I9CWY=;
        b=dJyRCVNjcQCMi4NdIFxwFixJAUxGiHmKABCRcNIQ+pmAkSx1Xmg9G5JQlRqCGXcTFG
         HU16CjcPcjR1AKb6PtdLTPFkJzGVT7Fmx2T6zj1VVHX7bFVdQA4ZPXYRcvuP6xe2hHoe
         RihRw20ONNHiK4E61aena4sHAmx7KyDkuBqmL0GHdc4oDLg9pMEVepMX+KRjSb5bCQTz
         NtcQAMdRBHTjqHSa1FG4NLDTlEh4K1N77YNUE8amRG+S0mAzBkU815ZqefQWtXyMOnOG
         2zzI0bB+u8od5t+VAj8v1dG+Tm7gdlbGQAtrKFb7BAPsYd93ev8G6uW3SvoohsThK4Nv
         s+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710296; x=1756315096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7k+74s62+ie2qI3stkXXLEjnb9GMMj3Q5b9Z4I9CWY=;
        b=oz3lJP/hSsB4p+ZQOZt8IyaTctW2Ccwg8weLMhIfH9U13ziinx6kehJDhcNyeEfyFg
         a2DTVI2KtMBGuyz09AT54k8MxXk91SuVPTX02ac/GiJS4ZEss4EFf77D4FWK2vJvvZyi
         Ez9kh/oqh3m+s+DMVCslxO/TLDQtcPjVfXQ+9b6S9TeVFtNqZEpKmmIi1uG974hWGbjA
         HGRAoN3Oma9DrjR4mkXO3PPyYzasVpOXIQaqoFBMO5gFJL3Fv5NLGMGrADQ+HIlvU+gx
         Omg4zPbqUcGi+Yj5YuSE0RNhA9Uaqf9H25dCzWImDCuG1WXat67cnEmg10kbs21AkpvT
         xxLg==
X-Forwarded-Encrypted: i=1; AJvYcCV5U66pp1jX8BRdjVkisNvU3ParVcLqtjt0PLGFFolvYhpMwbbd94UVN1K4MDHe0cX3bUxEdbpGL9VGfSXX0ag0z78=@vger.kernel.org, AJvYcCWvZUfUcHKODdmgkMBGzRsR1XytBcjPNYZfs3A5QfmfnmPgbsaC8bOkRRX0xJJvV+FUZMAsmz8/y24=@vger.kernel.org, AJvYcCXoO+AJvQsHFR33qPJQrY5xDR2vfaVNH2NDlgWMkHyJH14bYqvlx3gfSbG14TnMmz0kTl7NtNyuVS6q/b12@vger.kernel.org
X-Gm-Message-State: AOJu0YxKvXi54HK6XYJ42YE2Bc92kOkFAtLRi+cZVzJOrVlbqd97ZrA3
	gtQ+dg+VPg2p+ilAccJeecTIX60aYHtJy76OjcXM4WQ1F4y3I972pnsc
X-Gm-Gg: ASbGncty0EFPzRMFKDHa4G/3MeOLooi83uKUpuX+uG36/rZVpGofJr8T2LIb13Qd8Ww
	aNsFFRIkXUu3hxR/tqCc71SDItpb7tiZ1cDXwOlzsvA6mstfeSpCIcPnlGiDCutQh93FnPotLGv
	HH5gtb9PrLe6Kslu0o2M1oUWOkBvI3i9CI+tgQ++LuTdHDfnsG/fboBBQaEgoCM8FuoTmtc17Tg
	Sy11DeyeWzcst3GZMao1DDz9FuxyB5vdAdSaR3xvrz+1lOHjXQmqz6mPUy8D9YpX4XVvso+PE2d
	y7u6X+oD8iL8eN86RyAsFu18iRBR2AyNLybPPUFbXlUt6ZfobUst73Wr9SJKw31e71w1TsuQEgL
	TlYg/7rX+UyqbGHsrbmIt/Z7eQSt4nQqTqoIqSzOdy+A+nduWkmrP/ZBSZQqlYvlLNTPh93FA2w
	==
X-Google-Smtp-Source: AGHT+IG0tKaQ2M5bVSr2PsdvZV9ON8MG1E6NZ0asQ528swrW3P1oZhU0gF3bbjKfvKvOWIvHOq19BA==
X-Received: by 2002:a05:6000:2203:b0:3b8:893f:a185 with SMTP id ffacd0b85a97d-3c32fe1a654mr2939693f8f.53.1755710296181;
        Wed, 20 Aug 2025 10:18:16 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c2865dsm40319815e9.2.2025.08.20.10.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:18:15 -0700 (PDT)
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
Subject: [PATCH 02/11] clk: renesas: r9a09g047: Add USB3.0 clocks/resets
Date: Wed, 20 Aug 2025 18:17:49 +0100
Message-ID: <20250820171812.402519-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB3.0 clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index afd09b95fb74..e3fed4a3121a 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -16,7 +16,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G047_GBETH_1_CLK_PTP_REF_I,
+	LAST_DT_CORE_CLK = R9A09G047_USB3_0_CLKCORE,
 
 	/* External Input Clocks */
 	CLK_AUDIO_EXTAL,
@@ -181,6 +181,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 		  CLK_PLLETH_DIV_125_FIX, 1, 1),
 	DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G047_GBETH_1_CLK_PTP_REF_I,
 		  CLK_PLLETH_DIV_125_FIX, 1, 1),
+	DEF_FIXED("usb30_ref_alt_clk_p", R9A09G047_USB3_0_REF_ALT_CLK_P, CLK_QEXTAL, 1, 1),
+	DEF_FIXED("usb30_core_clk", R9A09G047_USB3_0_CLKCORE, CLK_QEXTAL, 1, 1),
 };
 
 static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
@@ -276,6 +278,10 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(4))),
 	DEF_MOD("sdhi_2_aclk",			CLK_PLLDTY_ACPU_DIV4, 10, 14, 5, 14,
 						BUS_MSTOP(8, BIT(4))),
+	DEF_MOD("usb30_aclk",			CLK_PLLDTY_DIV8, 10, 15, 5, 15,
+						BUS_MSTOP(7, BIT(12))),
+	DEF_MOD("usb30_pclk_usbtst",		CLK_PLLDTY_ACPU_DIV4, 11, 0, 5, 16,
+						BUS_MSTOP(7, BIT(14))),
 	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_tx_i", CLK_SMUX2_GBE0_TXCLK, 11, 8, 5, 24,
 						BUS_MSTOP(8, BIT(5)), 1),
 	DEF_MOD_MUX_EXTERNAL("gbeth_0_clk_rx_i", CLK_SMUX2_GBE0_RXCLK, 11, 9, 5, 25,
@@ -352,6 +358,7 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
+	DEF_RST(10, 10, 4, 27),		/* USB30_ARESETN */
 	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
 	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
-- 
2.43.0


