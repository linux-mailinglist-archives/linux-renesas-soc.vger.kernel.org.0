Return-Path: <linux-renesas-soc+bounces-549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB240801E4A
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Dec 2023 20:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61F991F2110C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Dec 2023 19:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4889F208BE;
	Sat,  2 Dec 2023 19:26:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id BD97D11A;
	Sat,  2 Dec 2023 11:26:15 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,246,1695654000"; 
   d="scan'208";a="185089902"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Dec 2023 04:26:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.28])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9F92F40764EE;
	Sun,  3 Dec 2023 04:26:11 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 05/11] dt-bindings: mfd: dlg,da9063: Update watchdog property
Date: Sat,  2 Dec 2023 19:25:29 +0000
Message-Id: <20231202192536.266885-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update watchdog property by referring to dlg,da9062-watchdog binding file
and drop its definition from this file.

While at, update description with link to product information.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../devicetree/bindings/mfd/dlg,da9063.yaml   | 21 ++++++-------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
index c5a7e10d7d80..1bdfb2be2e17 100644
--- a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
+++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
@@ -17,6 +17,9 @@ description: |
   moment where all voltage monitors are disabled. Next, as da9063 only supports
   UV *and* OV monitoring, both must be set to the same severity and value
   (0: disable, 1: enable).
+  Product information for the DA906{3L,3} devices can be found here:
+  - https://www.dialog-semiconductor.com/products/da9063l
+  - https://www.dialog-semiconductor.com/products/da9063
 
 properties:
   compatible:
@@ -35,21 +38,6 @@ properties:
   "#interrupt-cells":
     const: 2
 
-  dlg,use-sw-pm:
-    type: boolean
-    description:
-      Disable the watchdog during suspend.
-      Only use this option if you can't use the watchdog automatic suspend
-      function during a suspend (see register CONTROL_B).
-
-  watchdog:
-    type: object
-    $ref: /schemas/watchdog/watchdog.yaml#
-    unevaluatedProperties: false
-    properties:
-      compatible:
-        const: dlg,da9063-watchdog
-
   rtc:
     type: object
     $ref: /schemas/rtc/rtc.yaml#
@@ -82,6 +70,9 @@ properties:
         $ref: /schemas/regulator/regulator.yaml
         unevaluatedProperties: false
 
+  watchdog:
+    $ref: /schemas/watchdog/dlg,da9062-watchdog.yaml
+
 required:
   - compatible
   - reg
-- 
2.39.2


