Return-Path: <linux-renesas-soc+bounces-25888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 406D1CCC837
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 16:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1850C30C19C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Dec 2025 15:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8223354AC3;
	Thu, 18 Dec 2025 15:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="D+TF+11j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8799B352F94
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Dec 2025 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071318; cv=pass; b=Lz5PzUKYgmC+iWHoE2U6pNz75Lgd9DKyxLI6RxmmmYMxjm+ArsCXe09SUj9BGbuZAcYgZwMtbD40Xs7xTEvRdBDFdd4fCvrBLKuTfgfg4uDpbHliw6Ps/FMVnyyo+aToxk7adl7uxJ11ZDemUsWWLuJZ/4xyO3O+CEuncTZ2SUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071318; c=relaxed/simple;
	bh=HFFh/0R1q/dM407ncnP63bQTvfvE8hZuOCGo9ES6MnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ja3Wby577cE0zk/IuZfZmwnci8ptmtDHXueMvZfCjdxITm7YX9A5mbmQqzTUrvcTFMg7yvdo5qQoHjI5wZ5W5xIQkQqbNWsZoouoWJzLM7CTewJlJgYCjRDTkHiaOjpjvJWLEd0eeat+3CYYmQwiMk+Ag4rstXsXuEuZQAZCTMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=D+TF+11j; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=k3AM7QmqkPS84tQuQ7++sP3E2X2hsG+zkS1II3xFrLY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071288;
 b=f5YmVc6Xxs5qZkbmfQRNyiX/h5EY3ZX3IK/KpOQWVD1FOPMiaWBR4hJwCWt/QhsU+2REtAfE
 ZJpyfo1kHSwCjSYE1ApIpczOLxpbmePbOaa8mg+kEZKwafyZb5ID6695ru56WO5ieyzYzGBrSTC
 aPLBQjzBQAVqko4PoL5kXYS8Sa4SD/+pvdfqVo/s2jhVCDKr8w9nPSSGm9kdYWecRQKhhGeaAYG
 LMN0bu7lXfOXAWA+xaINhPgPtv2KY/HIld/mdZ+oUeCjq849hge+u+EiFplVGSsvQ3CSGXCEy1u
 IpDoFkurvWfKMqdXPdt0YslL4hguBR7GS1ugCEKQ8W+5w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071288;
 b=C9M3EoTUz7p+Ag0oUm4rbr22pYilPyny18jPYJYfzYv3HQp7V7m7RABUZk9nn1jGriE5TACA
 1Cef+j4fNbC+DxHIS+6bBwHahXoGJvQNTjHeJ20qzRU8qFMg+X+WeL9lPnMY8Kwxu807qFw/BCw
 PMb45dlPyM+FfS8/g4CBdo0Nd7vkJ9chx9TP9HoJt0WHEkGOqZLwgyoWY0zcwk/Tqg3wCtwWXNn
 DdaVfHTS3DTeRY8Yjd9lZO8WPMY4cuL2r3T07jznqWRoNpOZUEiRvGO24w03J2pS4BOSqbUkRIH
 fxhiUqCLmVTmPa+CRS4ZFa1qstcHjBXMoRxi0UMV+HBpQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 18 Dec 2025 16:21:28 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C1E2ECC0CC7;
	Thu, 18 Dec 2025 16:21:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
Date: Thu, 18 Dec 2025 16:20:48 +0100
Message-ID: <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-renesas-soc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dXDry6fRMz3yXl8
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:79e50b13dc320d875aa9306a79dc5026
X-cloud-security:scantime:2.032
DKIM-Signature: a=rsa-sha256;
 bh=k3AM7QmqkPS84tQuQ7++sP3E2X2hsG+zkS1II3xFrLY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071288; v=1;
 b=D+TF+11jhGGZp0rOv9NNOV6lYXd+ADzW4DYNGbWAJ6Sh1qN9WWyx65g0LE356kJy3GjtfoAi
 +1gmKRBf3zxe+nhcMbgD3wusJ8m9CYb/RtC8CV81vDT0cNmwsgjc1gMD5MmQviKqVMwbvd2/Czd
 18Ps6w+TLKmws0tw1Fp363Jeb8cpD9JzCWrPnrCnDFC2uGlxGVRyot1+73mUqG812I0Yn3tC+Ct
 sWf19xZUpoLl3qh9vQarraN5JFf63gS7Yh2xjkQ6awOR4uuQzLLTajzzer8GAoSUa/NE0wmy0yz
 LSTDAb/uHnFhdGwz5RVe8aNJzaZt9oJfL3M+zStVpHTtw==

Add "clock-output-names" which is a standard property for clock
providers.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../bindings/clock/renesas,9series.yaml       | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
index af6319697b1c0..5590f04147612 100644
--- a/Documentation/devicetree/bindings/clock/renesas,9series.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
@@ -52,6 +52,10 @@ properties:
     items:
       - description: XTal input clock
 
+  clock-output-names:
+    minItems: 1
+    maxItems: 8
+
   renesas,out-amplitude-microvolt:
     enum: [ 600000, 700000, 800000, 900000 ]
     description: Output clock signal amplitude
@@ -83,6 +87,38 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0241
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0441
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 4
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0841
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 8
+
 examples:
   - |
     /* 25MHz reference crystal */
@@ -101,6 +137,7 @@ examples:
             compatible = "renesas,9fgv0241";
             reg = <0x6a>;
             #clock-cells = <1>;
+            clock-output-names = "DIF0";
 
             clocks = <&ref25m>;
 
-- 
2.43.0


