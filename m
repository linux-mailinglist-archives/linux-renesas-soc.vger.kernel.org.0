Return-Path: <linux-renesas-soc+bounces-30506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPApI3jmxmnrPwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:20:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA55634AD7D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CC5F304B8F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34070396B6D;
	Fri, 27 Mar 2026 20:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kQ9ynxwv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B294D3976A9;
	Fri, 27 Mar 2026 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642271; cv=none; b=GKs4NumD1WVUMehRBlzvLsYyYy07DzBEijWenvROoH5ck3C3v6/kME6IMzVJ1Ss1GFu3VIE137lLcOVvIb0eRyNBODp57Un8u3AxzEDwTc5BJZZkyRnQCjZYP6YGi3TFvewAhD8xJrHJjPZRW3gRpfVq7xln1odATrKWirncEwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642271; c=relaxed/simple;
	bh=EBmjoQkH9LPRuThWexQIZ2OYduWjXu9isH5m17TGdNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pC5LQQ+BYyYHmCiLVNUh2zcDcfRCYxhLiXawyoGIrGFTVgJWKx3fq7uuZ7EnHw0rLBNF1lYlG4H0vmgF/IsbfGA3PZi+c8SzjmM+M0AZ4VPBDte7NvcNJ137zjhAUqjdeqGBQbZVAM/HhEDlimfrOHfFKC6rQgmctLYN45AteH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kQ9ynxwv; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7E19F1A3035;
	Fri, 27 Mar 2026 20:11:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 514CA60268;
	Fri, 27 Mar 2026 20:11:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 692C310451AD3;
	Fri, 27 Mar 2026 21:11:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774642267; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SXMVxKzfCtjtPW53QziO7/qN8dgM9GH3NrWg8FXgaJk=;
	b=kQ9ynxwvi9POasUW9gtVJ5bCNrzyf1qSAK1blyZZKWqQe+wtZo6UMN8z1eJrWrAF83CI2q
	vBb+UOZI7qYYxZwh9O/a/wEEdgCcZ8b7qrrOlbAHteWzc18ZnAmgYhvHf8kuGDXT0alBwX
	4R2Q+nCHnoVaRmXLGECQRGAI2TuZSciYctbIHuv0c7smOkIYWWxq1tU6Zv5y8C2p+sZsCW
	xvFdjxCQdqa9RkoCqaZ4Gg39KQXME6tnT0w1p70pmo73MelqKvrruvAZ+/tG/YZ9rVOQbU
	fm8VMycr6NmZ4sPP8bUum5hCnfcZhIwPgzigdUouh0VYcM+Q0Otv1ReOkHYxsw==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 27 Mar 2026 21:09:35 +0100
Subject: [PATCH 13/16] hwrng: omap: Enable on Renesas RZ/N1D
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-schneider-v7-0-rc1-crypto-v1-13-5e6ff7853994@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30506-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: EA55634AD7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Kconfig symbol and associated seem to be badly named as they have
nothing OMAP specific but instead refer to Inside Secure Safexcel
devices which have been used in many SoCs from different
manufacturers (like OMAP, Marvell but also eg. Renesas).

The Renesas RZ/N1D features this IP, so add this architecture to the
dependency allow list. In practice this dependency list does not seem
very relevant and could be entirely dropped, given the fact that this IP
has been implemented by many different vendors and seems to be
architecture agnostic.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/char/hw_random/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index 492a2a61a65b..a26b705fb111 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -193,7 +193,7 @@ config HW_RANDOM_IXP4XX
 
 config HW_RANDOM_OMAP
 	tristate "OMAP Random Number Generator support"
-	depends on ARCH_OMAP16XX || ARCH_OMAP2PLUS || ARCH_MVEBU || ARCH_K3 || COMPILE_TEST
+	depends on ARCH_OMAP16XX || ARCH_OMAP2PLUS || ARCH_MVEBU || ARCH_K3 || ARCH_RZN1 || COMPILE_TEST
 	default HW_RANDOM
 	help
 	  This driver provides kernel-side support for the Random Number

-- 
2.51.1


