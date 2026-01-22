Return-Path: <linux-renesas-soc+bounces-27287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKq5OR5BcmnpfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:24:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9026C68B01
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CE8D3040449
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 15:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F3336920D;
	Thu, 22 Jan 2026 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ouqf/x0W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716AB257848;
	Thu, 22 Jan 2026 15:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094841; cv=none; b=Uz25bm9S99biraRYXGaoRnoL9UdIW7XPjT8voS3jGoTbO+PU45dEXk40c++0RN13OwlFZYEz6YSr8GkrHwMkya0rFydOrSHoAx0V8mI5tUtZEG3uZJ9f/O5TomW3GIzPlHtY6nG4tjwCbdgjg0WZcWzMHs6yqJj0+KcUgn41cPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094841; c=relaxed/simple;
	bh=ENAyw5SdLy55pSt9WmNMmWrG/D0AdkQKgkV/d/Gazvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mbyh/LXMCbhqzW36kUcaocU9wDzIq+skwrygnBoSSlIkIn6G7FCpqtva02u1ep5PaudAPk/mf6yVc4JmjyK9cg4UUGWUsfMq0Te9aK9wf3A09VvYfTcR5NHifQuyn6YLN6cNvyKjREHq9chvs6okGdJ7d0yV3n5FDxxrz6o4NaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ouqf/x0W; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CA471C21AA8;
	Thu, 22 Jan 2026 15:13:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F172E606B6;
	Thu, 22 Jan 2026 15:13:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D41F7119B82BD;
	Thu, 22 Jan 2026 16:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769094836; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BmUZvACDm6QqUUV043UM4+MxgOt/q7ysDmHWlsGNQFM=;
	b=ouqf/x0WUus5o/gGvjNRcD45jrYDU7DrxgKYVc7Zgr2HvVPpZsRiEpSyI50Ifmg5AmcSyK
	UHskFuKKrcZeZ9/8YVD966rdvC9h0Idn8YYDzgq+irfAles/sx1o4dXFMSJVzACkuCjbfK
	K8Z5C+vLSLJCr8TkjksXx6kfXS8KJMvDKD93osC/KBtpdJHVzqjSwN9V5+6puWPBWz/fVd
	KwzMASO7hHR5tBe4aKQ6rnQbZgymXIJmHZ4u2gRO8A0pBEi9HZTGFWjh8m6tAtzQUzsSqD
	R25HHy6H/aF0AtQvWsl/hB3nY3PJhQj+JSwe9i8DGv+9Bo72uYPXJw1ezhUPQQ==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Thu, 22 Jan 2026 16:13:27 +0100
Subject: [PATCH v4 02/15] spi: dt-bindings: cdns,qspi-nor: Add Renesas
 RZ/N1D400 to the list
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-schneider-6-19-rc1-qspi-v4-2-f9c21419a3e6@bootlin.com>
References: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com>
In-Reply-To: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Vaishnav Achath <vaishnav.a@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27287-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,sang-engineering.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,2.98.109.136:email]
X-Rspamd-Queue-Id: 9026C68B01
X-Rspamd-Action: no action

Add support for the Renesas RZ/N1D400 QSPI controller.

This SoC is identified in the bindings with its other name: r9a06g032.
It is part of the RZ/N1 family, which contains a "D" and a "S"
variant. IPs in this SoC are typically described using 2 compatibles:
the SoC specific compatible and the family compatible. The original
Cadence IP compatible is dropped because it is unusable on its own.

Indirect accesses are not supported by this flavour of the Cadence IP,
which means several properties have no meaning in the scope of the
Renesas compatible. Let's make sure they are no longer expected nor
mandatory.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 33 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
index e005869a76c8..43625f41131d 100644
--- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
@@ -61,6 +61,20 @@ allOf:
         cdns,fifo-depth:
           enum: [ 128, 256 ]
           default: 128
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzn1-qspi
+    then:
+      properties:
+        cdns,trigger-address: false
+        cdns,fifo-depth: false
+        cdns,fifo-width: false
+    else:
+      required:
+        - cdns,trigger-address
+        - cdns,fifo-depth
 
 properties:
   compatible:
@@ -80,6 +94,9 @@ properties:
           # controllers are meant to be used with flashes of all kinds,
           # ie. also NAND flashes, not only NOR flashes.
           - const: cdns,qspi-nor
+      - items:
+          - const: renesas,r9a06g032-qspi
+          - const: renesas,rzn1-qspi
       - const: cdns,qspi-nor
         deprecated: true
 
@@ -163,8 +180,6 @@ required:
   - reg
   - interrupts
   - clocks
-  - cdns,fifo-width
-  - cdns,trigger-address
   - '#address-cells'
   - '#size-cells'
 
@@ -231,3 +246,17 @@ examples:
         cdns,fifo-width = <4>;
         cdns,trigger-address = <0x7fff0000>;
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+    spi@40005000 {
+        compatible = "renesas,r9a06g032-qspi", "renesas,rzn1-qspi";
+        reg = <0x40005000 0x1000>, <0x10000000 0x10000000>;
+        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&sysctrl R9A06G032_CLK_QSPI0>, <&sysctrl R9A06G032_HCLK_QSPI0>,
+                 <&sysctrl R9A06G032_HCLK_QSPI0>;
+        clock-names = "ref", "ahb", "apb";
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };

-- 
2.51.1


