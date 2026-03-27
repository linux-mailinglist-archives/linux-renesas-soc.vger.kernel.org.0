Return-Path: <linux-renesas-soc+bounces-30501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANhdKZDkxmmjPwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30501-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:12:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622934AA3A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B10FA3050918
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D124393DE2;
	Fri, 27 Mar 2026 20:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2xAXeYlc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF15392C4D;
	Fri, 27 Mar 2026 20:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642255; cv=none; b=LjzcHirB7w5KFC68pT/DZ/jzOGFIp31zwrnRGFxQlpa961QlD7GuTZA5uK1Fp/Sf9gBIZR6obJ2iBTNtvqsqyo7VbJB5sZVFBrZHKNa4cFOPbiX056JGXLWN4h8WjJlRdziZfS7oAA7m0tiQV7bY1Iuc0bmp/AU8SFWmJFBQdCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642255; c=relaxed/simple;
	bh=yOafjVFOKW6zrotbALbaw1A8cYq6BLe+Fi3zFv/LbCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hvTxFQQ3X8nJkM+KvIRHRyGot0vTsDShvLG4MnnymU4bYTyNzXMITTxz+/NYw5xZyz93zZPWOmiu4ogWNM5DMBzYtv5JNY/iMIgP0C0JXyzwFqs094QZryru/iImfS/ZVV8foQWjJFqSu0T6BRGkFwCqgWjPJ2v9EyL5VMz0+zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2xAXeYlc; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 631534E4282E;
	Fri, 27 Mar 2026 20:10:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34E5060268;
	Fri, 27 Mar 2026 20:10:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6654010451AF7;
	Fri, 27 Mar 2026 21:10:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774642250; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mBs4tOA5jzY9GXFpfbtVqcNMinyS6IW1J+L41OKuwoU=;
	b=2xAXeYlccuP9mqpArLBXM11iR8JFplbq7kh9Qa7Y7avKFCJkx6fGejA/+yA+hnFJr4YjKs
	eB2jR7VbJRbg8GkK0Ie3cKSO24FI4xqffRD7qM0gWLADje7GWpO8tr/d3qTegWH72+V5ma
	0rlA9CKMgbp3uQNgIzHDUw4tAX4ZvURznu3ztMUPV7S2Lao/4O2wjPaufFj2x5IxU7//rD
	GQtZJ+eu002u42EX2YMA/6dC+FxlTDMyWk2wW1IcdFMsHHZvCEzuaHDctKZXoysA3Dhx6s
	yuBE0NZffeYEo1LO/xVY72HPC/FvMXeUJK33kzX5sXFauttv32btQGYhMM/2Qw==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 27 Mar 2026 21:09:30 +0100
Subject: [PATCH 08/16] clk: Improve a couple of comments
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-schneider-v7-0-rc1-crypto-v1-8-5e6ff7853994@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30501-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2622934AA3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Avoid mentioning the function names directly in the comments, it makes
them easily out of sync with the rest of the code. Use a more generic
wording.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/clk/clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 1795246b10a0..591c0780b61e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5213,7 +5213,7 @@ static int of_parse_clkspec(const struct device_node *np, int index,
 		/*
 		 * For named clocks, first look up the name in the
 		 * "clock-names" property.  If it cannot be found, then index
-		 * will be an error code and of_parse_phandle_with_args() will
+		 * will be an error code and the OF phandle parser will
 		 * return -EINVAL.
 		 */
 		if (name)
@@ -5286,7 +5286,7 @@ of_clk_get_hw_from_clkspec(struct of_phandle_args *clkspec)
  *
  * This function looks up a struct clk from the registered list of clock
  * providers, an input is a clock specifier data structure as returned
- * from the of_parse_phandle_with_args() function call.
+ * from the OF phandle parser.
  */
 struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
 {

-- 
2.51.1


