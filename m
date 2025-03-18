Return-Path: <linux-renesas-soc+bounces-14561-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3B7A66F1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 09:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA463420894
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 08:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752ED201000;
	Tue, 18 Mar 2025 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hjs+AQXy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BF51A3056
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 08:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742288060; cv=none; b=D3+xxcXXBp6n6Ym/WVSmUF5X5zjA/LsWYcde1GP9IR5dvWk/81mZ52MXnEk24a3tKevx+h5e0wxUEGUCS0+zDyEVzmbYdukonOoQyM72QSEzDo+kG8L6oYdg1IeGULUSwp3LNY5StqsM/XXeZF27JBPyK1RVOEDP/WThYAMa9zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742288060; c=relaxed/simple;
	bh=Js9/nS+MIPxyikfrAQwlchDX6ZwWrhrB5CNrGfZ+bo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q503zYJTDmia2KVlzyDWeKVBzE3v0VZdv3gKoCQlXSqsk8abw98xK0KSvg+Gt3m6g+t4tKZeviSwHU9IKGV5LglrwkrGusPcD/JCZNqdYKm5txlfT27OMez6fiSam4BKza8BXXbGPPeyj7xkct2cFa3CsRjugOMhyX/zo7SYyHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hjs+AQXy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=2ayO8Klm1vIIw2
	4IPuB7XQ4nODfqD+hrTlr7Ibbi9e8=; b=hjs+AQXy1ZWv1t3r++oPCwtEhGKvzW
	2g8sEqKy8vHUWkw/hyir3kQ9XJ3KfK3MatMiz9W5Uo4PnZMPQthJGCkPA4g1o+8A
	GVBxDoRI57WC/1zCGqsi8yzqNsO/dfWzrY9xSZePY/G/pRIfwyIVOgCGpuDUj7uH
	1vhd906h9TXu2Nu2NKpcrLr2gpAJpcsbiHlSQ0xfun16p0xYxQaHgSnh8h+LqlXG
	LCC8HoWfqMJtg+D6uRjxTxhkX4xk5ElErsI4S+MDw5GQzvZaU/27o8fqvsJrUv61
	5ZTcr9VroDBUI+kWmcGvzceHV4t5MTAloa1c4rULhgJC9YfEvfbuyi3A==
Received: (qmail 3650562 invoked from network); 18 Mar 2025 09:54:13 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2025 09:54:13 +0100
X-UD-Smtp-Session: l3s3148p1@/tp6DJowMNggAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: serial: snps-dw-apb-uart: document RZ/N1 binding without DMA
Date: Tue, 18 Mar 2025 09:53:53 +0100
Message-ID: <20250318085353.18990-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renesas RZ/N1D has this UART with and without DMA support. Currently,
only the binding with DMA support is described. Add the missing one
without DMA support which can fallback even more.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../bindings/serial/snps-dw-apb-uart.yaml     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 1c163cb5dff1..645b14ffde90 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -13,6 +13,20 @@ allOf:
   - $ref: serial.yaml#
   - $ref: rs485.yaml#
 
+  - if:
+      properties:
+        compatible:
+          items:
+            - enum:
+                - renesas,r9a06g032-uart
+                - renesas,r9a06g033-uart
+            - const: renesas,rzn1-uart
+            - const: snps,dw-apb-uart
+    then:
+      properties:
+        dmas: false
+        dma-names: false
+
   - if:
       properties:
         compatible:
@@ -30,6 +44,12 @@ allOf:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - renesas,r9a06g032-uart
+              - renesas,r9a06g033-uart
+          - const: renesas,rzn1-uart
+          - const: snps,dw-apb-uart
       - items:
           - enum:
               - renesas,r9a06g032-uart
-- 
2.47.2


