Return-Path: <linux-renesas-soc+bounces-27289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIGrHVJBcmnpfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:25:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E65A68B53
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 008EF304A665
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 15:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206F930DEBD;
	Thu, 22 Jan 2026 15:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="w0SnOLTR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B60378D83
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094847; cv=none; b=Cx2upRGGVbvQk8oX+HmK/qJ3htei9p9PaKATiSF3b+KGGbkzD/dBafBh/e4f1jUXE2+VSZQoedDasckE9S9C+/Zbl603XdpNJBmqge58c54l+xkfS5MNlCOXI/H5f2dtcGpdv1vgQnRDUvvPZbv71trDly/Ej35IseG5LJU5SA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094847; c=relaxed/simple;
	bh=JD9J15FD3+7Fo755XEIaI+M7RJcrkXyMm5ZCiSP5OnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sz/M4+w8Nx0vfiD68Vb92UMUPFpCvrHmPgcxk3N4UclUbHPmOYhtMjhz1Wnymr7a8OPCWNsku3c9u3bw6XLSWwX6d3SLQRM0I3SqFDaO5a7lKYpg38/ez1vExL4NKrPm5uO0rB/yBCBrBIyOeJa6JUAEH/3XZmPekspzQgVsmw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=w0SnOLTR; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 58F0B1A2AAD;
	Thu, 22 Jan 2026 15:14:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C40F606B6;
	Thu, 22 Jan 2026 15:14:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 420A0119B82C1;
	Thu, 22 Jan 2026 16:13:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769094841; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+kIY2+d5nqykmYBPmHAWFbCHhJxDmjtvUjwEBEl1LRg=;
	b=w0SnOLTRxT0OH53Rq8wTI/+GZs5AEISLfobmHtrkNHxDziP8uyWrftxs2upQcukBeIfLCa
	pRurbmrLk4e7AWrD4ioOwpHQOLV6u8MqFlTbYumGVvBusbk0w2SHr5vSSWs3V7vM4dIudl
	wilPtl22x2bnUAh/P7x4l2iMjkJtJm+3i1BrfKMZTFk0zCoFxwyVqyzmQCHc2sNw/sAj2i
	81t3bsbPk7Mn4oPYHBNGog36mio4+t49cimwm72PQCzSSOcMKMPX17IjoYw3nlt41Rmlxc
	bAyRFzyt1v9CCb3aGnKxWnI0Z6Tol6XbCIoP6a2qvJZ4GfEF91srbLDHfMEiUg==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Thu, 22 Jan 2026 16:13:29 +0100
Subject: [PATCH v4 04/15] spi: cadence-qspi: Fix style and improve
 readability
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-schneider-6-19-rc1-qspi-v4-4-f9c21419a3e6@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27289-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,sang-engineering.com:email]
X-Rspamd-Queue-Id: 1E65A68B53
X-Rspamd-Action: no action

It took me several seconds to correctly understand this block. I
understand the goal: showing that we are in the if, or in one of the two
other cases. Improve the organization of the code to both improve
readability and fix the style.

Suggested-by: Pratyush Yadav <pratyush@kernel.org>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index cc28da7fc686..c0a507953c58 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -374,17 +374,12 @@ static irqreturn_t cqspi_irq_handler(int this_irq, void *dev)
 	/* Clear interrupt */
 	writel(irq_status, cqspi->iobase + CQSPI_REG_IRQSTATUS);
 
-	if (cqspi->use_dma_read && ddata && ddata->get_dma_status) {
-		if (ddata->get_dma_status(cqspi)) {
-			complete(&cqspi->transfer_complete);
-			return IRQ_HANDLED;
-		}
-	}
-
-	else if (!cqspi->slow_sram)
-		irq_status &= CQSPI_IRQ_MASK_RD | CQSPI_IRQ_MASK_WR;
-	else
+	if (cqspi->use_dma_read && ddata && ddata->get_dma_status)
+		irq_status = ddata->get_dma_status(cqspi);
+	else if (cqspi->slow_sram)
 		irq_status &= CQSPI_IRQ_MASK_RD_SLOW_SRAM | CQSPI_IRQ_MASK_WR;
+	else
+		irq_status &= CQSPI_IRQ_MASK_RD | CQSPI_IRQ_MASK_WR;
 
 	if (irq_status)
 		complete(&cqspi->transfer_complete);

-- 
2.51.1


