Return-Path: <linux-renesas-soc+bounces-7683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B25AC944D97
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 16:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62F6A1F2385F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 14:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983191A487B;
	Thu,  1 Aug 2024 14:03:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391051A38C1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Aug 2024 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722521009; cv=none; b=uvde8BLGq3aXKMClIdpUDv4eQ3QR1f1x96F3KUDzrbvhtdZP5upYjRPVgszGGK0cz1e3ECIVvAjuiTxEglqEEWx5t6JLyE8ahsl6ARdnN1o/CunT+BFewXjYJds8UQG6+C2VPLIiuR7cQSByKGAb97Qx6Z10sv3aTrA4EBIY7G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722521009; c=relaxed/simple;
	bh=4B5qeLnXbkiU9/+d8ETfOpEIsw0uhhnpcY7UwqgINbU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H16Zz+N3TCw1E8ZIoam//IljSwMo5+retYeSxxUUsuYSlfxpTJmEFBBK8nUrmxtEno1BLK8hWgFj8xGBobGVAwqBvc/7ja4zKk4z3h/3szx9FtDjdIYSZnlNqEGcaRnP7N1ljIg+kmgDU/FC+3JyeyVAgLoyzQH+bPfYzOnJ8Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fff7:d11a:41d8:a195])
	by michel.telenet-ops.be with bizsmtp
	id ue3J2C00d5XJrhx06e3KpT; Thu, 01 Aug 2024 16:03:25 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sZWOM-004SD5-LV;
	Thu, 01 Aug 2024 16:03:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sZWOk-00HOMB-Q8;
	Thu, 01 Aug 2024 16:03:18 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-can@vger.kernel.org
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] dt-bindings: can: renesas,rcar-canfd: Document R-Car V4M support
Date: Thu,  1 Aug 2024 16:03:17 +0200
Message-Id: <68b5f910bef89508e3455c768844ebe859d6ff1d.1722520779.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Duy Nguyen <duy.nguyen.rh@renesas.com>

Document support for the CAN-FD Interface on the Renesas R-Car V4M
(R8A779H0) SoC, which supports up to four channels.

The CAN-FD module on R-Car V4M is very similar to the one on R-Car V4H,
but differs in some hardware parameters, as reflected by the Parameter
Status Information part of the Global IP Version Register.  However,
none of this parameterization should have any impact on the driver, as
the driver does not access any register that is impacted by the
parameterization (except for the number of channels).

Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
[geert: Clarify R-Car V4M differences]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Add more clarification,

v2:
  - Drop RFC state now it works.

Changes compared to the BSP:
  - Restrict number of channels to four.
---
 .../bindings/net/can/renesas,rcar-canfd.yaml  | 22 ++++++++++++++-----
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index d3f45d29fa0a550a..7c5ac5d2e880bbb8 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -32,6 +32,7 @@ properties:
           - enum:
               - renesas,r8a779a0-canfd     # R-Car V3U
               - renesas,r8a779g0-canfd     # R-Car V4H
+              - renesas,r8a779h0-canfd     # R-Car V4M
           - const: renesas,rcar-gen4-canfd # R-Car Gen4
 
       - items:
@@ -163,14 +164,23 @@ allOf:
           maxItems: 1
 
   - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              const: renesas,rcar-gen4-canfd
+      properties:
+        compatible:
+          contains:
+            const: renesas,r8a779h0-canfd
     then:
       patternProperties:
-        "^channel[2-7]$": false
+        "^channel[5-7]$": false
+    else:
+      if:
+        not:
+          properties:
+            compatible:
+              contains:
+                const: renesas,rcar-gen4-canfd
+      then:
+        patternProperties:
+          "^channel[2-7]$": false
 
 unevaluatedProperties: false
 
-- 
2.34.1


