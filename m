Return-Path: <linux-renesas-soc+bounces-30509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOxjNaLmxmnrPwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:20:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 360C634AD9D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96B493062480
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDD839DBFF;
	Fri, 27 Mar 2026 20:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CT635IC3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27961393DD3;
	Fri, 27 Mar 2026 20:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642282; cv=none; b=pmdJ42qbPm+DYv+bditVKA2YBu3rocFcsloEoZ/LXKOVtd+hHM5B7b51EmsuPWxi0psK4wdDYCvVj31ucLZSj6sWkWLmhqy65lmM8MNdkWEtB4Bl1ZsrDFRiMpNa00zTIB49doj12kTX364Ak03k841JTmv6YYNjyMWsijvTmhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642282; c=relaxed/simple;
	bh=dVZyfeEgrkGYmDshoQsQ4RLpKkjU6LGopLTjHakrndA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ud3MI6bcyaUsHhIkvkbWI56vnVk7mNJBhXrS6wroIwlljmJP1HFShOOZZ0Kvp07NgcJgmDaqsYnbxlfxyekJlvygH5gPKLGAwz1njlp4rMiXbibx3MYppouG8CdnN7iMnYNlk5wgSAyk2mlnlTJkTIBsrlI7Syzdh83oxPmldyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CT635IC3; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DFC971A3033;
	Fri, 27 Mar 2026 20:11:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B404060268;
	Fri, 27 Mar 2026 20:11:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6938510451AF7;
	Fri, 27 Mar 2026 21:11:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774642278; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DIlrp9PjoRowHYZrJ7gc0fvN1Nwlk04nBRTDWt8Ig3w=;
	b=CT635IC3QQJ9j3PVQe+py5sJkt2oMZwPoLThB5jvtWnOVqrWOrq06xqGcCgdgXoHJrXMr8
	uwoBdNqh6pcF5Rb6AZPWqVjjWhdlSOKjY7aMMMQjEtKclEDtR7TWilFV65QqoTtDTO5uFA
	+mBgamfOadbous7asK2oPVEV9yM6mVd01qKXYoeUloq9u2tbyrhHNyQP1SqbY42kbsoFOk
	3+NjTBkXzG/FgzWZMF3aXuqFHqfpDssBTR/MrXgdQdQvtMrVvcyyK64rqJqZr6jTryo5Vv
	heas5wAdL2apG+2aZufBT46a39qq+r7cwH1GQpZKtc8/8YZ0+2IZXdgDKta5LA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 27 Mar 2026 21:09:38 +0100
Subject: [PATCH 16/16] ARM: dts: renesas: r9a06g032: Describe the EIP-150
 block
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-schneider-v7-0-rc1-crypto-v1-16-5e6ff7853994@bootlin.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Jayesh Choudhary <j-choudhary@ti.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Antoine Tenart <atenart@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30509-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[2.99.68.96:email,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.2:email,2.99.21.128:email,2.98.246.64:email,2.99.5.224:email]
X-Rspamd-Queue-Id: 360C634AD9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The EIP-150 is composed of 3 blocks:
* An interrupt controller named EIP-201 AIC
    - fed by a clock coming from the EIP-150
    - connected to the main GIC
* A random number generator named EIP-76
    - fed by a clock coming from the EIP-150
    - signalling interrupts through the AIC
* A public key accelerator engine named EIP-28
    - Fed by a clock coming from the EIP-150
    - Signalling interrupts through the AIC

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 42 ++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index f4f760aff28b..6aaa93ed03d6 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+#include <dt-bindings/interrupt-controller/inside-secure,safexcel-eip201.h>
 
 / {
 	compatible = "renesas,r9a06g032";
@@ -170,6 +171,47 @@ usb@2,0 {
 			};
 		};
 
+		eip150: bus@40040000 {
+			compatible = "inside-secure,safexcel-eip150", "simple-pm-bus";
+			clocks = <&sysctrl R9A06G032_HCLK_CRYPTO_EIP150>;
+			#clock-cells = <0>;
+			clock-map = <&sysctrl R9A06G032_HCLK_CRYPTO_EIP150>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x40040000 0x40040000 0x10000>;
+			status = "disabled";
+
+			eip76_rng: rng@40040000 {
+				compatible = "inside-secure,safexcel-eip76";
+				reg = <0x40040000 0x80>;
+				interrupt-parent = <&eip201_aic>;
+				interrupts = <AIC_TRNG_INT IRQ_TYPE_EDGE_RISING>;
+				clocks = <&eip150>;
+				status = "disabled";
+			};
+
+			eip28_pka: crypto@40044000 {
+				compatible = "inside-secure,safexcel-eip28";
+				reg = <0x40044000 0x4000>;
+				interrupt-parent = <&eip201_aic>;
+				interrupts = <AIC_PKA_INT0 IRQ_TYPE_EDGE_RISING>,
+					     <AIC_PKA_INT1 IRQ_TYPE_EDGE_RISING>,
+					     <AIC_PKA_INT2 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&eip150>;
+				status = "disabled";
+			};
+
+			eip201_aic: interrupt-controller@40048000 {
+				compatible = "inside-secure,safexcel-eip201";
+				reg = <0x40048000 0x4000>;
+				interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				clocks = <&eip150>;
+				status = "disabled";
+			};
+		};
+
 		uart0: serial@40060000 {
 			compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart", "snps,dw-apb-uart";
 			reg = <0x40060000 0x400>;

-- 
2.51.1


