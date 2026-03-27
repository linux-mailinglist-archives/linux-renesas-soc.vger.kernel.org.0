Return-Path: <linux-renesas-soc+bounces-30496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IUHF6HkxmmjPwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:12:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1E934AA48
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17732307A31D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B453638F920;
	Fri, 27 Mar 2026 20:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2wx9k1HP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697B838F629;
	Fri, 27 Mar 2026 20:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642235; cv=none; b=NmwUktLP/fS4cZm2JIPNr/FOT70ghdfRctc1LE3eFgcGC4k1ArWIFy8Dd+9OgVhSCbvgwTxk2Id5FU7I1hb5sxwB54EpAGU7EJOQR7kF8B5PoANiGCyqL7vJH1QzNkn3LJ7/2Lo+xRabEVoe3Oct1aBn5bdOTRcfOcLRqBB1sjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642235; c=relaxed/simple;
	bh=9ykDc/2Fq36YhPKpD+AdlHrqOq429F/13Ov/J4ZvzEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=emZT8xPhdjOTRU7QCOIoi7/ygC9buQBwBBs6xunKquEqtitgK8BMG+I3Nhmyypmuw+bX4RrlMKHAoNeEcVhOmNXUYCubsiRPhc0ZfcAR3+RTtxG4a3l5xTrexUyUMkupBJMSSdx/LwlZYg27L2vvrp25ekYsZ3UBAw6/ldR2jcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2wx9k1HP; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2F9BB4E4282D;
	Fri, 27 Mar 2026 20:10:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0329560268;
	Fri, 27 Mar 2026 20:10:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B5F610451AFC;
	Fri, 27 Mar 2026 21:10:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774642231; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1tXPZKU8vqlwEKf00N91HyfiiBe7zrASx6NrddJCNWU=;
	b=2wx9k1HPWTWiiTykAU/2pYkKRUmmjGgfNBxfNkKucGh41A7LmOBZturbtbJBYVE0u19PLy
	sDACs9I5qI8Z0frjFkmIO2NM8PmL31ejZs0bJECae7VqqTMPFjZwub8dv60LEIJILsiLj7
	xTysrOBPjyd/z4/ZaT823Iexz7alqOJhWO8XiD+7ffC4BvOeAGMBOmVXwoOxnfeMUWo0Jv
	KguyOUOK2LMecARezi5OtQibRtnbaL4d232zBwxEL/9EaEy08BLfHAWl7+o7Ab+H1pPCML
	ioU6Z9lCVVmJlk0X3rK+qT73VWXFewgekSNx9ihSVeCiES9FCxSmjAmxV7LxQw==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 27 Mar 2026 21:09:25 +0100
Subject: [PATCH 03/16] dt-bindings: rng: Rename the title of the EIP-76
 file
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-schneider-v7-0-rc1-crypto-v1-3-5e6ff7853994@bootlin.com>
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
	TAGGED_FROM(0.00)[bounces-30496-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,ti.com:email]
X-Rspamd-Queue-Id: BA1E934AA48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Be a little more precise in the title by giving the family name and the
own name of the hardware block. Despite the original compatibles, this
file describes a SafeXcel EIP-76 hardware random number generator.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml b/Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml
index f501fc7691c6..92d906998211 100644
--- a/Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml
+++ b/Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/rng/inside-secure,safexcel-eip76.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Inside-Secure HWRNG Module
+title: Inside-Secure SafeXcel EIP-76 HWRNG Module
 
 maintainers:
   - Jayesh Choudhary <j-choudhary@ti.com>

-- 
2.51.1


