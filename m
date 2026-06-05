Return-Path: <linux-renesas-soc+bounces-33618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ld4CI53BImoQdQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:31:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B146482AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 14:31:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZH4Nog0u;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 453C530FD032
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 12:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF0A4DD6C3;
	Fri,  5 Jun 2026 12:20:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8085384CFF
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 12:20:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662055; cv=none; b=MvxrfCrhcZZlQkcpac0Dpe6NYIk2p0lvSKeAGj3C108fo+J9+9oQgKDt7M2egGDdIu9tk8Ln7Gwp7YSdXtoUnk8sv3OTsHXrcTji+geGFMr+fWF8oNy3+cvra6MG+VPwRzn3EuzobsoaktqaKuHu61BK1skCAfi6nZR1W4rLk3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662055; c=relaxed/simple;
	bh=V0c6wRnBNKj3rAPlxZeuEkWEQAuLwmliuJ98bv0rgQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttDpYk0sAy9vufXuRMlyUm3tZfDYSaICM36sX9Q8utM2ImuaDAfJqNFK5Oua72j9WVuEVHBVDWPTjww0KlZvNlei+CgqyNlotbXoum6CThdmt2TDFJC1d8MfLYckpTpqPzIrLyjcwC5fp0yMzZSVvGlt9/T/+LuOnIITWM2R6Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZH4Nog0u; arc=none smtp.client-ip=209.85.210.176
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-842319576d5so1036741b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662053; x=1781266853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGGO/1RfN+V25aU18hx7LO9b1XN52DQ2OCTBVEQdgtA=;
        b=ZH4Nog0ubZqBf+/BxHgX5ohfllwVU6NIlhMDl5+LoBaXIf2PZmvFGa5eIxWGf9NjTG
         C8Tr1ZORbj6RYZG3AIpiCdo81t1i7ITl/9xlcWKGqKlTOSHIymsGkrQKybu3t2Ldbl8n
         Qu3P+nLakhrSDEWuvWF0ZRwxyw4GZVDPxLbxquGzWRvRes5AUa4AAaxHfXEr0ripNWRq
         i8Ij2xzTpVFpE/MXOAiw/VpLhXmIKGkOI3HUF7Ron4TFyduR9NeFNrrx8FmtvDcMk/NL
         Wkdpwg7uTxY7Wi1qXpVcVUaDAkKIBPSJpNNoRFgDgnf7ZyMS++l0yKa7DZiq0G7mTeX1
         SglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662053; x=1781266853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGGO/1RfN+V25aU18hx7LO9b1XN52DQ2OCTBVEQdgtA=;
        b=llTigFanufLSjf5BgCCCq0wZ9peRJRc2UBAv9zgkDmlUIFWZnVEwfqUlcNcmdSzZnK
         +9JF9BtHPLujcWuI7zQ+DDqKhfO6lmqrEqTjQ2LSXGrC77/dexq6lnSyxhHVRM4aeRkF
         tW+Oq8H+6zj6dBluZM1iOvwA4UpJ87qLCUVsmQ2yA9ozLTxBnuSiG7vTeVggKD+nyQTi
         Nyy2tQMw8wU4mUGdUfIRVXETWC/aTkWiGtHcxE3eMEXSJkx2tEXWloGDnPq5eEFW36WF
         tZaugUKUWMoC98z9cGjmi0G056L2pC0f0TEzNlpi9JUTCDxZzYTYHIfIPlptOD9S1Fru
         q+qQ==
X-Forwarded-Encrypted: i=1; AFNElJ8p0Yqa2GBW+lhWi2MAJj2hCE9SUHjER+JMJA0rNAtQLcF6d5j/pYImTU1tyYkr0Uv/Rg/mp+45VtWz3qgjcIhKdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdC8hr7MF7aGvzzpNUa4AJY5G5SJEUj7to6A5O9TJpWzMvpJs1
	q+oGEWXEguxuIPJtr0CVZtP27CRnTJ7A4T9VAudei8GdGCtlm+96+B+9
X-Gm-Gg: Acq92OGbVhzwb5xtdABxBTJA3I2JSbWMvICKGrgXje721vD35+PSjaAGYzRV/5dnlB5
	it6BSo65lYGVlzUmFYTCWfp0TOqtRvMaoJfI8cz2iOHZckqpstvhtgk6WIC1r9tEf9BHbMAb/jM
	wdQbueLs69IVpTfGGpc/FbHuh0t7CybX2aeB4OSqV6DVxQSFdL+cr37EQ/2Wduqt4MpkDMiGoTb
	al9BQbbnocGXnQb64KB8ih9ks2f6WXeMoktmKdqOTShKGV/x0MUaIejyUZDbUyLyWhijUqVokqY
	7nkXffRg8E68TMdWjSJt/JdLN/WW0+u9jO2for1T+FdfcxgR+//e2b+lUT5EXzA0JNvkFw10gAO
	yLTbAavhTb7J9LnArChivocrKYmx8vr7IyzsbH9mFA974WjRPEyi5w1g3UV9jHrxUTBPzAOGce0
	VNVLpfgZHH7Re0ZoB14PGrF8Jp8LazKfbKgo+MmAaKA8g13whd0qS3J1BsVN4hWL2OGI9Z
X-Received: by 2002:a05:6a00:1819:b0:842:3841:fdba with SMTP id d2e1a72fcca58-842b0eadd19mr3304985b3a.6.1780662053109;
        Fri, 05 Jun 2026 05:20:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 08/10] ASoC: renesas: fsi: refactor clock initialization
Date: Fri,  5 Jun 2026 19:19:52 +0700
Message-ID: <20260605121955.105661-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33618-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24B146482AD

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_clk_init() from set_fmt() to probe.
This moves clock resource lookup from fsi_dai_set_fmt() to the probe
path. The set_rate() callbacks validate that the required clock
resources are available before they are used for hardware
configuration.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - Handle the return value of fsi_clk_init() to properly support deferred 
   probe, as suggested by Mark.

 sound/soc/renesas/fsi.c | 52 +++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index a2d7d17dd2bb..3f303e15e835 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -292,6 +292,7 @@ struct fsi_master {
 	void __iomem *base;
 	struct fsi_priv fsia;
 	struct fsi_priv fsib;
+	struct clk *clk_spu;
 	const struct fsi_core *core;
 	spinlock_t lock;
 };
@@ -862,6 +863,11 @@ static int fsi_clk_set_rate_external(struct device *dev,
 	int ackmd, bpfmd;
 	int ret = 0;
 
+	if (!xck || !ick) {
+		dev_err(dev, "xck clock or ick clock is missing\n");
+		return -EINVAL;
+	}
+
 	/* check clock rate */
 	xrate = clk_get_rate(xck);
 	if (xrate % rate) {
@@ -898,6 +904,11 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 	int ackmd, bpfmd;
 	int ret = -EINVAL;
 
+	if (!ick || !div) {
+		dev_err(dev, "ick clock or div clock is missing\n");
+		return -EINVAL;
+	}
+
 	if (!(12288000 % rate))
 		target = 12288000;
 	if (!(11289600 % rate))
@@ -970,28 +981,38 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 	return ret;
 }
 
-static int fsi_clk_init(struct device *dev,
-			struct fsi_priv *fsi,
-			int xck,
-			int ick,
-			int div,
-			int (*set_rate)(struct device *dev,
-					struct fsi_priv *fsi))
+static int fsi_clk_init(struct device *dev, struct fsi_priv *fsi)
 {
 	struct fsi_clk *clock = &fsi->clock;
+	struct fsi_master *master = fsi->master;
 	int is_porta = fsi_is_port_a(fsi);
+	int xck, ick, div;
+
+	if (fsi->clk_cpg) {
+		xck = 0; ick = 1; div = 1;
+		clock->set_rate = fsi_clk_set_rate_cpg;
+	} else {
+		xck = 1; ick = 1; div = 0;
+		clock->set_rate = fsi_clk_set_rate_external;
+	}
 
 	clock->xck	= NULL;
 	clock->ick	= NULL;
 	clock->div	= NULL;
 	clock->rate	= 0;
 	clock->count	= 0;
-	clock->set_rate	= set_rate;
 
 	clock->own = devm_clk_get(dev, NULL);
 	if (IS_ERR(clock->own))
 		return dev_err_probe(dev, PTR_ERR(clock->own), "Can't get fck clock\n");
 
+	if (!master->clk_spu) {
+		master->clk_spu = devm_clk_get_optional(dev, "spu");
+		if (IS_ERR(master->clk_spu))
+			return dev_err_probe(dev, PTR_ERR(master->clk_spu),
+					"Can't get spu clock\n");
+	}
+
 	/* external clock */
 	if (xck) {
 		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
@@ -1666,15 +1687,6 @@ static int fsi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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
@@ -1972,6 +1984,9 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->master	= master;
 	fsi_port_info_init(fsi, &info.port_a);
 	fsi_handler_init(fsi, &info.port_a);
+	ret = fsi_clk_init(&pdev->dev, fsi);
+	if (ret)
+		return ret;
 	ret = fsi_stream_probe(fsi, &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "FSIA stream probe failed\n");
@@ -1985,6 +2000,9 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->master	= master;
 	fsi_port_info_init(fsi, &info.port_b);
 	fsi_handler_init(fsi, &info.port_b);
+	ret = fsi_clk_init(&pdev->dev, fsi);
+	if (ret)
+		return ret;
 	ret = fsi_stream_probe(fsi, &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "FSIB stream probe failed\n");
-- 
2.43.0


