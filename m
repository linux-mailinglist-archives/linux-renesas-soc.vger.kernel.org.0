Return-Path: <linux-renesas-soc+bounces-22848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD94BCA8D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 20:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D21F1A6146D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 18:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A732B9B7;
	Thu,  9 Oct 2025 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ADfLfmbf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ACA1662E7
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 18:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760033971; cv=none; b=uSmWAG+K0ou36/O4aO8hs6DOiDgUDwfEDRgW1iivqIq5cPxZ8Kruf1F3m5cE+EbouZdvH4bJJX6x3Ys4PiUlEgZ2h7m8kTt6pnAxWPZCkS6FlZFIuT2t4pkfnDXnsAEk1aAQYgJUv8RBD0543rh6wN2nv9dyemRbYeX++Yq/xHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760033971; c=relaxed/simple;
	bh=oJL9ZzdD0I4gLcqpPwX4g8cC/PdlzfO8WIm2TwilfUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NY6OjoyTT3HXq/huzna3MKECY2wlNwaqqIxueKjljJUKglXC+cQaRLEXuzrbSS0vcojgF1PyMiqpSuU8LlcnrI9OfGFdPj7mEsBZ54BQgKaKfZhe8wfVBO5ruwUn9slONN841AaY5KayBByZJDwggx3fQSI3JGoGx04B505bsS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ADfLfmbf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=UNgWapdaXwLxZR
	5i7ioNb3VcKjZtB4lqKESXtLEmFSM=; b=ADfLfmbf9z0Zx7jAsomq2CzrQPH9+v
	lmA36JbF+nlg9TmZ1z+uPciKWwYWq3txGuzxUSB7l1hNJFuSvWTxe8Vst6nbBsw3
	1VxLL4Pl1hdphx1kXCCFCDVnONG6qSCJBabnT+BmMSvBc/uQvpJkEisVc7oI+xOC
	EeCN4BfhJl8+hHVkWjjJi+xR9K87XLMKZAUcdwIDgky2Jv+pT7WvJbjMLqPrlnlL
	RLJhie/6pPPF484zinL+0KtX4TgXN8WVLiEt+rPCJwCr9RwE8ADVjPD7Nsv/Ktt/
	F5xm8Yj/1PVjjh7hRTidwrIxStyg/IdgnVeLj/pR8/iTvNI8ZVgUrYgQ==
Received: (qmail 1180667 invoked from network); 9 Oct 2025 20:19:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 20:19:25 +0200
X-UD-Smtp-Session: l3s3148p1@JEhP171AWJYujnv2
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: Add Renesas R2A11302FT PMIC
Date: Thu,  9 Oct 2025 20:12:47 +0200
Message-ID: <20251009181916.2431-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This PMIC is referenced in upstream DTs for the Renesas Lager and
Koelsch boards. Sadly, we don't have documentation for more complete
bindings, but due to the spi-cpol/cpha it also doesn't belong to trivial
devices. So, start with this minimal binding description with the facts
that we do know:

Fixes:
arch/arm/boot/dts/renesas/r8a7790-lager.dtb: /soc/spi@e6e10000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: /soc/spi@e6e20000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since RFC [1]:
* dropped "unevaluatedProperties" because we know this binding is not
  complete currently
* removed 'pmic' label from the example
* proper patch description

[1] https://lore.kernel.org/r/20250929083449.14393-1-wsa+renesas@sang-engineering.com

 .../bindings/mfd/renesas,r2a11302ft.yaml      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/renesas,r2a11302ft.yaml

diff --git a/Documentation/devicetree/bindings/mfd/renesas,r2a11302ft.yaml b/Documentation/devicetree/bindings/mfd/renesas,r2a11302ft.yaml
new file mode 100644
index 000000000000..e978b359b3ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/renesas,r2a11302ft.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/renesas,r2a11302ft.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R2A11302FT Power Supply ICs for R-Car
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+properties:
+  compatible:
+    const: renesas,r2a11302ft
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 6000000
+
+  spi-cpol: true
+
+  spi-cpha: true
+
+required:
+  - compatible
+  - reg
+  - spi-cpol
+  - spi-cpha
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@0 {
+                compatible = "renesas,r2a11302ft";
+                reg = <0>;
+                spi-max-frequency = <6000000>;
+                spi-cpol;
+                spi-cpha;
+        };
+    };
+...
-- 
2.47.2


