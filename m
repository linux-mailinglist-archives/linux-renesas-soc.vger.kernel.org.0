Return-Path: <linux-renesas-soc+bounces-30650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLMsOgqmy2nJJwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:46:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A032136847E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 19B643020CD3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255D23A63FD;
	Tue, 31 Mar 2026 10:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="g2KKJQv1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23703A63FB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953946; cv=none; b=S1L/oOukBaobQbVh77GvQWsZeA69cgCCzOsipO+xGQSRWcPVDmvUXbmg1OarMsATpnjiDSctsr9EizdxGKiy5JAM6XmZBMry1d0Wjqu2M7SH83hduhZid2DExvdOhKhr911sh5lsukJbT/0dnU3GaJVGyJPuTtFIJXcWPZxSWhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953946; c=relaxed/simple;
	bh=K0EX0cspVeWxNCtAKEUv2IpTsWN+IA1QxsQ1rNF3Vs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOYYSud66blTVwqi2Hr6cx8TZ81y3J3MhR/WTaYpCk0lhAa0vc04Ec+D6bptGpa/9ui+62+7xI3XnHIXSi3zZFdRsZvWVooW20a8PzL6gidTb98QuArJw5aJUf4yqJw69qsMSQ+8kLVcvdN9yflkF02zIrV5j0HXqbBMSHM3x40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=g2KKJQv1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=r0g0IpoxlP5va4wkaZmbiFkAib721mTMQMhw3iYp7pw=; b=g2KKJQ
	v17g60ndBRl/eWM0TfPATbe1XyOdNli1t0lSyu1UvDf+98IbDYxoCydQVPvwgRfP
	NuZZuzlKDQ9CZSZX9/5qfgRKSb2Vq+DJ1WHnfuDldgTkZqg8/p30NJkHhF2L26ed
	YnAz8E/UPXY1T58Ta+xJZc3agZP5LxY8vpOx5YrfLYa7JkXqjikf1J/w/UHmf/c0
	Z6KjQ3ohjyUVwdIrmRTJRq3W2ntGHSTmzRd7GwFUGx0g4mxdvJuNjgJ5kWrB0kRK
	h2W0+rwFdRObTeO7yuTrv5botZAxSCi2vU600OsDgCuTXEelLHwJSwsm3f30gB3S
	MLMDeURmccWNJz2Q==
Received: (qmail 1653790 invoked from network); 31 Mar 2026 12:45:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2026 12:45:39 +0200
X-UD-Smtp-Session: l3s3148p1@I3UCq09O/K4ujnu8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marek.vasut@mailbox.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: soc: renesas: Document MFIS IP core
Date: Tue, 31 Mar 2026 12:45:23 +0200
Message-ID: <20260331104527.29170-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260331104527.29170-1-wsa+renesas@sang-engineering.com>
References: <20260331104527.29170-1-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30650-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[kernel.org,mailbox.org,sang-engineering.com,glider.be,gmail.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,189e0000:email,devicetree.org:url]
X-Rspamd-Queue-Id: A032136847E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Renesas Multifunctional Interface (MFIS) as found on the
Renesas R-Car X5H (r8a78000) SoC. MFIS includes features like Mailbox/HW
Spinlock/Product Register/Error Injection/Error Detection and the likes.
Family-compatible values are not introduced here because MFIS is usually
very different per SoC.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v2:
* added interrupt constraints
* fixed whitespaces in example (Thanks, Krzysztof, for both!)

 .../soc/renesas/renesas,r8a78000-mfis.yaml    | 191 ++++++++++++++++++
 .../dt-bindings/soc/renesas,r8a78000-mfis.h   |  28 +++
 2 files changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
 create mode 100644 include/dt-bindings/soc/renesas,r8a78000-mfis.h

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
new file mode 100644
index 000000000000..7ee3a82053d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
@@ -0,0 +1,191 @@
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
+    minItems: 32
+    maxItems: 128
+    description:
+      The interrupts raised by the remote doorbells.
+
+  interrupt-names:
+    minItems: 32
+    maxItems: 128
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
+        compatible = "renesas,r8a78000-mfis";
+        reg = <0x189e0000 0x1000>, <0x18800000 0x40000>;
+        reg-names = "common", "mboxes";
+        interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "ch0i", "ch0e", "ch1i", "ch1e", "ch2i", "ch2e", "ch3i", "ch3e",
+                          "ch4i", "ch4e", "ch5i", "ch5e", "ch6i", "ch6e", "ch7i", "ch7e",
+                          "ch8i", "ch8e", "ch9i", "ch9e", "ch10i", "ch10e", "ch11i", "ch11e",
+                          "ch12i", "ch12e", "ch13i", "ch13e", "ch14i", "ch14e", "ch15i", "ch15e",
+                          "ch16i", "ch16e", "ch17i", "ch17e", "ch18i", "ch18e", "ch19i", "ch19e",
+                          "ch20i", "ch20e", "ch21i", "ch21e", "ch22i", "ch22e", "ch23i", "ch23e",
+                          "ch24i", "ch24e", "ch25i", "ch25e", "ch26i", "ch26e", "ch27i", "ch27e",
+                          "ch28i", "ch28e", "ch29i", "ch29e", "ch30i", "ch30e", "ch31i", "ch31e",
+                          "ch32i", "ch32e", "ch33i", "ch33e", "ch34i", "ch34e", "ch35i", "ch35e",
+                          "ch36i", "ch36e", "ch37i", "ch37e", "ch38i", "ch38e", "ch39i", "ch39e",
+                          "ch40i", "ch40e", "ch41i", "ch41e", "ch42i", "ch42e", "ch43i", "ch43e",
+                          "ch44i", "ch44e", "ch45i", "ch45e", "ch46i", "ch46e", "ch47i", "ch47e",
+                          "ch48i", "ch48e", "ch49i", "ch49e", "ch50i", "ch50e", "ch51i", "ch51e",
+                          "ch52i", "ch52e", "ch53i", "ch53e", "ch54i", "ch54e", "ch55i", "ch55e",
+                          "ch56i", "ch56e", "ch57i", "ch57e", "ch58i", "ch58e", "ch59i", "ch59e",
+                          "ch60i", "ch60e", "ch61i", "ch61e", "ch62i", "ch62e", "ch63i", "ch63e";
+        #hwlock-cells = <1>;
+        #mbox-cells = <2>;
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


