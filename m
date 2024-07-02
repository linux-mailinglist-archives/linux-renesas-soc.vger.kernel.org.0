Return-Path: <linux-renesas-soc+bounces-7001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 707BD9246CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 20:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18B531F25E28
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 18:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BBA1BE243;
	Tue,  2 Jul 2024 18:00:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE25516B394;
	Tue,  2 Jul 2024 18:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719943248; cv=none; b=lBEAz3W5w75uIVaMbWTk6AI55xAFfMRyie1RjVT9LWyZNWU/bmjrSJk7rT20w3rDWkPJShoJg1qNGrmN4p1Q1dWBcmIaZefjZojLeGJWRd89fIkWZUwjK3hXCxEgJbfMURPFBD1LpfoutMEd2g61he+o77fJitwn8oWwjOdvWIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719943248; c=relaxed/simple;
	bh=uiszMLVjTGUq53HrANIlVYKfp11W6v0uMlAq8Nhz4JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxOQ57eCZbZ3WDxoUM1wg6EiEqWM8mjuppJQqgAZ2WfVusCYw0qsV32gxVm3ZGa908zDEcTUOERlcircGIZzGauMnIw60dDFS1Tipr6csabfuCwddjydBzcCIZcQRtp91NlAISmkTvUHXLz3lGlzxhKN7hiqP35pJBWh78FP9pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,178,1716217200"; 
   d="scan'208";a="210052545"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Jul 2024 03:00:45 +0900
Received: from localhost.localdomain (unknown [10.226.93.72])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E49724006CD0;
	Wed,  3 Jul 2024 03:00:40 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v5 1/4] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document USB VBUS regulator
Date: Tue,  2 Jul 2024 19:00:15 +0100
Message-ID: <20240702180032.207275-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702180032.207275-1-biju.das.jz@bp.renesas.com>
References: <20240702180032.207275-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VBUS enable can be controlled by the VBOUT bit of the VBUS control
register. This register is part of usbphy-ctrl IP.

Document the USB VBUS regulator object.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
v4->v5:
 * Added Rb tag from Krzysztof.
v3->v4:
 * Fixed example indentation to 4 char spaces
 * Dropped regulator-{min,max}-microvolt from example.
v3:
 * New patch
---
 .../bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index 03c18611e42d..b0b20af15313 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -42,6 +42,12 @@ properties:
       0 = Port 1 Phy reset
       1 = Port 2 Phy reset
 
+  regulator-vbus:
+    type: object
+    description: USB VBUS regulator
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -49,6 +55,7 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
+  - regulator-vbus
 
 additionalProperties: false
 
@@ -64,4 +71,7 @@ examples:
         resets = <&cpg R9A07G044_USB_PRESETN>;
         power-domains = <&cpg>;
         #reset-cells = <1>;
+        regulator-vbus {
+            regulator-name = "vbus";
+        };
     };
-- 
2.43.0


