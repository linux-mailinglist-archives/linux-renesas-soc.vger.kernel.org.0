Return-Path: <linux-renesas-soc+bounces-32769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFqaD9M4C2qWEwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 18:05:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5655570924
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 18:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7316C302F432
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 15:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86514477E53;
	Mon, 18 May 2026 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5De4wUy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D135E46AF3F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119631; cv=none; b=YTSTijVcNm0GBYXZEwKDTf4ecEqh52xbECwEhoFC/3a0wbHIycYVIQu9gkaTBy3bU81SIQhkDmuU1zGP42NMnhaaKazzUZBIeOOMyUCJrztOa66L4jXlw2MYyt9O4zi0hL3O1Of/uw65Q6ZxH6owZL03gDY15+euM0lF+CsqtGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119631; c=relaxed/simple;
	bh=Xm5Boyim7sdrxeyIokp6SD1lIy0FcgEcbXWyXpnbQr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMoXq9A88OUP10xdgYYHq733OLhy0OG5BJLWbCj0S9lo3znlAdhdT9gae1bXNLc/uw122RB3+W192Ys3vW9uAv/9dWwRkHDlqgiowcyj/tWPVe9wGlZeE6T0GZD9R2NAFu1bImD4OSRdHODIUhqO8lk0a6HFFWb/sqPXqchNfC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5De4wUy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so14379045e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779119613; x=1779724413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9onwht8Dq0fj2+O1hssa5nW2YVplvEKVA+74iuHZx0=;
        b=Y5De4wUyA5LUPNRVvDh7Jn+C8v6vLl7DsQ4xI4HYu/3HhOyzpyQv89uE09ykyyk2xW
         L9Pl0cbNJsZ3878uAzlSeQFPPNdjG6xTGyFrTclO5COMWzfjKgZjmz4d9T1xlzFAu6Qo
         gvOTcg55h1ZGCLlP6P25vzFfhClnQAVfELkWKCyAi0s0tF3OYxGNUE9UukCmW1rWgf21
         0wXzvQ+yIrp3YrGtbEtigR12kkPa729Yts2fP95hmTZVF2qFX2GyWQR+QcmW0KRaGFtU
         0nWfGhW5knNjcSBCLHrGci206zhZq86hM9YBp6MTDR6yo5zp06++fYvaadjKVEaBZVNw
         k/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779119613; x=1779724413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P9onwht8Dq0fj2+O1hssa5nW2YVplvEKVA+74iuHZx0=;
        b=TfiinTa1ZDF7cEPmB9Yg/F0ZIeABVQR0MR5CPLYSD7ca29M5WXItwdobW+d+wHtcWu
         79YOQVTINSBmMtQEysqkjP7c7DZg356Ffw4eSrcIOTIBUmyDq3+ptE63dZ4qkZUHQ8JO
         LmWGen6dCeCPSDWUTht1EbJyxGcGuZ1CYJoVa0K0mGCfISlTkiUJ8I451/rwXzKT6PnL
         aSqG8L12uP4PAlkRtOIQ7yN5sYXRj4jFbga0BocsG8C4lbu1KGNPbbcWi1HAhgZb3jz/
         SFEplwb9XwyROEICzoy43ny7GZOcROedFCuq5CaC699ro5U7HXGu/PRbfBT6Q6KS/115
         Iejg==
X-Forwarded-Encrypted: i=1; AFNElJ+FhXfFmn22reIT2SWeNM2ikpv46wy5YvfwcVQTpKCKmNDQ0VTxEtHUgJjxJ9ejhy6f6GZAdi4GHN5ayIfy5NMNyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN/mm5+zprHG0EnnfswUNqrxTq9FLuwT+Gh8ITAoXYgEKup/h7
	mkNrKPb0ZbiYPZAKj4EnmWIdqIWiUx9R5ut2Yd6pDg2pg33wERO+WW4Z
X-Gm-Gg: Acq92OFu5xEmKmRbkoFQ1bYgGyK4Q9s2qCyUSZ6SAU2g7tVicixLyEZHjCVGEa649CB
	jloJlDo/kJ3/1PQv0bDUcC0iOdsvQr4EjCwaQA5sDBmt3/8g0r6j6a3x01QroTc+R8GUEzf4yVY
	mEv+4GxykxCVPUxaCUvthivrWJxxwSBvpEVNZIcwzdwX12coXg8z8JoRVj7omcGC+XRqKFoAVZw
	rVU7V0I5ZYhLGX3pfci8w3C0CDzzNBOrg2KCh028zWUU8+CcxZO4oBkdd9KU/m8LJdUQdJawnXq
	DQsS+aznqCh3+9Lp6KUQrq+CPWmYh4KGpi25CqUbZpqip6opIgvon6pGQCpDgYQRS2GxCIaNcpY
	msn6/NRFstGbcDj236Ew68BJ6re1xuRwHMZHmfcLIO9PF58a5vRm4bjsO5rVnUQEM829BpxQT0N
	Db87X3HTs/+OUJf4H4BeRez4kPBg67bsC/Gi3xYIqecuhn/7NAIfjobho6KZmUvsYO/fbcN3FeP
	ex4wcVoQXii2rXVFrLTicmR4KbVwYES7UPXGA==
X-Received: by 2002:a05:600c:3e1b:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-48fe60eccc3mr235450415e9.13.1779119613010;
        Mon, 18 May 2026 08:53:33 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2409:d26f:6d8b:b2cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm450054575e9.1.2026.05.18.08.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:53:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
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
Subject: [PATCH v2 1/4] dt-bindings: PCI: renesas,r9a08g045-pcie: Add RZ/V2H(P) support
Date: Mon, 18 May 2026 16:53:21 +0100
Message-ID: <20260518155324.168948-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32769-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,bp.renesas.com,pengutronix.de,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B5655570924
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
controllers rely on the system controller (`sysc`) for configuration,
but the required registers reside at different offsets for each instance.
To correctly identify the controller instance and map the corresponding
system controller registers, make the "linux,pci-domain" and "num-lanes"
properties mandatory for this SoC and restrict their values according to
the hardware capabilities.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Updated commit message.
- Dropped un-necessary new line in schema.
---
 .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
index 90086909e921..149a2973b16e 100644
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
@@ -220,7 +221,9 @@ allOf:
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
@@ -235,6 +238,20 @@ allOf:
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
+        linux,pci-domain:
+          enum: [0, 1]
+        num-lanes:
+          enum: [2, 4]
+      required:
+        - linux,pci-domain
+        - num-lanes
 
 unevaluatedProperties: false
 
-- 
2.54.0


