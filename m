Return-Path: <linux-renesas-soc+bounces-27235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFemDLoocWniewAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 20:27:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC4D5C24B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 20:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 41B1B803FA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD364DB56B;
	Wed, 21 Jan 2026 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cHlIbbiV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A264DA55E;
	Wed, 21 Jan 2026 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015143; cv=none; b=p0hkk0MQyylbfFz5eprptNIUiuPoBGHExcH8FqUSgexUa7tuaxLjzqphctgl1iA2OI67CvCPzWudnrq4ZuHJ/vSw6LJKQJhsMQ/Zd1TkT+5shG6186CNIFc/wVfMslZlUalVd/e3VHnbyJ7i/wSDejrDEf5ypfl1vsFh4o2z0Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015143; c=relaxed/simple;
	bh=VMbYoKu+7IgsIV37YiNQ2Hu+o2Jq4vUZtELmNqTnQ3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bbj8hhMT2Q1cy/ghnxZlcldZ3XllxIlsnCjD5GCC+mfoln5MnMzb8ub26xOTmkEnPQnnTrt4r2ncxaVNZSFzEiVHzI1EO1VYaJXcodRuoD9nvKZfeYCLkxcMabk5J4Q9BxQBh/Pee6TMhTVdtqxRhLjjuCuko5X4k287frLU/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cHlIbbiV; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 52BAAC21A90;
	Wed, 21 Jan 2026 17:05:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87FEB6070A;
	Wed, 21 Jan 2026 17:05:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BD50119B1746;
	Wed, 21 Jan 2026 18:05:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769015138; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nPmyVELRcoYpEy2eRks8PaTVcSMPd+ySGhdTlPunCeo=;
	b=cHlIbbiVxnRpmG+nNuwdVsuEao/WFC3F/1omhX+XpVFFTTlOGyjKJfK2BoWCQy09hKMaPA
	kM/UVQPKu7q2OxvJPKIzTATGPfUEMNBfx/FSh64js3uMUkilJU/Mw0Hti3bGt7bxJu9r91
	HB2SKB5iETigvi47piSrkvyeF3Cr29MGzH3W8c/cW5vRsnxOEyeYuALWkbXJxs8bS00vTx
	U3voNNKpwY9C+mnS4XcI3WPF9JOdXYjjIKzouZmHNi78ncPnFhE8ZV2+ilxUKOYzJ6uuuE
	kyH4SKShSKPGVAgu0KrMqp2paH3Z+7MGiLFUiZAWVsBafyNozJV+vJoyyVkEDA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Wed, 21 Jan 2026 18:05:11 +0100
Subject: [PATCH v3 15/17] spi: cadence-qspi: Use a default value for
 cdns,fifo-width
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-schneider-6-19-rc1-qspi-v3-15-43e70fab4444@bootlin.com>
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
	TAGGED_FROM(0.00)[bounces-27235-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: CBC4D5C24B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Bindings expect 4 to be the default value for cdns,fifo-width. Said
otherwise, if the property (which is not mandatory) is not provided, the
OS, in order to comply with the bindings, should not error out and take
4 as default value.

Comply with the bindings. This would have slighlty simplyfied my testing
if it had been implemented correctly in the first place, but in practice
it should have no impact on the existing boards using this controller, as
they all set cdns,fifo-width to 4 explicitly in their upstream DTS.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index e0e4423baed9..5f3a914e45f7 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1596,10 +1596,8 @@ static int cqspi_of_get_pdata(struct cqspi_st *cqspi)
 		cqspi->fifo_depth = 0;
 	}
 
-	if (of_property_read_u32(np, "cdns,fifo-width", &cqspi->fifo_width)) {
-		dev_err(dev, "couldn't determine fifo-width\n");
-		return -ENXIO;
-	}
+	if (of_property_read_u32(np, "cdns,fifo-width", &cqspi->fifo_width))
+		cqspi->fifo_width = 4;
 
 	if (of_property_read_u32(np, "cdns,trigger-address",
 				 &cqspi->trigger_address)) {

-- 
2.51.1


