Return-Path: <linux-renesas-soc+bounces-24469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C269FC4F107
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 17:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C4E134E5285
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 16:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FB536CE0F;
	Tue, 11 Nov 2025 16:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lOrBQU23"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFBC328272;
	Tue, 11 Nov 2025 16:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762878897; cv=none; b=AvhLzhyxxEIWwod/Z/x45IsuLxUiRCnlZxEum8C5KTxISJuV+0pvabttprc8ZQZ+Q8GuU43t1qYfYALIO0g+F5ivfITFmQNCR3pDXlDB4ADOvvKo8qbppLQeMCG0KrPRpO1soKxuaA/u+aw7ysGJPxFWu58Jhtn6ogsYCraLkiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762878897; c=relaxed/simple;
	bh=f09iJv0JNGSRgjJMHH3xABuPHKV+oRJzXaowFWVlF+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gcKRSDlQRc/wtCMGjQG4kkdWSkpvOJ8cC78PLURc4Ogb7v3Q0wVyBtuN7un0qFMvRk1FGxdmP1QYXuchB50sUr1C141jBAzf07nLb0LY21NvyyTMvViCYb02CxoLoBiKOkkcQu9Zt2uCAXkxoeCtJCd2bP8zxcbMID33SdaL2bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lOrBQU23; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEEA41DD3;
	Tue, 11 Nov 2025 17:32:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762878772;
	bh=f09iJv0JNGSRgjJMHH3xABuPHKV+oRJzXaowFWVlF+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lOrBQU23f+AwyaCNNAOPABqgvSVW2+R6BteEFCfultweEkwi+83n6hirZX0kEokAS
	 2E0caRtQ8V/naXX4e84omyogzebB9o3WQc6XvveDsxoYai1SJlb8Dd08GSPuM7G6BN
	 31AOtHbyw5hqUWE4LK+J8Pb6GQAGiLJOKqisakiM=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 11 Nov 2025 16:34:24 +0000
Subject: [PATCH v6 1/3] dt-bindings: media: Add bindings for the RZ/V2H(P)
 IVC block
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-ivc-v6-1-2a0ad3894478@ideasonboard.com>
References: <20251111-ivc-v6-0-2a0ad3894478@ideasonboard.com>
In-Reply-To: <20251111-ivc-v6-0-2a0ad3894478@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 laurent.pinchart@ideasonboard.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3598;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=f09iJv0JNGSRgjJMHH3xABuPHKV+oRJzXaowFWVlF+o=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBpE2Wos3XAXv5vFBbw+vLeyphb/Rs7JNmhTcjuy
 VJZjNS/moGJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaRNlqAAKCRDISVd6bEV1
 MjKaD/sHmIb+eeRpNfQRYxuSpwHF4j40VEct9LlZ77OBfMASbS6hEdAsyMmkSNFLD/lAedfh1tf
 7J0DBPJuuXeFPnQHdx2In0xRFS77cz11xdIAPqhCWTJmF64YOHWcXHiJssgIFK4MbzjCGfVY95R
 LkxeZ3+67mXkNgxHfzX0OYwSZV0BygsRC+7yrtLqMIAI0N4PFO24Vb+YWfbVnCZYDE3pTPI663O
 WsSY063xMcW5jQr0OYmrkr1G8PoRYFNWVwKHXoWPujH6gdYLDUS2OoH/7t3NXQegT+WrFopKaqO
 Lcvonl7eFdqZLnGqQM0Nc7NLlH/Ts08vJXDN4RHHAqJeASVeIh0/KbNYD7lqNISqdFY/p/ngfWT
 Zmi5lPwVs6MGEmlxE/hlc/H44568qTPqk+sWKgCzRb1KvNhtTCp/wQEVfB+9TiLddaC6G9ekUWD
 tNoyoMDLy0gHt7oytMjTkbmiu/PULzP+1NnttzCd4WOiK772j3YGKdTiYqerI0xZd6nvJbobQLg
 x9azCFbvWzuzNX+IM1HT+OI8bN3HXg9Wyx5r/pKZwGEjmirHGoMvLjnhYXXZekUy2MrvfA3A7gx
 5GCv3HtLcdWTM7cMArcm85TNewamlTxUZA/1qNI0PQpxLqNKsWExr7irCKpjt/7r+ckeFkj1iw8
 uZqvYu/Mt1KYTsA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

The RZ/V2H(P) SoC has a block called the Input Video Control block which
feeds image data into the Image Signal Processor. Add dt bindings to
describe the IVC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Chagnes in v6:
	- Add # RZ/V2H(P) after compatible string enum

Changes in v5:

	- Rename RZ/V2H to RZ/V2H(P)

Changes in v3:

	- Rename from rzv2h-ivc.yaml to r9a09g057-ivc.yaml
	- Update clock and reset names

Changes in v2:

	- compatible matches filename
	- Added power-domains
	- Aligned clock and reset entries on opening "<"
	- Removed status = "okay"; from example
---
 .../bindings/media/renesas,r9a09g057-ivc.yaml      | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c09cbd8c9e3597e1d3d1f83cbd9abd5d17cc0262
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,r9a09g057-ivc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2H(P) Input Video Control Block
+
+maintainers:
+  - Daniel Scally <dan.scally@ideasonboard.com>
+
+description:
+  The IVC block is a module that takes video frames from memory and feeds them
+  to the Image Signal Processor for processing.
+
+properties:
+  compatible:
+    const: renesas,r9a09g057-ivc # RZ/V2H(P)
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Input Video Control block register access clock
+      - description: Video input data AXI bus clock
+      - description: ISP system clock
+
+  clock-names:
+    items:
+      - const: reg
+      - const: axi
+      - const: isp
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: Input Video Control block register access reset
+      - description: Video input data AXI bus reset
+      - description: ISP core reset
+
+  reset-names:
+    items:
+      - const: reg
+      - const: axi
+      - const: isp
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Output parallel video bus
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+  - reset-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    isp-input@16040000 {
+      compatible = "renesas,r9a09g057-ivc";
+      reg = <0x16040000 0x230>;
+
+      clocks = <&cpg CPG_MOD 0xe3>,
+               <&cpg CPG_MOD 0xe4>,
+               <&cpg CPG_MOD 0xe5>;
+      clock-names = "reg", "axi", "isp";
+
+      power-domains = <&cpg>;
+
+      resets = <&cpg 0xd4>,
+               <&cpg 0xd1>,
+               <&cpg 0xd3>;
+      reset-names = "reg", "axi", "isp";
+
+      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
+
+      port {
+        ivc_out: endpoint {
+          remote-endpoint = <&isp_in>;
+        };
+      };
+    };
+...

-- 
2.43.0


