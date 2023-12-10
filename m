Return-Path: <linux-renesas-soc+bounces-868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D1380BB38
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Dec 2023 14:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A7BE1F20F77
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Dec 2023 13:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6183F9E8;
	Sun, 10 Dec 2023 13:47:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8DFFFE3;
	Sun, 10 Dec 2023 05:47:47 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,265,1695654000"; 
   d="scan'208";a="185923331"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 10 Dec 2023 22:47:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 97C9B4003EBC;
	Sun, 10 Dec 2023 22:47:42 +0900 (JST)
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
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 4/8] dt-bindings: mfd: dlg,da9063: Update watchdog child node
Date: Sun, 10 Dec 2023 13:47:13 +0000
Message-Id: <20231210134717.94020-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231210134717.94020-1-biju.das.jz@bp.renesas.com>
References: <20231210134717.94020-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update watchdog child node by referring to dlg,da9062-watchdog binding
file and drop its definition from this file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5:
 * Updated commit header and description by replacing
   'watchdog property'->'watchdog child node'
 * Added Rb tag from Geert.
v3->v4:
 * Added Ack from Conor
 * Dropped link to product information.
v2->v3:
 * No change
v2:
 * New patch
---
 .../devicetree/bindings/mfd/dlg,da9063.yaml    | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
index c5a7e10d7d80..ce81e0b029cc 100644
--- a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
+++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
@@ -35,21 +35,6 @@ properties:
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
@@ -82,6 +67,9 @@ properties:
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


