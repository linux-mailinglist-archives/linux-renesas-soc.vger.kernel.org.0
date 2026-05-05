Return-Path: <linux-renesas-soc+bounces-32009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIR/JTeZ+Wm2+AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:16:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDD84C7B92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 01017300B9E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 07:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556693D524E;
	Tue,  5 May 2026 07:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMs30s6n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B613DF00C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964536; cv=none; b=GLrMxI9dkYVYr9byDrGy0dcbqzRr0SBgmIPBspPybQTG4tACoPVCWaZPbQNTHDZuCWJ6n2TSOlVPYEhAPJSpKQ6TZm5G3OcgU+2zZBhBk8d42nO9jG00JfYsCJ6QlRdsDLNHaY6YgGGlWlJLDdpSykxBXkDDaHzsYxGE436x8vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964536; c=relaxed/simple;
	bh=iHfi4qBDrEwjYuv1vedv6xVdNftnQD0gzac0f7qxf7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJUn3SrNCKdD1kjFSNZKQHZGeMWkfqbdZ3FSwVRQ3GJEATURDtuyVXqh930KCg16taKwZbRptz8nEDP868nALo3ZZlZF5seZnDf3BXm9T4KU3tBbELh6ffNnmTb1AH+RSycpEvB/yQ6/5SmU7Hw8JpvFPnNtAloo8fy5zhJ19zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMs30s6n; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso24722285e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777964533; x=1778569333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WorZYhOoTBDaWVLEYTDQ9XR3zgZj8QwE6iKO1vmk6Wc=;
        b=QMs30s6nkcVF8n/ytv063vcobyqOglL40irWZasABYDQ+1TGGaeemdeo3TwLVW9/sK
         KcsywIu1dNFDfvdCcobu8dgMCVDPGebiz5MT+N8b/TShUSrkHqb1MJARWYVh3wauaw5r
         hLSW/Ru4ImeFNG4yuhN3iOL8u3bjfMb4PxiY5z1I8Ib0MwG4OoX7YzsAm+5xBbc6/AE0
         lamZdsuWhgF6GkQoV7az9YlvnmhGaaw/VWA/ha9yAeJGInH24KSMxUDokMc6jNgcq8qK
         9QKXL03UoQpHgcS6Hd+g1AjG1C08itBLLfkO/uuJAkHCJJU3YciBJ60FzYOJ5Wu/HHYj
         AQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964533; x=1778569333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WorZYhOoTBDaWVLEYTDQ9XR3zgZj8QwE6iKO1vmk6Wc=;
        b=l87giNPZOxBxhGyYwsNhY0K532e+9DStO2FRlcGOUTcwbHtaYN8C47O9/IWqK6UPWz
         cBlv9kL2T7Rk1KDTRfvsGxSzXKKYnCf6l0FTXaw22VlA2vkHqvAZCO03ZEnc6uBwtClw
         JJWiQyA3uGxNkl572g6/OAV2m2Y+tnwPLjBB8gqweBJ0Wsdq1CR4CNUWnfOi+fXYD238
         cXC6ML7PW7qWqkRmnS74X3DofFRF927gqU3OCeQxBZ2ocv6HRgWyKq8O09U5qI7JixzX
         R8agFjWedKAlNbh9UkZ8pBd7mCMBrQWeDQCQCH/9lDSX9w3t2i1Ho7qDUwn730NYxtn1
         DGJA==
X-Forwarded-Encrypted: i=1; AFNElJ8FLnA9wdyZSnyRfNI4Ki3nOg4EHRCBD7HQPdoRHR/4G77fVjqT5sf1hecrUZedo8S3Ct3tc0k0oitXIxCtHhPZKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/yUohMnnOEj4OWUuzkSmngs26PJSBqNK+ZRqlDBFCfr6xfM24
	3Q/sJb3PVtKxw/rEFA/1ztjRbiZuqfDYNYuMZxbA1rJjJT5Qdk1zjdX4
X-Gm-Gg: AeBDieuQ4qzQNI30DVZM9pLD81FP3x4BUn82exzD5z3UQ+wXRaCPHqojQ6cQtGKwLV8
	sT1lblBISTzpTQD+vA6wGHdq0tv0MaGvBMV+Muh0CsI6KHXQR46vv+HqCLSbW/ndUYWhi5oAlBN
	XEZnmz1V3iLQugKTbeA1WENie+htgMe8B99gE4YFdWghAWxCSENzz0QqjocKKQoxArTWtt5RvzQ
	0g8lwLYL/SlczQW9uvOxtepkFkzGxLRG0UqZNmnF5IRkHLLAtLovDzpBJ3dytAxXw9EzqAhcfBH
	DM1I4JxU/P3Gm/S7MXyTtdsvAXqQl0EZAIQXG2eLbAsmENlqnUfFVjQ4NyQbFePHZ16o8NC4NXJ
	Bjnj32KV3AkoRM6VK64boPG6DE+WY+fdOu0nOwXgok/bMDK6GJwieqiKE6kGn0yNEybfgftRlK8
	sDqfCkUN5JHjDnnAUshI8iBTXa8UtNNHDvu/eevKK/fzDEjbY5MzGXTz3DngQ=
X-Received: by 2002:a05:600c:628c:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48a988be16emr216544795e9.21.1777964532044;
        Tue, 05 May 2026 00:02:12 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6ffb7sm329473105e9.5.2026.05.05.00.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:02:11 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/4] arm64: dts: renesas: r9a08g046: Add i2c{0..3} device nodes
Date: Tue,  5 May 2026 08:01:55 +0100
Message-ID: <20260505070206.7932-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8FDD84C7B92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32009-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add i2c{0..3} device nodes to RZ/G3L ("R9A08G046") SoC DTSI.
As the place holders for i2c0 is removed, add the pincontrol
device nodes to make it functional on the board DTS.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 83 ++++++++++++++++++-
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 11 +++
 2 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index f0dbd700b538..8abf4ec28df1 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -257,10 +257,91 @@ scif5: serial@1004e000 {
 		};
 
 		i2c0: i2c@100ae000 {
+			compatible = "renesas,riic-r9a08g046", "renesas,riic-r9a09g057";
 			reg = <0 0x100ae000 0 0x400>;
+			interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G046_I2C0_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G046_I2C0_MRST>;
+			power-domains = <&cpg>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			/* placeholder */
+			status = "disabled";
+		};
+
+		i2c1: i2c@10090400 {
+			compatible = "renesas,riic-r9a08g046", "renesas,riic-r9a09g057";
+			reg = <0 0x10090400 0 0x400>;
+			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 337 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G046_I2C1_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G046_I2C1_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@10090800 {
+			compatible = "renesas,riic-r9a08g046", "renesas,riic-r9a09g057";
+			reg = <0 0x10090800 0 0x400>;
+			interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 344 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 345 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G046_I2C2_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G046_I2C2_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@10090c00 {
+			compatible = "renesas,riic-r9a08g046", "renesas,riic-r9a09g057";
+			reg = <0 0x10090c00 0 0x400>;
+			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 353 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A08G046_I2C3_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A08G046_I2C3_MRST>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		canfd: can@100c0000 {
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index da6f02287944..6d86b88ce104 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -11,6 +11,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
+		i2c0 = &i2c0;
 	};
 
 	memory@48000000 {
@@ -50,6 +51,11 @@ &extal_clk {
 	clock-frequency = <24000000>;
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+};
+
 &mdio0 {
 	phy0: ethernet-phy@7 {
 		compatible = "ethernet-phy-id0022.1640";
@@ -144,4 +150,9 @@ ctrl {
 				 power-source = <1800>;
 		};
 	};
+
+	i2c0_pins: i2c0 {
+		pinmux = <RZG3L_PORT_PINMUX(L, 2, 4)>, /* RIIC0_SCL */
+			 <RZG3L_PORT_PINMUX(L, 3, 4)>; /* RIIC0_SDA */
+	};
 };
-- 
2.43.0


