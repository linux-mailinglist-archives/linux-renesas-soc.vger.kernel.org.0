Return-Path: <linux-renesas-soc+bounces-27230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL3gC3wtcWmcfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 20:48:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F05665C801
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 20:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F36D38405F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B324D90DF;
	Wed, 21 Jan 2026 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FxLSSiiw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950404D90C3;
	Wed, 21 Jan 2026 17:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015134; cv=none; b=k1wFJAbJACZzp0wmv50bsjF7Fsd5nWh9G7qT2bzsa3QLgQdlpCQFeqasmR+/j0DJTN+0MfSvLYj6tXYtX5E2S2MSM41gD8jPWyk9MNp3G7MUC74KeEArnKuSh0oU/vOalzmQfrb7v6nj1HKCK/6qHr9YncYZ+/RiXjf9O4+Xd2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015134; c=relaxed/simple;
	bh=wqzgTKFg6ppbuBFV3yXjEvMJbs7TMKIWizW6DK2qIQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fkvyZz9mIHXNrwib1NIm6Gi7XZezvffLCiLxn1KZ/6btkWUaYBC8fbR7WQSefnF9IE8ulYAaVijjHZhMH+BMsG9bK7IAzP+gusZdjWeC3yD41IkdJPuX6iopM8vw9bemBeV6CYme5hxzQb72PrwYHuunuZgx3OJTx63FkWWJWow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FxLSSiiw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D63081A28FD;
	Wed, 21 Jan 2026 17:05:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD0966070A;
	Wed, 21 Jan 2026 17:05:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AB74119B18A9;
	Wed, 21 Jan 2026 18:05:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769015129; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y4t0ZhlqcETe6yz8RMe/Zn2ajMMv2vHDxX8bYifqwF8=;
	b=FxLSSiiw6RWTVyMA2PNLzSywT1RZ0gFCHZV3OuUyikzYyfrPVAoxtEN828bJvKRvBsiOfA
	U7tMydIAhfz++FPXhY/PobGinpmrtiVaVEeE1zQ6F4g8WxlODp57CTiMVcaZeWlA5Y09PV
	Cmza1tahJCpBsKP0s39SWqkKZQA25VJ7G/vU0LpVtswM9nNki2spiWw6frBJjgCfzZRDoZ
	aPMMEER3HPK5vGUzmu1e6W0EEdkUGX0W9Er20a+accoyZMoydXS3kJqnZCbfeLk/HDDHGl
	mcAjP0Zkx40l2kutj1JiPNxuLXLVRNSmCXw9kIXvwF1BhArxflIJV+u2hmRvrw==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Wed, 21 Jan 2026 18:05:06 +0100
Subject: [PATCH v3 10/17] spi: cadence-qspi: Fix probe error path and
 remove
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-schneider-6-19-rc1-qspi-v3-10-43e70fab4444@bootlin.com>
References: <20260121-schneider-6-19-rc1-qspi-v3-0-43e70fab4444@bootlin.com>
In-Reply-To: <20260121-schneider-6-19-rc1-qspi-v3-0-43e70fab4444@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Vaishnav Achath <vaishnav.a@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27230-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,ti.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[bootlin.com,reject];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: F05665C801
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The probe has been modified by many different users, it is hard to track
history, but for sure its current state is partially broken. One easy
rule to follow is to drop/free/release the resources in the opposite
order they have been queried.

Fix the labels, the order for freeing the resources, and add the
missing DMA channel step. Replicate these changes in the remove path as
well.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 44 ++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index fc9f6e8dd549..4bfe65af458e 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1890,7 +1890,7 @@ static int cqspi_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(cqspi->clk);
 	if (ret) {
 		dev_err(dev, "Cannot enable QSPI clock.\n");
-		goto probe_clk_failed;
+		goto disable_rpm;
 	}
 
 	/* Obtain QSPI reset control */
@@ -1898,14 +1898,14 @@ static int cqspi_probe(struct platform_device *pdev)
 	if (IS_ERR(rstc)) {
 		ret = PTR_ERR(rstc);
 		dev_err(dev, "Cannot get QSPI reset.\n");
-		goto probe_reset_failed;
+		goto disable_clk;
 	}
 
 	rstc_ocp = devm_reset_control_get_optional_exclusive(dev, "qspi-ocp");
 	if (IS_ERR(rstc_ocp)) {
 		ret = PTR_ERR(rstc_ocp);
 		dev_err(dev, "Cannot get QSPI OCP reset.\n");
-		goto probe_reset_failed;
+		goto disable_clk;
 	}
 
 	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi")) {
@@ -1913,7 +1913,7 @@ static int cqspi_probe(struct platform_device *pdev)
 		if (IS_ERR(rstc_ref)) {
 			ret = PTR_ERR(rstc_ref);
 			dev_err(dev, "Cannot get QSPI REF reset.\n");
-			goto probe_reset_failed;
+			goto disable_clk;
 		}
 		reset_control_assert(rstc_ref);
 		reset_control_deassert(rstc_ref);
@@ -1955,7 +1955,7 @@ static int cqspi_probe(struct platform_device *pdev)
 		if (ddata->jh7110_clk_init) {
 			ret = cqspi_jh7110_clk_init(pdev, cqspi);
 			if (ret)
-				goto probe_reset_failed;
+				goto disable_clk;
 		}
 		if (ddata->quirks & CQSPI_DISABLE_STIG_MODE)
 			cqspi->disable_stig_mode = true;
@@ -1963,7 +1963,7 @@ static int cqspi_probe(struct platform_device *pdev)
 		if (ddata->quirks & CQSPI_DMA_SET_MASK) {
 			ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
 			if (ret)
-				goto probe_reset_failed;
+				goto disable_clks;
 		}
 	}
 
@@ -1974,7 +1974,7 @@ static int cqspi_probe(struct platform_device *pdev)
 			       pdev->name, cqspi);
 	if (ret) {
 		dev_err(dev, "Cannot request IRQ.\n");
-		goto probe_reset_failed;
+		goto disable_clks;
 	}
 
 	cqspi_wait_idle(cqspi);
@@ -2001,31 +2001,36 @@ static int cqspi_probe(struct platform_device *pdev)
 		ret = cqspi_request_mmap_dma(cqspi);
 		if (ret == -EPROBE_DEFER) {
 			dev_err_probe(&pdev->dev, ret, "Failed to request mmap DMA\n");
-			goto probe_setup_failed;
+			goto disable_controller;
 		}
 	}
 
 	ret = spi_register_controller(host);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register SPI ctlr %d\n", ret);
-		goto probe_setup_failed;
+		goto release_dma_chan;
 	}
 
 	if (!(ddata && (ddata->quirks & CQSPI_DISABLE_RUNTIME_PM)))
 		pm_runtime_put_autosuspend(dev);
 
 	return 0;
-probe_setup_failed:
-	if (!(ddata && (ddata->quirks & CQSPI_DISABLE_RUNTIME_PM)))
-		pm_runtime_disable(dev);
+
+release_dma_chan:
+	if (cqspi->rx_chan)
+		dma_release_channel(cqspi->rx_chan);
+disable_controller:
 	cqspi_controller_enable(cqspi, 0);
-probe_reset_failed:
+disable_clks:
 	if (cqspi->is_jh7110)
 		cqspi_jh7110_disable_clk(pdev, cqspi);
-
+disable_clk:
 	if (pm_runtime_get_sync(&pdev->dev) >= 0)
 		clk_disable_unprepare(cqspi->clk);
-probe_clk_failed:
+disable_rpm:
+	if (!(ddata && (ddata->quirks & CQSPI_DISABLE_RUNTIME_PM)))
+		pm_runtime_disable(dev);
+
 	return ret;
 }
 
@@ -2043,18 +2048,19 @@ static void cqspi_remove(struct platform_device *pdev)
 		cqspi_wait_idle(cqspi);
 
 	spi_unregister_controller(cqspi->host);
-	cqspi_controller_enable(cqspi, 0);
 
 	if (cqspi->rx_chan)
 		dma_release_channel(cqspi->rx_chan);
 
-	if (!(ddata && (ddata->quirks & CQSPI_DISABLE_RUNTIME_PM)))
-		if (pm_runtime_get_sync(&pdev->dev) >= 0)
-			clk_disable(cqspi->clk);
+	cqspi_controller_enable(cqspi, 0);
 
 	if (cqspi->is_jh7110)
 		cqspi_jh7110_disable_clk(pdev, cqspi);
 
+	if (!(ddata && (ddata->quirks & CQSPI_DISABLE_RUNTIME_PM)))
+		if (pm_runtime_get_sync(&pdev->dev) >= 0)
+			clk_disable(cqspi->clk);
+
 	if (!(ddata && (ddata->quirks & CQSPI_DISABLE_RUNTIME_PM))) {
 		pm_runtime_put_sync(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);

-- 
2.51.1


