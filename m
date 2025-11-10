Return-Path: <linux-renesas-soc+bounces-24429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47FC49440
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 21:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E00E1888A12
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 20:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE002F0C7C;
	Mon, 10 Nov 2025 20:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6C2Y40w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A502E8B95
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762807182; cv=none; b=TA1hSa3v4c1Yi+lbqSHe3yRH8T6pWL9TTfatVDJfLH4J48pIkPkl4FzA5exGlRaLIX7OJwuQTGvCgnMGvMXMqul9oAJW8pjBqJItj4DTGBRT49M4+OFs/hzmLuQhAvpq5axmxZ01/DFQvEXxEEtTWhw5/vNOVmNreCDOjEWJQMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762807182; c=relaxed/simple;
	bh=AkgHaQmw6NA3nKy2zyksBXMR0NDo/R2Qbv+yM8I4mrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OAlNPv2+wry8rO5tpSoYWYMpOLPeyVRXuRV6ONfBZX3+PVws1xfLMbrqC1iUhSeIlAf5Sv8dg3PYqCRRY+1tw9XJg+fLfoeKNYj280kiLf6CbLTQgZIaq/rlk0GADQNGE0FdeMJwTifLz/5hLcVv2iscQQgt5EV3sxGINIQKL/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6C2Y40w; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3437af844afso1951473a91.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 12:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762807180; x=1763411980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6K87sjrAn7jsbixbzY3ZTMgfnTETtINPCdgt7Pmhlo=;
        b=c6C2Y40wekH3B8OBY2mX1JAZloKngtwFW3zGCTUjrwML0B99VfPOXhrCs1p8iBWGLW
         33qy7bXk5kDqBlY2ZjD9II66O7eO0r34GgUQBW9RewmPQN4gaMRd2R23UY2JyLAlyplT
         C38rF2IDXLwvBs5NYnmjh4gl6zicOWtYDmqzqCOGJCvkqlEBZMdwqburh5fwxsPrbq4t
         oSMsFPWmYOGBYgEjwHt/IOLNC3CafrtitgTHmO0KlFdY58ohtqG2hb2s4eGh2f+Ay6dN
         IUnJMLGk3eMjc7x02FN+VqGYiczvVZdISEkkqs+0MIK432KrlAxExI4YUhwyeG2gSbQs
         6jWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762807180; x=1763411980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6K87sjrAn7jsbixbzY3ZTMgfnTETtINPCdgt7Pmhlo=;
        b=ursQBejJbKLMt4hDwF54QSf8lPt1kjNkbr9OP7OM4MaPVc/MuBxmPZDAAR7hNscL6n
         dC50d3jYPc7znrCX0TD1whD2HoRsDRWhslbxOuTG//xwPYTBy/ST4E/2HDJu3gbPOdqn
         MVRsR9ESv4xwisKPEVit+bQpoX+ybrgalcuxW4MapKNwFoP5DfHKAlg/60mne3qnjYrL
         xN1cLo2y/3S8p3VCKGCGN/a6AcCYsrtCgLNLFf/Y9wO4V1UujWA7NEPB1chT2NymkLxQ
         jHIQ3tBoUfZVfVTbKxvL3+dzeeu1fL5uWIN6AGG/xqnSnP10d6Px7NWNbLfJk/zcKaAo
         hBbA==
X-Gm-Message-State: AOJu0YwkFKXNgxjOlFiZUdtXcELc+UctI/2iX7ksInFawpoico1RmKuc
	W6YzEca7ZLcS7KOnSCfNQAtQcE/8GHFAI+pVHs71ZE5LcrXGs/oglnYT
X-Gm-Gg: ASbGnctWMVdVXXc46QQOojNh4M4H5bpGcIDXwKdker2RpusHRfdpk15OFHvFTiciNJN
	cdV2NI8ulMjNXKBwHFuMb/YWjZnHhXIWCJSqh4BcvF/iQsK24CpDWWIxUMJJnWrILKdwJtx9Uyl
	0oIaWYrOP762/sptCFPe35SxUeSzmePTAcAOdLgUpoXu7cO7jbQWWbRz2yKSJ2UB58MWelqhVK6
	gZV7ovarYOf8dm17qms9IeuPCMP6slUtcKappLuaxKE0scF70KBZYBsfzqp4OIIbOowpKWAKlQd
	ccE+aJqE+Xr7dvSgg1cCIFikNLD38WJmOPElyYeJDqqoUAbAafWwRZX6R67zXkwLn9EejKGCWzJ
	Fj8ya3M+Dlensz7MCqgvvLP/RL7DSqJRSgU6vMBNFYvaMbhVR620cQPrQKjc9RKFwWGwM0ogLO1
	gnTNlA5dEBh3Vnk/K9LdBzTw==
X-Google-Smtp-Source: AGHT+IFFo88851x6ts9UcKu3G6c2Zy5/pvsjVy0eGIvIka3YKXz2RYKTvCpvPp5F/IDqXtG7tq7Bcw==
X-Received: by 2002:a17:90b:4986:b0:33b:a5d8:f198 with SMTP id 98e67ed59e1d1-3436cd0026emr10076418a91.25.1762807180058;
        Mon, 10 Nov 2025 12:39:40 -0800 (PST)
Received: from iku.. ([2401:4900:1c06:79c0:4ab7:69ea:ca5e:a64f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a67e2f82sm18855643a91.0.2025.11.10.12.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 12:39:39 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3] arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support
Date: Mon, 10 Nov 2025 20:39:26 +0000
Message-ID: <20251110203926.692242-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable Ethernet support on the RZ/T2H and RZ/N2H EVKs.

Configure the MIIC converter in mode 0x6:
  Port 0 <-> ETHSW Port 0
  Port 1 <-> ETHSW Port 1
  Port 2 <-> GMAC2
  Port 3 <-> GMAC1

Enable the ETHSS, GMAC1 and GMAC2 nodes. ETHSW support will be added
once the switch driver is available.

Configure the MIIC converters to map ports according to the selected
switching mode, with converters 0 and 1 mapped to switch ports and
converters 2 and 3 mapped to GMAC ports.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, as rest of the patches of series [0] has been already reviewed and
queued sending this lone patch for v3 review.
[0] https://lore.kernel.org/all/20251028175458.1037397-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v2->v3:
- Split comments
- Renamed ETHX_{MDC,MDIO} to GMACX_{MDC,MDIO}
- Updated commnet for SW2[8] to drop P27_2 and
  P35_3-P35_5 as they are not used for GMAC1
- Renamed eth2 to gmac2 and eth3 to gmac1 in pinctrl nodes
- Corrected pin for ETH2_RXER
- Corrected the aliases to match the board schematics
- For led0 switched to use VSC8531_ACTIVITY instead of
  VSC8531_LINK_ACTIVITY.
- Renamed phy3 to mdio1_phy and phy2 to mdio2_phy

v1->v2:
- Dropped *skew-psec properties which are not needed for
  VSC8541 PHYs.
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 70 +++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 78 +++++++++++++++++++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 70 +++++++++++++++++
 3 files changed, 218 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 799c58afd6fe..b7706d0bc3aa 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -149,7 +149,77 @@ &i2c1 {
 	status = "okay";
 };
 
+&mdio1_phy {
+	reset-gpios = <&pinctrl RZT2H_GPIO(32, 3) GPIO_ACTIVE_LOW>;
+};
+
+&mdio2_phy {
+	/*
+	 * PHY2 Reset Configuration:
+	 *
+	 * SW6[1] OFF; SW6[2] ON; SW6[3] OFF - use pin P17_5 for GMAC_RESETOUT2#
+	 */
+	reset-gpios = <&pinctrl RZT2H_GPIO(17, 5) GPIO_ACTIVE_LOW>;
+};
+
 &pinctrl {
+	/*
+	 * GMAC2 Pin Configuration:
+	 *
+	 * SW2[6] OFF - connect MDC/MDIO of Ethernet port 2 to GMAC2
+	 * SW2[7] ON - use pins P29_1-P29_7, P30_0-P30_4, and P31_2-P31_5
+	 * for Ethernet port 2
+	 */
+	gmac2_pins: gmac2-pins {
+		pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>, /* ETH2_TXCLK */
+			 <RZT2H_PORT_PINMUX(29, 2, 0xf)>, /* ETH2_TXD0 */
+			 <RZT2H_PORT_PINMUX(29, 3, 0xf)>, /* ETH2_TXD1 */
+			 <RZT2H_PORT_PINMUX(29, 4, 0xf)>, /* ETH2_TXD2 */
+			 <RZT2H_PORT_PINMUX(29, 5, 0xf)>, /* ETH2_TXD3 */
+			 <RZT2H_PORT_PINMUX(29, 6, 0xf)>, /* ETH2_TXEN */
+			 <RZT2H_PORT_PINMUX(29, 7, 0xf)>, /* ETH2_RXCLK */
+			 <RZT2H_PORT_PINMUX(30, 0, 0xf)>, /* ETH2_RXD0 */
+			 <RZT2H_PORT_PINMUX(30, 1, 0xf)>, /* ETH2_RXD1 */
+			 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD2 */
+			 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD3 */
+			 <RZT2H_PORT_PINMUX(30, 4, 0xf)>, /* ETH2_RXDV */
+			 <RZT2H_PORT_PINMUX(31, 2, 0xf)>, /* ETH2_TXER */
+			 <RZT2H_PORT_PINMUX(31, 3, 0xf)>, /* ETH2_RXER */
+			 <RZT2H_PORT_PINMUX(31, 4, 0xf)>, /* ETH2_CRS */
+			 <RZT2H_PORT_PINMUX(31, 5, 0xf)>, /* ETH2_COL */
+			 <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
+			 <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* GMAC2_MDIO */
+			 <RZT2H_PORT_PINMUX(31, 0, 0x2)>; /* ETH2_REFCLK */
+	};
+
+	/*
+	 * GMAC1 Pin Configuration:
+	 *
+	 * SW2[8] ON - use pins P33_2-P33_7, P34_0-P34_5, P34_7 and
+	 * P35_0-P35_2 for Ethernet port 3
+	 */
+	gmac1_pins: gmac1-pins {
+		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
+			 <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
+			 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD1 */
+			 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
+			 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
+			 <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
+			 <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
+			 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
+			 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
+			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
+			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
+			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
+			 <RZT2H_PORT_PINMUX(34, 7, 0xf)>, /* ETH3_TXER */
+			 <RZT2H_PORT_PINMUX(35, 0, 0xf)>, /* ETH3_RXER */
+			 <RZT2H_PORT_PINMUX(35, 1, 0xf)>, /* ETH3_CRS */
+			 <RZT2H_PORT_PINMUX(35, 2, 0xf)>, /* ETH3_COL */
+			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
+			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
+			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>; /* ETH3_REFCLK */
+	};
+
 	/*
 	 * I2C0 Pin Configuration:
 	 * ------------------------
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index d698b6368ee7..17c0c79fbd96 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -186,7 +186,85 @@ &i2c1 {
 	status = "okay";
 };
 
+&mdio1_phy {
+	/*
+	 * PHY3 Reset Configuration:
+	 *
+	 * DSW12[5] OFF; DSW12[6] ON - use pin P03_2 for GMAC_RESETOUT3#
+	 */
+	reset-gpios = <&pinctrl RZT2H_GPIO(3, 2) GPIO_ACTIVE_LOW>;
+};
+
+&mdio2_phy {
+	/*
+	 * PHY2 Reset Configuration:
+	 *
+	 * DSW8[1] ON; DSW8[2] OFF; DSW12[7] OFF; DSW12[8] ON - use pin
+	 * P03_1 for GMAC_RESETOUT2#
+	 */
+	reset-gpios = <&pinctrl RZT2H_GPIO(3, 1) GPIO_ACTIVE_LOW>;
+};
+
 &pinctrl {
+	/*
+	 * GMAC2 Pin Configuration:
+	 *
+	 * DSW5[6] OFF - connect MDC/MDIO of Ethernet port 2 to GMAC2
+	 * DSW5[7] ON - use pins P29_1-P29_7, P30_0-P30_4, P30_7,
+	 * P31_2, P31_4 and P31_5 are used for Ethernet port 2
+	 */
+	gmac2_pins: gmac2-pins {
+		pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>, /* ETH2_TXCLK */
+			 <RZT2H_PORT_PINMUX(29, 2, 0xf)>, /* ETH2_TXD0 */
+			 <RZT2H_PORT_PINMUX(29, 3, 0xf)>, /* ETH2_TXD1 */
+			 <RZT2H_PORT_PINMUX(29, 4, 0xf)>, /* ETH2_TXD2 */
+			 <RZT2H_PORT_PINMUX(29, 5, 0xf)>, /* ETH2_TXD3 */
+			 <RZT2H_PORT_PINMUX(29, 6, 0xf)>, /* ETH2_TXEN */
+			 <RZT2H_PORT_PINMUX(29, 7, 0xf)>, /* ETH2_RXCLK */
+			 <RZT2H_PORT_PINMUX(30, 0, 0xf)>, /* ETH2_RXD0 */
+			 <RZT2H_PORT_PINMUX(30, 1, 0xf)>, /* ETH2_RXD1 */
+			 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD2 */
+			 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD3 */
+			 <RZT2H_PORT_PINMUX(30, 4, 0xf)>, /* ETH2_RXDV */
+			 <RZT2H_PORT_PINMUX(31, 2, 0xf)>, /* ETH2_TXER */
+			 <RZT2H_PORT_PINMUX(31, 1, 0xf)>, /* ETH2_RXER */
+			 <RZT2H_PORT_PINMUX(31, 4, 0xf)>, /* ETH2_CRS */
+			 <RZT2H_PORT_PINMUX(31, 5, 0xf)>, /* ETH2_COL */
+			 <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
+			 <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* GMAC2_MDIO */
+			 <RZT2H_PORT_PINMUX(31, 0, 0x2)>; /* ETH2_REFCLK */
+
+	};
+
+	/*
+	 * GMAC2 Pin Configuration:
+	 *
+	 * DSW5[8] ON - use pins P00_0-P00_2, P33_2-P33_7, P34_0-P34_6
+	 * for Ethernet port 3
+	 * DSW12[1] OFF; DSW12[2] ON - use pin P00_3 for Ethernet port 3
+	 */
+	gmac1_pins: gmac1-pins {
+		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
+			 <RZT2H_PORT_PINMUX(33, 3, 0xf)>, /* ETH3_TXD0 */
+			 <RZT2H_PORT_PINMUX(33, 4, 0xf)>, /* ETH3_TXD0 */
+			 <RZT2H_PORT_PINMUX(33, 5, 0xf)>, /* ETH3_TXD2 */
+			 <RZT2H_PORT_PINMUX(33, 6, 0xf)>, /* ETH3_TXD3 */
+			 <RZT2H_PORT_PINMUX(33, 7, 0xf)>, /* ETH3_TXEN */
+			 <RZT2H_PORT_PINMUX(34, 0, 0xf)>, /* ETH3_RXCLK */
+			 <RZT2H_PORT_PINMUX(34, 1, 0xf)>, /* ETH3_RXD0 */
+			 <RZT2H_PORT_PINMUX(34, 2, 0xf)>, /* ETH3_RXD1 */
+			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
+			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
+			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
+			 <RZT2H_PORT_PINMUX(0, 0, 0xf)>, /* ETH3_TXER */
+			 <RZT2H_PORT_PINMUX(0, 1, 0xf)>, /* ETH3_RXER */
+			 <RZT2H_PORT_PINMUX(0, 2, 0xf)>, /* ETH3_CRS */
+			 <RZT2H_PORT_PINMUX(0, 3, 0xf)>, /* ETH3_COL */
+			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
+			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
+			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>; /* ETH3_REFCLK */
+	};
+
 	/*
 	 * I2C0 Pin Configuration:
 	 * ------------------------
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 924a38c6cb0f..3eed1f3948e8 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -7,10 +7,14 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/mscc-phy-vsc8531.h>
+#include <dt-bindings/net/renesas,r9a09g077-pcs-miic.h>
 #include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
 
 / {
 	aliases {
+		ethernet3 = &gmac1;
+		ethernet2 = &gmac2;
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		mmc0 = &sdhi0;
@@ -70,10 +74,34 @@ &ehci {
 	status = "okay";
 };
 
+&ethss {
+	status = "okay";
+
+	renesas,miic-switch-portin = <ETHSS_GMAC0_PORT>;
+};
+
 &extal_clk {
 	clock-frequency = <25000000>;
 };
 
+&gmac1 {
+	pinctrl-0 = <&gmac1_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&mdio1_phy>;
+	phy-mode = "rgmii-id";
+	pcs-handle = <&mii_conv3>;
+	status = "okay";
+};
+
+&gmac2 {
+	pinctrl-0 = <&gmac2_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&mdio2_phy>;
+	phy-mode = "rgmii-id";
+	pcs-handle = <&mii_conv2>;
+	status = "okay";
+};
+
 &hsusb {
 	dr_mode = "otg";
 	status = "okay";
@@ -87,6 +115,48 @@ eeprom: eeprom@50 {
 	};
 };
 
+&mdio1 {
+	mdio1_phy: ethernet-phy@3 {
+		compatible = "ethernet-phy-id0007.0772", "ethernet-phy-ieee802.3-c22";
+		reg = <3>;
+		vsc8531,led-0-mode = <VSC8531_ACTIVITY>;
+		vsc8531,led-1-mode = <VSC8531_LINK_ACTIVITY>;
+		reset-assert-us = <2000>;
+		reset-deassert-us = <15000>;
+	};
+};
+
+&mdio2 {
+	mdio2_phy: ethernet-phy@2 {
+		compatible = "ethernet-phy-id0007.0772", "ethernet-phy-ieee802.3-c22";
+		reg = <2>;
+		vsc8531,led-0-mode = <VSC8531_ACTIVITY>;
+		vsc8531,led-1-mode = <VSC8531_LINK_ACTIVITY>;
+		reset-assert-us = <2000>;
+		reset-deassert-us = <15000>;
+	};
+};
+
+&mii_conv0 {
+	renesas,miic-input = <ETHSS_ETHSW_PORT0>;
+	status = "okay";
+};
+
+&mii_conv1 {
+	renesas,miic-input = <ETHSS_ETHSW_PORT1>;
+	status = "okay";
+};
+
+&mii_conv2 {
+	renesas,miic-input = <ETHSS_GMAC2_PORT>;
+	status = "okay";
+};
+
+&mii_conv3 {
+	renesas,miic-input = <ETHSS_GMAC1_PORT>;
+	status = "okay";
+};
+
 &ohci {
 	dr_mode = "otg";
 	status = "okay";
-- 
2.43.0


