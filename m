Return-Path: <linux-renesas-soc+bounces-34853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3tACH8gkTmoJEAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:22:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA0A72435B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:21:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BB49305FF01
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 10:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E00039B484;
	Wed,  8 Jul 2026 10:15:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F74E396D38;
	Wed,  8 Jul 2026 10:15:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505729; cv=none; b=SXJyUgSpXxwvOoJH17uv/3gXpcKl+iFiw+Xcen2QApkYdxgLM7X9Ydr+CMIOhQvS3y5lpHCf9UV5NLbMPHwuQuqd6JOb7vU4LEGr6yFX0WbvKflaDCPmdkd0yZcFhty0q4vFRyawYe/7xxEJd52D+h3irae8X0yvucsPsCN9wug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505729; c=relaxed/simple;
	bh=Vnb7OKEK2AHAgIXLhfDaQ0t/4SY/KoboitG4AjqyX1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MecwoZFM5+iQD8zyXHPOE7BMJGc5uNNUY/5Kc4bdU51x5eKZ8v8rXKGAu3u1iiLQgaRvp0O3IOEoZB8EoCFl7SPL4HiSgUZ+EUK2hSv4l7RSoltlo+mxgMU+tLReD+UrvqCFescY7l1UB1wX9R0aILbR13+9qUxKEJBKKPKigjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF991F00A3F;
	Wed,  8 Jul 2026 10:15:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/6] dt-bindings: power: Document Renesas R-Car X5H Module Controller
Date: Wed,  8 Jul 2026 12:15:07 +0200
Message-ID: <1d79020a5eb2f269ea7ebb354cdfdf880049721c.1783505142.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783505142.git.geert+renesas@glider.be>
References: <cover.1783505142.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-34853-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:from_mime,glider.be:email,glider.be:mid,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECA0A72435B

Document support for Renesas R-Car X5H Module Controllers, and add
binding definitions for power domains not backed by registers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Clarify the meaning of the two power domain cells and the reset
    cell,
  - Drop R8A78000_MDLC_PD_CMN, as CMN is backed by MDPG bits,
  - Expand MDLC acronym,
  - Add a comment stating that all R8A78000_MDLC_PD_* definitions are
    for always-on power domains,
  - Drop firmware property.
---
 .../bindings/power/renesas,r8a78000-mdlc.yaml | 61 +++++++++++++++++++
 .../dt-bindings/power/renesas,r8a78000-mdlc.h | 15 +++++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
 create mode 100644 include/dt-bindings/power/renesas,r8a78000-mdlc.h

diff --git a/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml b/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
new file mode 100644
index 0000000000000000..1dba1e1b1c5b52d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/renesas,r8a78000-mdlc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car X5H Module Controller
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  Each instance of the R-Car X5H Module Controller (MODULE CONTROL) provides
+  Power Gating for up to 64 Power Domains, and Module Standby and Reset for up
+  to 256 modules in the Power Domain of each Module hierarchy.
+
+properties:
+  compatible:
+    const: renesas,r8a78000-mdlc
+
+  reg:
+    maxItems: 1
+
+  '#power-domain-cells':
+    description: |
+      - The first power domain specifier cell is the power domain part, and
+        must be either the Module Power Domain Gating (MPDG) register index
+        (0x00-0x3f) from the datasheet, for power domains which are backed by
+        MPDG bits and which can be controlled in that manner,  or a Power
+        Domain number, as defined in
+        <dt-bindings/power/renesas,r8a78000-mdlc.h>, for power domains which
+        are always on, and for which there are no MPDG bits to control them.
+
+      - The second power domain specifier cell is the module standby part, and
+        must be the module number (0x00-0xff), composed of the Module System
+        Reset (MSRES) register index in the high nibble, and the Module Reset
+        Destination bitfield index in the low nibble.
+    const: 2
+
+  '#reset-cells':
+    description:
+      The single reset specifier cell must be the module number (0x00-0xff),
+      and thus identical to the second power domain specifier cell.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#power-domain-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    system-controller@c3060000 {
+            compatible = "renesas,r8a78000-mdlc";
+            reg = <0xc3060000 0x1000>;
+            #power-domain-cells = <2>;
+            #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/power/renesas,r8a78000-mdlc.h b/include/dt-bindings/power/renesas,r8a78000-mdlc.h
new file mode 100644
index 0000000000000000..6f3d1ae23648e55b
--- /dev/null
+++ b/include/dt-bindings/power/renesas,r8a78000-mdlc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Glider bv
+ */
+#ifndef __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
+#define __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
+
+/* R-Car X5H Module Controller Always-On Power Domains */
+
+#define R8A78000_MDLC_PD_AON			0x40
+#define R8A78000_MDLC_PD_SCP			0x41
+#define R8A78000_MDLC_PD_APL			0x42
+#define R8A78000_MDLC_PD_ACL			0x43
+
+#endif /* __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__ */
-- 
2.43.0


