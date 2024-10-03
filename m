Return-Path: <linux-renesas-soc+bounces-9352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8364698F104
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 16:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B51191C214E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 14:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FA119F11F;
	Thu,  3 Oct 2024 14:04:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431B919D093
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Oct 2024 14:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727964284; cv=none; b=CQUT9JbT2Heoyhsu8cQCiFmFS6XHqlSCVJPWi5h07Ef7EznErC4okRL/LXnHTGaePusg/SIkSDEszv12Q/tBZ/H+PdPgKFOcKiywrSNH9M9ZzxwkzAXiOSbG0H4T+bl+rem/D+r2LSdfVzHlQzuGOMH0wq27Fd3/5DraH7vI/Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727964284; c=relaxed/simple;
	bh=IN7VUIPHXWbspVhLBD+cYSc0OvefiWRv/4MBxp7NEAY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bmowdKfQjVvnYkcL45LdnTM75jDFA8pzLUa67Ex13am1oOPqcz+qcdA83kMJEVNkhsuYP0+NJxREZqp7bkL+G6EVdjEGtlCkcQJx2eCNao4axpE3eNSbf/CgOYJtd+Dw3eFOrTAwSil6oQA8NzymNKqHD5v2wRKCpk1Vid1B9Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d4db:7463:4f08:3c82])
	by xavier.telenet-ops.be with cmsmtp
	id Kq4d2D0095K8SYz01q4dMx; Thu, 03 Oct 2024 16:04:39 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swMRR-001CGU-2z;
	Thu, 03 Oct 2024 16:04:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swMRZ-006e9f-B0;
	Thu, 03 Oct 2024 16:04:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 resend 1/7] dt-bindings: fuse: Move renesas,rcar-{efuse,otp} to nvmem
Date: Thu,  3 Oct 2024 16:04:25 +0200
Message-Id: <425648901d724b3db81329f98988d0532257eb89.1727963347.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727963347.git.geert+renesas@glider.be>
References: <cover.1727963347.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The R-Car E-FUSE blocks can be modelled better using the nvmem
framework.

Replace the R-Car V3U example by an R-Car S4-8 ES1.2 example, to show
the definition of nvmem cells.  While at it, drop unneeded labels from
the examples, and fix indentation.

Add an entry to the MAINTAINERS file.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 .../{fuse => nvmem}/renesas,rcar-efuse.yaml   | 35 +++++++++++++------
 .../{fuse => nvmem}/renesas,rcar-otp.yaml     | 17 +++++----
 MAINTAINERS                                   |  1 +
 3 files changed, 36 insertions(+), 17 deletions(-)
 rename Documentation/devicetree/bindings/{fuse => nvmem}/renesas,rcar-efuse.yaml (54%)
 rename Documentation/devicetree/bindings/{fuse => nvmem}/renesas,rcar-otp.yaml (60%)

diff --git a/Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml b/Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.yaml
similarity index 54%
rename from Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml
rename to Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.yaml
index d7e289244e72cce1..ce7d65afa4602537 100644
--- a/Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/fuse/renesas,rcar-efuse.yaml#
+$id: http://devicetree.org/schemas/nvmem/renesas,rcar-efuse.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: R-Car E-FUSE connected to PFC
@@ -13,6 +13,9 @@ description:
   The E-FUSE is a type of non-volatile memory, which is accessible through the
   Pin Function Controller (PFC) on some R-Car Gen4 SoCs.
 
+allOf:
+  - $ref: nvmem.yaml#
+
 properties:
   compatible:
     enum:
@@ -39,17 +42,27 @@ required:
   - power-domains
   - resets
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
-    #include <dt-bindings/power/r8a779a0-sysc.h>
-
-    fuse: fuse@e6078800 {
-            compatible = "renesas,r8a779a0-efuse";
-            reg = <0xe6078800 0x100>;
-            clocks = <&cpg CPG_MOD 916>;
-            power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
-            resets = <&cpg 916>;
+    #include <dt-bindings/clock/r8a779f0-cpg-mssr.h>
+    #include <dt-bindings/power/r8a779f0-sysc.h>
+
+    fuse@e6078800 {
+        compatible = "renesas,r8a779f0-efuse";
+        reg = <0xe6078800 0x200>;
+        clocks = <&cpg CPG_MOD 915>;
+        power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+        resets = <&cpg 915>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            calib@144 {
+                reg = <0x144 0x08>;
+            };
+        };
     };
diff --git a/Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml b/Documentation/devicetree/bindings/nvmem/renesas,rcar-otp.yaml
similarity index 60%
rename from Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml
rename to Documentation/devicetree/bindings/nvmem/renesas,rcar-otp.yaml
index d74872ae9ff378f9..3313c03ea68dfd57 100644
--- a/Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/renesas,rcar-otp.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/fuse/renesas,rcar-otp.yaml#
+$id: http://devicetree.org/schemas/nvmem/renesas,rcar-otp.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: R-Car E-FUSE connected to OTP_MEM
@@ -13,6 +13,9 @@ description:
   The E-FUSE is a type of non-volatile memory, which is accessible through the
   One-Time Programmable Memory (OTP_MEM) module on some R-Car Gen4 SoCs.
 
+allOf:
+  - $ref: nvmem.yaml#
+
 properties:
   compatible:
     enum:
@@ -22,17 +25,19 @@ properties:
   reg:
     items:
       - description: OTP_MEM_0
-      - description: OTP_MEM_1
+      - description: OTP_MEM_1.
+          The addresses of cells defined under the optional nvmem-layout
+          subnode are relative to this register bank.
 
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-    otp: otp@e61be000 {
-            compatible = "renesas,r8a779g0-otp";
-            reg = <0xe61be000 0x1000>, <0xe61bf000 0x1000>;
+    otp@e61be000 {
+        compatible = "renesas,r8a779g0-otp";
+        reg = <0xe61be000 0x1000>, <0xe61bf000 0x1000>;
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index ca10c94405f3a43d..2437c49c19440a96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2922,6 +2922,7 @@ Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
 C:	irc://irc.libera.chat/renesas-soc
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
 F:	Documentation/devicetree/bindings/hwinfo/renesas,prr.yaml
+F:	Documentation/devicetree/bindings/nvmem/renesas,*
 F:	Documentation/devicetree/bindings/soc/renesas/
 F:	arch/arm/boot/dts/renesas/
 F:	arch/arm/configs/shmobile_defconfig
-- 
2.34.1


