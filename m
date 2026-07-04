Return-Path: <linux-renesas-soc+bounces-34719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XYkgH+NsSWra1gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 22:28:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D5B7086C9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 22:28:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="UDF/MiTU";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=MbOMardN;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64A38300B18F
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 20:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2566C35F5E3;
	Sat,  4 Jul 2026 20:28:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BE93749FB;
	Sat,  4 Jul 2026 20:28:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196893; cv=none; b=M6df6gwxMOuVboH03PxW89l1gHk7iGcXoriP1emCf300gSn4C1uKbg7uaHf9j2VPrhjQz+uc/iNdVOkXo/59R5EG8ZFaUQEJ0TAUYEMHSyNYtoCdAJv+vpD/0+Bk54IDf10qvwxtQNmFfj8SBiGLbob/3JwYuq2zssdCpx02Q0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196893; c=relaxed/simple;
	bh=+OJiMFVpc6r7ZA3dCrM2sSZk86Cgl1wo0faTGNpGGVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rR5RVGzBNezmM0f3yFMNo5IlN0MjmfwhBIEJMYSkKCpjobGHfz/CXAwnPiDPa/58G1FWDrtLEEYTMMV57zQ16TxNyuW8Pr8jQjQ5vJ4dZd9JRQIT6sc5X4xLzj0A8Go141RLKIl41lTR9Ybxh+pupXe8imJdMqPdPb5LtLEBlmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UDF/MiTU; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MbOMardN; arc=none smtp.client-ip=80.241.56.161
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gt2Hl4pcQz9tg3;
	Sat,  4 Jul 2026 22:28:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783196883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZlKqmH8HGW5XmFIDCBjBNhPuo0k6uuUHtwbU5C/5rA=;
	b=UDF/MiTUS2vAH0ZNqaj8uxSaLGbw79wisCekqbkd6QQWO169GQHOCvw8N5hEHurdz+sblB
	qmsTBpbmQ46FuKggK4OFfiG2VSDfpdxL+HetH/LuMUV+IzZao8HlRHMh4YVaqDB7mwD0sf
	YK58eZMRRIS+ICgagYgWs5lzZuuNFB94iFdk4Ni2XWyBYN2CnO2CDp9XqQ2GMWTlJ+WhIh
	u6x0ExFOdyswC1mn0iPLIJbbtHePz4ve2APQW2mOfIV0kyNoS/nhs60M7sNgSRxNkzOSMM
	tFSfqw3X5tGEf114eDi3AFqB8uv9XiKCvnS72I3MSXbeONiqcPBJfA3/dvYz+g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783196881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZlKqmH8HGW5XmFIDCBjBNhPuo0k6uuUHtwbU5C/5rA=;
	b=MbOMardNKtY6VSb8fCrNiWqe1ZBrJFB5XeSgK+J1318VRnCzuxxOPSqIzXFlsP9trrAJ+s
	Q66wr2HVaA0J0AoUFurskAv1oV4NZTJKKb+KMk65G2VYMCS4u1jt4wbCKKr3B3f3mHlrLM
	YiGGfEHOpvnpj8egpH+lYOAdnO3cjVu2uNXEme1S53+MB/Fq3b5MklnQbvvpJpZ9hO07vR
	yj+7QuHUE3KxYRnF6cPbYsg03AFDZOI+iC94JF/mnrTXvVqqUm2viXWU0/Xbdm6b8Alvkr
	XtB9XqUY2dG9ReZ1AE6Wpa+4j/AaWwUPomhe4yLS9iSYPJ1ifnzd1R6Jolfw2w==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: PCI: rcar-gen4-pci-host: Add R-Car X5H PCIe4 compatible
Date: Sat,  4 Jul 2026 22:25:00 +0200
Message-ID: <20260704202748.355708-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260704202748.355708-1-marek.vasut+renesas@mailbox.org>
References: <20260704202748.355708-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: u6j3qq1ui3x7ny4o357kmeykzj1y7n8h
X-MBO-RS-ID: 071502cbd0e8955e6c7
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34719-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,renesas.com:email,vger.kernel.org:from_smtp,glider.be:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13D5B7086C9

Document bindings for R-Car X5H (R8A78000) PCIe4 host module.

The binding document is deliberately using "renesas,rcar-gen5-pcie4"
DT compatible string to discern R-Car X5H PCIe4 controller supported
by this binding, from R-Car X5H PCIe6 controller which will use a
separate binding.

The R-Car X5H PCIe4 controller does no longer include PHY register
range, the PHY is now a separate IP and referenced via the 'phy' DT
property. The 'reg' and 'reg-names' DT properties therefore differ
between R-Car Gen4 PCIe and R-Car X5H PCIe4, and the difference is
handled in the allOf section.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../bindings/pci/rcar-gen4-pci-host.yaml      | 74 +++++++++++++------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
index bb3f843c59d91..9733704331b56 100644
--- a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
@@ -10,30 +10,20 @@ title: Renesas R-Car Gen4 PCIe Host
 maintainers:
   - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 
-allOf:
-  - $ref: snps,dw-pcie.yaml#
-
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r8a779f0-pcie      # R-Car S4-8
-          - renesas,r8a779g0-pcie      # R-Car V4H
-          - renesas,r8a779h0-pcie      # R-Car V4M
-      - const: renesas,rcar-gen4-pcie  # R-Car Gen4
-
-  reg:
-    maxItems: 7
-
-  reg-names:
-    items:
-      - const: dbi
-      - const: dbi2
-      - const: atu
-      - const: dma
-      - const: app
-      - const: phy
-      - const: config
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r8a779f0-pcie      # R-Car S4-8
+              - renesas,r8a779g0-pcie      # R-Car V4H
+              - renesas,r8a779h0-pcie      # R-Car V4M
+          - const: renesas,rcar-gen4-pcie  # R-Car Gen4
+
+      - items:
+          - enum:
+              - renesas,r8a78000-pcie4     # R-Car X5H PCIe4
+          - const: renesas,rcar-gen5-pcie4 # R-Car Gen5 PCIe4
 
   interrupts:
     maxItems: 4
@@ -81,6 +71,46 @@ required:
   - resets
   - reset-names
 
+allOf:
+  - $ref: snps,dw-pcie.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rcar-gen4-pcie
+    then:
+      properties:
+        reg:
+          maxItems: 7
+
+        reg-names:
+          items:
+            - const: dbi
+            - const: dbi2
+            - const: atu
+            - const: dma
+            - const: app
+            - const: phy
+            - const: config
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rcar-gen5-pcie4
+    then:
+      properties:
+        reg:
+          maxItems: 6
+
+        reg-names:
+          items:
+            - const: dbi
+            - const: dbi2
+            - const: atu
+            - const: dma
+            - const: app
+            - const: config
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0


