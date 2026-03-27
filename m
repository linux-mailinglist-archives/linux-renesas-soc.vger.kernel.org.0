Return-Path: <linux-renesas-soc+bounces-30498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMFEOPfkxmmjPwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:13:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6472D34AAF0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28AE9301ABA2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D06F39183B;
	Fri, 27 Mar 2026 20:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aHGM3meg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7A23921E4;
	Fri, 27 Mar 2026 20:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642246; cv=none; b=Quycow+2yWmeXYI//WUq44ctexYIubDHpEmoxAW81O8iJMYZJvUXcVQXyJGBvEU+UjBeJ6zwm3FLZl4z+s/M7Jf8uQm0uGSLKZcn2kqNWww7w26sYHzb3zUxxvPa8FTJoO/AQxFdPbgCDLbv9B+cxxo0egXeqSv+XEOSvS73v3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642246; c=relaxed/simple;
	bh=PKrOSUYH0iJI9iHWHiN/7WH/2D8sWmOZLuUr5mUsIuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bVa9GrJDCOkkbXhBYyNcHUgB7QnQuRFRbJlIBDD4fETFcV2oGzp2dPv59A0bAvkUHHh1TThVkWJOwP0Z/LDIbZR06FtcEFZbtcpknxfWBHdNwmBH4NsnhGCmaQOjCLO5wwgz95nuypCM+nckPdPOfaOjU4eWv9e5Gn6eF1sIjew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aHGM3meg; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 93D7B1A302F;
	Fri, 27 Mar 2026 20:10:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62CE260268;
	Fri, 27 Mar 2026 20:10:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DC9F10451AD3;
	Fri, 27 Mar 2026 21:10:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774642239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ddul0e9GZFCUS58sTFnpBUCJG4K93ySFv+lJJXOGGaw=;
	b=aHGM3megSlFnSCTO/n0CbVEayHxGnRqfvs837i9jzWvBCdRvVztVvy6L03HgwgunsqaM07
	/vv3Gfw9ozzmvOoR3GzYU/Mncapea7/fHy5MrEAR+A2AQxir+NKU7bq83SyrdR69tXupSB
	z0mU1WaG18HgPO6HtsZNLloQJkHu40lLu8uD/diO0O8YeuxQBD9jufzfsAgB1FeYIuiLG8
	v8E11pOPU9gCCfdZ0deuQH4LN23Hy+zf7sZF5EgwLOB0plnX5+qRLIYXX+IHhBSA7Rt4MT
	kALEkfbO5wbrhnlfVA4wlot0iDJmI4ibmt1k7Gjz2+6sagtVfkXqH6iRrTLOfQ==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 27 Mar 2026 21:09:27 +0100
Subject: [PATCH 05/16] dt-bindings: bus: eip150: Describe the EIP-150
 container node
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-schneider-v7-0-rc1-crypto-v1-5-5e6ff7853994@bootlin.com>
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
	TAGGED_FROM(0.00)[bounces-30498-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 6472D34AAF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Part of Inside-Secure's SafeXcel family, the EIP-150 is some kind of
container node composed of:
- a public key accelerator,
- random number generator,
- an interrupt controller.

It also acts as proxy for the clocks.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 .../bus/inside-secure,safexcel-eip150.yaml         | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/inside-secure,safexcel-eip150.yaml b/Documentation/devicetree/bindings/bus/inside-secure,safexcel-eip150.yaml
new file mode 100644
index 000000000000..1b3d83a852f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/inside-secure,safexcel-eip150.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/inside-secure,safexcel-eip150.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Inside-Secure SafeXcel EIP-150 container
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+description:
+  The EIP-150 is a hardware container, it has its own interrupt
+  controller inside to which a random number generator and a public key
+  accelerator are wired.
+
+allOf:
+  - $ref: simple-pm-bus.yaml#
+  - $ref: /schemas/clock/clock-nexus-node.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: inside-secure,safexcel-eip150
+      - {} # simple-pm-bus, but not listed here to avoid false select
+
+  clocks:
+    minItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/interrupt-controller/inside-secure,safexcel-eip201.yaml#
+
+  "^rng@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/rng/inside-secure,safexcel-eip76.yaml#
+
+  "^crypto@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/crypto/inside-secure,safexcel-eip28.yaml#
+
+required:
+  - compatible
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+unevaluatedProperties: false

-- 
2.51.1


