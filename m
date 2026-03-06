Return-Path: <linux-renesas-soc+bounces-28965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD+AGOPmqmkTYAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:38:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F345A222D2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDCA73054177
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 14:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F5F36922B;
	Fri,  6 Mar 2026 14:35:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8222233FE33;
	Fri,  6 Mar 2026 14:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807723; cv=none; b=gzH7XaD+pME08kxyNW+KlD6iSKMz8TrjfVs2c5+X21eQmDb3DrgHuUxTdpaa59qy80J98DIv7CPjhJuq0UnkbdFih5JVnC3pDRTm4TN8h0AJ0gqluh8glzPD5SExfLSw/Qcxid2GOX8A7objrgWjbd8+ztFCJJkOhh4I1jnzrc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807723; c=relaxed/simple;
	bh=6pkDPk+rXfHKKCesFWrj1i3R/Yarw8SBmzdwLtVU0oY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3YZQxF9tyNWZO0rTaKjImYQfygsorcG0ilbTds64twybPq6tMsW3tNMax+xn1Dm4YE1q5Jw5LW1r1pYWNcNhw/WnquXiI/mEfQYcJdQpSbWGLIq3b8ajZ/BH9r1ABvDPDwMxAie76U/tIB/laSEhNuODXWBxUc6m+VKwOlJAxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: H9I9cGGSS36QFAyxTbDqAA==
X-CSE-MsgGUID: 158KGTosSa6uEMXozEh73g==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Mar 2026 23:35:20 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.98])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id CF35D4008546;
	Fri,  6 Mar 2026 23:35:14 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org
Cc: robh@kernel.org,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v8 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document RZ/G3E SoC
Date: Fri,  6 Mar 2026 15:34:13 +0100
Message-ID: <20260306143423.19562-7-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
References: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F345A222D2F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28965-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Extend the existing device tree bindings for Renesas RZ/G3S PCIe
controller to include support for the RZ/G3E (renesas,r9a09g047e57-pcie)
PCIe controller. The RZ/G3E PCIe controller is similar to RZ/G3S but has
some key differences:

 - Uses a different device ID
 - Supports PCIe Gen3 (8.0 GT/s) link speeds
 - Uses a different clock naming (clkpmu vs clkl1pm)
 - Has a different set of interrupts, interrupt ordering, and reset
   signals

Add device tree bindings for renesas,r9a09g047e57-pcie compatible IPs.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v8: Addressed "75 chars limit" chackpatch warning in commit description
v7: No changes
v6: Collected Rb tag from Claudiu
v5: Collected Rb tag from Rob
v4: Fixed clock name constraint using enum

v3:
 - Moved interrupt/clock description in distinct PATCH
 - Fixed clock name constraints
 - Updated clock descriptions

v2: Reuse G3S names


 .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 73 +++++++++++++++++--
 1 file changed, 67 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
index d1eb92995e2c..a67108c48feb 100644
--- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
@@ -10,17 +10,21 @@ maintainers:
   - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
 
 description:
-  Renesas RZ/G3S PCIe host controller complies with PCIe Base Specification
-  4.0 and supports up to 5 GT/s (Gen2).
+  Renesas RZ/G3{E,S} PCIe host controllers comply with PCIe
+  Base Specification 4.0 and support up to 5 GT/s (Gen2) for RZ/G3S and
+  up to 8 GT/s (Gen3) for RZ/G3E.
 
 properties:
   compatible:
-    const: renesas,r9a08g045-pcie # RZ/G3S
+    enum:
+      - renesas,r9a08g045-pcie # RZ/G3S
+      - renesas,r9a09g047-pcie # RZ/G3E
 
   reg:
     maxItems: 1
 
   interrupts:
+    minItems: 16
     items:
       - description: System error interrupt
       - description: System error on correctable error interrupt
@@ -38,8 +42,16 @@ properties:
       - description: PCIe event interrupt
       - description: Message interrupt
       - description: All interrupts
+      - description: Link equalization request interrupt
+      - description: Turn off event interrupt
+      - description: PMU power off interrupt
+      - description: D3 event function 0 interrupt
+      - description: D3 event function 1 interrupt
+      - description: Configuration PMCSR write clear function 0 interrupt
+      - description: Configuration PMCSR write clear function 1 interrupt
 
   interrupt-names:
+    minItems: 16
     items:
       - const: serr
       - const: serr_cor
@@ -57,20 +69,28 @@ properties:
       - const: pcie_evt
       - const: msg
       - const: all
+      - const: link_equalization_request
+      - const: turn_off_event
+      - const: pmu_poweroff
+      - const: d3_event_f0
+      - const: d3_event_f1
+      - const: cfg_pmcsr_writeclear_f0
+      - const: cfg_pmcsr_writeclear_f1
 
   interrupt-controller: true
 
   clocks:
     items:
       - description: System clock
-      - description: PM control clock
+      - description: PM control clock or clock for L1 substate handling
 
   clock-names:
     items:
       - const: aclk
-      - const: pm
+      - enum: [pm, pmu]
 
   resets:
+    minItems: 1
     items:
       - description: AXI2PCIe Bridge reset
       - description: Data link layer/transaction layer reset
@@ -81,6 +101,7 @@ properties:
       - description: Configuration register reset
 
   reset-names:
+    minItems: 1
     items:
       - const: aresetn
       - const: rst_b
@@ -128,7 +149,9 @@ patternProperties:
         const: 0x1912
 
       device-id:
-        const: 0x0033
+        enum:
+          - 0x0033
+          - 0x0039
 
       clocks:
         items:
@@ -167,6 +190,44 @@ required:
 
 allOf:
   - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g045-pcie
+    then:
+      properties:
+        interrupts:
+          maxItems: 16
+        interrupt-names:
+          maxItems: 16
+        clock-names:
+          items:
+            - const: aclk
+            - const: pm
+        resets:
+          minItems: 7
+        reset-names:
+          minItems: 7
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-pcie
+    then:
+      properties:
+        interrupts:
+          minItems: 23
+        interrupt-names:
+          minItems: 23
+        clock-names:
+          items:
+            - const: aclk
+            - const: pmu
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
 
 unevaluatedProperties: false
 
-- 
2.25.1


