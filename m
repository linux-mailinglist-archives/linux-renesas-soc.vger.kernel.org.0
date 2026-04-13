Return-Path: <linux-renesas-soc+bounces-31230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDfqFC7C3Gn5VwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:15:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F14983EA745
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0726A309544F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 10:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCA73B9D8F;
	Mon, 13 Apr 2026 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtfqG2J0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30173B95F0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074868; cv=none; b=iuhun3A2gSiicjBSvs++saMB6FrIZPgPI3SgFFM3ux3Chc4fwTXnX7IF+lcoYAuXHHfssY3BrqNfUJ4vb5ImJa7YNQJdxinsbA7WrxIuWvfhwLsxKHGm3kgRO1SspHgHmN3iIbTgX8+nvjd4F0TjVkDrxYRQBfzI79VFm0lOHy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074868; c=relaxed/simple;
	bh=0bMg0/W1dHU7kdGDq/bhaGzEZAt+cNePiIeAjdWuL80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxKKn99W9a+B4i9AlsdFeXNmpixcM/izNWkOFuzPGpJAAxcNAtbOzWc+SBmw3lYKTCPbLoW4WCJ4Aa4UYulCRxZBVBAc8wTchMjsNsDQsgUD4zSYhW73aC8r6IUhGYllCQTQJvod5yY/w88dhQhSnPJXFjA27tR+3gCHHcnLZaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtfqG2J0; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f1f6103afso865514b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 03:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074866; x=1776679666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upB10mny2syi2uM1NkkQ56XECtDOY4twgSZ8lGsSufU=;
        b=BtfqG2J06h+QT15Tt6xfYxbyiS22OCyjOJElqmzOymikx8mWVcTqBzslhAYICFZr5L
         FvVhwQmn4NB5ZjDHPcYAfZAPPwa6WJaCQHEhvwDVLHuAXV8zOA1kWpfvOYSdgjmE6wUo
         0MI8MuRaoEtsEeK4n2JD5g6+d9nf7e4Du4c/uCDbIMB+zJMA+2Q6B+MauG4MnXbEqTg0
         wwd1CpbaNOVEg9kFr6JBE5A+Dhyhuvrn2hiv5npGxfcu0sq59IjEUuDXOC+VIayFWxoA
         bxDC129wjqr3ujRTU3uHfHtmKo4LuN1pk6xGawm6YkJptCSAkeSa5tONal4sqBCzGh/I
         MA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074866; x=1776679666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=upB10mny2syi2uM1NkkQ56XECtDOY4twgSZ8lGsSufU=;
        b=j3agaIU5siad7Pe3jq0CFdoOM37sI7UK5I94UyBkxGYZ2BzmHd3YIQAh3pUo3QhLeD
         wmwlHvrM4iTDrY8BP7GSnSlHFNXOeCQXp9j5uRhHe3SCRa4TqrpOMcjPxk+kEmZQYqQO
         lW1EQMMpJVMeM+rmQAjjI/e8LEDYWuh0ESXvbUd32ZM0asAAIaKByqnICS4PvUKdP1uU
         8cBWi0zG6KHL8ZWQDorT7DL7NDqAd6thWkTdQYrWFUepZiitYf9vNmHH8EFMnphJfTG2
         r/X+1sDBuKMlP4rOOhIDNCRJUXjIsFEYK+UITP0arUu5smSU8mzRRBdg41rSaxcjpWUD
         Rldw==
X-Forwarded-Encrypted: i=1; AFNElJ8FohkdclfmUD+Er2R1I77lwwihqCTIohjLYleFWdCJFRBwgah0a9+mjFM/4ja07WNIpxGDDd3Zreoz1Y5eKKLlPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3bx/sUuHsnzfaauOd11bk2X9wTMXBvShrXQ+G5XarVqBWVYlC
	NsCv1nGHtjV1MQi6qN6OQF7QieTBI6YkJIMVlSJUe4e4QbT4wJKVe/Ze
X-Gm-Gg: AeBDietXMcI/0OVk7gXe409M3SBJngEEMrIuKYc/9cPvitcD4gOOwH06CVv4asaoB8v
	5xHbwq27DBh8PRZzlv+XCWLqlgvdFz4yX5omrBuSqGagTH/FqbgCriY+4T/qP/9V/f8o3NA9qcr
	BmSqnjkb8OuxOLU9xPZ2QutLQTSAIu++OvSK6GkpuaxFG1Gd7Ta2SML3bJJ43AtZPHRw7LQCLiq
	B9e2HhsMOSnI/iN0NAzPooQGGYhkcWhx2e5pjjXV+l8ALlPKxCROCkyk270HHp99jyIXZ6WlJv8
	3xVZyuZVINx3bY97x4/E/1Q8GVAqLmvDnUcE/5q/+M3Z1Uo26iWsTzENFzQeZcnjSWmWOvToaGJ
	EFftOYwRr25XpZxWj+hvJ+IDQ3WeXLrBaOEQZgndYh9N33e9VLHfb5tvddwpjxSOXhBMnmZUrYN
	OU/xr4Bfmu/60hzGY2cnACGvTvdijOAaDWGM5DQcZSzZ6iN4zWKdsX6bIjYFhP64srxZgD
X-Received: by 2002:a05:6a00:14c7:b0:82c:9fe1:aa4d with SMTP id d2e1a72fcca58-82f0c28d49amr12758235b3a.13.1776074865962;
        Mon, 13 Apr 2026 03:07:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 4/6] ASoC: renesas: fsi: refactor clock initialization
Date: Mon, 13 Apr 2026 17:06:58 +0700
Message-ID: <20260413100700.30995-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,perex.cz,suse.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31230-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F14983EA745
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_clk_init() out of set_fmt() and handle clock master logic
internally. This simplifies the flow and aligns with probe-time
initialization.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Note: Due to hardware limitations, only slave mode has been verified.
Testing master mode requires resoldering board resistors or
developing an HDMI driver, so master mode logic is currently
compile-tested only. Full support for fsidiv requires additional
DT bindings and a corresponding driver.

 sound/soc/renesas/fsi.c | 157 +++++++++++++++++++++-------------------
 1 file changed, 81 insertions(+), 76 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 9df3e91ac79c..db4ddc30f44f 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -709,73 +709,6 @@ static void fsi_spdif_clk_ctrl(struct fsi_priv *fsi, int enable)
 		fsi_core_mask_set(master, b_mclk, mask, val);
 }
 
-/*
- *		clock function
- */
-static int fsi_clk_init(struct device *dev,
-			struct fsi_priv *fsi,
-			int xck,
-			int ick,
-			int div,
-			int (*set_rate)(struct device *dev,
-					struct fsi_priv *fsi))
-{
-	struct fsi_clk *clock = &fsi->clock;
-	int is_porta = fsi_is_port_a(fsi);
-
-	clock->xck	= NULL;
-	clock->ick	= NULL;
-	clock->div	= NULL;
-	clock->rate	= 0;
-	clock->count	= 0;
-	clock->set_rate	= set_rate;
-
-	clock->own = devm_clk_get(dev, NULL);
-	if (IS_ERR(clock->own))
-		return -EINVAL;
-
-	/* external clock */
-	if (xck) {
-		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
-		if (IS_ERR(clock->xck)) {
-			dev_err(dev, "can't get xck clock\n");
-			return -EINVAL;
-		}
-		if (clock->xck == clock->own) {
-			dev_err(dev, "cpu doesn't support xck clock\n");
-			return -EINVAL;
-		}
-	}
-
-	/* FSIACLK/FSIBCLK */
-	if (ick) {
-		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
-		if (IS_ERR(clock->ick)) {
-			dev_err(dev, "can't get ick clock\n");
-			return -EINVAL;
-		}
-		if (clock->ick == clock->own) {
-			dev_err(dev, "cpu doesn't support ick clock\n");
-			return -EINVAL;
-		}
-	}
-
-	/* FSI-DIV */
-	if (div) {
-		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
-		if (IS_ERR(clock->div)) {
-			dev_err(dev, "can't get div clock\n");
-			return -EINVAL;
-		}
-		if (clock->div == clock->own) {
-			dev_err(dev, "cpu doesn't support div clock\n");
-			return -EINVAL;
-		}
-	}
-
-	return 0;
-}
-
 #define fsi_clk_invalid(fsi) fsi_clk_valid(fsi, 0)
 static void fsi_clk_valid(struct fsi_priv *fsi, unsigned long rate)
 {
@@ -921,6 +854,10 @@ static int fsi_clk_set_rate_external(struct device *dev,
 	int ackmd, bpfmd;
 	int ret = 0;
 
+	if (!xck || !ick) {
+		dev_err(dev, "External (xck) or Internal (ick) clock is missing\n");
+		return -EINVAL;
+	}
 	/* check clock rate */
 	xrate = clk_get_rate(xck);
 	if (xrate % rate) {
@@ -957,6 +894,11 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 	int ackmd, bpfmd;
 	int ret = -EINVAL;
 
+	if (!ick || !div) {
+		dev_err(dev, "Internal (ick) or Divider (div) clock is missing\n");
+		return -EINVAL;
+	}
+
 	if (!(12288000 % rate))
 		target = 12288000;
 	if (!(11289600 % rate))
@@ -1029,6 +971,76 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 	return ret;
 }
 
+/*
+ *		clock function
+ */
+static int fsi_clk_init(struct device *dev, struct fsi_priv *fsi, int is_cpg)
+{
+	struct fsi_clk *clock = &fsi->clock;
+	struct fsi_master *master = fsi->master;
+	int is_porta = fsi_is_port_a(fsi);
+	int xck, ick, div;
+
+	if (is_cpg) {
+		xck = 0; ick = 1; div = 1;
+		clock->set_rate = fsi_clk_set_rate_cpg;
+	} else {
+		xck = 1; ick = 1; div = 0;
+		clock->set_rate = fsi_clk_set_rate_external;
+	}
+
+	clock->xck	= NULL;
+	clock->ick	= NULL;
+	clock->div	= NULL;
+	clock->rate	= 0;
+	clock->count	= 0;
+
+	clock->own = devm_clk_get(dev, NULL);
+	if (IS_ERR(clock->own))
+		return -EINVAL;
+
+	if (!master->clk_spu) {
+		master->clk_spu = devm_clk_get_optional(dev, "spu");
+		if (IS_ERR(master->clk_spu))
+			return PTR_ERR(master->clk_spu);
+	}
+
+	/* external clock */
+	if (xck) {
+		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
+		if (IS_ERR(clock->xck))
+			return dev_err_probe(dev, PTR_ERR(clock->xck), "Can't get xck clock\n");
+		if (clock->xck == clock->own) {
+			dev_err(dev, "cpu doesn't support xck clock\n");
+			return -EINVAL;
+		}
+	}
+
+	/* FSIACLK/FSIBCLK */
+	if (ick) {
+		clock->ick = devm_clk_get_optional(dev, is_porta ? "icka" : "ickb");
+		if (IS_ERR(clock->ick))
+			return dev_err_probe(dev, PTR_ERR(clock->ick), "Can't get ick clock\n");
+		if (clock->ick == clock->own) {
+			dev_err(dev, "cpu doesn't support ick clock\n");
+			return -EINVAL;
+		}
+	}
+
+	/* FSI-DIV */
+	if (div) {
+		clock->div = devm_clk_get_optional(dev, is_porta ? "diva" : "divb");
+		if (IS_ERR(clock->div))
+			return dev_err_probe(dev, PTR_ERR(clock->div), "Can't get div clock\n");
+		if (clock->div == clock->own) {
+			dev_err(dev, "cpu doesn't support div clock\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static void fsi_pointer_update(struct fsi_stream *io, int size)
 {
 	io->buff_sample_pos += size;
@@ -1684,15 +1696,6 @@ static int fsi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	}
 
-	if (fsi_is_clk_master(fsi)) {
-		if (fsi->clk_cpg)
-			fsi_clk_init(dai->dev, fsi, 0, 1, 1,
-				     fsi_clk_set_rate_cpg);
-		else
-			fsi_clk_init(dai->dev, fsi, 1, 1, 0,
-				     fsi_clk_set_rate_external);
-	}
-
 	/* set format */
 	if (fsi_is_spdif(fsi))
 		ret = fsi_set_fmt_spdif(fsi);
@@ -1992,6 +1995,7 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->master	= master;
 	fsi_port_info_init(fsi, &info.port_a);
 	fsi_handler_init(fsi, &info.port_a);
+	fsi_clk_init(&pdev->dev, fsi, !!(info.port_a.flags & SH_FSI_CLK_CPG));
 	ret = fsi_stream_probe(fsi, &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "FSIA stream probe failed\n");
@@ -2005,6 +2009,7 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->master	= master;
 	fsi_port_info_init(fsi, &info.port_b);
 	fsi_handler_init(fsi, &info.port_b);
+	fsi_clk_init(&pdev->dev, fsi, !!(info.port_b.flags & SH_FSI_CLK_CPG));
 	ret = fsi_stream_probe(fsi, &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "FSIB stream probe failed\n");
-- 
2.43.0


