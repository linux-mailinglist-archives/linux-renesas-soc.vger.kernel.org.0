Return-Path: <linux-renesas-soc+bounces-27587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE+hK34ke2nXBgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:12:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B40BDAE005
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3119D300BE22
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 09:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F2737F72C;
	Thu, 29 Jan 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7Q2H2FO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CEB37B3F6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 09:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677879; cv=none; b=o840+08KuQ//knHvNOEfyvE7u6oUh5soQfyz8PveFUGPGiE6RtFSFThAS80fIbgl7mihe6cIHgT1yLAhg2KSbJazM4znIxYfNQd5mUuuSAqr7FfhBoArwJXilCRb7hpOTJb2thpkcVbqxAWqJzIoEsOq4MActhD6zAEFKIp0vKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677879; c=relaxed/simple;
	bh=pqS0iTnZy+TD7iR+ETY3i6A5U7dU6kE1UlBEw/91Vl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Esz5jOb1G8KJjj7sVjxNKlX0j28QY35VPfTgDK3RSRNNvzXN4n5r+EA66SL+Jv/6s2vXrblprLhViCKNdWiKbcjPrZNGpoQXJWx8ire3ioHpIIwIh+uoti0Y0YtFe/8bRsRiyPli7Av4k1IQ+hWDumABKoS7tqEH/LO60R42sW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7Q2H2FO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so5494725e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 01:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769677876; x=1770282676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9LVqcaf1ijJnoQzqgdsz1n58Lr+Jp/HnhYJrE/7aVo=;
        b=i7Q2H2FOJuJqQ6evr5ZAUmrWOPaWhS8LsPiJbe9SsPfIU9hnm+isrsvBeaeMs8FdQ4
         ZtODem4Jcs/+SeuLhvt8mgaXvrwcP+TkN+pm0oYcTmW6OOrpgNC9o/rwr2H92CNhbtnY
         47wt5VvZEnbR8EKbRh5yope1SiGqp7smrX9cqV/njgnaMGspWXzmmYsx+q+DWAEMsPfj
         5j8uTqp8dm0CWEGojfTdAhLcPhaJW8ugUZw0QeQfV2ZTEyN+lZRRURuuBL89yj4oQ7MG
         S2FKbbXGGeUEtIqoI+GKZYtqeBl/G9Lup9uls7FdC6m88VR/IAZGs8LDS/qDC7Mbaz4D
         pSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769677876; x=1770282676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y9LVqcaf1ijJnoQzqgdsz1n58Lr+Jp/HnhYJrE/7aVo=;
        b=gJ+O+XbcwGDEra8/s25UK8iULScNKPmkkVvtxctXnf2XGnF220sFsro1BQCUjiyQkr
         8pZTzxbgcoB/eZmWyhY27m0E8ycOsvnPC1WJnlGlKyZ02Z5z2RLGEQjQgU6o3EPc6ZZa
         YTxLSCu4mUYaWdwNF3/giPmvg5OqSdNBjL63Ju71ywZhu2yp5CNPxLJuhfBCiqstw7+H
         HT0iPui3YAIAwVGG+EhUbKtrG/qV/uZPij5z2QMPWWKd0x0rTb4mi/gIgKp1q45bvh/i
         GD9z9wED9RdHca0in0lf5VyuyDNMsOznx4d2eF5aTpPHY6klizQmOjOJZNoV9eq6T5Rf
         BcdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvmLe+XPoyQRC++QK8vBbC3LhZBJpy9nFx+ZLKQnzkAgXL0Wyk+6DpxtL+zkPjLXhFGJehZ7bJq5wcsjj+4LECbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUgU+/Y/vLJ2D9h96hzeKeteEv3ExZHc9DCFPZZyGEvkMTZHVh
	tnm7EDxHIlmkSKU/Il/LnRjGVNib5iUmkIUDHwFGUQAyFn9mMC2JdO1e
X-Gm-Gg: AZuq6aJdZl4vHAFLFZH1VwmL/RP6sDrf5CIFhFCRN7+4CoxrPJT94crjBybDHO99GpQ
	kV2sQ4hWU7qUbNVFujakLm/o23rX8QJipxoUVVgzigg+5pyi6PKy5bylqsfoWVMWuh60Fd7O1tS
	Nqbq84kybtzRrgs6RxMzJLF9EGTIyFOa+2d3HcCQ/MN18EKSGloFtIETtx/7RLiEKAneVpHPppr
	l/wn6lMcFIZRdj5Q9QnzHDm0gDYUEdXisV+azrJ4yeHtCJRvxqlPMcmsG0cDaOtWYWdR7fLe6cL
	VSh1pvWb3vLzkKKHd9t+M9tQ6BCLkKp5cCQkOCgMzl98I6wbPy/SvRyEu4LGVXFA3PNjK8wcfzi
	EfzXkCsj0z+STuO4UZa08tOBCRSYf98cNWaWWU0+MwQ5G/uWmD5bk8Cg9qyDyxIU/vggAiIgNPO
	E8bSfRg+noso7Dy3S7
X-Received: by 2002:a05:600c:4f4f:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-4806c7cc86dmr103201195e9.16.1769677875603;
        Thu, 29 Jan 2026 01:11:15 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm175338875e9.2.2026.01.29.01.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:11:15 -0800 (PST)
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
Subject: [PATCH 9/9] arm64: dts: renesas: rzg3l-smarc-som: Enable eth1 (GBETH1) interface
Date: Thu, 29 Jan 2026 09:11:00 +0000
Message-ID: <20260129091108.95277-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
References: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27587-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[2.220.108.0:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email,0.0.0.7:email]
X-Rspamd-Queue-Id: B40BDAE005
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable the Gigabit Ethernet Interface (GBETH1) populated on the RZ/G3L
SMARC EVK. Also add pincontrol definitions for GBETH{0,1}.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  1 +
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 2f918830b8f1..58733016b66b 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -14,6 +14,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
 #include "r9a08g046l48.dtsi"
 #include "rzg3l-smarc-som.dtsi"
 #include "renesas-smarc2.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index f52af01a7eff..0b9bb073c282 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -10,6 +10,7 @@ / {
 
 	aliases {
 		ethernet0 = &eth0;
+		ethernet1 = &eth1;
 	};
 
 	memory@48000000 {
@@ -23,6 +24,8 @@ &eth0 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
 
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -30,6 +33,19 @@ &eth0_rxc_rx_clk {
 	clock-frequency = <125000000>;
 };
 
+&eth1 {
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-0 = <&eth1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&eth1_rxc_rx_clk {
+	clock-frequency = <125000000>;
+};
+
 &extal_clk {
 	clock-frequency = <24000000>;
 };
@@ -53,3 +69,79 @@ phy0: ethernet-phy@7 {
 		txd3-skew-psec = <0>;
 	};
 };
+
+&mdio1 {
+	phy1: ethernet-phy@7 {
+		compatible = "ethernet-phy-id0022.1640",
+			     "ethernet-phy-ieee802.3-c22";
+		reg = <7>;
+		rxc-skew-psec = <1400>;
+		txc-skew-psec = <1400>;
+		rxdv-skew-psec = <0>;
+		txdv-skew-psec = <0>;
+		rxd0-skew-psec = <0>;
+		rxd1-skew-psec = <0>;
+		rxd2-skew-psec = <0>;
+		rxd3-skew-psec = <0>;
+		txd0-skew-psec = <0>;
+		txd1-skew-psec = <0>;
+		txd2-skew-psec = <0>;
+		txd3-skew-psec = <0>;
+	};
+};
+
+&pinctrl {
+	eth0_pins: eth0 {
+		txc {
+			pinmux = <RZG3L_PORT_PINMUX(B, 1, 1)>;  /* ETH0_TXC_REF_CLK */
+			power-source = <1800>;
+			output-enable;
+			drive-strength-microamp = <5200>;
+		};
+
+		ctrl {
+			pinmux = <RZG3L_PORT_PINMUX(A, 1, 1)>, /* MDC */
+				 <RZG3L_PORT_PINMUX(A, 0, 1)>, /* MDIO */
+				 <RZG3L_PORT_PINMUX(C, 2, 1)>, /* PHY_INTR */
+				 <RZG3L_PORT_PINMUX(C, 1, 1)>, /* RXD3 */
+				 <RZG3L_PORT_PINMUX(C, 0, 1)>, /* RXD2 */
+				 <RZG3L_PORT_PINMUX(B, 7, 1)>, /* RXD1 */
+				 <RZG3L_PORT_PINMUX(B, 6, 1)>, /* RXD0 */
+				 <RZG3L_PORT_PINMUX(B, 0, 1)>, /* RXC */
+				 <RZG3L_PORT_PINMUX(A, 2, 1)>, /* RX_CTL */
+				 <RZG3L_PORT_PINMUX(B, 5, 1)>, /* TXD3 */
+				 <RZG3L_PORT_PINMUX(B, 4, 1)>, /* TXD2 */
+				 <RZG3L_PORT_PINMUX(B, 3, 1)>, /* TXD1 */
+				 <RZG3L_PORT_PINMUX(B, 2, 1)>, /* TXD0 */
+				 <RZG3L_PORT_PINMUX(A, 3, 1)>; /* TX_CTL */
+				 power-source = <1800>;
+		};
+	};
+
+	eth1_pins: eth1 {
+		txc {
+			pinmux = <RZG3L_PORT_PINMUX(E, 1, 1)>;  /* ETH1_TXC_REF_CLK */
+			power-source = <1800>;
+			output-enable;
+			drive-strength-microamp = <5200>;
+		};
+
+		ctrl {
+			pinmux = <RZG3L_PORT_PINMUX(D, 1, 1)>, /* MDC */
+				 <RZG3L_PORT_PINMUX(D, 0, 1)>, /* MDIO */
+				 <RZG3L_PORT_PINMUX(F, 2, 1)>, /* PHY_INTR */
+				 <RZG3L_PORT_PINMUX(F, 1, 1)>, /* RXD3 */
+				 <RZG3L_PORT_PINMUX(F, 0, 1)>, /* RXD2 */
+				 <RZG3L_PORT_PINMUX(E, 7, 1)>, /* RXD1 */
+				 <RZG3L_PORT_PINMUX(E, 6, 1)>, /* RXD0 */
+				 <RZG3L_PORT_PINMUX(E, 0, 1)>, /* RXC */
+				 <RZG3L_PORT_PINMUX(D, 2, 1)>, /* RX_CTL */
+				 <RZG3L_PORT_PINMUX(E, 5, 1)>, /* TXD3 */
+				 <RZG3L_PORT_PINMUX(E, 4, 1)>, /* TXD2 */
+				 <RZG3L_PORT_PINMUX(E, 3, 1)>, /* TXD1 */
+				 <RZG3L_PORT_PINMUX(E, 2, 1)>, /* TXD0 */
+				 <RZG3L_PORT_PINMUX(D, 3, 1)>; /* TX_CTL */
+				 power-source = <1800>;
+		};
+	};
+};
-- 
2.43.0


