Return-Path: <linux-renesas-soc+bounces-27226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBBPEGcScWlEcgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 18:52:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A09EF5AC7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 18:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4AD63B4F0DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C4F4D8D82;
	Wed, 21 Jan 2026 17:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OiL+xRge"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D77495518;
	Wed, 21 Jan 2026 17:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015126; cv=none; b=YOzFdLDCa5kxccBMnxWcGiXJYsWLP+eT05bhImHaiE3sjc9e5B9JonxKotRdzA/g4XFpN1+IFSo5/RLtO2xnh+yYmtAM1hhtD1LbqBNegDdERIFuT4fW3eiGl14cu6uCAehL4DDTZkaZhlgFKUpSwdDCdERs1Z28YDqBl1oFV34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015126; c=relaxed/simple;
	bh=JD9J15FD3+7Fo755XEIaI+M7RJcrkXyMm5ZCiSP5OnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SxQEWoJMa/l4NfrD41G+oil7gCwqOw4HCGGAMRuHZTPm142f8E8c1scFieKJU/dlaq14950X+gNF21MuqkA2wTagrgP4GnDWiR/oggJjLjp6mPHA1rps+K8bB87yuHY3Tdu1Ymt0VHjX7aLT/sxxwhrXqlesCVTYGp2/EeYVHxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OiL+xRge; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CAA29C21A8F;
	Wed, 21 Jan 2026 17:04:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0AF2F6070A;
	Wed, 21 Jan 2026 17:05:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94B3B119B17EB;
	Wed, 21 Jan 2026 18:05:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769015122; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+kIY2+d5nqykmYBPmHAWFbCHhJxDmjtvUjwEBEl1LRg=;
	b=OiL+xRge1aqQnB8S8GrCz9ysflX0nUlOu+Zev8BYic+nQ1YVdMZ4Jcm/12CMUr35xlq7uo
	x58fOF+P5NvTMog948BfS2h4BPy/l8T6eG5Idi10Pe1kPCJqgDY3SMtu57Ow64hHjdo+ul
	d3T7POxNpjdQByCGiVg9SGlQRbKS++0qKqTvg1bjZd8SD+cnxCaVXQA1iKA+NIDYLTSNlD
	xUQijJS7K6PKgVCrhDy8vAllkNwHYBRwUQghoJ0fr79fM7YNvKHkQyujEXFDclVPypYPb8
	fnYCVcBrvf/5IsliwiBkubLm2nd9SFm79coXwkT0qIrmEIFFBltGBlLA/pmUIQ==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Wed, 21 Jan 2026 18:05:02 +0100
Subject: [PATCH v3 06/17] spi: cadence-qspi: Fix style and improve
 readability
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-schneider-6-19-rc1-qspi-v3-6-43e70fab4444@bootlin.com>
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
	TAGGED_FROM(0.00)[bounces-27226-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: A09EF5AC7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


