Return-Path: <linux-renesas-soc+bounces-32320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBFfGmVFAGqmFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:44:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0E650325C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 10:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2ED653002311
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 May 2026 08:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7917936BCE8;
	Sun, 10 May 2026 08:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQPY11Df"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC3A36AB47
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 08:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402658; cv=none; b=PthIrDt9P4YXiJmFJpfkDpKeLwpiL3wZz8D2M4BikLNnIku2pwMtoEF53LnyA9PlPAig/mQzRTuGhXg4X2HlNRTF2WEfVwW8o/qBZ7TwWY5hz1sF3S3livXXGqwxPnZT9dtl8IWZFP79e8f7sUrdIt/PIosFzlUuoWco2OGrmEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402658; c=relaxed/simple;
	bh=S8VdUXpZ5EXRzzLHhnCbiXAzluQarMo2bEw81/CmmUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jGIyZQ6Rs2/XweaYkS+VR6SedmV9p5g27CoL9cEX6CBF/syUAn1dlrBkXgqy6PoZf0WWf+u54EC6WeWaq0SZn1Lo0jy6mYyO4NeRq/4Okt9zJhE1x7ZNq/Jogm9sguV8ncNlHOLO357gIbWHMnrQ77Gi/KTpQcPToitOn7g6Al8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQPY11Df; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b941cd869cso19604785ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 May 2026 01:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402656; x=1779007456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y80K+Yov+kmnyD6TTF5xlQ2F59dwPBHCmkqWrn6Hjzs=;
        b=EQPY11Df00IQRMasi7QQCKpZQuW1EjAAdA0rboGlySd7rUgIjv1VcnJii71Qc2K+RU
         /DNlCsdOByRudesfJSk9TZqyFOHAZajfZSALpCmaW6/QnXF+anhJG9tQ2Fq8LQub7pU5
         gLvggLJx3fhNjQIjPsBRs5FXsYPrS1LWgDiCpJURbPqDB2qG4C4H8R6MA92FpuaVzhVJ
         zk0YZ5Nf+p5WT4y2Rqdwth1zEhcj1omr9x6yn1BLX0cUfN/5SgOp/TbhU8O34xHnKAFE
         bUeQ3GbaKXgu3q3q/NgSK7lrYZda1u82CCZX5prA6+D4sNQ/LNtW6sAjZt4RYKHryMSr
         iRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402656; x=1779007456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y80K+Yov+kmnyD6TTF5xlQ2F59dwPBHCmkqWrn6Hjzs=;
        b=OQc0+vtf1FXMuuLqgbU5ilTa30QmAUnz0ETPhtH0tc4FwFn+xojtDILeeugNTU07LE
         VZR7vEtUF6H/jp6AH4HGsiTc5YCcO4Qs0j4oq08xquTQT9sdDhZ4DJJ6fC2nK7xvL2o+
         iervaTu7F/XZsfDV8+6gJGgs2frcAiOmsIdEcmag5KRLXKjq4vVUehKSOeK77zELQCrG
         FxCFZsmIWmqYRiyLvKLa0TCZSEUNixvm5AmVYvPvD6M8fQgWjikf6AmuPSjch1ZglPon
         tdZw6gu1Pft/Yl4ZffXzpU/qaVkYDApAo/SR/sdk2tLtDqFPWNe3gxt/4+jXlIFEl6Gx
         9aNw==
X-Forwarded-Encrypted: i=1; AFNElJ9snlvme7RoDCs8yCz1S0jvmGBoBrEwWSXfAd94EeflqNJWVyybOkn9EJi9cB1zV1KqzBr2lS7rE1RxGJV74J1LpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9fQq3Fdca29jLrfFMP+6mNOmzBUZy1TSLCTy7Xeu4XQlxflaT
	lH0QsNrvQWVVLbRmcQPpOgbBNCrky/3SKDeiuz4AxWUjlD8uM13V0coU
X-Gm-Gg: Acq92OF0n3rYA9AlLYpBl8pvHfVquHMYnBl/AHI6a6laHWfQy9S00ge7ZeAPUFJQVyL
	Xf25YWUtGB1tbDBwoxe82WXFsaMPcip6f2qCdLloxvtioOU1qYzjtDhAySqG0ryIscpyhr+D3j4
	1ST6RhHDxx7uDO7egYWAchdomDM6oAIinCmxYkYQHIiwrMN5MvM/AGKVtnptGVqxgQgxmyg+DNw
	J4SKx5gK59F6yToj+h6gXLqf4SI8mNR62Y0pO8FK1dUNqS5rkqr5gEbTk6xXKjvmNvJRULDoEWh
	PcwJriPbKLM03UmfzhpamkbUmKQZAogdz9r8ZkfcsT7B2/eicbLeWbop67EhXng06tq/t37Neik
	FF48XQjn3zQXXQLReHuITSWIM/dGIj0vfpzZspjS2I/tyVUGGasPmHsThMJbkpVsndKr1GcjUtb
	i42lj0JVT3H91r8RlFmXfctgAnxZsnSXKwT5g46kmK/FwyioxOTdErBUpa4Q==
X-Received: by 2002:a17:902:e790:b0:2ba:bfc:76b5 with SMTP id d9443c01a7336-2ba78b40166mr207083955ad.4.1778402656470;
        Sun, 10 May 2026 01:44:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:44:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 07/10] ASoC: renesas: fsi: refactor clock initialization
Date: Sun, 10 May 2026 15:43:00 +0700
Message-ID: <20260510084303.122426-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4F0E650325C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-32320-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_clk_init() to probe and use devm_clk_get_optional() for optional
clocks. This allows probe to succeed even when some optional clocks are
missing, while set_rate() performs strict validation to ensure all required
clocks are available for hardware configuration during audio setup.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 70 ++++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 55a11f1fe8aa..8c46d6806958 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -865,6 +865,11 @@ static int fsi_clk_set_rate_external(struct device *dev,
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
@@ -901,6 +906,11 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
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
@@ -973,35 +983,42 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
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
 		return -EINVAL;
 
+	if (!master->clk_spu) {
+		master->clk_spu = devm_clk_get_optional(dev, "spu");
+		if (IS_ERR(master->clk_spu))
+			return PTR_ERR(master->clk_spu);
+	}
+
 	/* external clock */
 	if (xck) {
-		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
-		if (IS_ERR(clock->xck)) {
-			dev_err(dev, "can't get xck clock\n");
-			return -EINVAL;
-		}
+		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
+		if (IS_ERR(clock->xck))
+			return dev_err_probe(dev, PTR_ERR(clock->xck), "Can't get xck clock\n");
 		if (clock->xck == clock->own) {
 			dev_err(dev, "cpu doesn't support xck clock\n");
 			return -EINVAL;
@@ -1010,11 +1027,9 @@ static int fsi_clk_init(struct device *dev,
 
 	/* FSIACLK/FSIBCLK */
 	if (ick) {
-		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
-		if (IS_ERR(clock->ick)) {
-			dev_err(dev, "can't get ick clock\n");
-			return -EINVAL;
-		}
+		clock->ick = devm_clk_get_optional(dev,  is_porta ? "icka" : "ickb");
+		if (IS_ERR(clock->ick))
+			return dev_err_probe(dev, PTR_ERR(clock->ick), "Can't get ick clock\n");
 		if (clock->ick == clock->own) {
 			dev_err(dev, "cpu doesn't support ick clock\n");
 			return -EINVAL;
@@ -1023,11 +1038,9 @@ static int fsi_clk_init(struct device *dev,
 
 	/* FSI-DIV */
 	if (div) {
-		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
-		if (IS_ERR(clock->div)) {
-			dev_err(dev, "can't get div clock\n");
-			return -EINVAL;
-		}
+		clock->div = devm_clk_get_optional(dev,  is_porta ? "diva" : "divb");
+		if (IS_ERR(clock->div))
+			return dev_err_probe(dev, PTR_ERR(clock->div), "Can't get div clock\n");
 		if (clock->div == clock->own) {
 			dev_err(dev, "cpu doesn't support div clock\n");
 			return -EINVAL;
@@ -1689,15 +1702,6 @@ static int fsi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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
@@ -1997,6 +2001,7 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->running_streams = 0;
 	fsi_port_info_init(fsi, &info.port_a);
 	fsi_handler_init(fsi, &info.port_a);
+	fsi_clk_init(&pdev->dev, fsi);
 	ret = fsi_stream_probe(fsi, &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "FSIA stream probe failed\n");
@@ -2011,6 +2016,7 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->running_streams = 0;
 	fsi_port_info_init(fsi, &info.port_b);
 	fsi_handler_init(fsi, &info.port_b);
+	fsi_clk_init(&pdev->dev, fsi);
 	ret = fsi_stream_probe(fsi, &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "FSIB stream probe failed\n");
-- 
2.43.0


