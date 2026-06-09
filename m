Return-Path: <linux-renesas-soc+bounces-33757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kzmIC/38J2rI6gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:46:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B568A65F9C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:46:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fYUqp0Az;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CC2230C4603
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F62402B8D;
	Tue,  9 Jun 2026 11:39:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E226403E90
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 11:39:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005180; cv=none; b=fCQYJGmG1hofPU03S8vnm8S7bb2i6aR6R3/O1WeF+KShr3PvuJW+e4RCJVw4k2kr1HO0M85hf4XaoPeDIfuzN+ao18MBm4GyOi2hsskIk8E7T84Kvax9Mr8ulMpg0ZdwdNQtLsv/YbYoWk+iLGjhLl5lrALYNhr38BagaO79ck8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005180; c=relaxed/simple;
	bh=TVTFqtNv3SDidQR0s+8WQhEyydhiZpPFphguBiX/dDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IV2KeikVB0X3XHGLoq7yA6y5SwQY0t2+tmK+P1cVjwmGIQbSUnNqNVEoS54/FV730fftVg5dDaOxCJROLWmx/DIq/hmM8oFgCGofEJr4rENTh4X56xWoMRetnW36nudJ2Z7e5Mbq5JzS9tweDASr0IoYZDnGoooWH0xSmgeJ/q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYUqp0Az; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso48491395ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 04:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005176; x=1781609976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXEOWHZ4dzNUaN8JMIKeeopADr/ohbLDpOo26m2Ui5M=;
        b=fYUqp0AzlkNTpn8WDSlre0+FEZHjb3lZ2rrvIASQ9BwdCx+nF6wHJNYQ33P1hjLWjv
         IxZ6Fg5iJ50JdX287VXvcNX0TKAMx2vUPs7J2orXcnx60eSL+X2ZdMi04pxxfYyYutsV
         5i/2nsNMSjr8AtbhErTSIAvPcyS3mIgNylNa0JswvsBd2KF7ZCWu0dVXG8y0vu3qPjV+
         eOQpTy6jl4MQw+iUTFEcrS5n4PpYh7gc/HmUGzCZd8uQTRSjX6anqSPXB7RpKugGU95N
         aAc3LIwWGmexLEAvTBAm23hmPSWwVuyX7kWmpjVFUM0/smKtg1f9iSLPOHZVvdt/kaoc
         kbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005176; x=1781609976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sXEOWHZ4dzNUaN8JMIKeeopADr/ohbLDpOo26m2Ui5M=;
        b=g3vtM+2hNvmvbXvQckecr37KSXCASgU2+peka1qtQ4dzdx9l/4CGpnigxAZMpEzHsg
         DSWLngJX+5lS1C/HBzPqo2CYOnvcRYo7wlXIvmrCIkKbuseUu9o8L5+aMEulWmpnnn95
         0yopavSXd/UpYbD+z5AKfjIic4WtyhjpycAPfjHbTJKSLkUFAsd/Fmtr0ndSSkXlCPrg
         pAAnyocwkPyuBcEOrc19DSknRDzcvoZFtTZrqiNfTKImygq/JsJhF+/eUrWhlWRNQO83
         4BFWL+6MmdfHhDsLQoZD2sh/jQfgh8mwcFkmFG7N0R7G1x5mHO35uulWvOYiIN1WlvCX
         aJ3g==
X-Forwarded-Encrypted: i=1; AFNElJ9oHWjEso1WLOZrJZzqyDC4iSFP+IIV78GC9jr7sxBMKsoPNc1hvH9hk3o7pAB7Yx4lTbwPFIVeh3hcM1lgK/G8sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygZImWIwZHFs5tPLExczpMP5GHtvv7bYcKnGBxCcMe7ZjgTP35
	yxLDL9TGtsL7F0I7mWHIlBNMTVQPdw5FHDvZASVi0oRylxUO9yOjYP6uI/Vwig==
X-Gm-Gg: Acq92OFLigI3B6r5/wr37kj1wVZlCbo7Ni/5vPBbpxg3QAWJVn82zFxzY+2euPhkeSm
	dYNFpCAV5IaN3RgFsA0xFIzqU5O91O/EnrkflPgVOEETQbqZL4d7iXRl8W4U3bKzZ7TZ71lAi9p
	G89rshiuH3Qq0ePWVlbytkky3vH2tE8tRZx2SDbupJOswJMPIqac0If3VFTBX3VWiHakpcKvtJ6
	Z5VwIJCS4dqNeXDdXsSOjj5KC1GnyNWajZ4EZYA423dTUFMCahYvzuhKo6OiTOHn4vLcfgFH27r
	Zv6OAwAXX9AjpdRA5MDGkm+jl/jUBJ/wUTxg4VYoBlQK6+LgtUQ2+RRsI+5SR2Sgbz1dv8fPS0C
	PaTt9QRh1f2AG1mUNhWCX6nNo83oNcfr8d6ymCqz2GTGrZUnMYssm4bTQUANAOZwUieVwQC2luL
	tWBxRYZ6/b4XaJHNqjDQCJoOQ1XfVcRdGqdj0H5UHZPWA7b10RV1KQMNbdJriC/d7tU6NL
X-Received: by 2002:a17:902:f60d:b0:2ba:4e84:966 with SMTP id d9443c01a7336-2c1e85e0896mr217831875ad.36.1781005176375;
        Tue, 09 Jun 2026 04:39:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:36 -0700 (PDT)
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
Subject: [PATCH v6 08/11] ASoC: renesas: fsi: refactor clock initialization
Date: Tue,  9 Jun 2026 18:38:33 +0700
Message-ID: <20260609113836.45079-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33757-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B568A65F9C6

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_clk_init() from set_fmt() to the probe path.
This ensures that clock resources are acquired only once during device
initialization, instead of being looked up repeatedly whenever set_fmt()
is called.
Together with the previous conversion to devm_clk_get_optional(), the
driver can now probe successfully even when optional clocks are absent.
The set_rate() callbacks continue to validate that all required clocks
are available before applying hardware-specific configuration.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.
 - Improve probe and clock error handling.
Changes in v5:
 - Reorder the patches 
 - update the error handling path to ensure proper cleanup by Sashiko 
Changes in v4:
 - Handle the return value of fsi_clk_init() to properly support deferred 
   probe, as suggested by Mark.

 sound/soc/renesas/fsi.c | 67 +++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index e29be2bcf952..43bc77ebcca3 100644
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
@@ -1978,6 +1975,11 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->master	= master;
 	fsi_port_info_init(fsi, &info.port_a);
 	fsi_handler_init(fsi, &info.port_a);
+	ret = fsi_clk_init(&pdev->dev, fsi);
+	if (ret) {
+		dev_err(&pdev->dev, "FSIA clk init failed\n");
+		return ret;
+	}
 	ret = fsi_stream_probe(fsi, &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "FSIA stream probe failed\n");
@@ -1991,6 +1993,11 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->master	= master;
 	fsi_port_info_init(fsi, &info.port_b);
 	fsi_handler_init(fsi, &info.port_b);
+	ret = fsi_clk_init(&pdev->dev, fsi);
+	if (ret) {
+		dev_err(&pdev->dev, "FSIB clk init failed\n");
+		goto exit_fsia;
+	}
 	ret = fsi_stream_probe(fsi, &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "FSIB stream probe failed\n");
-- 
2.43.0


