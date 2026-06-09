Return-Path: <linux-renesas-soc+bounces-33725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gh5oGbRtJ2ouwgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:34:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBDA65BA85
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:34:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pTDcMZ6G;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94D27301FD58
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 01:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90685346766;
	Tue,  9 Jun 2026 01:32:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419D133B6D9
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 01:32:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968730; cv=none; b=AyIJuxGsDaSw9ei6LpBRFcBiGkehTokl32x1nVdkoGqqJp0udJWChA/+KJVwKU1VDKv1ejrB/jY/lPl821OTWQuOtHuRcAbOyLFUGkdlXxKvqkwGlsCpTTcChC+0v5yRYC1P8XUcFAokcclpTh7Nn+6lIGpGylsc0Cdpvnocqzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968730; c=relaxed/simple;
	bh=/wFz177WD3SJ6TlQiCBL0Au+rgkwIfaDTqf/SlngIsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gMG0GRW/Zv7emaIBgXhpVFVD2lKV+XoClZIwHBAoT+Cxnxd5p2zWKKEXmicngZm7gGRmA6gnSqH/+6bItT11fpvF/HXWOHsSJTWDswsagtiXmS+Ig/1oFwVWeF/LF7c+0+98gAxC49bH2JKNNZdXfwxTH2WBrzUslXkQP/pKPZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTDcMZ6G; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so40927535ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 18:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968724; x=1781573524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8p33kKo2+s8dyswBbfJmCPtBlgGA9fVQCE0brP+A/g=;
        b=pTDcMZ6GHW8NgPLm7Fxx0cHPQd+bn3piHYZd2swh3QhFuFa1Q7O3ky6CPVcgPhU/H+
         Z7kdwGrSeP9cWOrrDdRScfKG8Z+i1ZocLFDzUqKxGbZimkwlaWwDqRVykP12meDCay7Y
         UPIyn/+YkMttxinMThsdOi5T38QGSAyF4gUvil8Vm3Wt0XbAvoStdLOFApWD+iRvEdbX
         lYHOn9/FqpciWL4BTWH+hhGVxSu6qfdQ++HuYEV+MvU1UMOzO4xHDtljZxOaDY0Q7raU
         qyeURMG4mUGfwxID7CVOz9FnLiuumgqrqZwIIVObgdYXBb16kcK2G9IohgoALgmz3Xpp
         ICKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968724; x=1781573524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m8p33kKo2+s8dyswBbfJmCPtBlgGA9fVQCE0brP+A/g=;
        b=OQAewATZfMQDBrNdkZBcNZejdI7HkBONhtsNR2V4OZ8dCh1WzfDLhDVtgeT9AKpqZd
         Lab//e3BQv4+ioD+HHJdJHFn5TmN4kuvs39bQKbo7fxD6tAt7DNT/hGras5oIvNplvfw
         ZYVaMevRAGLaL690TzGbP4BI1I/c5Kc/Q/ShhJAod4AjHNinLDBsA5bWecIx39Milg1k
         7ljZ1Cdht09KE5o6C8Lfy4DipU7N00ONbywJFM+mQEuzBJ7GTOp6eWxkn/NPNKC37HjP
         98YFA2q4Ps46TzIsaSxpvuDZC+m43joVKvOCTZDw/hAmKfAa7G7oqYlPQ+GO2h+edyPz
         XFUA==
X-Forwarded-Encrypted: i=1; AFNElJ8glNQia6SNJVM6eaRzQE3U6lcWL3k39B+9vsaAwgco+VWkvHawL2I98R9vF4lv4zxO5XeT533tcD/UHX5b5D+1Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHtwGOeYKYkSTdEIzJs5mtScG1ndd904DJwIp2F40oKdeyjb7U
	EML+fmS6yFrV/f09EgOd4ooLn/tgQQtvc0u8CjzAlD+lZPVgYMsBDoIi
X-Gm-Gg: Acq92OFSxrFKXxkLP4npbTJldb4haCisQl2LDzsTKnp63DJcEeSeUPFA8q+eq6luZCZ
	Xk8L2QhvycXSh7qBIB580UyB7vRrzzH/n0CMcQhHebfyqKmm5NOQZWkYlsSBZmVgv4MFKgQvki+
	gpEcTnXfSvMfOTT7LkNM/LmBXkMgT4VggLujJhfGVU4mvndGmYo+ODhmhWZU3ir+riqFVTUmKV6
	zM5dHCuXCeM29+P5cXh6kH6tUWuNbtELOKWbsNkOwNWLTxq+3viuRetJv6HDsLEbkIxv4N0uaPs
	3X3M68I5nkON0ExARtvi//NHL1+XVLxGtA6IcQnRNPXYiRmgdSkNxIravggyGQBHEPV+RRK1023
	rcLJOGKHKXtIsjXCbPsxYj6uF6ytpfshZKMzqxRjFRrQp8M5e6ymrSpk1o0+012AJxgzkneUM4n
	XhSNoKYonwt9ss3zCVtWDsq3d+PsIPjZA8QJibxMD2opl9mBP25u8Cm17Ul1Z+odOvE2we
X-Received: by 2002:a17:903:2a87:b0:2bf:13b0:f8ed with SMTP id d9443c01a7336-2c1e7b2ce09mr252583915ad.3.1780968724400;
        Mon, 08 Jun 2026 18:32:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:32:04 -0700 (PDT)
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
Subject: [PATCH v5 08/11] ASoC: renesas: fsi: refactor clock initialization
Date: Tue,  9 Jun 2026 08:31:04 +0700
Message-ID: <20260609013107.5995-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33725-lists,linux-renesas-soc=lfdr.de];
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
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCBDA65BA85

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_clk_init() from set_fmt() to the probe path.
This ensures that clock resources are acquired only once during device
initialization, instead of being looked up repeatedly whenever set_fmt()
is called.
Together with the previous conversion to devm_clk_get_optional(), the
driver can now probe successfully even when optional clocks are absent.
The set_rate() callbacks continue to validate that all required clocks
are available before applying hardware-specific configuration.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v5:
 - Reorder the patches 
 - update the error handling path to ensure proper cleanup by Sashiko 

Changes in v4:
 - Handle the return value of fsi_clk_init() to properly support deferred 
   probe, as suggested by Mark.

 sound/soc/renesas/fsi.c | 63 +++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index e29be2bcf952..13988c7dc926 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -862,6 +862,11 @@ static int fsi_clk_set_rate_external(struct device *dev,
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
@@ -898,6 +903,11 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
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
@@ -970,35 +980,35 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
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
-		return -EINVAL;
+		return dev_err_probe(dev, PTR_ERR(clock->own), "Can't get fck clock\n");
 
 	/* external clock */
 	if (xck) {
 		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
-		if (IS_ERR(clock->xck)) {
-			dev_err(dev, "can't get xck clock\n");
-			return -EINVAL;
-		}
+		if (IS_ERR(clock->xck))
+			return dev_err_probe(dev, PTR_ERR(clock->xck), "Can't get xck clock\n");
 		if (clock->xck == clock->own) {
 			dev_err(dev, "cpu doesn't support xck clock\n");
 			return -EINVAL;
@@ -1008,10 +1018,8 @@ static int fsi_clk_init(struct device *dev,
 	/* FSIACLK/FSIBCLK */
 	if (ick) {
 		clock->ick = devm_clk_get_optional(dev,  is_porta ? "icka" : "ickb");
-		if (IS_ERR(clock->ick)) {
-			dev_err(dev, "can't get ick clock\n");
-			return -EINVAL;
-		}
+		if (IS_ERR(clock->ick))
+			return dev_err_probe(dev, PTR_ERR(clock->ick), "Can't get ick clock\n");
 		if (clock->ick == clock->own) {
 			dev_err(dev, "cpu doesn't support ick clock\n");
 			return -EINVAL;
@@ -1021,10 +1029,8 @@ static int fsi_clk_init(struct device *dev,
 	/* FSI-DIV */
 	if (div) {
 		clock->div = devm_clk_get_optional(dev,  is_porta ? "diva" : "divb");
-		if (IS_ERR(clock->div)) {
-			dev_err(dev, "can't get div clock\n");
-			return -EINVAL;
-		}
+		if (IS_ERR(clock->div))
+			return dev_err_probe(dev, PTR_ERR(clock->div), "Can't get div clock\n");
 		if (clock->div == clock->own) {
 			dev_err(dev, "cpu doesn't support div clock\n");
 			return -EINVAL;
@@ -1672,15 +1678,6 @@ static int fsi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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
@@ -1983,6 +1980,9 @@ static int fsi_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "FSIA stream probe failed\n");
 		return ret;
 	}
+	ret = fsi_clk_init(&pdev->dev, fsi);
+	if (ret)
+		goto exit_fsia;
 
 	/* FSI B setting */
 	fsi		= &master->fsib;
@@ -1996,6 +1996,9 @@ static int fsi_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "FSIB stream probe failed\n");
 		goto exit_fsia;
 	}
+	ret = fsi_clk_init(&pdev->dev, fsi);
+	if (ret)
+		goto exit_fsib;
 
 	pm_runtime_enable(&pdev->dev);
 	dev_set_drvdata(&pdev->dev, master);
-- 
2.43.0


