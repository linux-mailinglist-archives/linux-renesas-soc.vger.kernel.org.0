Return-Path: <linux-renesas-soc+bounces-27297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INE5IJRDcmnpfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:34:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF1D68F7C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D23C306A006
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 15:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A766138947C;
	Thu, 22 Jan 2026 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lXh3iqFC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C261389443
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094863; cv=none; b=Mr3nrciBgJlp5tx+SMHDrmv5uP91qEepzKSQpCaFDdR5wKOS+p8wEm5YuIXkGIA614hpuMqyqhu18c8RiDNm5frgschUuHkaBOE83xvcSEiiPPlZs5C8YBpoBWtGp2lx7KMe2jj5kw8/RG5uQtQTER/6UZPdkkV3X/rJdfHlQQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094863; c=relaxed/simple;
	bh=s5qeqBhzqXvBR0yVd6ehmw1JmdAeCogqylKOKRTU5a0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X7BwZKea2UDYE7Kv6JfW+7HfnYvJRmUtRnHxd2pqe9D8mxwO+FUTh42j76G5TEZqZkjx2dgkSBmtvVVhJVR+BuefaY5bQCzCdvMoUqf48b5HUtf+56hgDVdromfXOyW/SUbTz/ufgR+cn+ZS0Ufn39NhFIp+Qz+O+/nxJ+pOiEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lXh3iqFC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 977C94E421F3;
	Thu, 22 Jan 2026 15:14:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E78A606B6;
	Thu, 22 Jan 2026 15:14:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DA42119B82C1;
	Thu, 22 Jan 2026 16:14:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769094858; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QegLxnXsPbyMpFnnOsyJbRiNNWksSHe1X3JonRazV2o=;
	b=lXh3iqFCuehpD4zHg1NoHByMIiq86jeu/zSpMQiQj1x1Eg0BcuSJ4UVTDaNGecT0eV4ZVm
	bW16OjHQUHhBKWtJbfGtd4elyUjHK3hxK9n9XMjqV+S2TLIzV2ozJXANcSo3lIv7joE0WD
	XKKAa7i4MV4b7djmKB7pOywNiGiS0b6l9w7ByZTx1+W7dpX0Ie99jm71D1Mq5H23WI1lNZ
	hfA7S1JqgBazM7rvd71SDgmy22puFptRch6Aw3bope0zLbukgP4+eIO2qgZv/vDmgYBPxz
	vMtplKsW0n5AxNygyMRKgj/rN121bJxvqwSCRTjwMDJIC6AQs0pJwv12+u/e5A==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Thu, 22 Jan 2026 16:13:37 +0100
Subject: [PATCH v4 12/15] spi: cadence-qspi: Make sure write protection is
 disabled
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-schneider-6-19-rc1-qspi-v4-12-f9c21419a3e6@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	TAGGED_FROM(0.00)[bounces-27297-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,ti.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[212.83.139.233:received,185.246.85.4:received,212.83.136.155:received];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:email,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: DBF1D68F7C
X-Rspamd-Action: no action

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


