Return-Path: <linux-renesas-soc+bounces-5026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C978B9877
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 12:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADB461F240C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 10:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0611B5677C;
	Thu,  2 May 2024 10:06:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F8E55C0A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 May 2024 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714644360; cv=none; b=rMnsd45RV86nfxDX1hjbL8+kLNU8xvXewtS8b8Z5BEwFARLouAYkoWa9WsF1JG6vAoOy9pd7ATNRQtaRWcLmpfGWzNWQ6S0SlJEqTioGT8d2IKximZejlbMfqCVSo+9DSA3+MZt/WxDUhoQwYl8IMYHuQUSrK+HwWaI6Wb/TGD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714644360; c=relaxed/simple;
	bh=wtROmOjpsYU5GBY1Rlv4h8b3SmHRVtSwvGeJLTUi/fc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CAJt2WPbim3O6xVtMFjhYXhN7VkuUBSOs8BdCL+QY4qmP14btr0CjVls92RXnbJYDLRfyG7MkJAE9nhehNIX3y4ZEiT5odw9PdPHh68wWBjJNw+Rw9pkObDT88VVHvhLLnVujfpMU70L7bJliNpe7fx3CyC2zDw6NdXvd2+SGgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4VVTr052Ctz4wy8v
	for <linux-renesas-soc@vger.kernel.org>; Thu, 02 May 2024 11:57:20 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:93f:7d7e:5c98:dabc])
	by albert.telenet-ops.be with bizsmtp
	id J9xC2C0063PjoSD069xClr; Thu, 02 May 2024 11:57:12 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s2TAv-002nZC-S8;
	Thu, 02 May 2024 11:57:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s2TBg-004jYE-3c;
	Thu, 02 May 2024 11:57:12 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/8] dt-bindings: fuse: Document R-Car E-FUSE / PFC
Date: Thu,  2 May 2024 11:57:04 +0200
Message-Id: <9623b0aca13c640f2b6883e5a0e49beb97721ca2.1714642390.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714642390.git.geert+renesas@glider.be>
References: <cover.1714642390.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for E-FUSE non-volatile memory accessible through PFC
on R-Car V3U and S4-8.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/fuse/renesas,rcar-efuse.yaml     | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml

diff --git a/Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml b/Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml
new file mode 100644
index 0000000000000000..d7e289244e72cce1
--- /dev/null
+++ b/Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/fuse/renesas,rcar-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: R-Car E-FUSE connected to PFC
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  The E-FUSE is a type of non-volatile memory, which is accessible through the
+  Pin Function Controller (PFC) on some R-Car Gen4 SoCs.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r8a779a0-efuse # R-Car V3U
+      - renesas,r8a779f0-efuse # R-Car S4-8
+
+  reg:
+    maxItems: 1
+    description: PFC System Group Fuse Control and Monitor register block
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
+    #include <dt-bindings/power/r8a779a0-sysc.h>
+
+    fuse: fuse@e6078800 {
+            compatible = "renesas,r8a779a0-efuse";
+            reg = <0xe6078800 0x100>;
+            clocks = <&cpg CPG_MOD 916>;
+            power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+            resets = <&cpg 916>;
+    };
-- 
2.34.1


