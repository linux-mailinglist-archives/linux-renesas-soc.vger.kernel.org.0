Return-Path: <linux-renesas-soc+bounces-32070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA95AYjc+WkwEwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:03:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 404D64CD2AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5079B3023312
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA2841325B;
	Tue,  5 May 2026 12:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PABCs2RJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC69640F8E0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982541; cv=none; b=dMu4KMOKJLGzlk6g0VYJAeIsxc1E1px5HckPA1Kdfmu44RvUjBdfQtfCbOIwujm2nnvslXGh5dwyIVZmMQ9cZh7WpHPov16MhcSoLLiT7JavV3iv0gkV7xM6T9dQWrlhlTJA3p2yeeNhvvLmvAqL8Mb9RsGSGuO9LKtINsZ+Rmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982541; c=relaxed/simple;
	bh=cNLr2taXbpX2OcE5yjZznFeiiGyGBLPTTQZdFmvHAlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jf9RqfasFST530i9eJbMbC8DBc6OkIWnSPHWcdeHJd/GJw8QKZ+16mCcbdBXBoFd78jBjNgAWRnoYeZwophWqXqO+xkhDARQP9uxNTwcgF7T5x0lVHs6ZUYhTU+Rdxj7RFnloGNpxOiuB5y3kvpshRdIcGfTw2zKoZLHhEjewJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PABCs2RJ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso2384276f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777982537; x=1778587337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzsA6N6NmgWM0rNix94AHnL8OJvlx0hoitqTUcN+rEo=;
        b=PABCs2RJ4CC/lCPPs/NDapQ5G+8ZMphKDzGr0QIBuvd913TZvcAdHW3VKkDnRzKJG0
         2j7b1EPLkEAKS8k+Q5mIt/otvG6PBYiILVsfOQSV28jaEv6ra6a4putUVj+ku07e4a0y
         YKCukfRtgiHBaGhMV3sIiaLDjq6uS3f/U7JZoBoT5PkReYKKaYNdWHvMaZdYHCpNAZql
         eDYU+uuZZTHQLxcRcvYmtx1ZQtHx9IAmub+bqdQ9/fXBpvaKFklPRHOJ3mrJlWhBMLU+
         zGz7gdNUSudjDpVbO3VXuUnkzHZQtMgpOsIUTEOw/5dTKirgEqY9YNTNaJ8GLZ41bHec
         LcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982537; x=1778587337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DzsA6N6NmgWM0rNix94AHnL8OJvlx0hoitqTUcN+rEo=;
        b=UuG9+RrWvux5zUWXh149ax+4nWLqdmtgQ/rjJC6jHCe08uN5xKB5NfsKHWjlwaXZ6l
         Z+nX1/7NRlxjFQSqx/+Jwasbqqz82f1oXkxL9aUTse1lBl/vHOKktOSqTLez660Hiojj
         4YQseyhzJ8//kA5EVJ7MJD1ueIDlv+0R+Rsc8yi1Zm2G/tPvP8SJ3EiV1LsPDtOmWBwe
         lWs744p2Fai/J+ysvNWAOzJsbOrK9L3ImvXzOrkyu3PvnqmDPyEOBqHBi3ABERKlKIDu
         dFLbi7RT/0LzkdwYPcx4kjJ91T3A7a+sZSlVZt5+EnQlh/jQWcPhSEJXE9C15DpKbSVp
         B2Lw==
X-Gm-Message-State: AOJu0YwZaV3fJic5/Gb3yag+p3MZuYJ3wYpdG/ERGsDxU8eaTcDkZxm7
	HjkazO5yDcITN4iGYkFmWoOG3RtY/qnAPBF9nUm0+tbvoLk/gLTOdvAiLx20uRZbiiA=
X-Gm-Gg: AeBDiev5Ke/6IVFHI5DPzPXt8yOOqpQTaetshANREPxSh5NBWM9lh0e1f0vsPDkSm4B
	+SecbIAh51kzE6fSmPYQJtgxyCbN/dcimVizO+dOZh1p4sUBB5t153CVNU0ZmYSEdVvQ88nB2rE
	rmWUgTosMCa86ftMNSsaBNWhfcKhIkZGVUoptciMyrkDiz3X8QG5Q1FvyqMnJ+ECbTfqNXAyok5
	g5K+HDlzDHokjrBoLq54GYnRXEOW70mmBYgXE3sg54DcnAXVd3CSoe38fTGsNvb3eK1Wd7NSdVN
	JrdHA260KB4V7PQfxP/mi+hlq7/cfwZcAhaDcNCq0ihzrEBiJxkJhLnSUnCC+AXe/egBGTst1Xa
	lIDQRfh4rm+2rfgv+EPH87/X5R3rq0oYy9qzOpo+SDMrzvJk90VJxngAAKVRSa0xWUe0R2EtHuO
	cH+XOghipX1FInGFXWUlw3b5sh/Sg6o/PHqb1Wj/gKB5ypB8bqqpgChVh/WKMxfJ/njMERV59TJ
	6KSbazern/bJHQ8qpF7pTujkOeQEtEoA2NqWQem5kgmsjs6BPlbFcCiHA==
X-Received: by 2002:a05:6000:611:b0:43c:ffb1:2214 with SMTP id ffacd0b85a97d-44bb4722800mr24295650f8f.16.1777982536525;
        Tue, 05 May 2026 05:02:16 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7d2a:9b5b:a191:3b81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03e04sm4386398f8f.21.2026.05.05.05.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:02:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes
Date: Tue,  5 May 2026 13:01:53 +0100
Message-ID: <20260505120153.680979-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260505120153.680979-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 404D64CD2AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-32070-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_SPAM(0.00)[0.889];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.234.96:email,0.12.53.0:email];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,0.4.147.224:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,1fb000:email]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the xSPI0 and xSPI1 controllers on the RZ/T2H N2H EVK board.

The xSPI0 controller is connected to an MX25LW51245 octal flash device.
Although the hardware supports octal mode, configure the bus width to
1-bit (x1) mode. Enabling octal mode causes the BootROM to fail loading
the first-stage bootloader following a Watchdog Timer (WDT) reset.

The xSPI1 controller is connected to an AT25SF128A flash device.
Configure this interface for 4-bit (x4) mode to utilize the available
data lines.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index f87c2492f414..0894c9d38971 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2025 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/net/mscc-phy-vsc8531.h>
@@ -20,6 +21,8 @@ aliases {
 		mmc0 = &sdhi0;
 		mmc1 = &sdhi1;
 		serial0 = &sci0;
+		spi0 = &xspi0;
+		spi1 = &xspi1;
 	};
 
 	chosen {
@@ -331,6 +334,59 @@ ctrl-pins {
 				 <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1_CD */
 		};
 	};
+
+	xspi0_pins: xspi0-group {
+		clk-pins {
+			pinmux = <RZT2H_PORT_PINMUX(5, 1, 0x1c)>, /* XSPI0_CKP */
+				 <RZT2H_PORT_PINMUX(5, 2, 0x1c)>; /* XSPI0_CKN */
+			input-schmitt-disable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+
+		data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(5, 6, 0x1c)>, /* XSPI0_IO0 */
+				 <RZT2H_PORT_PINMUX(5, 7, 0x1c)>, /* XSPI0_IO1 */
+				 <RZT2H_PORT_PINMUX(6, 0, 0x1c)>, /* XSPI0_IO2 */
+				 <RZT2H_PORT_PINMUX(6, 1, 0x1c)>, /* XSPI0_IO3 */
+				 <RZT2H_PORT_PINMUX(6, 2, 0x1c)>, /* XSPI0_IO4 */
+				 <RZT2H_PORT_PINMUX(6, 3, 0x1c)>, /* XSPI0_IO5 */
+				 <RZT2H_PORT_PINMUX(6, 4, 0x1c)>, /* XSPI0_IO6 */
+				 <RZT2H_PORT_PINMUX(6, 5, 0x1c)>; /* XSPI0_IO7 */
+			input-schmitt-disable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+
+		ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(5, 3, 0x1c)>, /* XSPI0_CS0 */
+				 <RZT2H_PORT_PINMUX(6, 6, 0x1c)>, /* XSPI0_RESET0 */
+				 <RZT2H_PORT_PINMUX(5, 5, 0x1c)>; /* XSPI0_DS */
+			input-schmitt-disable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+	};
+
+	xspi1_pins: xspi1-group {
+		ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(1, 0, 0x1c)>, /* XSPI1_CKP */
+				 <RZT2H_PORT_PINMUX(1, 1, 0x1c)>; /* XSPI1_CS0 */
+			input-schmitt-enable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+
+		data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(1, 4, 0x1c)>, /* XSPI1_IO0 */
+				 <RZT2H_PORT_PINMUX(1, 5, 0x1c)>, /* XSPI1_IO1 */
+				 <RZT2H_PORT_PINMUX(1, 6, 0x1c)>, /* XSPI1_IO2 */
+				 <RZT2H_PORT_PINMUX(1, 7, 0x1c)>; /* XSPI1_IO3 */
+			input-schmitt-enable;
+			slew-rate = <1>;
+			drive-strength-microamp = <9000>;
+		};
+	};
 };
 
 &sci0 {
@@ -395,3 +451,82 @@ &wdt2 {
 	timeout-sec = <60>;
 };
 
+&xspi0 {
+	pinctrl-0 = <&xspi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	assigned-clocks = <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
+	assigned-clock-rates = <50000000>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		m25p,fast-read;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+		vcc-supply = <&reg_3p3v>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bl2-0";
+				reg = <0x00000000 0x00060000>;
+				read-only;
+			};
+
+			partition@1fb000 {
+				label = "fip-0";
+				reg = <0x00060000 0x007a0000>;
+				read-only;
+			};
+
+			partition@300000 {
+				label = "user-0";
+				reg = <0x800000 0x003800000>;
+			};
+		};
+	};
+};
+
+&xspi1 {
+	pinctrl-0 = <&xspi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	assigned-clocks = <&cpg CPG_CORE R9A09G077_XSPI_CLK1>;
+	assigned-clock-rates = <50000000>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		m25p,fast-read;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		vcc-supply = <&reg_3p3v>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "bl2-1";
+				reg = <0x00000000 0x00060000>;
+			};
+
+			partition@60000 {
+				label = "fip-1";
+				reg = <0x00060000 0x007a0000>;
+			};
+
+			partition@800000 {
+				label = "user-1";
+				reg = <0x800000 0x800000>;
+			};
+		};
+	};
+};
-- 
2.54.0


