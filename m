Return-Path: <linux-renesas-soc+bounces-551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFA0801E4E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Dec 2023 20:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFF14280FE7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Dec 2023 19:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF3D20B2E;
	Sat,  2 Dec 2023 19:26:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id E0FB411A;
	Sat,  2 Dec 2023 11:26:26 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,246,1695654000"; 
   d="scan'208";a="188949092"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2023 04:26:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.28])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1984040764EE;
	Sun,  3 Dec 2023 04:26:21 +0900 (JST)
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
Subject: [PATCH v2 07/11] dt-bindings: mfd: dlg,da9063: Sort child devices
Date: Sat,  2 Dec 2023 19:25:31 +0000
Message-Id: <20231202192536.266885-8-biju.das.jz@bp.renesas.com>
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

Sort child devices alphabetically.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../devicetree/bindings/mfd/dlg,da9063.yaml      | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
index 468d31b1135b..ecdef322723d 100644
--- a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
+++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
@@ -38,14 +38,6 @@ properties:
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
 
@@ -57,6 +49,14 @@ properties:
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


