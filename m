Return-Path: <linux-renesas-soc+bounces-27233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHD0LIMqcWniewAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 20:35:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 470BB5C475
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 20:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 159C3B03F15
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436D04DA556;
	Wed, 21 Jan 2026 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JN1wMIae"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967854D9919
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015140; cv=none; b=k/Y+HyqkYlNe4gYd2g1KlNSVOIpZwgGa70elssKRbtrDCd/Jpmf6AVRgbDGHiQ7Kyurko1TZdKJYiad0hBJFgUQd7Z71VkAR7mqn7paAiCGnv4NZFzFTxLSEH5abd4KcC1Seu2zo1o9keoA5lGTDoVBpoSTaDkSdXDbXJ706kxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015140; c=relaxed/simple;
	bh=7UMMSpTRFRksgUS7dSZabu6uzWVcK75/uzorszirfjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLmkzV1LW3AZHmNbJOLyDpA85oqzW/lwwbnnI540+lNWLGIYDQJrxQIEHjV+yJ4KKR73S9SuHdHmUAUvbsJw5OwV0JSexAPyleXEZ0enYaOvqSHItCAmQna1IlwViZRQSqePuIUxHKQYN6cg/bVo/fU+EYi1+V8vZaTtQKVtaA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JN1wMIae; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 315E14E421CB;
	Wed, 21 Jan 2026 17:05:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0164F6070A;
	Wed, 21 Jan 2026 17:05:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C017119B18D4;
	Wed, 21 Jan 2026 18:05:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769015135; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WIFqPskiDM9IjrZs85Iqodhn/D6pSUk1OJXi0KZ7anY=;
	b=JN1wMIaeDUKDCERcrdVvdA9LjV3So1tTmGvPS6HNjf5KaPDaWm0CaeDoXYXv6SecjnZcyv
	Ht4SZs2EwQATmllbldoBEFLZTaNx+1wHG5odMmYiw5u3pfV0ruv4xUCFowOrzf5nC0mfIk
	UYf8MKXajxdRi0F0u0WD0boGRtOcYYo2N2bq/AFkfmO7sEJRLjZ2/wwztpXrnvRbhuKrg2
	6lGQvGfzD85R5aIt6J8q8+jPZtBUUexLKO4c3kNXrUMBBCT9KNHH8WPdqfjTcwYXKa9AqC
	WNZ1gLRrybHfDAe/b+J1K4udaqMc8cXMMRj4AAoLMtvICWWaoGpxgyrrNHEb1g==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Wed, 21 Jan 2026 18:05:09 +0100
Subject: [PATCH v3 13/17] spi: cadence-qspi: Add a flag for controllers
 without indirect access support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-schneider-6-19-rc1-qspi-v3-13-43e70fab4444@bootlin.com>
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
	TAGGED_FROM(0.00)[bounces-27233-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,sang-engineering.com:email]
X-Rspamd-Queue-Id: 470BB5C475
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Renesas RZ/N1 QSPI controllers embed the Cadence IP with some
limitations/simplifications. One of the is that only direct access is
supported, none of the registers related to indirect writes are
populated, so create a flag to avoid these accesses and make sure only
direct accessors are called.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 35379546c3b4..e1ec20684b0a 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -47,6 +47,7 @@ static_assert(CQSPI_MAX_CHIPSELECT <= SPI_DEVICE_CS_CNT_MAX);
 #define CQSPI_SUPPORT_DEVICE_RESET	BIT(8)
 #define CQSPI_DISABLE_STIG_MODE		BIT(9)
 #define CQSPI_DISABLE_RUNTIME_PM	BIT(10)
+#define CQSPI_NO_INDIRECT_MODE		BIT(11)
 
 /* Capabilities */
 #define CQSPI_SUPPORTS_OCTAL		BIT(0)
@@ -1423,7 +1424,8 @@ static ssize_t cqspi_read(struct cqspi_flash_pdata *f_pdata,
 	if (ret)
 		return ret;
 
-	if (cqspi->use_direct_mode && ((from + len) <= cqspi->ahb_size))
+	if ((cqspi->use_direct_mode && ((from + len) <= cqspi->ahb_size)) ||
+	    (cqspi->ddata && cqspi->ddata->quirks & CQSPI_NO_INDIRECT_MODE))
 		return cqspi_direct_read_execute(f_pdata, buf, from, len);
 
 	if (cqspi->use_dma_read && ddata && ddata->indirect_read_dma &&
@@ -1624,19 +1626,20 @@ static void cqspi_controller_init(struct cqspi_st *cqspi)
 	/* Disable all interrupts. */
 	writel(0, cqspi->iobase + CQSPI_REG_IRQMASK);
 
-	/* Configure the SRAM split to 1:1 . */
-	writel(cqspi->fifo_depth / 2, cqspi->iobase + CQSPI_REG_SRAMPARTITION);
+	if (!(cqspi->ddata && cqspi->ddata->quirks & CQSPI_NO_INDIRECT_MODE)) {
+		/* Configure the SRAM split to 1:1 . */
+		writel(cqspi->fifo_depth / 2, cqspi->iobase + CQSPI_REG_SRAMPARTITION);
+		/* Load indirect trigger address. */
+		writel(cqspi->trigger_address,
+		       cqspi->iobase + CQSPI_REG_INDIRECTTRIGGER);
 
-	/* Load indirect trigger address. */
-	writel(cqspi->trigger_address,
-	       cqspi->iobase + CQSPI_REG_INDIRECTTRIGGER);
-
-	/* Program read watermark -- 1/2 of the FIFO. */
-	writel(cqspi->fifo_depth * cqspi->fifo_width / 2,
-	       cqspi->iobase + CQSPI_REG_INDIRECTRDWATERMARK);
-	/* Program write watermark -- 1/8 of the FIFO. */
-	writel(cqspi->fifo_depth * cqspi->fifo_width / 8,
-	       cqspi->iobase + CQSPI_REG_INDIRECTWRWATERMARK);
+		/* Program read watermark -- 1/2 of the FIFO. */
+		writel(cqspi->fifo_depth * cqspi->fifo_width / 2,
+		       cqspi->iobase + CQSPI_REG_INDIRECTRDWATERMARK);
+		/* Program write watermark -- 1/8 of the FIFO. */
+		writel(cqspi->fifo_depth * cqspi->fifo_width / 8,
+		       cqspi->iobase + CQSPI_REG_INDIRECTWRWATERMARK);
+	}
 
 	/* Disable direct access controller */
 	if (!cqspi->use_direct_mode) {

-- 
2.51.1


