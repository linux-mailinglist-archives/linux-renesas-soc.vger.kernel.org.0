Return-Path: <linux-renesas-soc+bounces-22434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B04EBA8688
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 10:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3B08188F1AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 08:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE2623183F;
	Mon, 29 Sep 2025 08:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SBKyCvYI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCDA14E2E2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 08:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759134904; cv=none; b=V+eH704FJgfSYDtGDdEA/9Qmx/c86VNvrxMg/SzwhqvDS1wHVBe1KYXQoHBB0geFBeapCvK/3a+6nqikuX2YvCQ7V/v1K8zJjJ9xs4uYAhYaTYk/FODP51i4L52VMavPrscgBgA9DHM8HQRvfw7Gvzx4qtn9wjaMOIAHBkXwIFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759134904; c=relaxed/simple;
	bh=b1rmZNu7HDfckQqsuISYnl3zQTrDvfW9oSBMuiWkOWM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=adaXWhdQ+crHHq9U4lCvpKSKq4KAEHjiz+3ZR4qIzUKXJ/00k1SidrZpTqkzjLfjt1NqiHNlyyqozPmDhEVGCLU5aG7B6vGnpwCviub1bXPOWBCFKKu5E9F1Fwp4s/1Q7DCamhLoQlwVg6CcoPfHLYbcxTGfpjBJn5vqCjtws9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SBKyCvYI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=rWIXW2a5KULKO/
	2r69KqW7CRGloiI+0coE2XY6HpH2Y=; b=SBKyCvYIQ0tDTCYLujBJDcbw2XrCSp
	dTVrEf0ojFugxQmdTuMZsmpsUQXwOhIL7Aer2Lu+V7BgIKCLWMszML1tqiatgXYZ
	FzY1Od+4sR14QSvkeDsN50r4JFqPbwD6ZHP6rosBBVqbR/QFp6daPkIbbHXoDSXc
	5Yh3/bNXO2742KoHOr49Eh5cAeGDEoTSROHl+AoAl+kWqTE85C6+NWHupNlSqoII
	RKIR3WqJxwPEwlK1ZXqnbjp2KJiwDW61a1o50ZCfavufte2+nrs6u6F+szr0U0eG
	X7HuMOF5cGbav+PP1d36m8nlpUZ/ascCdgaXJvSoFRvry3MU+u7AMuZg==
Received: (qmail 3183417 invoked from network); 29 Sep 2025 10:34:53 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Sep 2025 10:34:53 +0200
X-UD-Smtp-Session: l3s3148p1@xGtyguw/gNogAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH] dt-bindings: mfd: Add Renesas R2A11302FT PMIC
Date: Mon, 29 Sep 2025 10:34:49 +0200
Message-ID: <20250929083449.14393-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Internal RFC for now.

Basic binding description for the above PMIC already referenced in
upstream DTs for the Renesas Lager and Koelsch boards.

Do you think we could / should upstream it? Passes dt_binding_check and
dtbs_check.

Fixes:
arch/arm/boot/dts/renesas/r8a7790-lager.dtb: /soc/spi@e6e10000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: /soc/spi@e6e20000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']

Notes:

Would have loved to add this to 'trivial-devices' but 'spi-cpol' and
'spi-cpha' are not allowed there.

There is no driver and there will likely never be one.

I don't have and couldn't find any datasheet.

Maybe Geert wants to be listed as maintainer? He is the only one who
ever playes with this device. All is fine with me...

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../bindings/mfd/renesas,r2a11302ft.yaml      | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/renesas,r2a11302ft.yaml

diff --git a/Documentation/devicetree/bindings/mfd/renesas,r2a11302ft.yaml b/Documentation/devicetree/bindings/mfd/renesas,r2a11302ft.yaml
new file mode 100644
index 000000000000..fc94f26f2bcd
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/renesas,r2a11302ft.yaml
@@ -0,0 +1,51 @@
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic: pmic@0 {
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


