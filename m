Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1306578E69F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 08:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjHaGgx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 02:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346094AbjHaGgw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 02:36:52 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 78877A4;
        Wed, 30 Aug 2023 23:36:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="178276026"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Aug 2023 15:36:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 795A041881A9;
        Thu, 31 Aug 2023 15:36:44 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/3] arm64: dts: renesas: rzg2ul-smarc-som: Enable serial NOR flash
Date:   Thu, 31 Aug 2023 07:36:33 +0100
Message-Id: <20230831063635.2816-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230831063635.2816-1-biju.das.jz@bp.renesas.com>
References: <20230831063635.2816-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable Renesas at25ql128a flash connected to QSPI0. Also disable
the node from rzfive-smarc-som as it is untested.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Enabled 4-bit tx support
---
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 44 +++++++++++++++++++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    |  4 ++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
index 97cdad2a12e2..b9e4e476ff7b 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
@@ -179,6 +179,18 @@ eth1_pins: eth1 {
 			 <RZG2L_PORT_PINMUX(18, 5, 1)>; /* IRQ7 */
 	};
 
+	qspi0_pins: qspi0 {
+		qspi0-data {
+			pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3";
+			power-source = <1800>;
+		};
+
+		qspi0-ctrl {
+			pins = "QSPI0_SPCLK", "QSPI0_SSL";
+			power-source = <1800>;
+		};
+	};
+
 	sdhi0_emmc_pins: sd0emmc {
 		sd0_emmc_data {
 			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
@@ -230,6 +242,38 @@ sd0_mux_uhs {
 	};
 };
 
+&sbc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+
+		spi-cpol;
+		spi-cpha;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			boot@0 {
+				reg = <0x00000000 0x200000>;
+				read-only;
+			};
+			user@200000 {
+				reg = <0x200000 0xE00000>;
+			};
+		};
+	};
+};
+
 #if (SW_SW0_DEV_SEL)
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_emmc_pins>;
diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
index c62debc7ca7e..0c9d72c32879 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -42,6 +42,10 @@ phy1: ethernet-phy@7 {
 	};
 };
 
+&sbc {
+	status = "disabled";
+};
+
 &sdhi0 {
 	status = "disabled";
 };
-- 
2.25.1

