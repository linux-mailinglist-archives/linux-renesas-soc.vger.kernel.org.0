Return-Path: <linux-renesas-soc+bounces-30502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NOdMYnlxmnrPwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:16:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 235A034AC0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60853311DE14
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC683947A5;
	Fri, 27 Mar 2026 20:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1coECAk/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220563921ED;
	Fri, 27 Mar 2026 20:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642257; cv=none; b=h0rPJ3cVyejVbsWwnKkxYTZYaG6UjkwyD0v7b9ZMkc6wRA6sla2M5nWVLKipMT3/N8M+ouP/M4EmnsGn3mELapMEe2HEiN2MtpFf1cIE1TpwanNvn29PisPuYlx/yzUeh0Xz+RH8WrE4/hXscfqsNZidBTnip2ebv+S3viELob8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642257; c=relaxed/simple;
	bh=yEqFKL+Bru9EBWmeBMnux2IV5jrF0EdWAnEFW09Zyiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tMQJP2y3juYXc1d5JowgasGrUwPvwbgn01NKPeGh+YT7UrUmB49888M7pS/PyBE1QKe/NgBMIeeP0GGDljZeQWE4tx9kbXKxdawcaBPiYIFAqu1o2vOEBt9VnvCFBrI2GZSKLX6IORv81siHmZB4C1g0Itisuw3QCBt2SbEN2BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1coECAk/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B876F4E4282F;
	Fri, 27 Mar 2026 20:10:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EC3860268;
	Fri, 27 Mar 2026 20:10:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A53BC10451AD3;
	Fri, 27 Mar 2026 21:10:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774642253; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G0soYlY6tYSZ/jALE0v3RpWgs8GiSeAJyuFOmZIYGLE=;
	b=1coECAk/P/7FYMN/IC97+8jU4B0YZIHpCFGPOjegsulHNGGmRvDf+/6GJr+eh6aLYfOJ2z
	ZpRVgEhzJnK7uBrECyMtEraFIN4ePvoj5t2xwY3DGqojTOFsq94+i1DCygRHyZjVg1iV+W
	wECCGPdKmCizgiK9GguSpIWzpNQqPo5USURcPNsUCvIFI1HTJ93NbwvWkfIagH+BFB7LV4
	whjK8U9ATntdB/6AkhhYhDpZ3kqLf9Sr0Kl1sjJvf0yITQXa13YF9aVsGQflfW60Ps4z2D
	jL+QCFyoYneYcGOdEnC6wic1jYVCVYyRNXPE1Zhk+rJyaHQ9kpfXc5iXEZ133g==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 27 Mar 2026 21:09:31 +0100
Subject: [PATCH 09/16] clk: Use the generic OF phandle parsing in only one
 place
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-schneider-v7-0-rc1-crypto-v1-9-5e6ff7853994@bootlin.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Jayesh Choudhary <j-choudhary@ti.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Antoine Tenart <atenart@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30502-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 235A034AC0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There should be one single entry in the OF world, so that the way we
parse the DT is always the same. make sure this is the case by avoid
calling of_parse_phandle_with_args() from of_clk_get_parent_name(). This
is even more relevant as we currently fail to parse clock-ranges. As a
result, it seems to be safer to directly call of_parse_clkspec() there.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/clk/clk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 591c0780b61e..93e33ff30f3a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5375,8 +5375,7 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
 	int count;
 	struct clk *clk;
 
-	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
-					&clkspec);
+	rc = of_parse_clkspec(np, index, NULL, &clkspec);
 	if (rc)
 		return NULL;
 

-- 
2.51.1


