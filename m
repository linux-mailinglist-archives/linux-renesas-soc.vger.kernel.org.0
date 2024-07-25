Return-Path: <linux-renesas-soc+bounces-7537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4FC93C91A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 21:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FC241C2222A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 19:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DB954759;
	Thu, 25 Jul 2024 19:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HmJqUW5Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D598F1CD32
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jul 2024 19:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721936971; cv=none; b=cYjii/PI1HFKBcCheq6o6hZaGBmy/K/xsGf5Si1r6+jZ8+ePU74x05G96tUFMrg4hVKdLS3FXhPaX4PJv4dDPSKlAzTt8oc8i6mEw5XLiiF4zVh+S+z3KwLbWBWsOHCG8DiyXyvslMURu3nSjtn9a/0maDq8TY4M6j94e+Wu2OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721936971; c=relaxed/simple;
	bh=itWJCIlgkEUJLQ3KZeBnoKj+1gEWsdqds/HRYWyC1/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSY8qUmHCOBQ9ICaVvAhNobITV9GbOfAnwum3qZWRI8ebOdbaQfCQK61hOGEkDSj7NIbsRCBZuh5ECWJO1SlR4YETozBdglMkRhuaP6bLdxjm9eXSOLSWQ9Axr7fFfWL8+uUhOPLxtQ6BSpc5IcrvfPfT1MRlieFAV7Oygg7EAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HmJqUW5Y; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0PHhg+naDGjTaOblPkFrw2AP79kNdGp0IZrvwD97kWo=; b=HmJqUW
	5Ypkk51r9TkP/gGzdrc5pOxY/diiSIAYrIhiwX9hlc458rwGVeRuXIMer2sK1jfz
	EeWGCH4jONYlmjJrhTbbSEa/RGzO6shu9rNzzZYT4UnUFfyguwgk1VVaFHBmG7O2
	E8gEbQj/eK1IVigk4dZz3g8Y209bIohjTsn+MZrmZq6vG6Rad420kdJ+GtdDHiLh
	boJjagqagG07dhAwdSvZjwYDULAw2KW2Te/glmC2jold7sD/pFQTmC6MYFCfqbwY
	LZD84SHRDs6xAEwQbr6k8A/gDaJXPQ+keiZjmMHXrw7a/InQBzOpNgGMLkcTClk9
	d6HtaLgXhPtYa83A==
Received: (qmail 3088288 invoked from network); 25 Jul 2024 21:49:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jul 2024 21:49:27 +0200
X-UD-Smtp-Session: l3s3148p1@FrBHsRcelIgujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Cong Dang <cong.dang.xn@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT 1/6] clk: renesas: r8a779h0: Add PWM clock
Date: Thu, 25 Jul 2024 21:49:08 +0200
Message-ID: <20240725194906.14644-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add the module clock used by the PWM timers on the Renesas R-Car V4M
(R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
[wsa: rebased]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 16a2e26abcc7..a9614d0c51ae 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -195,6 +195,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("msi3",		621,	R8A779H0_CLK_MSO),
 	DEF_MOD("msi4",		622,	R8A779H0_CLK_MSO),
 	DEF_MOD("msi5",		623,	R8A779H0_CLK_MSO),
+	DEF_MOD("pwm",		628,	R8A779H0_CLK_SASYNCPERD4),
 	DEF_MOD("rpc-if",	629,	R8A779H0_CLK_RPCD2),
 	DEF_MOD("scif0",	702,	R8A779H0_CLK_SASYNCPERD4),
 	DEF_MOD("scif1",	703,	R8A779H0_CLK_SASYNCPERD4),
-- 
2.43.0


