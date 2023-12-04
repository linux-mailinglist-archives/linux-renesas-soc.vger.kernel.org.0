Return-Path: <linux-renesas-soc+bounces-661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE89803B75
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 18:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59644280E88
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 17:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACD32E843;
	Mon,  4 Dec 2023 17:25:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id EEDDDCB;
	Mon,  4 Dec 2023 09:25:50 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,250,1695654000"; 
   d="scan'208";a="185273273"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Dec 2023 02:25:50 +0900
Received: from localhost.localdomain (unknown [10.226.93.142])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id EEF704031BE0;
	Tue,  5 Dec 2023 02:25:46 +0900 (JST)
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
Subject: [PATCH v3.1 7/8] dt-bindings: mfd: dlg,da9063: Sort child devices
Date: Mon,  4 Dec 2023 17:25:09 +0000
Message-Id: <20231204172510.35041-8-biju.das.jz@bp.renesas.com>
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

Sort child devices alphabetically.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v3->v3.1:
 * Added Ack from Conor Dooley.
v2->v3:
 * No change
v2:
 * New patch
---
 .../devicetree/bindings/mfd/dlg,da9063.yaml      | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
index 1e5a847a6be2..676b4f2566ae 100644
--- a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
+++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
@@ -35,14 +35,6 @@ properties:
   "#interrupt-cells":
     const: 2
 
-  rtc:
-    type: object
-    $ref: /schemas/rtc/rtc.yaml#
-    unevaluatedProperties: false
-    properties:
-      compatible:
-        const: dlg,da9063-rtc
-
   onkey:
     $ref: /schemas/input/dlg,da9062-onkey.yaml
 
@@ -54,6 +46,14 @@ properties:
         $ref: /schemas/regulator/regulator.yaml
         unevaluatedProperties: false
 
+  rtc:
+    type: object
+    $ref: /schemas/rtc/rtc.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: dlg,da9063-rtc
+
   watchdog:
     $ref: /schemas/watchdog/dlg,da9062-watchdog.yaml
 
-- 
2.39.2


