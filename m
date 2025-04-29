Return-Path: <linux-renesas-soc+bounces-16442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BBFAA0568
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 10:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEC46170A35
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Apr 2025 08:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293E127A935;
	Tue, 29 Apr 2025 08:20:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C71279780;
	Tue, 29 Apr 2025 08:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914817; cv=none; b=Zffvx8F2Jt0XDacpNHRx37MuFen1vYdtUBcJQsV/qsQfXIePyic0xm0RPOmF0aoz7F3ga/WPAmZZx5ST4AmTYs2CdYNnIVAYKme/N6Cw3RJkSRGBQ1KYY6VJV2dhxdo+64ofvOWvIO9dQXPaH3w28PUggouN14Lj7kWBy51Naqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914817; c=relaxed/simple;
	bh=73zA2CLYL9Mn6PX0DxYR0lMBD9A44hRDhGJfPS6gdrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bA2qgtB9ny1ZkcevwOA4d6iudBqPHz7g+eVsoHxzPUsh+IbdSOh+iKvD5kJ8lcK7QiCONlld4hSVEHtrPxdjVn0baOxaRkPdETBVBSUFW7JFl+xzKJu83LUPi3l1RXW0+ylP1jjR3n/8ycFln4arzPmgBuf59Ghsxvc/bO610Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: +jeovNkORJK8jxGD8ggfVA==
X-CSE-MsgGUID: iFUeV+J8QuesaRFIvVTfjA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Apr 2025 17:20:06 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.118])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2764A4007F4D;
	Tue, 29 Apr 2025 17:20:02 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v8 01/11] dt-bindings: serial: Added secondary clock for RZ/T2H RSCI
Date: Tue, 29 Apr 2025 10:19:43 +0200
Message-ID: <20250429081956.3804621-2-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com>
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At boot, the default clock is the PCLKM core lock (synchronous
clock, which is enabled by the bootloader).
For different baudrates, the asynchronous clock input must be used.
Clock selection is made by an internal register of RCSI.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 .../bindings/serial/renesas,rsci.yaml          | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index ea879db5f485..aa2428837a2f 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -35,10 +35,14 @@ properties:
       - const: tei
 
   clocks:
-    maxItems: 1
+    items:
+      - description: serial functional clock
+      - description: default core clock
 
   clock-names:
-    const: fck # UART functional clock
+    items:
+      - const: async
+      - const: bus
 
   power-domains:
     maxItems: 1
@@ -58,11 +62,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/clock/renesas-cpg-mssr.h>
-
-    aliases {
-        serial0 = &sci0;
-    };
+    #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
 
     sci0: serial@80005000 {
         compatible = "renesas,r9a09g077-rsci";
@@ -72,7 +72,7 @@ examples:
                      <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
                      <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names = "eri", "rxi", "txi", "tei";
-        clocks = <&cpg CPG_MOD 108>;
-        clock-names = "fck";
+        clocks = <&cpg CPG_MOD 108>, <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
+        clock-names = "async", "bus";
         power-domains = <&cpg>;
     };
-- 
2.43.0


