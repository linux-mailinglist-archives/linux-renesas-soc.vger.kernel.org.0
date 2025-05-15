Return-Path: <linux-renesas-soc+bounces-17133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 839FFAB8923
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 16:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FC2B1BC3B6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 14:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D204B1E3775;
	Thu, 15 May 2025 14:18:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC6A1DED69;
	Thu, 15 May 2025 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318729; cv=none; b=Rqq0nb3EjUEcvrGK3mKoUgIiOsRItUE4qrV/Oi2DdzGqFJ6fuaIkkdwVQgTlTrQR+60Vb/idYW5Ahuh1lsbe3wY1Fg1nTt/WgRZXtrPqCNZoqU2Z5GFDGN8IJtmsIaJeNJ5OGgq1VgScb5b1o3A6EPfX776yIEeUGGF3HGlpwYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318729; c=relaxed/simple;
	bh=JNcndCMCg3DsXhurxCt49i2J12i7f5avcOBkiu526og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ceEwwwGb23/S4usCX8aZnVaUFPcv9CMkMiTSTqzbYb4D8C3XyUrr0GcB4RHDnfPxRYdBpaDmFAt2N3xql6kn/BcuAdTOS57f/Mx6Hyl1+6H2HypANZEvGXmYSnelmkPh7Ns+IoTdZHkBdmV2mgzQkE0LPmDh9F9sYYKVUsjUugI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: uEWTIOByQxqIHQVdoXLT+Q==
X-CSE-MsgGUID: ZLX3n8YeT7GaacYoZyYqtA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 May 2025 23:18:38 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.187])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 285B4401A460;
	Thu, 15 May 2025 23:18:34 +0900 (JST)
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
Subject: [PATCH v9 01/10] dt-bindings: serial: Added secondary clock for RZ/T2H RSCI
Date: Thu, 15 May 2025 16:18:16 +0200
Message-ID: <20250515141828.43444-2-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At boot, the default clock is the PCLKM core clock (synchronous
clock, which is enabled by the bootloader).
For different baudrates, the asynchronous clock input must be used.
Clock selection is made by an internal register of RCSI.

Also remove the unneeded serial0 alias from the dts example.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v8->v9:
 - typo in description
 - named clocks 'operational' and 'bus', and added optional 'sck' clock
 - uses value of 2nd core clock in example to break the dependency on cpg patch
---
 .../bindings/serial/renesas,rsci.yaml         | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index ea879db5f485..e966d2b5f16d 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -35,10 +35,17 @@ properties:
       - const: tei
 
   clocks:
-    maxItems: 1
+    minItems: 2
+    maxItems: 3
 
   clock-names:
-    const: fck # UART functional clock
+    minItems: 2
+    maxItems: 3
+    items:
+      enum:
+        - operation
+        - bus
+        - sck # optional external clock input
 
   power-domains:
     maxItems: 1
@@ -58,11 +65,7 @@ unevaluatedProperties: false
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
@@ -72,7 +75,7 @@ examples:
                      <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
                      <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names = "eri", "rxi", "txi", "tei";
-        clocks = <&cpg CPG_MOD 108>;
-        clock-names = "fck";
+        clocks = <&cpg CPG_MOD 8>, <&cpg CPG_CORE 13>;
+        clock-names = "operation", "bus";
         power-domains = <&cpg>;
     };
-- 
2.43.0


