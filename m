Return-Path: <linux-renesas-soc+bounces-26922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A62D30AAE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 12:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7980303C101
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 11:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D9A37A49D;
	Fri, 16 Jan 2026 11:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Gvp+mS9x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F6A34405F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768564147; cv=none; b=WjoF/cuK0VbyW5VTlQZSbzPIO9+2uF7Bf5rvpilIM0w5onxWkZyfnolmfVzKFqZL5Tx5dp6G5hfXhCSuzHz/VVQ7Wt6lO4CRkMbZDfp7nsYW/v0CiUB1HwBy2NAtPWGTrlA39yPfiWsBpTNcnK5aX7g7h2M77LJcZD0q94lvZMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768564147; c=relaxed/simple;
	bh=kdi77dDjklwKIumaOWuPiHVQMf/5l80PdjC+qGlq9kE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QBS+OYr9b/pl7K/zyphHJXTO6VrUU7gIFKarfNqLJQ8QfHSBko0n98tZWbAqUsQnz1yv7E27MrD2gI0+D/atu7UGOSBMpLALogQvA4duwNLbbHjBjoChn7ukWLaSFX36sUB+bHHJQ2IAUDbSrEQ+X+3S/sgmUVvxnHtHqX82+C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Gvp+mS9x; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=lTYejoiy0xJzO5
	ocw5GrDApAGo6xik7Xpi+P7zL3M9w=; b=Gvp+mS9xZkrKeHH3Qwpbc0sjj7cxLF
	iInfXc0yuvUQwLTrvkinxwIIETbczdKz/szQJxJXpYx8Y4RyslpSNi1s8oQSRpGt
	qq0WCoh6ZLLR/h7wObGaL4klsLNqA4pa+FquqsvjJsixBu6exinWZyjj2IpsJ0sq
	8dikeyhV6JUiaZc8lCTZ3iUoIWuYHd7D6BXa44iALbi5Shy04JMU7qx077OxIB/5
	+AUoJmurr6tpvx8cefIMZ0fKJ5Sudp+ua7xaN7EfaUvR6g4ArNcgrHgrlxaNHkP9
	i+U8K3+pg89JaECwls1UcEfvbCxwigwJosVK2c5zHidJh04Rw4c0ivrQ==
Received: (qmail 2903690 invoked from network); 16 Jan 2026 12:49:01 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jan 2026 12:49:01 +0100
X-UD-Smtp-Session: l3s3148p1@cXlr7X9ICOMujnua
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: add QSPI node including NOR flash
Date: Fri, 16 Jan 2026 12:48:48 +0100
Message-ID: <20260116114852.52948-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the QSPI controller to access the connected SPI NOR flash. The
NOR datasheet may suggest faster tuning parameters but those did not
work on my board.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Depends on the series "[PATCH v2 00/13] spi: cadence-qspi: Add Renesas
RZ/N1 support". As this is still under discussion, this patch is RFC
only.

The tuning values used came from Miquel and work here as well. An
interested party may try to tune this further but I will go the safe
route here.

The partitioning comes from the BSP. Using these partitions, I actually
discovered previous kernels and DTBs from the previous owner of the
board :)

Thanks and happy hacking, everyone!

 .../dts/renesas/r9a06g032-rzn1d400-db.dts     | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index 4a72aa7663f2..0e23aa8aa55b 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -300,6 +300,84 @@ pins_mdio1: pins_mdio1 {
 		pinmux = <RZN1_PINMUX(152, RZN1_FUNC_MDIO1_SWITCH)>,
 			 <RZN1_PINMUX(153, RZN1_FUNC_MDIO1_SWITCH)>;
 	};
+
+	pins_qspi0: pins_qspi0 {
+		pinmux = <RZN1_PINMUX(74, RZN1_FUNC_QSPI)>,
+			 <RZN1_PINMUX(75, RZN1_FUNC_QSPI)>,
+			 <RZN1_PINMUX(76, RZN1_FUNC_QSPI)>,
+			 <RZN1_PINMUX(77, RZN1_FUNC_QSPI)>,
+			 <RZN1_PINMUX(78, RZN1_FUNC_QSPI)>,
+			 <RZN1_PINMUX(79, RZN1_FUNC_QSPI)>;
+		bias-disable;
+	};
+};
+
+&qspi0 {
+	pinctrl-0 = <&pins_qspi0>;
+	pinctrl-names = "default";
+	status = "okay";
+	bootph-all;
+
+	flash@0 {
+		reg = <0>;
+		compatible = "jedec,spi-nor";
+		spi-max-frequency = <62500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		cdns,read-delay = <1>;
+		cdns,tshsl-ns = <200>;
+		cdns,tsd2d-ns = <255>;
+		cdns,tchsh-ns = <20>;
+		cdns,tslch-ns = <20>;
+		bootph-all;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				/* 64KB */
+				label = "qspi0:spl";
+				reg = <0x0000000 0x00010000>;
+			};
+			partition@1 {
+				/* 64KB */
+				label = "qspi0:pkgt";
+				reg = <0x0010000 0x00010000>;
+			};
+			partition@2 {
+				/* 512KB */
+				label = "qspi0:u-boot";
+				reg = <0x0020000 0x00080000>;
+			};
+			partition@3 {
+				/* 64KB */
+				label = "qspi0:env";
+				reg = <0x00a0000 0x00010000>;
+			};
+			partition@4 {
+				/* 128KB */
+				label = "qspi0:dtb";
+				reg = <0x00b0000 0x00020000>;
+			};
+			partition@5 {
+				/* 1MB */
+				label = "qspi0:cm3";
+				reg = <0x00d0000 0x00100000>;
+			};
+			partition@6 {
+				/* 6MB */
+				label = "qspi0:kernel";
+				reg = <0x01d0000 0x00600000>;
+			};
+			partition@7 {
+				/* Remaining */
+				label = "qspi0:data";
+				reg = <0x07d0000 0>;
+			};
+		};
+	};
 };
 
 &rtc0 {
-- 
2.47.3


