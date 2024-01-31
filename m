Return-Path: <linux-renesas-soc+bounces-2153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F398443D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 17:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0CDC2914CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 16:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430CC12BE8B;
	Wed, 31 Jan 2024 16:12:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFE312A166
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 16:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706717520; cv=none; b=LMZlvf/shxqhH1b61fRY+WIBSx2NSeeSk/L2ad8wOh7ynE/U5QQ++1km/d3OCyW2RoAbaWow+4tUQVqfDzK8LX4BTRHLN2euXiQR2iurKHfN/9tIXkvnyUHKmQFdqx/exNoDWQlJwavhydb/Gjz5l81bQr74+uaGGWmMli41oEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706717520; c=relaxed/simple;
	bh=etiQOCiZU9tDAlchggQr10q8COercMMXKaVDFoX+q74=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DSHQDJ6XzFrSrYf2GP297Iefz+mGpCC0VNF8OTeo/tIuwNPHXHUDscBlH42avtRPRYQHdx6L9snQRaP6xU1bhVwmE1tvrNhm4+zoj+oBUnrjdHBQLjpgXUUlmCbWf2RvX9kdkEdfGzP0dAtQSH//chCeBE5pZK/XI1MEpxlpED0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by andre.telenet-ops.be with bizsmtp
	id hUBq2B00N4efzLr01UBqR2; Wed, 31 Jan 2024 17:11:55 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVDAw-00GrV5-9U;
	Wed, 31 Jan 2024 17:11:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVDBm-008lXe-Ht;
	Wed, 31 Jan 2024 17:11:50 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: timer: renesas,tmu: Document input capture interrupt
Date: Wed, 31 Jan 2024 17:11:45 +0100
Message-Id: <8cb38b5236213a467c6c0073f97ccc4bfd5a39ff.1706717378.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Timer Unit (TMU) instances with 3 channels support a fourth
interrupt: an input capture interrupt for the third channel.

While at it, document the meaning of the four interrupts, and add
"interrupt-names" for clarity.

Update the example to match reality.

Inspired by a patch by Yoshinori Sato for SH.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Reword interrupt descriptions.

The corresponding DTS updates can be found in series "[PATCH 0/2]
ARM/arm64: dts: renesas: Improve TMU interrupt descriptions".
https://lore.kernel.org/r/cover.1705325654.git.geert+renesas@glider.be
Once the DTS updates are upstream, "interrupt-names" can be made
required.
---
 .../devicetree/bindings/timer/renesas,tmu.yaml | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index a67e427a9e7e22aa..84bbe15028a1de94 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -46,7 +46,19 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 3
+    items:
+      - description: Underflow interrupt, channel 0
+      - description: Underflow interrupt, channel 1
+      - description: Underflow interrupt, channel 2
+      - description: Input capture interrupt, channel 2
+
+  interrupt-names:
+    minItems: 2
+    items:
+      - const: tuni0
+      - const: tuni1
+      - const: tuni2
+      - const: ticpi2
 
   clocks:
     maxItems: 1
@@ -100,7 +112,9 @@ examples:
             reg = <0xffd80000 0x30>;
             interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+                         <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
             clocks = <&mstp0_clks R8A7779_CLK_TMU0>;
             clock-names = "fck";
             power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
-- 
2.34.1


