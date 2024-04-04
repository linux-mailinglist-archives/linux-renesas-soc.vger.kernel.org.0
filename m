Return-Path: <linux-renesas-soc+bounces-4303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E10DD898012
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Apr 2024 07:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EA001F24B4F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Apr 2024 05:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16787EF09;
	Thu,  4 Apr 2024 05:15:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp [153.127.30.23])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2215C76919;
	Thu,  4 Apr 2024 05:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=153.127.30.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712207719; cv=none; b=PVqqaWM9GhVmljI8tTbUnKe/RWclLTqI2Zv6vDGuP0UuJ3DixiluBpv+fAzgq/MfXOEMXIZAQ2nDAga27tZzOXsMaXA6dWqWg/2ZbZlwwGVxUkKATgMWj1C5YlmdjPj1rze+6sBBQ4gGykxuReUva5gb9HQz8pCa7pqqny4fUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712207719; c=relaxed/simple;
	bh=s7z/DJLA2hvdIV/rv9zwgO39neOGHSX5TSCrrrQvjFc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=px1nLr5hjz0E0L3dWyUJNzGCooqzbk35DifBcE6FzMaKyvJFozAuGknlG+VRF0HDHdrBBvVQ9j35mHwksPferqoDqjwhboM3aYy2YPcntllVWcHwVVaX/VEkRWzYXTKVmPzhTWApjCNTrCsxRdP6UvOSvH55NMeKbl3ZQDRwC5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=users.sourceforge.jp; spf=fail smtp.mailfrom=users.sourceforge.jp; arc=none smtp.client-ip=153.127.30.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=users.sourceforge.jp
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=users.sourceforge.jp
Received: from SIOS1075.ysato.name (al128006.dynamic.ppp.asahi-net.or.jp [111.234.128.6])
	by sakura.ysato.name (Postfix) with ESMTPSA id 5F30E1C0FD1;
	Thu,  4 Apr 2024 14:15:15 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lee Jones <lee@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Rientjes <rientjes@google.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Baoquan He <bhe@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Azeem Shaikh <azeemshaikh38@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [RESEND v7 12/37] dt-bindings: pci: pci-sh7751: Add SH7751 PCI
Date: Thu,  4 Apr 2024 14:14:23 +0900
Message-Id: <5ab3c5952b49d7998734855e2ec1ee980795a724.1712207606.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712207606.git.ysato@users.sourceforge.jp>
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renesas SH7751 PCI Controller json-schema.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 .../bindings/pci/renesas,sh7751-pci.yaml      | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/renesas,sh7751-pci.yaml

diff --git a/Documentation/devicetree/bindings/pci/renesas,sh7751-pci.yaml b/Documentation/devicetree/bindings/pci/renesas,sh7751-pci.yaml
new file mode 100644
index 000000000000..115c2bb67339
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/renesas,sh7751-pci.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/renesas,sh7751-pci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas SH7751 PCI Host controller
+
+maintainers:
+  - Yoshinori Sato <ysato@users.sourceforge.jp>
+
+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+
+properties:
+  compatible:
+    const: renesas,sh7751-pci
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: PCI Controller
+      - const: Bus State Controller
+
+  "#interrupt-cells":
+    const: 1
+
+  "#address-cells":
+    const: 3
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+  dma-ranges: true
+
+  interrupt-controller: true
+
+  renesas,bus-arbit-round-robin:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Set DMA bus arbitration to round robin.
+
+required:
+  - compatible
+  - reg
+  - "#interrupt-cells"
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+  - interrupt-map
+  - interrupt-map-mask
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    pci@fe200000 {
+            compatible = "renesas,sh7751-pci";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            #interrupt-cells = <1>;
+            interrupt-controller;
+            device_type = "pci";
+            bus-range = <0 0>;
+            ranges = <0x02000000 0 0xfd000000 0xfd000000 0 0x01000000>,
+                     <0x01000000 0 0x00000000 0xfe240000 0 0x00040000>;
+            dma-ranges = <0x02000000 0 0xc000000 0x0c000000 0 0x04000000>;
+            reg = <0xfe200000 0x0400>,
+                  <0xff800000 0x0100>;
+            interrupt-map = <0x0000 0 0 1 &julianintc 5 IRQ_TYPE_LEVEL_LOW>,
+                            <0x0000 0 0 2 &julianintc 6 IRQ_TYPE_LEVEL_LOW>,
+                            <0x0000 0 0 3 &julianintc 7 IRQ_TYPE_LEVEL_LOW>,
+                            <0x0000 0 0 4 &julianintc 8 IRQ_TYPE_LEVEL_LOW>,
+                            <0x0800 0 0 1 &julianintc 6 IRQ_TYPE_LEVEL_LOW>,
+                            <0x0800 0 0 2 &julianintc 7 IRQ_TYPE_LEVEL_LOW>,
+                            <0x0800 0 0 3 &julianintc 8 IRQ_TYPE_LEVEL_LOW>,
+                            <0x0800 0 0 4 &julianintc 5 IRQ_TYPE_LEVEL_LOW>,
+                            <0x1000 0 0 1 &julianintc 7 IRQ_TYPE_LEVEL_LOW>,
+                            <0x1000 0 0 2 &julianintc 8 IRQ_TYPE_LEVEL_LOW>,
+                            <0x1000 0 0 3 &julianintc 5 IRQ_TYPE_LEVEL_LOW>,
+                            <0x1000 0 0 4 &julianintc 6 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-map-mask = <0x1800 0 0 7>;
+    };
-- 
2.39.2


