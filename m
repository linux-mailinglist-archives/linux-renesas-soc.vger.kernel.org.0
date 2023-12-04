Return-Path: <linux-renesas-soc+bounces-658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1229803B6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 18:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FF50B20A2F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 17:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2892E82B;
	Mon,  4 Dec 2023 17:25:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 23FBFA9;
	Mon,  4 Dec 2023 09:25:37 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,250,1695654000"; 
   d="scan'208";a="185273261"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Dec 2023 02:25:36 +0900
Received: from localhost.localdomain (unknown [10.226.93.142])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 25AA24031BE0;
	Tue,  5 Dec 2023 02:25:32 +0900 (JST)
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
Subject: [PATCH v3.1 4/8] dt-bindings: mfd: dlg,da9063: Update watchdog property
Date: Mon,  4 Dec 2023 17:25:06 +0000
Message-Id: <20231204172510.35041-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update watchdog property by referring to dlg,da9062-watchdog binding file
and drop its definition from this file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v3->v3.1:

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


