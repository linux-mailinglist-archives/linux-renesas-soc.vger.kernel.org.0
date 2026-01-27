Return-Path: <linux-renesas-soc+bounces-27492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN5qIsodeWkQvgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 21:19:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF55F9A506
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 21:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DB3A304303C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 20:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB75236C0D0;
	Tue, 27 Jan 2026 20:18:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A8436EAA5;
	Tue, 27 Jan 2026 20:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769545094; cv=none; b=kPtfnDGZC+sCsJNTyda+OZkBzzVFdoK0B/rvOUZP+teiNr8bCgNjSj2O+gRW4gVU6xZzWIajOzCf5afxB8YQCvmcAV5gHUkMThSWeCkPvHZ054xVJKhD+bc9QEz9Pf9BYHV/+TT37A3rPKrS6s69dGxIm6lWbQ/TH8/wpvZr3eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769545094; c=relaxed/simple;
	bh=9bzRqNgGoRSfRoR8GFXGmzZC7gQcS2HubfedC6x4rLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ooUcJFnW4GRxCIh4Q+Qr2HWtxYAEkl6hxz/p3IpdK+1FJC6P9Gd9lbvfngA0UKDc271svUPQ6MIFh7S+dGTOA/AmoxePWy0kxQiD32luoN5qNa8VmAuD8J9V8iNv8AJAj2+cO7N76kuZg/DR3Ds3C3QeGTHNty08kpRs6ADItlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: O1w3u154SbmRHOUqNqnBlA==
X-CSE-MsgGUID: p+H2HziGSa2e9oWqWHvw/A==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Jan 2026 05:18:07 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.69])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AC65F4087502;
	Wed, 28 Jan 2026 05:18:03 +0900 (JST)
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
Subject: [PATCH v2 1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow multiple DMAs
Date: Tue, 27 Jan 2026 22:17:04 +0200
Message-ID: <20260127201706.616374-2-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127201706.616374-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260127201706.616374-1-cosmin-gabriel.tanislav.xa@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-27492-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: CF55F9A506
X-Rspamd-Action: no action

The Renesas RZ/T2H and RZ/N2H SoCs have multiple DMA controllers that
can be used with the RSPI peripheral. The current bindings only allow a
single pair of RX and TX DMAs.

Allow multiple DMAs by only restricting the possible names of the DMA
channels.

All '.*-names$' properties must conform to the string-array.yaml
meta-schema, which requires both minItems and maxItems properties to be
present before the items can be a schema. Otherwise, the items need to
be an array.

Declare a generous maxItems of 32, which should be enough for 16 DMA
controllers, so that we don't have to update this value ever again, even
if currently the maximum number of DMA controllers on a Renesas SoC is
5.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * new patch

 .../devicetree/bindings/spi/renesas,rzv2h-rspi.yaml    | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
index a588b112e11e..383e97f0dabd 100644
--- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
+++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
@@ -57,13 +57,15 @@ properties:
       - const: presetn
       - const: tresetn
 
-  dmas:
-    maxItems: 2
+  dmas: true
 
   dma-names:
+    minItems: 2
+    maxItems: 32
     items:
-      - const: rx
-      - const: tx
+      enum:
+        - rx
+        - tx
 
   power-domains:
     maxItems: 1
-- 
2.52.0

