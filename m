Return-Path: <linux-renesas-soc+bounces-34539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ecQJJCntQmqMIgoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 00:09:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 275A26DEFC6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 00:09:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LVlNJ2sI;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D9CC3022699
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 22:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6298C3CAE95;
	Mon, 29 Jun 2026 22:09:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF16C2836A6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 22:09:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782770978; cv=none; b=B6v/R1zqL4vtHGL/3/p0f+6E1ZMxFf9ZXTMs8wCwh9mJxd4MGb/dkMszxOieY0FwVaZf5fiIAD3htvw+kzuc8R8Dzul+FLg9EDdZgYUhUQS/txATRF45/H2QZfYetQ9EHVugN0kB0fCeZhvVYGiReZVCui4ohT3H010S5wiFx/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782770978; c=relaxed/simple;
	bh=J1xatfoXArnQvu4XHqmWyqC0CCrKZwNwJs3W4riAnsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pN0qc3gGtiSHQKBKPaAn5En5O9FKWqOciLJ5w7c6b1ftOsi3nEPPbRJyE2GLFrhmG+8r/woEKdwIFXaYftOWMrOn1ckUxHf7S3iRwgOXrQ9yru8yM8FnoqYNgEtDbnqpWdA9sXibV7gF7DNXc47sjaND9WHw3gmzIvgYJW0rIuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVlNJ2sI; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-474560436c3so1000433f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 15:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782770975; x=1783375775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQ3vj1zojnGTs4zgewnFfNyAq4pm40w6260MawCoMhk=;
        b=LVlNJ2sIl9E8YY0r1wY6NkL2gF+QpFaBeULcEQhBOTjhjaWi0j+g9s+13wwyLTS0pJ
         8Wo4hJ/dRjlxvbxOE9CkdKApfvYX75yTKE+m4bHbhar1wYTN3pqQGz0swS7UYDnd5HbW
         FQQ/+S7GO3FKVNduVji53ly70EAajBdaNO6ACau9b7MW2Gh4AzK4d7+eFtnOHf2WBBQ2
         UantPrrfNjRCOy7UtzTCLXSCIfF/2VeDTzCjp/Y50MiieyPI4mpZS2T+cAU7FNKrQi0V
         1WqCX+1BW7+Qgb82O7TjzvyeDMltUa/StmiqO9pRlIioBy3UYAEn2aKv1+8rEBy3N9GO
         neYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782770975; x=1783375775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HQ3vj1zojnGTs4zgewnFfNyAq4pm40w6260MawCoMhk=;
        b=jap06qjGP1HQbORQ/IEQNAROcxfo7PrnmepkGd4I7CY05Gsgw70eMhPBhPa39JT1Ra
         9KClM0w379g0cgZze8BfFk3Rj47wknza7DSE7Mf3NutJV71Wskquuw3wvTnh7TK/j32o
         AArqhusic1K/p1i/WTKWXTYCut9z0Sr5XMQNmdzg2NwlGYxLubgx/Vfo6dy9auLcgnbe
         N7FErNIWqrTUIP/kLbG3BPGw5JdZzIxzhY5v67DJ+YDUiLw9g5YNk0G75ckFU3Yas80b
         p5ZctmQBXFo2wcbeE7KwH2EAi0UCJs9jp0jRioe+qNYi6FL41PNmxTW3ftsrGotqZogb
         z5ig==
X-Gm-Message-State: AOJu0YxEwnnBBT8w+5LR0IiavNTPVks0oCXIQ8l1LBLA63zCmauh/jX6
	GhsjqTkbLLDNxTJrxz3uMa2otP4h2I8Zx/nYtbB6VeEBAy4jrcy6IvfC
X-Gm-Gg: AfdE7cmQ5r4AXRd31y7c9gSnEczvNVJpdpF9XlrtlNAOvGNRxENozlI8tYQTIaFgPAp
	If877ezAOf3XMF88j+EJBRNlcqM+5pIkIFmxN+Tbz764Ioi3VsrcUSfySIA23mhOT+u4CYxvtUX
	Bdjh3gIKFGSpQl3OT81wnNmj3qxfSWMMPbfGo7giHrjFcPSSzBxBISYkKIg+s+QwvihFJiHPg/f
	1B102Uh/BkP8OnbC16FUgH1iEw8AOAAXGEbMVNM7PWgdLluQ0s51eJE2zUy/rKzScaKpoTtkEaU
	QQ/8rz18dGmrKr0fB2ln0ChPYTTE3ZPxQh0reV1s0ACfk8pUmkUNdUpzxEJ3/zXsCCxMvsfZs1I
	AlucWIrS5Dxxc2rIKlPzrZaqn/yb+A7nXXrVfrNhXt7ERceki4KIjYBM2PQR96ZD0XRATcfVZHp
	lEP71udKSAdSRsgEWkQ3mFd9WZRztw0Z1OZGFv49dxW8IUy5ZtNywGLo3zTzRI2KAqza2nDO18Z
	n0gSLZi7eJKhH7jlTfXSosSNGI=
X-Received: by 2002:a05:6000:4028:b0:441:1e8e:d8fd with SMTP id ffacd0b85a97d-475524a853amr1371170f8f.29.1782770975032;
        Mon, 29 Jun 2026 15:09:35 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:dfcc:acfa:dec0:e556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195b3sm1644670f8f.8.2026.06.29.15.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 15:09:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 1/4] dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2H(P) support
Date: Mon, 29 Jun 2026 23:09:29 +0100
Message-ID: <20260629220932.861445-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629220932.861445-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260629220932.861445-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34539-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:kwilczynski@kernel.org,m:lpieralisi@kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:robh@kernel.org,m:bhelgaas@google.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,bp.renesas.com,google.com,pengutronix.de,glider.be,gmail.com,vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 275A26DEFC6

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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- Added RB tags.

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


