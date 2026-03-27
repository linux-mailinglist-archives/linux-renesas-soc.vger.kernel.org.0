Return-Path: <linux-renesas-soc+bounces-30494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LEiD0DkxmmjPwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:10:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A648934A9A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB92330457F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8334A390223;
	Fri, 27 Mar 2026 20:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="s8LU75QG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EF0390234
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642228; cv=none; b=sEmuYgSlG0v7ZXoaSHRqhSDp9MMWG0nV6ZXxOPGGiaiJxHcyO/hMU6o1CaLD2TvY99e9Nmt5MggQg8KkQDyI1uMfZoW+jbO6oI4H78g/o20gR/Kf2WYb1U9rbD0i7XHx7kR53MxSp+0LatriPUzeWwDWyqf7zIaTgKxLVygHDcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642228; c=relaxed/simple;
	bh=53ISBKabvLXIGpST9KmWh9Un7jYPoZOrSqGNFBlPPog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=raPvwwwDKmHjod9YFMo4qL0JmFllemhi4Hh3rgeLYUvpocibixaJXfLpXgWyLGKwenoyhuXW+EQ3B1mWNXBeZLP4Ue/A9BEfvx0X5sNU+JZfGYk0Q/3YrGOVsHgiZ7SXBopvzWEAmn8waHVkbIDpjno4oxZo+iUTGJdyKVM772k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=s8LU75QG; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6BCEEC58750;
	Fri, 27 Mar 2026 20:10:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FC7D60268;
	Fri, 27 Mar 2026 20:10:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1B5310451AD3;
	Fri, 27 Mar 2026 21:10:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774642223; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lE3QKXVXrOESVFGZ+EtmwjmJziMWMpwyr3ofoukXeI4=;
	b=s8LU75QGO5PxR0VmI003T4y+A+OZdpHPLs8YNMTPr1r0366jG4m8cvSZaol9G77Dav1vIt
	EeX6Sz5X5P59OZk7XXsQz8lWrnWBNkw+syOb3nRghVMJhWLWAf42gUAp6wCpU5jZRuUjKk
	0+7T7lRjEMagnD1gccSqfuyZ5vMpzo2nK8zs9LEAQP63NKAm7wdcwAAGcJNwXLe3TVR0Z8
	PW98+Pzbu2psIZgoBEZLT0+FFfB9WDEIJ0UBa58emzZ+bIkMrdHF1IO+LVggV2QkbpF5wg
	YmN8uAnuNdjUqTfPdDfBebnxF2mf+tVrYiXOlBN6W55Z41bj7rkTqZJeMYzaGA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 27 Mar 2026 21:09:23 +0100
Subject: [PATCH 01/16] dt-bindings: clock: Introduce nexus nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-schneider-v7-0-rc1-crypto-v1-1-5e6ff7853994@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30494-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: A648934A9A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hardware containers can just decouple external resources like clock
without any more control. Nexus nodes already exist for PWM and GPIOs,
add a binding to allow them for clocks as well.

No examples are given, the file is litteraly a copy-paste from Hervé
Codina's work on PWM Nexus nodes, hence we just point to the examples
there which already illustrate very clearly the concept of the various
properties.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 .../bindings/clock/clock-nexus-node.yaml           | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
new file mode 100644
index 000000000000..f07e2972e8aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/clock-nexus-node.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Clock Nexus
+
+description: >
+  A nexus node allows to remap a phandle list in a consumer node through a
+  container or a connector node in a generic way. With this remapping,
+  the consumer node needs to know only about the nexus node. Resources
+  behind the nexus node are decoupled by the nexus node itself.
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+select: true
+
+properties:
+  '#clock-cells': true
+
+  clock-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+
+  clock-map-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  clock-map-pass-thru:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+dependentRequired:
+  clock-map: ['#clock-cells']
+  clock-map-mask: [ clock-map ]
+  clock-map-pass-thru: [ clock-map ]
+
+additionalProperties: true
+
+# See the original pwm-nexus-node.yaml description for examples

-- 
2.51.1


