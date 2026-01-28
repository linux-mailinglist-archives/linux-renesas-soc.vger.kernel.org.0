Return-Path: <linux-renesas-soc+bounces-27572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GgYBkyFemnx7AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 22:53:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91481A9464
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 22:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D69A1301A408
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 21:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF33733B6D0;
	Wed, 28 Jan 2026 21:52:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FACC2EC0A3;
	Wed, 28 Jan 2026 21:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637163; cv=none; b=l7NY+LFjs9vVEbAMiDv/Qrfpd/Qm1dihTIFVBoOIVJDHGXRaURW4oj+ElCdcwo5wEVDVbMP2B8LDvhiM7mHJ2bG9XYZQM1mOW9LcPF7TgirxvZjmiiuScd5wLMFIg/oSDqdy4IbY4nktLTz7L9O7KOp6WAZpUua0n39s9rvy6d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637163; c=relaxed/simple;
	bh=jnJMzLc1I79LAa7AGEwtS4d5b7aIHGIqVNJ48Y9+KtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hScFIB3gAHDC8recOhL7GmLATMj9Y8VNJMhlX2f+2UCUYi5jAJ1WpihKt4qHs4hqN7zAynbS6rKY4DsA3MWX/oASMIMIj5VeMR9H9NwEEUrIyY7fE2sH9jT9YNyp0yZde33hPH0IZZJ3upLR6+oA5VzBW4bfKSiv4oUQL+dEnxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: MoubSkylT86Ab4fM6LEA5A==
X-CSE-MsgGUID: 3aPy9+SDTHKooAQNk6/fNg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 29 Jan 2026 06:52:31 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D0B3540C0B84;
	Thu, 29 Jan 2026 06:52:27 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v3 1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow multiple DMAs
Date: Wed, 28 Jan 2026 23:51:30 +0200
Message-ID: <20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128215132.1353381-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260128215132.1353381-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-27572-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91481A9464
X-Rspamd-Action: no action

All supported SoCs have multiple DMA controllers that can be used with
the RSPI peripheral. The current bindings only allow a single pair of RX
and TX DMAs.

The DMA core allows specifying multiple DMAs with the same name, and it
will pick the first available one.

There is an exception in the base dt-schema rules specifically for
allowing this behavior (dtschema/schemas/dma/dma.yaml).

dma-names:
  anyOf:
    - uniqueItems: true
    - items:
        # Hack around Renesas bindings which repeat entries to support
        # multiple possible DMA providers
        enum: [rx, tx]

Allow multiple DMAs to have the same name and only restrict the possible
names of the DMA channels, not their count.

For RZ/T2H and RZ/N2H SoCs, limit the number of DMA channels to 6, as
they have 3 DMA controllers.

For RZ/V2H and RZ/V2N SoCs, limit the number of DMA channels to 10, as
they have 5 DMA controllers.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V3:
 * impose proper maxItems for each device
 * impose maxItems for dmas property

V2:
 * new patch

 .../bindings/spi/renesas,rzv2h-rspi.yaml         | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
index a588b112e11e..cf8b733b766d 100644
--- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
+++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
@@ -58,12 +58,16 @@ properties:
       - const: tresetn
 
   dmas:
-    maxItems: 2
+    minItems: 2
+    maxItems: 10
 
   dma-names:
+    minItems: 2
+    maxItems: 10
     items:
-      - const: rx
-      - const: tx
+      enum:
+        - rx
+        - tx
 
   power-domains:
     maxItems: 1
@@ -121,6 +125,12 @@ allOf:
         resets: false
         reset-names: false
 
+        dmas:
+          maxItems: 6
+
+        dma-names:
+          maxItems: 6
+
 unevaluatedProperties: false
 
 examples:
-- 
2.52.0

