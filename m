Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35648690E7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 17:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjBIQkY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 11:40:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBIQkX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 11:40:23 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 386E05D1CD;
        Thu,  9 Feb 2023 08:40:22 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,284,1669042800"; 
   d="scan'208";a="152269612"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Feb 2023 01:40:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1D5E24002C2D;
        Fri, 10 Feb 2023 01:40:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: rzg2ul-smarc-som: Enable serial NOR flash
Date:   Thu,  9 Feb 2023 16:40:16 +0000
Message-Id: <20230209164016.645399-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable Renesas at25ql128a flash connected to QSPI0. Also disable
the node from rzfive-smarc-som as it is untested.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
logs:
root@smarc-rzg2ul:~# modprobe spi-rpc-if
[  105.775964] spi-nor spi1.0: spi-nor-generic (16384 Kbytes)
[  105.823268] 2 fixed-partitions partitions found on MTD device spi1.0
[  105.829767] Creating 2 MTD partitions on "spi1.0":
[  105.835867] 0x000000000000-0x000000200000 : "boot"
[  105.849639] 0x000000200000-0x000001000000 : "user"

# cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
1f42181f4218
# cat /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1.0/spi-nor/partname
spi-nor-generic

Read/Write test
root@smarc-rzg2ul:/cip-test-scripts# ./rpcif_t_001.sh

EXIT|PASS|rpcif_t_001.sh|[00:03:25] ||
---
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    | 44 +++++++++++++++++++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    |  4 ++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
index 49ecd33aeeb8..d1a00f1d1b8c 100644
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
+		spi-tx-bus-width = <1>;
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
index d6f18754eb5d..56a907180485 100644
--- a/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
+++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
@@ -40,6 +40,10 @@ phy1: ethernet-phy@7 {
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

