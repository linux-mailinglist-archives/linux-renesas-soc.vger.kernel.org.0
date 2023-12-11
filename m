Return-Path: <linux-renesas-soc+bounces-888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DE780D05B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 17:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B8BE1F2167B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 16:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD794C3B1;
	Mon, 11 Dec 2023 16:01:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C4226B1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 08:01:32 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:dadd:5da9:a38f:8d88])
	by andre.telenet-ops.be with bizsmtp
	id M41S2B00E3oFjQr0141SM2; Mon, 11 Dec 2023 17:01:26 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rCiiM-00BkB5-Om;
	Mon, 11 Dec 2023 17:01:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rCiik-00BmVr-Er;
	Mon, 11 Dec 2023 17:01:26 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/7] dt-bindings: soc: renesas: Document R-Car V4H White Hawk Single
Date: Mon, 11 Dec 2023 17:01:16 +0100
Message-Id: <d16b9cc3e8a6ee6f9ee95961671a2d27e585c0aa.1702309604.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702309604.git.geert+renesas@glider.be>
References: <cover.1702309604.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible values for the Renesas R-Car V4H ES2.0
(R8A779G2) SoC and the Renesas White Hawk Single board.
The former is an updated version of R-Car V4H (R8A779G0).
The latter is a single-board integration of the Renesas White Hawk CPU
and Breakout board stack.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Or just drop the "-single" suffix?  The original board stack has a
"-breakout" suffix.
The DTBs are called r8a779g0-white-hawk.dtb vs.
r8a779g2-white-hawk-single.dtb, and I think we better don't rename the
former.
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 1bb5888988119455..cc0d699f660f3ca1 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -376,6 +376,13 @@ properties:
               - renesas,white-hawk-cpu # White Hawk CPU board (RTP8A779G0ASKB0FC0SA000)
           - const: renesas,r8a779g0
 
+      - description: R-Car V4H (R8A779G2)
+        items:
+          - enum:
+              - renesas,white-hawk-single # White Hawk Single board (RTP8A779G2ASKB0F10SA001)
+          - const: renesas,r8a779g2
+          - const: renesas,r8a779g0
+
       - items:
           - enum:
               - renesas,white-hawk-breakout # White Hawk BreakOut board (RTP8A779G0ASKB0SB0SA000)
-- 
2.34.1


