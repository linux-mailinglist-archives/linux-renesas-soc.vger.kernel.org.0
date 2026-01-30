Return-Path: <linux-renesas-soc+bounces-27662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAyUAmyafGmzNwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 12:47:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7DBA286
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 12:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F389430131E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 11:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D18B36D4E1;
	Fri, 30 Jan 2026 11:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWJO9uoD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4B8286416
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 11:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769773671; cv=none; b=rfFP6tZxWkr/gPPbqMy5apyA0El73JqYBmrmpA/BlJgNzm6rNGyFJ3cmGl3Kf/zrwArtwoqZdYGyj1biQA+b/veBpdHJ9KnMyWH2/U5uZhTqmeX4kUzHqDRHwmmBIWo+pvvTSo+3CQSlcycMV5BjisTS/b0lz5a7PaplOoOirTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769773671; c=relaxed/simple;
	bh=MGhvFRxe1NNo7xLt+3aHdT5eJAUyDKTnSre/6IBXckU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPKLspiVi3dwFQPpOq6W9A16aC+Vi0RineJu/d6vOVu9CXyWI7iMqMe+nsJ8XRZgt1sLYvbgJKCT/x+Lzzq0fhqr9IS9gfFVdKydtEylt+Clj7xokMGUi44IjwU4tVYLvDXU9fKkmBPDj1D9nUg9ZH2WGFWr+7mLBuiuskeEXEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWJO9uoD; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-64b7318f1b0so2740888a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 03:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769773668; x=1770378468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5uLnmPZ377+nkXuOYWLduQd55UQQkrY+wqK7qtadoE=;
        b=lWJO9uoDN5DnLnslzD4+2HEpSY1JUJkxfdZbehNBP2z55GUobnbgr8ZjvC/x4DmIpP
         xEiUjxxpkAQ6FSMtA2Dl/f+ZiT2UjO1502SGQwQpsNa5lmmALbuL1JbAEcLjugFdtaXC
         puNINTu4gF+srodacvY0K20iMLUJmXx3KuyZYu7QrbkE7IiFW9wLDzu2Bt0zV3TVwF+x
         0+0/QnkVqSOJVGphCoKARo2YNfm560T7IS1TxhsZodi1zCACm7KPIYQRQi8ibBtk+WUn
         ljVJ6bzHnetR2rhaFIsSemaOMx4/XBSOxY5r2hiIjnU85X97jGA3xdTJIdfuW76mqaDG
         3/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769773668; x=1770378468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v5uLnmPZ377+nkXuOYWLduQd55UQQkrY+wqK7qtadoE=;
        b=sktDll4J9+evLzeve31Hj3CcrruC+xjVD2W6zQ37bKzVi0MrMhRQRXTdiiMMGtOF/U
         ywKQjxGhGNVIrDwbzSxz2TYSd2LgGcJDJ499yE7ZjbpIVeOG2YHjAx7W8uwHaokWxTC0
         RNcd/sb9Qu9e2K0I5OaAb1G6BbCA+hjnTsbF1UlU2h7N4oF3LSpXl2B9wY7M1w+6kWRJ
         RBRBYmxq8q2XH8jbqgpZr4g1JAHFEd+5HxBQUooRjE5LhJTFSiWbekDkt9qMSgD2qZv1
         NsPT7riVYnvDfg6uN1vL/l/1rQlAjO6vHvXnwWpn8CmQ4qm3GVZrQNpYR12UYMlTs/5l
         ssKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUCL7zn3nhaf6ZxdMFE6kRzn6397a1moD01JIlY0YWCXnmePKS1/r54+cK5cBiWGtiNb1JPjT16hH1iVcV5IIw2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg3oF/hm3hhyJMtX6N4knbR6RbBlr7VpUW039nzZijliyljqF6
	RXL6Z4Nnp0eABz0XBs1qalARKwOd/TgZXMTeXTQZeDvn2mEqADpPZzGz
X-Gm-Gg: AZuq6aJSXHhl2JcI6I9un2j6wACwEYZyCM4+CwHv8Xpqbdv8Ghi3ASBaiQupGTUEC1v
	aHhuxdtvLKG6rcrHxRwn+Nzw1OWaADlAro0fg5qSZOGImNRllHuQZsA95XfYNmHCOVhfOgyLeij
	AWx3l76yF8zgFWKnrUDc4eaSa9/aMNt9ukDOPKnGxEryng1aEAG13hEpPsu9q+E8s9/ZaSzSZNJ
	Nw0FqQEa/kjhHR6thrn8CghU8o1AzrRoLem7PHV9ZRCuIvb86lhYdaOrmFan2+hwbpE5s7JlbWd
	ydgngUrn9A86JLXC3ZzIbD7n8D4Jr8HMGSK2VvJKMA5QyhgZ5NfgsFIDUyLJmEHo7cEXOWFl3dc
	S4NsNZtIlckyhXEkoa2uv7XiJSKGZLKoRKvAymMH+x3SmSXGe7KkgQVLxV43j6xsjiy6kIFrxCf
	K80fYNoXpjMzvf8ksA2/GI522RX2KZDzLqMyM=
X-Received: by 2002:a17:907:1c96:b0:b88:5a44:fe23 with SMTP id a640c23a62f3a-b8dff7a3461mr144840066b.39.1769773668012;
        Fri, 30 Jan 2026 03:47:48 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de3046abasm243751266b.2.2026.01.30.03.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:47:47 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH net-next v2 1/2] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC
Date: Fri, 30 Jan 2026 11:47:39 +0000
Message-ID: <20260130114744.252533-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130114744.252533-1-biju.das.jz@bp.renesas.com>
References: <20260130114744.252533-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27662-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[bp.renesas.com,foss.st.com,st.com,synopsys.com,vger.kernel.org,gmail.com,microchip.com];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: A8A7DBA286
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the Gigabit Ethernet (GBETH) IP on
Renesas RZ/G3L SoC. This SoC uses different Synopsys DesignWare MAC
version 5.30 compared to RZ/G3E.

RZ/G3L requires an extra clock compared to RZ/G3E and has pps interrupts.

Add a new compatible string "renesas,r9a08g046-gbeth" for RZ/G3L SoC and
update the schema to handle hardware differences between SoC variants.

Extend the base snps,dwmac.yaml schema to accommodate the PPS interrupts.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag
---
 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 77 ++++++++++++++++---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  3 +
 2 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index bd53ab300f50..21ac3c20bb61 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -26,6 +26,9 @@ select:
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: renesas,r9a08g046-gbeth # RZ/G3L
+          - const: snps,dwmac-5.30a
       - items:
           - enum:
               - renesas,r9a09g047-gbeth # RZ/G3E
@@ -47,13 +50,17 @@ properties:
   clocks:
     oneOf:
       - items:
-          - description: CSR clock
-          - description: AXI system clock
+          - description: CSR/Register access clock
+          - description: AXI system/Main clock
           - description: PTP clock
           - description: TX clock
           - description: RX clock
           - description: TX clock phase-shifted by 180 degrees
           - description: RX clock phase-shifted by 180 degrees
+          - description: RMII clock
+
+        minItems: 7
+
       - items:
           - description: CSR clock
           - description: AXI system clock
@@ -69,6 +76,10 @@ properties:
           - const: rx
           - const: tx-180
           - const: rx-180
+          - const: rmii
+
+        minItems: 7
+
       - items:
           - const: stmmaceth
           - const: pclk
@@ -88,6 +99,22 @@ properties:
           - const: tx-queue-1
           - const: tx-queue-2
           - const: tx-queue-3
+      - items:
+          - const: macirq
+          - const: eth_wake_irq
+          - const: eth_lpi
+          - const: rx-queue-0
+          - const: rx-queue-1
+          - const: rx-queue-2
+          - const: rx-queue-3
+          - const: tx-queue-0
+          - const: tx-queue-1
+          - const: tx-queue-2
+          - const: tx-queue-3
+          - const: ppt-pps-0
+          - const: ppt-pps-1
+          - const: ppt-pps-2
+          - const: ppt-pps-3
       - items:
           - const: macirq
           - const: eth_wake_irq
@@ -135,6 +162,27 @@ required:
 allOf:
   - $ref: snps,dwmac.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-gbeth
+    then:
+      properties:
+        clocks:
+          minItems: 8
+
+        clock-names:
+          minItems: 8
+
+        interrupts:
+          minItems: 15
+          maxItems: 15
+
+        interrupt-names:
+          minItems: 15
+          maxItems: 15
+
   - if:
       properties:
         compatible:
@@ -163,12 +211,26 @@ allOf:
       required:
         - reset-names
     else:
+      properties:
+        resets:
+          maxItems: 1
+
+        pcs-handle: false
+
+        reset-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzv2h-gbeth
+    then:
       properties:
         clocks:
-          minItems: 7
+          maxItems: 7
 
         clock-names:
-          minItems: 7
+          maxItems: 7
 
         interrupts:
           minItems: 11
@@ -178,13 +240,6 @@ allOf:
           minItems: 11
           maxItems: 11
 
-        resets:
-          maxItems: 1
-
-        pcs-handle: false
-
-        reset-names: false
-
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e..38bc34dc4f09 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -75,6 +75,7 @@ properties:
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
+        - renesas,r9a08g046-gbeth
         - renesas,r9a09g077-gbeth
         - renesas,rzn1-gmac
         - renesas,rzv2h-gbeth
@@ -142,6 +143,8 @@ properties:
           pattern: '^rx-queue-[0-7]$'
         - description: Per channel transmit completion interrupt
           pattern: '^tx-queue-[0-7]$'
+        - description: PPS interrupt
+          pattern: '^ptp-pps-[0-3]$'
 
   clocks:
     minItems: 1
-- 
2.43.0


