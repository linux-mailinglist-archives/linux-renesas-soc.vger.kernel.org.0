Return-Path: <linux-renesas-soc+bounces-6047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 997F590396A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 12:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E0CF1F23424
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 10:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6AF17B403;
	Tue, 11 Jun 2024 10:59:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C391791FC;
	Tue, 11 Jun 2024 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718103577; cv=none; b=cvEgVPsyn9Idc03uXH1j2SGTJjTTwjPyVkf3Js2sn8OC9S6fQn3HyRvAd63QhaUmHmBw1ZNgY38HYqLBV5bZfvfgw7+0NqnpsKhFlVn0c3cbltmRE79UUT5XJ5m4iaVNZejqA2uSO46Ldf9KWM/IKe4R4astlxGEF20PdFsjcpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718103577; c=relaxed/simple;
	bh=KT2sJbK47VncGi6Mu4YW32d4l4qap2QxDaLAefT6+5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R4ILSE+KXsSIoTLQSmB8bBAunpyBg56D/FL6u558Vq0geDfsemJkGhQ6T//O1qzbQYky1om8tj0Us9JXYJxHviz68RaYuuvqE4fB6o7VDknNWzS/yew4s6MGUKY8pdL10EjPHLz37GQA2pru3choALbhRZN869OK2ummVjyhh8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,229,1712588400"; 
   d="scan'208";a="211445801"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jun 2024 19:59:30 +0900
Received: from localhost.localdomain (unknown [10.226.93.49])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C287440078D0;
	Tue, 11 Jun 2024 19:59:25 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 1/6] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document USB VBUS regulator
Date: Tue, 11 Jun 2024 11:59:12 +0100
Message-Id: <20240611105917.57872-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611105917.57872-1-biju.das.jz@bp.renesas.com>
References: <20240611105917.57872-1-biju.das.jz@bp.renesas.com>
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
---
v3:
 * New patch
---
 .../bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index 03c18611e42d..cfe479df0f41 100644
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
 
@@ -64,4 +71,9 @@ examples:
         resets = <&cpg R9A07G044_USB_PRESETN>;
         power-domains = <&cpg>;
         #reset-cells = <1>;
+        regulator-vbus {
+          regulator-name = "vbus";
+          regulator-min-microvolt = <5000000>;
+          regulator-max-microvolt = <5000000>;
+        };
     };
-- 
2.25.1


