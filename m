Return-Path: <linux-renesas-soc+bounces-31111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPNzOK2w2GljgwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 10:11:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5018F3D3D07
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 10:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9BE830616E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 08:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC193A3E7B;
	Fri, 10 Apr 2026 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKI81Qvn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3643C3AA1BF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 08:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808336; cv=none; b=UYxwBhFvgB2TyrtQOGjUluWcbHby9QoEP9xUXE8RVs12IoLZSQAkZcszHOjSe0YKpX+Z/rJ7Mn9/wZ797Bi5TQCsxPu8fZyMMSB18kADGWPteNBGtw89alhNw1YAw92UqY01S6JqYGMubM0+4bmUjGCDN7LN/sCMgUl2BhjKhEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808336; c=relaxed/simple;
	bh=xorpueJxTNukt5ZFVGNxy2LzwUY45JT81ldlU6c6GAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XfNx9I9fa5f//APDaBeiPwAGC5di8qLobmxl+sFZKdAiSkGF8wmMeaMIRnfm1t2J7LresN7G18jRIODs+VfeUlzhv+n7E1Tnb7DqYHUwirRETbMxIwwlJRdt1/nZouBxY1mXopXsQ1M/xd0h+HPf6/Z1QYGUSBESteGS580CBsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKI81Qvn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b8efed61so14874235e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775808334; x=1776413134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrKnQwSJErgHcrBoBos/Qb5MY50qHFM3OyauosBsnB8=;
        b=DKI81QvnrTm6FfNeeo72sGgRRHkjOZy9gn5f+/0/5mbiPgN1zh4tBHQEri7TLmMw5L
         hbIrN/pgpge/AfDm5rCB/fP2NWRR7mZOUYaGlg9/eQPT0z8cg3hq10Zn83XR0Ze5P1z3
         4+is2K4w/3fT5m4vDuOoJGiAe4rarsDKZI6FEKdLg8aH+M4EonI1XWkT5d8SxLBQbxfm
         AtyUU840IcHVsByq4GSn9JXQjT9pMwzcuethwjNw0crLC+dvg7IhlxFDafSZvAakQ9dO
         54noBL6I/WkfqxoXPfiJzqhJvwIJBAhDKc7J5R9DrEogvEBR0b08/AkbKRxxCpeOkxQT
         RTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775808334; x=1776413134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YrKnQwSJErgHcrBoBos/Qb5MY50qHFM3OyauosBsnB8=;
        b=I2H2H8BcLpaoKbrzp2L+9hSbwWdBE/JVx3Sy2KJwMOcgavClPWsjAfWoL+vNwFwcw4
         /0Mk4dse01LttK8N23eOLwyZbLKLwY1+haeRraBwI0scC1rxm6o4GbR9d9mclCSpE/+G
         TUx307xM83iDwvlt1G3rg5wlB9Rg9R58/v43SDWqrRorUgHLDPtfOdp4KSoIfj+ZV5pX
         YTnAbU0f0cWoPuuMY8R8JNdOkVsOXlUtgm2ICZPYC0iYAe5MeRrqvQ/eoPuIXVyBda2/
         eSJ1fvF9ommuhLSI0eNuOe8aYny5/WymYRs+jT3jahm9GM/ILIa/wwFKHybUkIanyJH6
         Fzmw==
X-Forwarded-Encrypted: i=1; AJvYcCUuRRYqgDdzgCozCb0hF6C5ctrMqLUefieXuyM7pu0v3KUeIuc/AqzZFc5BQt2/l3xgQiniIAH2BooMqAZGOEyEnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3ISu/GbNgTONJ2h2usLYmJCKJjrShACCCy0UtaLRHVWSTFKHx
	zKFueRXpg7vEskMYmt6sWSFOtIHJfpvDLL63Ccsfrz1kDO9ilzIjoYfr
X-Gm-Gg: AeBDiev+HW3yPJydZ8p0oz8R2FyYsURkGPdFOzPgUWaapwCmdLIZxmwtZ1W3A9SFjGJ
	bVPjqZOdXIJsg4zupjCdQvj3kDX9dNyD79PPzRaTzdz+D0FGWvsxofF3aEdxRUyanhR2EBxWxU1
	Wek3J7P5E7UKudHIMt4uoxSII7VC0uQJJ/hKjbGX6RMGHmxsyz13za51gwijvIKuV74v2v5trKb
	0Jn0nUU0LtfSOs3njIQ9FQrLABMnt3H1/t59KytscqhYHiz6kxmOZQQgBxJC16NrB8Jnnaf818w
	qN+HN/MKVS5CfOArNMuRvT3/WbCFdJdWgrxdkt3QcxHXiWt1BeQa3VRqAqIrdH/nEvsT7rwJJb6
	aAJ14Dl1UIRiUUdpiIYzul8Z+8+bEwUXyUceE7kmUlWQcmnwD8RcO1yiKTzCuOTQGEFekMtFpui
	NO2g/SCMV6/T+xBgebM2z6nZbIv+/Ct4tHBa8hmtyNQIFbJ8aVB4oU25F0FVQHbkTU7vbJ5uELU
	ZqsbOcAdqdHUeS5ZhowlYVPqxw8UlA3fwRnbQ==
X-Received: by 2002:a05:600c:444b:b0:488:9c3b:ff40 with SMTP id 5b1f17b1804b1-488d6acd9fbmr20477575e9.15.1775808333390;
        Fri, 10 Apr 2026 01:05:33 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a73b:688a:4297:c5fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67ce3e4sm29950375e9.5.2026.04.10.01.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:05:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] spi: rzv2h-rspi: Simplify clock rate search function signatures
Date: Fri, 10 Apr 2026 09:05:17 +0100
Message-ID: <20260410080517.2405700-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410080517.2405700-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260410080517.2405700-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31111-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5018F3D3D07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The spr_min and spr_max parameters passed to
rzv2h_rspi_find_rate_variable() and rzv2h_rspi_find_rate_fixed() were
always called with RSPI_SPBR_SPR_MIN and RSPI_SPBR_SPR_MAX respectively.
There is no need to pass these as parameters since the valid SPR range
is fixed by the hardware.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/spi/spi-rzv2h-rspi.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-rzv2h-rspi.c b/drivers/spi/spi-rzv2h-rspi.c
index 602d4a36b44c..f45af5884638 100644
--- a/drivers/spi/spi-rzv2h-rspi.c
+++ b/drivers/spi/spi-rzv2h-rspi.c
@@ -88,9 +88,9 @@ struct rzv2h_rspi_best_clock {
 };
 
 struct rzv2h_rspi_info {
-	void (*find_tclk_rate)(struct clk *clk, u32 hz, u8 spr_min, u8 spr_max,
+	void (*find_tclk_rate)(struct clk *clk, u32 hz,
 			       struct rzv2h_rspi_best_clock *best_clk);
-	void (*find_pclk_rate)(struct clk *clk, u32 hz, u8 spr_low, u8 spr_high,
+	void (*find_pclk_rate)(struct clk *clk, u32 hz,
 			       struct rzv2h_rspi_best_clock *best_clk);
 	const char *tclk_name;
 	unsigned int fifo_size;
@@ -413,7 +413,6 @@ static inline u32 rzv2h_rspi_calc_bitrate(unsigned long tclk_rate, u8 spr,
 }
 
 static void rzv2h_rspi_find_rate_variable(struct clk *clk, u32 hz,
-					  u8 spr_min, u8 spr_max,
 					  struct rzv2h_rspi_best_clock *best)
 {
 	long clk_rate, clk_min_rate, clk_max_rate;
@@ -464,7 +463,7 @@ static void rzv2h_rspi_find_rate_variable(struct clk *clk, u32 hz,
 		 * minimum SPR that is in the valid range.
 		 */
 		min_rate_spr = DIV_ROUND_CLOSEST(clk_min_rate, rate_div) - 1;
-		if (min_rate_spr > spr_max)
+		if (min_rate_spr > RSPI_SPBR_SPR_MAX)
 			continue;
 
 		/*
@@ -474,14 +473,14 @@ static void rzv2h_rspi_find_rate_variable(struct clk *clk, u32 hz,
 		 * maximum SPR that is in the valid range.
 		 */
 		max_rate_spr = DIV_ROUND_CLOSEST(clk_max_rate, rate_div) - 1;
-		if (max_rate_spr < spr_min)
+		if (max_rate_spr < RSPI_SPBR_SPR_MIN)
 			break;
 
-		if (min_rate_spr < spr_min)
-			min_rate_spr = spr_min;
+		if (min_rate_spr < RSPI_SPBR_SPR_MIN)
+			min_rate_spr = RSPI_SPBR_SPR_MIN;
 
-		if (max_rate_spr > spr_max)
-			max_rate_spr = spr_max;
+		if (max_rate_spr > RSPI_SPBR_SPR_MAX)
+			max_rate_spr = RSPI_SPBR_SPR_MAX;
 
 		for (spr = min_rate_spr; spr <= max_rate_spr; spr++) {
 			clk_rate = (spr + 1) * rate_div;
@@ -512,7 +511,6 @@ static void rzv2h_rspi_find_rate_variable(struct clk *clk, u32 hz,
 }
 
 static void rzv2h_rspi_find_rate_fixed(struct clk *clk, u32 hz,
-				       u8 spr_min, u8 spr_max,
 				       struct rzv2h_rspi_best_clock *best)
 {
 	unsigned long clk_rate;
@@ -545,7 +543,7 @@ static void rzv2h_rspi_find_rate_fixed(struct clk *clk, u32 hz,
 		 */
 		if (!spr && !brdv)
 			continue;
-		if (spr >= spr_min && spr <= spr_max)
+		if (spr >= RSPI_SPBR_SPR_MIN && spr <= RSPI_SPBR_SPR_MAX)
 			goto clock_found;
 	}
 
@@ -575,12 +573,10 @@ static u32 rzv2h_rspi_setup_clock(struct rzv2h_rspi_priv *rspi, u32 hz)
 	};
 	int ret;
 
-	rspi->info->find_tclk_rate(rspi->tclk, hz, RSPI_SPBR_SPR_MIN,
-				   RSPI_SPBR_SPR_MAX, &best_clock);
+	rspi->info->find_tclk_rate(rspi->tclk, hz, &best_clock);
 
 	if (best_clock.error && rspi->info->find_pclk_rate)
-		rspi->info->find_pclk_rate(rspi->pclk, hz, RSPI_SPBR_SPR_MIN,
-					   RSPI_SPBR_SPR_MAX, &best_clock);
+		rspi->info->find_pclk_rate(rspi->pclk, hz, &best_clock);
 
 	if (!best_clock.clk_rate)
 		return -EINVAL;
-- 
2.53.0


