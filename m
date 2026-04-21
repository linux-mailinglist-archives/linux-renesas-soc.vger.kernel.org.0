Return-Path: <linux-renesas-soc+bounces-31472-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAaFIYi/52l4AQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31472-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:18:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0056343E988
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71B4330787A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 18:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03253BD654;
	Tue, 21 Apr 2026 18:12:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55FC3AA187;
	Tue, 21 Apr 2026 18:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795168; cv=none; b=P+PV5dTh9lUMI9ZdZX20Q+Vb2pNZJBOVi2sQnQLUHqBAWjvlvLE2zCfLU31brlHq64ZDHUI2CBwEyDmoi/IJZ2nJBh7BKCrCdDqKflA+g2DHCOiIMVQLsd+el9x/WexKUu2mCZWTac3Qrsc5H3psX4+99hAOM8ViIX7HjhB/VIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795168; c=relaxed/simple;
	bh=QrKi5FpD9xDv9alKjpbtADx04oQH6RcZFwBpFy0y4bA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lgaEaYudq81skSYk+hFw529EUW43DTrN4gWdxyuTG2uin22g6REmo8EcI/Q36k1zYzV61JAs7k4DMkCD30PqqTwYmvCVv5tY6Ru0O5EJ7ak4W/GR91cfo4a8b6WFFTpNd1moDfTqgrHekup/ItBe4M2xrBl/YJvA9xvXvmQTEg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3D1C2BCC9;
	Tue, 21 Apr 2026 18:12:43 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H Module Controller
Date: Tue, 21 Apr 2026 20:11:43 +0200
Message-ID: <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31472-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:mid,glider.be:email,c3060000:email,devicetree.org:url]
X-Rspamd-Queue-Id: 0056343E988
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document support for Renesas R-Car X5H Module Controllers, and
add definitions for power domains not backed by registers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/power/renesas,r8a78000-mdlc.yaml | 63 +++++++++++++++++++
 .../dt-bindings/power/renesas,r8a78000-mdlc.h | 16 +++++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
 create mode 100644 include/dt-bindings/power/renesas,r8a78000-mdlc.h

diff --git a/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml b/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
new file mode 100644
index 0000000000000000..c3075bb308962f59
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/renesas,r8a78000-mdlc.yaml
@@ -0,0 +1,63 @@
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
+      - The first power domain specifier cell must be either the Module
+        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
+        datasheet, or a Power Domain number, as defined in
+        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
+      - The second power domain specifier cell must be the module number
+        (0x00-0xff), composed of the Module System Reset (MSRES) register index
+        in the high nibble, and the Module Reset Destination bitfield index in
+        the low nibble.
+    const: 2
+
+  '#reset-cells':
+    description:
+      The single reset specifier cell must be the module number (0x00-0xff).
+    const: 1
+
+  firmware:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Reference to the SCMI firmware device node on systems where SCMI must be
+      used instead of direct hardware access.
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
+            firmware = <&scmi>;
+    };
diff --git a/include/dt-bindings/power/renesas,r8a78000-mdlc.h b/include/dt-bindings/power/renesas,r8a78000-mdlc.h
new file mode 100644
index 0000000000000000..31aa4935a7c5cf94
--- /dev/null
+++ b/include/dt-bindings/power/renesas,r8a78000-mdlc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Glider bv
+ */
+#ifndef __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
+#define __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
+
+/* R-Car X5H MDLC Power Domains */
+
+#define R8A78000_MDLC_PD_AON			0x40
+#define R8A78000_MDLC_PD_SCP			0x41
+#define R8A78000_MDLC_PD_APL			0x42
+#define R8A78000_MDLC_PD_CMN			0x43
+#define R8A78000_MDLC_PD_ACL			0x44
+
+#endif /* __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__ */
-- 
2.43.0


