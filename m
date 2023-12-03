Return-Path: <linux-renesas-soc+bounces-565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ED680231A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Dec 2023 12:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E86C91F2102E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Dec 2023 11:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD04B673;
	Sun,  3 Dec 2023 11:32:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9604CC1;
	Sun,  3 Dec 2023 03:32:37 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,247,1695654000"; 
   d="scan'208";a="185128667"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Dec 2023 20:32:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 31685418B3F9;
	Sun,  3 Dec 2023 20:32:32 +0900 (JST)
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
Subject: [PATCH v3 06/11] dt-bindings: mfd: dlg,da9063: Update onkey property
Date: Sun,  3 Dec 2023 11:31:54 +0000
Message-Id: <20231203113159.92316-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203113159.92316-1-biju.das.jz@bp.renesas.com>
References: <20231203113159.92316-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update onkey property by referring to dlg,da9062-onkey binding file
and drop its definition from this file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v2:
 * New patch
---
 .../devicetree/bindings/mfd/dlg,da9063.yaml       | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
index 1bdfb2be2e17..468d31b1135b 100644
--- a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
+++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
@@ -47,20 +47,7 @@ properties:
         const: dlg,da9063-rtc
 
   onkey:
-    type: object
-    $ref: /schemas/input/input.yaml#
-    unevaluatedProperties: false
-    properties:
-      compatible:
-        const: dlg,da9063-onkey
-
-      dlg,disable-key-power:
-        type: boolean
-        description: |
-          Disable power-down using a long key-press.
-          If this entry does not exist then by default the key-press triggered
-          power down is enabled and the OnKey will support both KEY_POWER and
-          KEY_SLEEP.
+    $ref: /schemas/input/dlg,da9062-onkey.yaml
 
   regulators:
     type: object
-- 
2.39.2


