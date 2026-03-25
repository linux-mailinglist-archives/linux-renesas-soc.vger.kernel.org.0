Return-Path: <linux-renesas-soc+bounces-30222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NJxEIzCw2n6twQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 12:10:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF283239BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 12:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89FC130811EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480943C873B;
	Wed, 25 Mar 2026 11:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EHaA0Cuf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859DB3C8728
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 11:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436845; cv=none; b=dOq1R32Jl7gkjZNok/KGGHQkN2Lm3woEo90pqMy7FkPSRURodhMbA3d4oh6vdUsCp9MfZ73m6nzlyxjA8LgZCpXgyY5Iku3+KOPIf1tQXtj95Oxa41V9PBQzzJ6gzymaAjWtXopAjI7D4mSM7DXESrlx95/k9X0JsYU75WEbItA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436845; c=relaxed/simple;
	bh=gpzDkiro6ohwpKAOWd8DAk7v8kdpOI4spycHzO6n67g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EV12BZ5n6k2IfWei4jL7IG1I8qIH70Rv7cvQDdCHILRXMJJ422b8NeOE1XqoO97nSF1WgETHc+vAH8N8lnglWkoQpi0Puk1lla90esNZH7rRX+jvy4Dwi8x8ROm7nfYZGojqQQ6Y4sz3jxxqZUpocCj3nnB5U3I9prqkxhrwBqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EHaA0Cuf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=GHk6AtcD4uE/gBpJb/IIUSeYvIXZC09yIVFlBbyWM80=; b=EHaA0C
	ufdCUtwfQDr9lQB0YQdB6z/1zoPQYWfBNYearRjXW2pLF6VXErOwdhMO+2j4ykD0
	0JOOquR6YJXOwtKcobHaVquTrtXYVix9nFNn5RofXWcDrUgF/ZN65wAXe0Na7l/1
	ZNa1lflrYIgeRZ2PIb3zYr5QzV+pIxY0pLJ73R4KUU/5t0hOX9Ub0p9UOCMONRAT
	0+vb990JiMsHjfBT/Ek6Ww7THuKFwJEXlTATuFbI7V205ZECNJNKF2TYbIq0mz/d
	vdhqE4p8JwxwAxfIEClrdQCJEbqXUjgiEW3mk5H08snpeExlMrDAGcoxsW5Jhr0u
	glipUuFRIztt1L5A==
Received: (qmail 3520780 invoked from network); 25 Mar 2026 12:07:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2026 12:07:19 +0100
X-UD-Smtp-Session: l3s3148p1@F+Z9RddNZKIujnt7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: soc: renesas: Document MFIS IP core
Date: Wed, 25 Mar 2026 12:07:13 +0100
Message-ID: <20260325110717.17083-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325110717.17083-1-wsa+renesas@sang-engineering.com>
References: <20260325110717.17083-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30222-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,vger.kernel.org,sang-engineering.com,glider.be,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,189e0000:email]
X-Rspamd-Queue-Id: EDF283239BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Renesas Multifunctional Interface (MFIS) as found on the
Renesas R-Car X5H (r8a78000) SoC. MFIS includes features like Mailbox/HW
Spinlock/Product Register/Error Injection/Error Detection and the likes.
Family-compatible values are not introduced here because MFIS is usually
very different per SoC.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Still passes 'dt_binding_check'. Double-checked with some invalid DTs.
Thank you to Krzysztof and Geert for the review.

Changes since v1:
* moved header from 'mailbox' to 'soc' and fixed ifdef-guard
* handled interrupt numbers and patterns per compatible
  (tried to remove minItems, didn't work.)
* extended descriptions
* in the header, explain that bits are ORable flags
  (I hope that shifts are okay then? Like in other upstream examples)
* use "system-controller" instead of "syscon"
* dropped label from the example
* improved subject and commit message

 .../soc/renesas/renesas,r8a78000-mfis.yaml    | 187 ++++++++++++++++++
 .../dt-bindings/soc/renesas,r8a78000-mfis.h   |  28 +++
 2 files changed, 215 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
 create mode 100644 include/dt-bindings/soc/renesas,r8a78000-mfis.h

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
new file mode 100644
index 000000000000..2839642ec116
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
@@ -0,0 +1,187 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/renesas/renesas,r8a78000-mfis.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas MFIS (Multifunctional Interface) controller
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+description:
+  The Renesas Multifunctional Interface (MFIS) provides various functionality
+  like mailboxes, hardware spinlocks, product identification, error injection,
+  error detection and such. Parts of it can be used for communication between
+  different CPU cores. Those cores can be in various domains like AP, RT, or
+  SCP. Often multiple domain-specific MFIS instances exist in one SoC.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r8a78000-mfis       # R-Car X5H (AP<->AP, with PRR)
+      - renesas,r8a78000-mfis-scp   # R-Car X5H (AP<->SCP, without PRR)
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: common
+      - const: mboxes
+
+  interrupts:
+    description:
+      The interrupts raised by the remote doorbells.
+
+  interrupt-names:
+    description:
+      An interrupt name is constructed with the prefix 'ch'. Then, the
+      channel number as specified in the documentation of the SoC. Finally,
+      the letter 'i' if the interrupt is raised by the IICR register. Or 'e'
+      if it is raised by the EICR register.
+
+  "#hwlock-cells":
+    const: 1
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell is the channel number as specified in the documentation
+      of the SoC. The second cell may specify flags as described in the file
+      <dt-bindings/soc/renesas,r8a78000-mfis.h>.
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r8a78000-mfis
+    then:
+      properties:
+        interrupts:
+          minItems: 128
+          maxItems: 128
+        interrupt-names:
+          minItems: 128
+          maxItems: 128
+          items:
+            pattern: "^ch[0-9]+[ie]$"
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r8a78000-mfis-scp
+    then:
+      properties:
+        interrupts:
+          minItems: 32
+          maxItems: 32
+        interrupt-names:
+          minItems: 32
+          maxItems: 32
+          items:
+            pattern: "^ch[0-9]+i$"
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - "#hwlock-cells"
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    system-controller@189e0000 {
+            compatible = "renesas,r8a78000-mfis";
+            reg = <0x189e0000 0x1000>, <0x18800000 0x40000>;
+            reg-names = "common", "mboxes";
+            interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "ch0i", "ch0e", "ch1i", "ch1e", "ch2i", "ch2e", "ch3i", "ch3e",
+                              "ch4i", "ch4e", "ch5i", "ch5e", "ch6i", "ch6e", "ch7i", "ch7e",
+                              "ch8i", "ch8e", "ch9i", "ch9e", "ch10i", "ch10e", "ch11i", "ch11e",
+                              "ch12i", "ch12e", "ch13i", "ch13e", "ch14i", "ch14e", "ch15i", "ch15e",
+                              "ch16i", "ch16e", "ch17i", "ch17e", "ch18i", "ch18e", "ch19i", "ch19e",
+                              "ch20i", "ch20e", "ch21i", "ch21e", "ch22i", "ch22e", "ch23i", "ch23e",
+                              "ch24i", "ch24e", "ch25i", "ch25e", "ch26i", "ch26e", "ch27i", "ch27e",
+                              "ch28i", "ch28e", "ch29i", "ch29e", "ch30i", "ch30e", "ch31i", "ch31e",
+                              "ch32i", "ch32e", "ch33i", "ch33e", "ch34i", "ch34e", "ch35i", "ch35e",
+                              "ch36i", "ch36e", "ch37i", "ch37e", "ch38i", "ch38e", "ch39i", "ch39e",
+                              "ch40i", "ch40e", "ch41i", "ch41e", "ch42i", "ch42e", "ch43i", "ch43e",
+                              "ch44i", "ch44e", "ch45i", "ch45e", "ch46i", "ch46e", "ch47i", "ch47e",
+                              "ch48i", "ch48e", "ch49i", "ch49e", "ch50i", "ch50e", "ch51i", "ch51e",
+                              "ch52i", "ch52e", "ch53i", "ch53e", "ch54i", "ch54e", "ch55i", "ch55e",
+                              "ch56i", "ch56e", "ch57i", "ch57e", "ch58i", "ch58e", "ch59i", "ch59e",
+                              "ch60i", "ch60e", "ch61i", "ch61e", "ch62i", "ch62e", "ch63i", "ch63e";
+            #hwlock-cells = <1>;
+            #mbox-cells = <2>;
+    };
diff --git a/include/dt-bindings/soc/renesas,r8a78000-mfis.h b/include/dt-bindings/soc/renesas,r8a78000-mfis.h
new file mode 100644
index 000000000000..52e17fea1a03
--- /dev/null
+++ b/include/dt-bindings/soc/renesas,r8a78000-mfis.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef _DT_BINDINGS_SOC_RENESAS_R8A78000_MFIS_H
+#define _DT_BINDINGS_SOC_RENESAS_R8A78000_MFIS_H
+
+/*
+ * Constants for the second mbox-cell of the Renesas MFIS IP core. To be treated
+ * as bit flags which can be ORed.
+ */
+
+/*
+ * MFIS HW design before r8a78001 requires a channel to be marked as either
+ * TX or RX.
+ */
+#define MFIS_CHANNEL_TX (0 << 0)
+#define MFIS_CHANNEL_RX (1 << 0)
+
+/*
+ * MFIS variants before r8a78001 work with pairs of IICR and EICR registers.
+ * Usually, it is specified in the datasheets which of the two a specific core
+ * should use. Then, it does not need extra description in DT. For plain MFIS
+ * of r8a78000, this is selectable, though. According to the system design and
+ * the firmware in use, these channels need to be marked. This is not needed
+ * with other versions of the MFIS, not even with MFIS-SCP of r8a78000.
+ */
+#define MFIS_CHANNEL_IICR (0 << 1)
+#define MFIS_CHANNEL_EICR (1 << 1)
+
+#endif
-- 
2.51.0


