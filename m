Return-Path: <linux-renesas-soc+bounces-27236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJHiGrsbcWmodQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 19:32:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C18E5B4EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 19:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 367757A6D53
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76224DB549;
	Wed, 21 Jan 2026 17:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HI46P8sr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FB64D2EF5;
	Wed, 21 Jan 2026 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015145; cv=none; b=SFMKnCIsc4HmWPrRuBKozwM74rQJ9wf8fMUliTKYO5Qx8EAIpxeh3ycXtfZMa/5ZU51OIuRHEJMgcxKKrHuq55HF0+zkotNNra4z7fQ4p1isWidCp9E2XOpBKe26D2w9c0IeuW/SDYL+fczSdSHTcL9PUfxMSj8P7i1Vka3X+pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015145; c=relaxed/simple;
	bh=L9zRGuWciWLS4xt7tmSPqAW/TLvbbxYs1/TW9TsfuJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sen/5CYN7mziJ1xn7GmE8hg402SE22raXxIREklzH4gF+EmDiPK1A0oRfKAexgry237Q000UZHAOPUwv9RdvoJYruZLixURnDkuaBZgQ6mp1sx210SVJs+hKa58tOskG33PXNVhOzylKn4WuieipirkVyDL+d6A2rQAkwH19Br0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HI46P8sr; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 96D7D1A28FD;
	Wed, 21 Jan 2026 17:05:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B9DB6070A;
	Wed, 21 Jan 2026 17:05:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDE19119B17EB;
	Wed, 21 Jan 2026 18:05:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769015140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IVRLNIDnLsBQL3km1y8IbVzR7+9lYxXcsBbu4Y2gsdw=;
	b=HI46P8sr7DSmtYRX82Edwy4vUCNvgF28x1WkOphxfHP0+RULjOI/gdU+/iAiDSNtoOzd4L
	xi6TnCqkXB4RyjAydcJxMPlMsgCok3hmYflLcSLJiGe+w8o2VSmWJPJR9ZV5Z2hbtjW2HT
	/QNO+ibc20O6nM/jM0o8uyRfh5qmgG5d2yIITJOKzRaApRNAUi2BMzhrExYpTXvp1yXX5b
	pIrfiQHuv4hKiEsWQSnCG7buJWxUf6bop0wdx1b4YytRPqQFUmInn8sQdLW4f8/J5VoS6V
	MTRIR6438gVTXnH5QffEf1Lkswi7OsI2dy2vMuO6ype7HDCSf4VxRp+tsiUxVQ==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Wed, 21 Jan 2026 18:05:12 +0100
Subject: [PATCH v3 16/17] spi: cadence-qspi: Add support for the Renesas
 RZ/N1 controller
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-schneider-6-19-rc1-qspi-v3-16-43e70fab4444@bootlin.com>
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
	TAGGED_FROM(0.00)[bounces-27236-lists,linux-renesas-soc=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[bootlin.com,reject];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,ti.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCPT_COUNT_TWELVE(0.00)[19];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2C18E5B4EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Renesas RZ/N1 QSPI controllers embed a modified version of the Cadence
IP with the following settings:
- a limited bus clock range
- no DTR support
- no DMA
- no useful interrupt flag
- only direct accesses (no INDAC mode)
- write protection

The controller has been tested by running the SPI NOR check list with a
custom RZ/N1D400 based board mounted with a Spansion s25fl128s1 quad
SPI.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
Output of the SPI NOR test procedure:
s25fl128s1
0120184d0180
spansion
xxd: /sys/bus/spi/devices/spi0.0/spi-nor/sfdp: No such file or directory
md5sum: can't open '/sys/bus/spi/devices/spi0.0/spi-nor/sfdp': No such file or directory
1+0 records in
1+0 records out
Copied 65536 bytes from qspi_test to address 0x00000000 in flash
Erased 65536 bytes from address 0x00000000 in flash
Copied 65536 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0010000
Copied 65536 bytes from qspi_test to address 0x00000000 in flash
Copied 65536 bytes from address 0x00000000 in flash to qspi_read
71f8b056a4bf5f51639a972dc9aac55eb8654fdc  qspi_test
71f8b056a4bf5f51639a972dc9aac55eb8654fdc  qspi_read

Read speed:
* page read speed is 6464 KiB/s
* 2 page read speed is 9014 KiB/s
* eraseblock read speed is 14222 KiB/s
Write speed:
* page write speed is 621 KiB/s
* 2 page write speed is 626 KiB/s
* eraseblock write speed is 633 KiB/s
Erase speed:
* erase speed is 617 KiB/s
---
 drivers/spi/spi-cadence-quadspi.c | 56 +++++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 5f3a914e45f7..6dd14ac37434 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -110,6 +110,7 @@ struct cqspi_st {
 	bool			apb_ahb_hazard;
 
 	bool			is_jh7110; /* Flag for StarFive JH7110 SoC */
+	bool			is_rzn1; /* Flag for Renesas RZN1 SoC */
 	bool			disable_stig_mode;
 	refcount_t		refcount;
 	refcount_t		inflight_ops;
@@ -1337,8 +1338,9 @@ static ssize_t cqspi_write(struct cqspi_flash_pdata *f_pdata,
 	 * mode. So, we can not use direct mode when in DTR mode for writing
 	 * data.
 	 */
-	if (!op->cmd.dtr && cqspi->use_direct_mode &&
-	    cqspi->use_direct_mode_wr && ((to + len) <= cqspi->ahb_size)) {
+	if ((!op->cmd.dtr && cqspi->use_direct_mode &&
+	     cqspi->use_direct_mode_wr && ((to + len) <= cqspi->ahb_size)) ||
+	    (cqspi->ddata && cqspi->ddata->quirks & CQSPI_NO_INDIRECT_MODE)) {
 		memcpy_toio(cqspi->ahb_base + to, buf, len);
 		return cqspi_wait_idle(cqspi);
 	}
@@ -1512,6 +1514,7 @@ static int cqspi_exec_mem_op(struct spi_mem *mem, const struct spi_mem_op *op)
 static bool cqspi_supports_mem_op(struct spi_mem *mem,
 				  const struct spi_mem_op *op)
 {
+	struct cqspi_st *cqspi = spi_controller_get_devdata(mem->spi->controller);
 	bool all_true, all_false;
 
 	/*
@@ -1538,6 +1541,9 @@ static bool cqspi_supports_mem_op(struct spi_mem *mem,
 		/* A single opcode is supported, it will be repeated */
 		if ((op->cmd.opcode >> 8) != (op->cmd.opcode & 0xFF))
 			return false;
+
+		if (cqspi->is_rzn1)
+			return false;
 	} else if (!all_false) {
 		/* Mixed DTR modes are not supported. */
 		return false;
@@ -1591,18 +1597,20 @@ static int cqspi_of_get_pdata(struct cqspi_st *cqspi)
 
 	cqspi->is_decoded_cs = of_property_read_bool(np, "cdns,is-decoded-cs");
 
-	if (of_property_read_u32(np, "cdns,fifo-depth", &cqspi->fifo_depth)) {
-		/* Zero signals FIFO depth should be runtime detected. */
-		cqspi->fifo_depth = 0;
-	}
+	if (!(cqspi->ddata && cqspi->ddata->quirks & CQSPI_NO_INDIRECT_MODE)) {
+		if (of_property_read_u32(np, "cdns,fifo-depth", &cqspi->fifo_depth)) {
+			/* Zero signals FIFO depth should be runtime detected. */
+			cqspi->fifo_depth = 0;
+		}
 
-	if (of_property_read_u32(np, "cdns,fifo-width", &cqspi->fifo_width))
-		cqspi->fifo_width = 4;
+		if (of_property_read_u32(np, "cdns,fifo-width", &cqspi->fifo_width))
+			cqspi->fifo_width = 4;
 
-	if (of_property_read_u32(np, "cdns,trigger-address",
-				 &cqspi->trigger_address)) {
-		dev_err(dev, "couldn't determine trigger-address\n");
-		return -ENXIO;
+		if (of_property_read_u32(np, "cdns,trigger-address",
+					 &cqspi->trigger_address)) {
+			dev_err(dev, "couldn't determine trigger-address\n");
+			return -ENXIO;
+		}
 	}
 
 	if (of_property_read_u32(np, "num-cs", &cqspi->num_chipselect))
@@ -1666,6 +1674,9 @@ static void cqspi_controller_detect_fifo_depth(struct cqspi_st *cqspi)
 	struct device *dev = &cqspi->pdev->dev;
 	u32 reg, fifo_depth;
 
+	if (cqspi->ddata && cqspi->ddata->quirks & CQSPI_NO_INDIRECT_MODE)
+		return;
+
 	/*
 	 * Bits N-1:0 are writable while bits 31:N are read as zero, with 2^N
 	 * the FIFO depth.
@@ -1791,6 +1802,8 @@ static int cqspi_probe(struct platform_device *pdev)
 	cqspi = spi_controller_get_devdata(host);
 	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi"))
 		cqspi->is_jh7110 = true;
+	if (of_device_is_compatible(pdev->dev.of_node, "renesas,rzn1-qspi"))
+		cqspi->is_rzn1 = true;
 
 	cqspi->pdev = pdev;
 	cqspi->host = host;
@@ -1888,7 +1901,12 @@ static int cqspi_probe(struct platform_device *pdev)
 	reset_control_deassert(rstc_ocp);
 
 	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clks[CLK_QSPI_REF].clk);
-	host->max_speed_hz = cqspi->master_ref_clk_hz;
+	if (!cqspi->is_rzn1) {
+		host->max_speed_hz = cqspi->master_ref_clk_hz;
+	} else {
+		host->max_speed_hz = cqspi->master_ref_clk_hz / 2;
+		host->min_speed_hz = cqspi->master_ref_clk_hz / 32;
+	}
 
 	/* write completion is supported by default */
 	cqspi->wr_completion = true;
@@ -1953,7 +1971,7 @@ static int cqspi_probe(struct platform_device *pdev)
 	if (ddata && (ddata->quirks & CQSPI_SUPPORT_DEVICE_RESET))
 		cqspi_device_reset(cqspi);
 
-	if (cqspi->use_direct_mode) {
+	if (cqspi->use_direct_mode && !cqspi->is_rzn1) {
 		ret = cqspi_request_mmap_dma(cqspi);
 		if (ret == -EPROBE_DEFER) {
 			dev_err_probe(&pdev->dev, ret, "Failed to request mmap DMA\n");
@@ -2133,6 +2151,12 @@ static const struct cqspi_driver_platdata mobileye_eyeq5_ospi = {
 		  CQSPI_RD_NO_IRQ,
 };
 
+static const struct cqspi_driver_platdata renesas_rzn1_qspi = {
+	.hwcaps_mask = CQSPI_SUPPORTS_QUAD,
+	.quirks = CQSPI_NO_SUPPORT_WR_COMPLETION | CQSPI_RD_NO_IRQ |
+		  CQSPI_HAS_WR_PROTECT | CQSPI_NO_INDIRECT_MODE,
+};
+
 static const struct of_device_id cqspi_dt_ids[] = {
 	{
 		.compatible = "cdns,qspi-nor",
@@ -2174,6 +2198,10 @@ static const struct of_device_id cqspi_dt_ids[] = {
 		.compatible = "amd,versal2-ospi",
 		.data = &versal2_ospi,
 	},
+	{
+		.compatible = "renesas,rzn1-qspi",
+		.data = &renesas_rzn1_qspi,
+	},
 	{ /* end of table */ }
 };
 

-- 
2.51.1


