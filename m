Return-Path: <linux-renesas-soc+bounces-27299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFdXF3hBcmnpfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:25:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A581068B96
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 289E930000A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 15:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D0D38BF82;
	Thu, 22 Jan 2026 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mCG4rB9o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B0933EAF9;
	Thu, 22 Jan 2026 15:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094868; cv=none; b=artfwqF/oHQKmFIgWld8pehWKOj29MN/97QcNXEB47simDDLnKVcbWxiQNBsLXZ/KXpUXcytOeE0TI8BZ50xib/3Fiw//dQclfLE5nnOu4BlooOC3hHHXOpxClfj69AhRD3/oqvWnwEwfBIw49x2xw4Um0KXoVsCqlUxVNUajmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094868; c=relaxed/simple;
	bh=L9zRGuWciWLS4xt7tmSPqAW/TLvbbxYs1/TW9TsfuJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQ8wPstOv36gANnUfwiaj7RKLGj62K2ARU5q+ArEHNMi+Hz7NgeeAw/gUxZkuO+itwTV2ZkIB/0OPwt2Yu/wLKcnLvM//c4eVqa1+zAXFc6GFMxECAyE9qTsucVrF+yU2BBVosi6UimCVYONxwd7nE/wlFfEpFrFxU8HDkzMBo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mCG4rB9o; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 08555C21AA7;
	Thu, 22 Jan 2026 15:14:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F258606B6;
	Thu, 22 Jan 2026 15:14:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59F16119B82BD;
	Thu, 22 Jan 2026 16:14:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769094863; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IVRLNIDnLsBQL3km1y8IbVzR7+9lYxXcsBbu4Y2gsdw=;
	b=mCG4rB9ojBO4dI9+V9tHGDaEvVtkWoQAuw5pd3KmC6199CtTnRsRR3olbOcvXusPqEqRP9
	7h6NjXCEsnKj1YVV9tLqqibiPjTQvYxF+QZ7NdcdNCVYhKsmLURwIzBVxWiMmS7ZhOJCoF
	L00SqENGlGLi2deUXl1xW3RbQ4LgRPZ+/gVjv3T1HFcEy+lGGbUK0sq4mK+cPXeP5pkC97
	yI/sgGS3Otv1Coab8QtwSeEanSGa9xTPhD5V8hQQdSlFyB9BKwFOzA+sOy0QVoOXS6B63I
	tzgU677tswJNkKSuWfqqvFuQ3gvKyV7jyH1zPH5Cx8bGt1uwrZgXRb6HelI/Dw==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Thu, 22 Jan 2026 16:13:39 +0100
Subject: [PATCH v4 14/15] spi: cadence-qspi: Add support for the Renesas
 RZ/N1 controller
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-schneider-6-19-rc1-qspi-v4-14-f9c21419a3e6@bootlin.com>
References: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com>
In-Reply-To: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27299-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: A581068B96
X-Rspamd-Action: no action

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


