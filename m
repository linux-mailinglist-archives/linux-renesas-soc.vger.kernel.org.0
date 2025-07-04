Return-Path: <linux-renesas-soc+bounces-19218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC39AF946F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 15:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E45FB7AC52B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 13:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF23E3074AB;
	Fri,  4 Jul 2025 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QzvsiDrP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B287E307481
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Jul 2025 13:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636621; cv=none; b=q/JZkwXlvMh9vSuuXxibl+Cl+jcNPGNAkUaHyojrvZCKATpQicHYVmPvNkvhiCzmXr2xlx+AZwNqzA9gNgPQKR0NLQOQJlVH5Q+mT+ZEA1JaXIk+6PVNwo0bfTNzhKJDFDic34SMvB77wtX6bYjkl1mFtcENzZ5prJUnm2nM5TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636621; c=relaxed/simple;
	bh=363z4+ODj0eDk+G9J5eeG9fyE/Gsvi/bEcEURwyj2xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCXtoF+f3IQ1amDb/IL49GRF+05P6pzIuDFMWev1Ab80b+O1SL7yy3tL+wFUDtOmI2kvx3MehAqFJKjJrRWW08owTe/MATi5L7cdLQ9lkO2FloSLDEL2+xbZqk11flIYm+NQ4QhGU2uCrZvaQigk6qqABW1AcCPN9IXnRlShiWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QzvsiDrP; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60c01b983b6so1849079a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jul 2025 06:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751636617; x=1752241417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIne4IF+NV24EtqbVzae+4FXgTFIsmLWApAJYxm1q38=;
        b=QzvsiDrPcYzMRbQyqaY79C7RQAXXQbwwskkitHgzWqX+CFVBxAdlwN4CHNzmf/+3PV
         ju4qYhzUN5OXE5BboRIPqM7iEPrmThlSSRlTVm+37P1c8n+2P1R3CAQ3t5QgIv6TKluf
         Kl+QlPTUwGRncHPT7HNq53pZsz4hCWAHDy5/3sOgwAKt8lqfj5KwI6pEskokWuCTWR1k
         HNH3w8UGCyyKyg4J7iAW8q/JRa/Y0nj+AUuS8TVSqtW9xrZBJTjKPTBTz46gsgonEa+7
         C84P3QGlGT/QeJCCFDmW04JMBrD8esk2O9y96tqM1SOV0Zjl4VxfvvNELAJyg432YJmo
         MDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636617; x=1752241417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIne4IF+NV24EtqbVzae+4FXgTFIsmLWApAJYxm1q38=;
        b=H7tmHUKGi3YPsfCpkLh+TOUnY9ZoD4lV/ufQWB0qM8wiYwrBO1EycLvwhA8xY/0iQV
         YwePAko6IfcoIKfAzLtGEZMqexKF44pOrvrV1WlvqqyHKDEJkEQXzWQHa/g5ibht/yxL
         /sBXNo06KWw7T7sbluKvq9b0oh4zTaXMlVwM9AKZCuP31rswjwS8RI5QLu/kRw5qnjET
         Ka9uXUygRhxSmA4rCbdmHWEvLaZLjSsnhzLqNj/AXYzZVOI4ExFtGzHpw192YOJJgOes
         Evj7PMBBDFBKjHhfCsFoiYIyGRW9VLnR3TPsR6yrUVSubDsU+G8kDSQzEe4+/DLaQs//
         zTpg==
X-Forwarded-Encrypted: i=1; AJvYcCWC7d8T8QjlShqzPh9xsj2kzc2OWIXsKKL1QlONwB5J4h7KQt2QHJwqIk+fTARq/cy1vbbDQgA4pmBR+KbebNtq/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyheP4srvlw7VSo9NJdjp+fvg8rFQlRZhoISzJgeBL2sBekqXrA
	CpJxD3nzZYDl8eP401qqHYmjAvpVzacRXQSzaSC9SY4TuF9Qcw//LLpSxXhEvSPIOyQ=
X-Gm-Gg: ASbGncuF9S1hHOIgoGOY1LCEtte1fMHDvdCRBlQtg/+v29ZyGdPCr7dD3Blphl1yUnk
	5sfYlWSik27seNuvqvjQqLl3XAgFrobC2nRR8jwWpuMEiCWFZjRea5MKxpQ+GNAUo1S6rYYoNco
	6YBn+LtKPG+g8EkJE7sQMtGuHhRna02xwHOLIejXER9XcNG6KUCEd5ttVuzO/zJc3CR0wMbxqwk
	AeytOO4bCn7fgBmA8otMBc0T5Js9w8mv2ZS3Lq1tCmN+dvMZrKrsWQrvDq0UXu+SdXNtqU5hg8E
	lIimvS54G0PmRRQwSrGQEt8qxesleYgcUmOd3vGjPHiAXRf2Fn8SrkPDok5OEbBlO09tm11rPiw
	DDLRaZeUsQqUzKo0zcwCqQnf0GA==
X-Google-Smtp-Source: AGHT+IErurtR/HbMkmE1efqwIH6hRoIPysAMhNCXkZd1cXgXHG1/n5Cc+xiZ3wxJ4DJBTssmCTipZA==
X-Received: by 2002:a05:6402:1ed3:b0:60c:5e47:3af5 with SMTP id 4fb4d7f45d1cf-60fcc62e4famr2920806a12.4.1751636616586;
        Fri, 04 Jul 2025 06:43:36 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fd3895ac7sm1084916a12.30.2025.07.04.06.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:43:36 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/3] clk: renesas: r9a08g045: Add MSTOP for coupled clocks as well
Date: Fri,  4 Jul 2025 16:43:26 +0300
Message-ID: <20250704134328.3614317-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

If MSTOP is not added for both clocks in a coupled pair, and the clocks
are not disabled in the reverse order of their enable sequence, the MSTOP
may remain enabled when disabling the clocks.

This happens because rzg2l_mod_clock_endisable() executes for coupled
clocks only when a single clock from the pair is enabled. If one clock has
no MSTOP defined, it can result in the MSTOP configuration being left
active when the clocks are disabled out of order (i.e., not in the reverse
order of enabling).

Fixes: c49695952746 ("clk: renesas: r9a08g045: Drop power domain instantiation")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 405907925bb7..ed0661997928 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -256,11 +256,13 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 					MSTOP(BUS_PERI_COM, BIT(4))),
 	DEF_COUPLED("eth0_axi",		R9A08G045_ETH0_CLK_AXI, R9A08G045_CLK_M0, 0x57c, 0,
 					MSTOP(BUS_PERI_COM, BIT(2))),
-	DEF_COUPLED("eth0_chi",		R9A08G045_ETH0_CLK_CHI, R9A08G045_CLK_ZT, 0x57c, 0, 0),
+	DEF_COUPLED("eth0_chi",		R9A08G045_ETH0_CLK_CHI, R9A08G045_CLK_ZT, 0x57c, 0,
+					MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_MOD("eth0_refclk",		R9A08G045_ETH0_REFCLK, R9A08G045_CLK_HP, 0x57c, 8, 0),
 	DEF_COUPLED("eth1_axi",		R9A08G045_ETH1_CLK_AXI, R9A08G045_CLK_M0, 0x57c, 1,
 					MSTOP(BUS_PERI_COM, BIT(3))),
-	DEF_COUPLED("eth1_chi",		R9A08G045_ETH1_CLK_CHI, R9A08G045_CLK_ZT, 0x57c, 1, 0),
+	DEF_COUPLED("eth1_chi",		R9A08G045_ETH1_CLK_CHI, R9A08G045_CLK_ZT, 0x57c, 1,
+					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("eth1_refclk",		R9A08G045_ETH1_REFCLK, R9A08G045_CLK_HP, 0x57c, 9, 0),
 	DEF_MOD("i2c0_pclk",		R9A08G045_I2C0_PCLK, R9A08G045_CLK_P0, 0x580, 0,
 					MSTOP(BUS_MCPU2, BIT(10))),
-- 
2.43.0


