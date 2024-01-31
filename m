Return-Path: <linux-renesas-soc+bounces-2128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE234843C97
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 11:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E126C1C29C5F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 10:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36D669946;
	Wed, 31 Jan 2024 10:27:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A7D74E2B;
	Wed, 31 Jan 2024 10:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696854; cv=none; b=IfvqPvwoP9iwkvXZo6wetM+uZ39aFXpdjzySVnmLG1Rz8dxHBCoG2jDMiDjXDck4sssGPK5IRWTNMopNnfXnqPsy/RODH2slQAQ/x4Licw6TQeTX3Srs+j/Kwc/TblqDLVAhTczTaS5t3HgluMRkA7SN2JNi5Pn/uXETUjvDWLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696854; c=relaxed/simple;
	bh=VlyiPC5c36QZ8iVWoGczr9Hw8VObwpZPtA2HSPdL4qc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UhQUQxtpC+JITJ0UtrpBUNgyOVDzzT6oBuhx66KFcc+nw7vkZYBCPymZu0zUyU76ztdjW6bIldmRwYkJEY11sLduYgKM7R0lKrKIA4C3ua6+kpljT0L3nd4gclY1MeHzWIcewyYolizVH71Z2e0QZCf+SHksemKowMg9wwrK1T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,231,1701097200"; 
   d="scan'208";a="196288314"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Jan 2024 19:27:31 +0900
Received: from localhost.localdomain (unknown [10.226.92.227])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2EDB641DF0DA;
	Wed, 31 Jan 2024 19:27:26 +0900 (JST)
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
Subject: [PATCH v6 RESEND 5/6] dt-bindings: mfd: dlg,da9063: Sort child devices
Date: Wed, 31 Jan 2024 10:26:55 +0000
Message-Id: <20240131102656.3379-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102656.3379-1-biju.das.jz@bp.renesas.com>
References: <20240131102656.3379-1-biju.das.jz@bp.renesas.com>
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
Acked-by: Lee Jones <lee@kernel.org>
---
v6->v6 resend:
 * Added Ack from Lee Jones.
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
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


