Return-Path: <linux-renesas-soc+bounces-27234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O8NKMIhcWl8eQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 19:58:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 307BA5BA97
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 19:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB0F87AF7EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02854DB548;
	Wed, 21 Jan 2026 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L5om0/kD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A734D9912;
	Wed, 21 Jan 2026 17:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015141; cv=none; b=NH7DHdY64fA5X2DnwSo5MELtRoXPx7mS6SpYJxheNEc42OoUirzZOjYrwodJt1JH3i50raQNL934EcOms1hkt4N9S59MRktfMJuf4PUSlZhZcyOhX7PhfJfviORUUJeWFoCuQwMZhhu2NV8xAcpKgiBnvnxs8NpOysF49+IqyuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015141; c=relaxed/simple;
	bh=s5qeqBhzqXvBR0yVd6ehmw1JmdAeCogqylKOKRTU5a0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qw/zq6MrnbrYcIHEf2opEn65RBbQff1VGK5Jeh6TCOQ0ADU/TrIsW/fAlg4cpuRC0LURWkxLcrnQVwPeCznWVfMoraxU0ToQlO2uNga3mCexQWWa5LZyW0VYhykA6/dj+zTKmcAqPEtBc+Ci4cjdtKkZVM5KHVFYg0l+vV8BTDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L5om0/kD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 11C504E421CC;
	Wed, 21 Jan 2026 17:05:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D61C36070A;
	Wed, 21 Jan 2026 17:05:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5ABF7119B18DD;
	Wed, 21 Jan 2026 18:05:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769015136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QegLxnXsPbyMpFnnOsyJbRiNNWksSHe1X3JonRazV2o=;
	b=L5om0/kDVbhd1Yu4xbOO0TP9ULP8vxO2C7fdJX48QBoU8YOdmxkBsy71mWfMJsEcn6GsqL
	1JafuysnawmyHfVsYjsETPnCxcuYp5j0zZjxJSk+awzMrtWstLCxnQDbr67wMsmltAdOsF
	bO/rKJe97Z6vgGoP0DOZxb9aipfg+LqWdS5IMckJV+nBlr4x73oq5NP1zMkjLWyGSeqCn3
	bDy3Q2M+yAXrDFI8KciJ0IFefv9+eij3WoPYW8M5kChR/34vk+DCk1PPm9Ej0W2usEm2+I
	W51qtCmQhcNCOThat3ltU5sQzPG2PF30M8A7XHhqIFwdyMnJ9UuHLx+RaAmrig==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Wed, 21 Jan 2026 18:05:10 +0100
Subject: [PATCH v3 14/17] spi: cadence-qspi: Make sure write protection is
 disabled
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-schneider-6-19-rc1-qspi-v3-14-43e70fab4444@bootlin.com>
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
	TAGGED_FROM(0.00)[bounces-27234-lists,linux-renesas-soc=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[bootlin.com,reject];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,ti.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
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
X-Rspamd-Queue-Id: 307BA5BA97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Renesas RZ/N1 QSPI controllers embed the Cadence IP with some
modifications. For instance, they feature a write protection of the
direct mapping at the controller level, with this feature all data
writes to the AHB region are aborted.

Despite the fact that the flag setting write protection is disabled by
default, Bootloaders may (and actually do) set it, so mark this feature
as being available with a specific flag to, if applicable, make sure it
is disabled.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index e1ec20684b0a..e0e4423baed9 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -48,6 +48,7 @@ static_assert(CQSPI_MAX_CHIPSELECT <= SPI_DEVICE_CS_CNT_MAX);
 #define CQSPI_DISABLE_STIG_MODE		BIT(9)
 #define CQSPI_DISABLE_RUNTIME_PM	BIT(10)
 #define CQSPI_NO_INDIRECT_MODE		BIT(11)
+#define CQSPI_HAS_WR_PROTECT		BIT(12)
 
 /* Capabilities */
 #define CQSPI_SUPPORTS_OCTAL		BIT(0)
@@ -218,6 +219,8 @@ struct cqspi_driver_platdata {
 #define CQSPI_REG_IRQSTATUS			0x40
 #define CQSPI_REG_IRQMASK			0x44
 
+#define CQSPI_REG_WR_PROT_CTRL			0x58
+
 #define CQSPI_REG_INDIRECTRD			0x60
 #define CQSPI_REG_INDIRECTRD_START_MASK		BIT(0)
 #define CQSPI_REG_INDIRECTRD_CANCEL_MASK	BIT(1)
@@ -1641,6 +1644,10 @@ static void cqspi_controller_init(struct cqspi_st *cqspi)
 		       cqspi->iobase + CQSPI_REG_INDIRECTWRWATERMARK);
 	}
 
+	/* Disable write protection at controller level */
+	if (cqspi->ddata && cqspi->ddata->quirks & CQSPI_HAS_WR_PROTECT)
+		writel(0, cqspi->iobase + CQSPI_REG_WR_PROT_CTRL);
+
 	/* Disable direct access controller */
 	if (!cqspi->use_direct_mode) {
 		reg = readl(cqspi->iobase + CQSPI_REG_CONFIG);

-- 
2.51.1


