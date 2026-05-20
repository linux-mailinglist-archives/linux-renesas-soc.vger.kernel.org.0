Return-Path: <linux-renesas-soc+bounces-32882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMYoO/LzDWry4wUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 19:48:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 406F65949EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 19:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18B02320A5C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 16:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419663C8723;
	Wed, 20 May 2026 16:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1XumvJu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9E13A1E72
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 16:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295756; cv=none; b=e8ApulJERs1wzR+7PNAeFSxt5z+vVVxGJWXDH1PjcprldRlSpchdMsISCmwnVVbqtfmESumE2NBWi/Ev5koCwKeb2Tebgck9RyBm2/zXTnGYFIgU4YZVW6EKqmFxImrg73To3EcjM6LoxtMI3nZ8rF2y2iwRB4mtGif5VO8co3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295756; c=relaxed/simple;
	bh=F6+RYDULt4OCEld7JGFE9rEHRKCd9PgaJxEgaJaHdgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqEUxFFVmyTclq/eMvW63DylUJAMu19qGEmtI/nvbWS+KQLV9Kw4YvrzSaorSrMTFNTQpKE6MBKYx1YAiaETEMODEXAkW1UnL2ZmZov4sPtiMTECyvODHR1+JB23zhrjoPe50eqp21Zy9KKorYYaDmv1m6AtFX7YFK4733FdhoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1XumvJu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso28684085e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 09:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779295752; x=1779900552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Z0EKz99OQ69IIyWqmPNk9Dp2si8fNBwQRm1/KGhrU8=;
        b=V1XumvJuOp5WFPElm5X+4zLWup5CnF55cv9YJzR0SP2dZy9lopJDFmZy+edp4P/NXH
         hgaza5Zex1CAJ1ZkENzToNbA3qqxghbVRjNY2ojgv1ivKs0Sy3jB71sLMxMJc8ieRXNw
         zXfHO+YUGMk+KIPk2UJ9cVXGNG9EV97SmCJyZ3379m+X7unm32COST8ClRclUzfT+IHj
         3Cox6SDNofDBZHXLbry90rKbVac1QpA6Gwrr/NlHi1GHTQArD5EQ7cmgZl9yBtmgaRZE
         cGL0FZ24pet3Z06/XZrOJb+X7usrxaXuOvXuTAQfIVqkVP3FdDh20IVakjo/7wv8Lysx
         h3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779295752; x=1779900552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Z0EKz99OQ69IIyWqmPNk9Dp2si8fNBwQRm1/KGhrU8=;
        b=EnyAajYIdyLzzao5up+t5t8ObOv59A5+wfEogyfuWU+6NQF+gIPNrx3Moyo+23NamL
         2S7M7YhlxZrlsSCX94lNKqoqYp2af2dngh2aa3nsYZtnohjklUjw/obGok1JJ0bXdyVJ
         WL4f63mR7J1EjI7Rlr1+6npuNg9udDY1Ks+EJJaY30/fWRpF3cV1AnNWbNmuXp7zttoT
         LIO76pOlDkZ4r/q+z+5IWa+azgLAeLbhC1729Ym6SoYjgkvGDyxYiW1uWo7ASPCvv3uC
         ACrRoWTWAom7AundM+MwBhcnT/BmjM9EAVkQN6ZgUJbSl9x+mc5t41u6fwzR+30llXpo
         NSaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VsChlvpwGTwDeoN5MSmk50mYE3YeRvfKWO3VddedIuxs2Ox7u2niiqnEFRc3CaRMM1ICnHmBStwGW6jJtYH6ASw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Y/SSp9EKfCJSZSxkUHZongCnIw05/8ZoR6CTDUwYfmaeyHi3
	fczZw2f5Owig2OB7Ugd8tfN2e1LuhvKlKzjsTdobc1oaYUs8OC4Nt/a9
X-Gm-Gg: Acq92OHr6m9EzcvRrEFOaq3KfG2EdJHjODqyXpXj4/z3bLzOtsPcUdYU0mzyScZdJLd
	0GXRVGyi/pVxSuJG8Q8TwJ0Vap7AkDAMiVEplvH5KM5CqL6F8QCPyoCsT9DU8oBfQxnIELiISi4
	2u4aSGGTIH2YExmlh1bJhFsNUMWoPQf9/+7+9nbiS9SMwtlyGh/vgfaxPGxGCTX5xRPC/lL70Eo
	V8s1AaQCLs4R/6D9atgtDM0RKPb4TprCLr5ST3S1MADcOo3S6bg8y2ZC7n/+hoCPCxurOxJOdxz
	BeKQRXya0Bw+UutASrCqpsPpGa64Y0dw+CLERFGUhDZ2PNndIGmaiBQJtfdS4pFGerh7Q83ZXs6
	GNeIB8kU4sd8tTdGkMIaygKvU+J+gRV1mxtkcx/5ANPezsmfIFNfbQxIev8+xxrd2X/ZdRPkSZY
	l3VJerPTnDGBmD+KFY5exQlOAwOq9gi1sV31unqGIZKb9Er/PWAsmiwF+Rzpmgwj+lMotdlc7W2
	TRKjQa79hAaJtOHujVbIYKqs63zfpyObL6H4K5JWKj1owmEE+hlzg2l0w==
X-Received: by 2002:a05:600c:858d:b0:48f:e230:80a3 with SMTP id 5b1f17b1804b1-48fe6514c31mr301498345e9.33.1779295751631;
        Wed, 20 May 2026 09:49:11 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:dcb8:81c1:dc9e:cd68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e71dsm3110285e9.9.2026.05.20.09.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:49:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/4] dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2H(P) support
Date: Wed, 20 May 2026 17:48:20 +0100
Message-ID: <20260520164823.436992-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32882-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[kernel.org,bp.renesas.com,google.com,pengutronix.de,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email]
X-Rspamd-Queue-Id: 406F65949EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the PCIe controller found on the Renesas RZ/V2H(P) SoC.

The RZ/V2H(P) controller is similar to the RZ/G3E variant but includes
additional registers and configuration bits for PCIe lane control. It
supports multilink operation configured as either a single x4 link
or two independent x2 link controllers.

Unlike earlier SoCs supported by this driver which only feature a single
PCIe controller, the RZ/V2H(P) SoC implements two controllers. Both
instances rely on the system controller (SYSC) for configuration, but
the required registers reside at different offsets for each controller.

To correctly identify the controller instance and map the corresponding
system controller registers, update the "renesas,sysc" property to a
phandle-array. For the RZ/V2H(P) SoC, require an accompanying cell to
specify the controller instance index (0 or 1). For all earlier SoCs,
strictly restrict the property to a single phandle with zero argument
cells.

Additionally, make the "num-lanes" property mandatory for this SoC and
restrict its values according to the hardware capabilities.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Dropped using linux,pci-domain property.
- Switched property to phandle-array for renesas,sysc
  to support multiple controllers with different SYSC register sets.
- Updated commit message for clarity.

v1->v2:
- Updated commit message.
- Dropped un-necessary new line in schema.
---
 .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 34 +++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
index 90086909e921..09d78bd1a577 100644
--- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
@@ -14,7 +14,7 @@ description: |
   with PCIe Base Specification 4.0 and supports different link speeds
   depending on the SoC variant:
     - Gen2 (5 GT/s): RZ/G3S
-    - Gen3 (8 GT/s): RZ/G3E, RZ/V2N
+    - Gen3 (8 GT/s): RZ/G3E, RZ/V2H(P), RZ/V2N
 
 properties:
   compatible:
@@ -22,6 +22,7 @@ properties:
       - enum:
           - renesas,r9a08g045-pcie # RZ/G3S
           - renesas,r9a09g047-pcie # RZ/G3E
+          - renesas,r9a09g057-pcie # RZ/V2H(P)
       - items:
           - const: renesas,r9a09g056-pcie # RZ/V2N
           - const: renesas,r9a09g047-pcie
@@ -139,7 +140,13 @@ properties:
       - clkl1pm clock request state
       - power off information in L2 state
       - errors (fatal, non-fatal, correctable)
-    $ref: /schemas/types.yaml#/definitions/phandle
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle to system controller
+          - description: PCIe controller index
+            enum: [0, 1]
+        minItems: 1
 
 patternProperties:
   "^pcie@0,[0-0]$":
@@ -220,7 +227,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a09g047-pcie
+            enum:
+              - renesas,r9a09g047-pcie
+              - renesas,r9a09g057-pcie
     then:
       properties:
         interrupts:
@@ -235,6 +244,25 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-pcie
+    then:
+      properties:
+        num-lanes:
+          enum: [2, 4]
+        renesas,sysc:
+          items:
+            - minItems: 2
+      required:
+        - num-lanes
+    else:
+      properties:
+        renesas,sysc:
+          items:
+            - maxItems: 1
 
 unevaluatedProperties: false
 
-- 
2.54.0


