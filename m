Return-Path: <linux-renesas-soc+bounces-31829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOL3MWpS82lnzQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 15:00:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A5F4A313C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 15:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47DDD3019822
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F98C4218B3;
	Thu, 30 Apr 2026 12:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3xXQgeQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B4040F8E4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553638; cv=none; b=nweDSJb7vExZp0tCLjajwQn2iGLQSpbswvzT6BqlDw0oRXxatm4PMIYojZt1F9j5hGh3jxyn7Cj48zKZcLH+Oro4DnPyvLSR9QBo1mfK12ChyBjJI4vweAmSgxLk2K7V7w4cR4nboC9D6p80mI0epXzPIZiC6D/O0qbZBu0XxrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553638; c=relaxed/simple;
	bh=RKgftYwLZm9ZGB9SUzhmAcs8FH11+yEFMapqpF+AAXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bG/oGvvcILmbDjWUm5rpZjtluY0jMa/Clqzn3zBomJaMhyz5mHwW3AKn6BGc8W8UYiFIc5R3+7qkYhGIaOCCVAHdfHNVxpjp/P26/Jsa7ub7N7sq0iNwpwNg3gCJC10LsxV2Xa5KDSH5mpLSFJopAl0045TBcWfN+zbGYEyomy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3xXQgeQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d75312379so1221775f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777553633; x=1778158433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ui9wMRPRd5WRi+7Ed1qkDLUf56FuZLXbegfJioV/+c=;
        b=e3xXQgeQ+1SeOBl7dPMOJcmlczj7DcTyqNJjQAHoN7lYFzP7YY1R5f582vPEWh7U53
         OeId/INBuVnTsAUw3GcX+a8mHI9bmpd9zTq3FQHrpwsLLwUS7yPuEsJrOmwwbYyhz0cr
         xM6OpTrjjcQZhCyyAFj6xPKezUk9d53QbKllSaiSW9rgpAaLOd0WU5+RcIsQlx2Ux7gQ
         oMMGmE27FDO0hd0BoKIRrlrNgcdu0rZ9bvRLeVXI9f3PL030cK0jZmEjVAT7vl5YxyWY
         /cZ1YfDsmB+QeB8ntNFhFX20toLtb2+HOecjruvHIT4lviyU5lT6AkU5Z46zd+bDH0aJ
         VkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553633; x=1778158433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ui9wMRPRd5WRi+7Ed1qkDLUf56FuZLXbegfJioV/+c=;
        b=dNdCvQQ6wAE6rmgOyGcSWr5vtg+FcjRxGey6e7iocqLzdRa7K1H8lvRTeWlv3ejtmA
         qsRK2cfKcb1PdZ4FEf1RaFVh5IWQ0Gf0TcJc9UAktjqvuRmZfMBSFGMzHHBiIpWtTAgu
         l9BlP4Ujm6eYwRDiYquLwTybqiqspbqx+qTXPprOeGEcy+J7cEPkJN+OqffZKegivMWY
         QsgumHv2EHnWyY5/36F0IVWoBNm8w4f89HVLiBJUMAjcxBts9UDx5DkaHo2MLgULSSAK
         uwSpgJe7aZ4VKeSXLJkwjS/BqJN1+zsdtWeAjvuPDFVfPNd9OoUPMFZ/nCfChzybyWM/
         rZAw==
X-Forwarded-Encrypted: i=1; AFNElJ+VXGvWTKnBBmOVuOrITx58f/BkkkO2VfO7CzwnUvRG9smQ47grSBoi5/f/CDpbgHky1bni/65siS8PZJvBd4SdRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxZO5SKO0Jsh1uodoBkpeqmEEGP7JhUI+0AMa2P8nfOGra0KeD
	tuCq4XgyOsKJwvd8aOwW0axyZYlXoP4M5jjQ8zLNs1JErbZnP1EhZKoU
X-Gm-Gg: AeBDievI7n/0KXVAAL53IuP77CH2lTkuTZwYo/lVx/SQhsN3Y42T5oPRfHaXtoCighO
	iPOmCZMnHvXZU2GTMqxx+TWvHM3QV4FNtxWsZ0oTtp8AWqF0DfrjHbhXrk7wD0isuiONCa2Ckdb
	s4Zp0CBi46oTmJrp9CKVPej6qRwRDUa9M5JnLfc1lVzE0J6DokJtUK6JI3lCYK/BvEjS3yg5WCB
	3f3wXaMlB4SY2SRUe2ISoRZzy5MwOUQ2aD4ahKBbKvEh2tTaQqt3TkhIv3PUEHtw3lKOUfidG3E
	AWpkHWtBv3KKgZjfV61sZ1E53jd1qeLX679MDjMeSNEo62eu5JQ8WK8HKtCZ+TxaevTGzIjRA5V
	T73rs25dN7rYHhJq5V2tImHdzrTGIXiW5oiRCLFvLiKsJK1J4kV67gLhQcQJgyhoqqaNLx6OCSW
	CPEDad/Q5d7+gJEa5sWEtC07zNIRGwKAPJ7is8UQA=
X-Received: by 2002:a05:600c:8b62:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48a8609bebdmr41523175e9.14.1777553632363;
        Thu, 30 Apr 2026 05:53:52 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3057ecsm40995825e9.20.2026.04.30.05.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:51 -0700 (PDT)
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
Subject: [PATCH v3 5/6] arm64: dts: renesas: rzg3l-smarc-som: Add pinctrl configuration for ETH0
Date: Thu, 30 Apr 2026 13:53:09 +0100
Message-ID: <20260430125342.439755-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B0A5F4A313C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31829-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.7:email,bp.renesas.com:mid,renesas.com:email]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add pin control configuration for the ETH0 Ethernet interface on the
RZ/G3L SMARC SoM board and also enable hotplug support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * Split from patch#6
 * Added hotplug support.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  1 +
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index acead2b1c842..0ae052238b3b 100644
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
index fb781d9035aa..d0516d7db8ba 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -23,6 +23,8 @@ &eth0 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
 
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -38,6 +40,7 @@ &mdio0 {
 	phy0: ethernet-phy@7 {
 		compatible = "ethernet-phy-id0022.1640";
 		reg = <7>;
+		interrupts-extended = <&icu 3 IRQ_TYPE_LEVEL_LOW>;
 		rxc-skew-psec = <1400>;
 		txc-skew-psec = <1400>;
 		rxdv-skew-psec = <0>;
@@ -52,3 +55,32 @@ phy0: ethernet-phy@7 {
 		txd3-skew-psec = <0>;
 	};
 };
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
+				 <RZG3L_PORT_PINMUX(C, 2, 15)>, /* PHY_INTR */
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
+};
-- 
2.43.0


