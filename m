Return-Path: <linux-renesas-soc+bounces-22879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 838DDBCC6DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 11:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7229C4E274B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 09:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA212ECE9A;
	Fri, 10 Oct 2025 09:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="g6K/7vyH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A52526A0F8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760089668; cv=none; b=MQOFBfdZLDacShAEqRAsK2GW/c1Nq5waRS8HOPKqOhQx6in0gbDq/y0BWh6575nwpCwTJOVfGuly7mDTArIHZUQmZywGW3Gy2x7wjcUyu7TmC/0gv/CletiDCOgfxrqa7tULnDP7nFinWDSZUZiWx+DgqORfJxPJhuRg8fMxG44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760089668; c=relaxed/simple;
	bh=zJkm6gQJjeQUoJeAAV+l9b5+AxhIx+J6Q8JswPOgcQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZT/xx7jMXcr8E+ZMKFQLf262s4V44v1KfC4EyD4kl4hGPg2LG6xw2c1I7ACq4ndKEcc+dpzF2PgoUElIttC/8D59WOOxcz43Rxk8FLDI/7lq1BO6ja6nhCDb/GI39r7oQqLtJ9UIgC0TbLncGygSow4OY9nSpxFIOrtNgBfUPUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=g6K/7vyH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Nts+QQC030khGM
	DsWdfg6pEtECUFKuiHkwl9jlX5gq0=; b=g6K/7vyHaejamGrbF0EDR3tOfbCHwb
	pfD4rqe1NeiSYdiOdSZcMB9iqklg7z5kwvFBdZzowvQs4M9e3uuxI6uZdpgqfqEM
	X6HvSrAdsnuqTSiDGDs6FhIlQIgt3ZxCnLa/sMu9/2Q1R4gK7zjqhDie3Nxb3Q7n
	oGqvNYb9BVJ47BCVP5M/2PrelohV9wK1YPkIFk/hAtauHMefvm3um0ZDBH6iAsSU
	lFNRCVsEupbsVaVuW8KC4cVusYGbHcWXtRWfkHSX8Z1AGa6kB2QolZQKLGx8/IdB
	HOUTIC7dnp9RsPn1JWCVbr3uRCfGGV80Hy6jVG+3Qjdn0clq1Yvqy0Hg==
Received: (qmail 1421944 invoked from network); 10 Oct 2025 11:47:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2025 11:47:43 +0200
X-UD-Smtp-Session: l3s3148p1@5N4iz8pAmoEgAwDPXwQHAL/S9V79e5yL
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
Subject: [PATCH v3] dt-bindings: mfd: Add Renesas R2A11302FT PMIC
Date: Fri, 10 Oct 2025 11:43:43 +0200
Message-ID: <20251010094734.10487-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This PMIC is referenced in upstream DTs for the Renesas Lager and
Koelsch boards. Sadly, there is no documentation available. This minimal
binding description states the facts that we do know.

Fixes:
arch/arm/boot/dts/renesas/r8a7790-lager.dtb: /soc/spi@e6e10000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: /soc/spi@e6e20000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since last version:
* switched to b4-style patch version counting
* added unevaluatedProperties
* fixed whitespaces in example
* added description stating that the binding is incomplete
* reworded commit message to state the reason for incompleteness

Thanks Krzysztof for all the input!

 .../bindings/mfd/renesas,r2a11302ft.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/renesas,r2a11302ft.yaml

diff --git a/Documentation/devicetree/bindings/mfd/renesas,r2a11302ft.yaml b/Documentation/devicetree/bindings/mfd/renesas,r2a11302ft.yaml
new file mode 100644
index 000000000000..7b96619ebd8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/renesas,r2a11302ft.yaml
@@ -0,0 +1,58 @@
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
+description: |
+  The Renesas R2A11302FT PMIC is used with Renesas R-Car Gen1/Gen2
+  based SoCs.
+
+  FIXME: The binding is incomplete and resembles the information gathered
+  so far.
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@0 {
+            compatible = "renesas,r2a11302ft";
+            reg = <0>;
+            spi-max-frequency = <6000000>;
+            spi-cpol;
+            spi-cpha;
+        };
+    };
+...
-- 
2.47.2


