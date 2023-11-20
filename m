Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D23E67F0C64
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 08:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbjKTHCm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 02:02:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232056AbjKTHCL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 02:02:11 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677CB1BD7
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Nov 2023 23:01:42 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32f737deedfso2600185f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Nov 2023 23:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700463701; x=1701068501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYAGumSF5wQuwMJcO1rZnCHjcneo6jlwkn1TXZm+oiw=;
        b=BiRH6cpg+/fzV0eUrDQ5maydgF3Z1ur2uCJ+ku+YqZhrhHRqxZ2xgjKxg4/P9QBq0l
         21Gva/CugXdd3uIgQAZS9xzzsmtDOP0KFLTdnDU3LUzsDeTHfmfXNaOW3LeyIXzISz+p
         jO4lH7OIn2b4FCyYkQQ56rxamQQf4gvpHXGIGkDSX+mQRgdcQL/GaweP/v42IzaeOIag
         QBlTvAyx6m5OKly0jKivs1RIj3PyP/7UhetRbDE3z/P6besRRjwTe1sJFyRM6IA5/wYo
         er67dvlyBdUxjbvN4BIL0Gnq+CS4xrdS6T0+GoGPyqBoabbcvHpTbPjMmE5lZaBinMQW
         QuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700463701; x=1701068501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYAGumSF5wQuwMJcO1rZnCHjcneo6jlwkn1TXZm+oiw=;
        b=a/4oVNfsNOxNbzPEzCRvZFvoAKe8YbsdKFeHN7gEYSaghOMh6rAXS5z9qI3bIePOZb
         PSNEoulMK6tKjM3rmTGSUqqVKmG7kqbLGa2jmpqEQ1orV8YFnMZGezr2Gp/VyZqZUdtL
         25bEh+nCgx70+UDXkrPIrTH+Zbo/+D8QRkoM8lrC16kHlJgWngz4S8he8wK6QFcRqWMq
         R//refH18qY2I59Q9UB5PS/LlqyQLY+LA9St+dPXuUTfgIs+2feaucDSPrjCWQ/n2VZY
         t5HPdSe54Jz6Juto9aQlCYNCaEWPcgMqD2ZZMkFktzrrI4OUz8IrrwZDf7VQlDAkLbi5
         LtKA==
X-Gm-Message-State: AOJu0YzfZdGnj3NwBwGQdM1w+1wW2jZFKM+EzN+pglfCMvyKlgTFcOK9
        oIShVGRq+ZUX+d0xA938lwbmyw==
X-Google-Smtp-Source: AGHT+IGkYhOstWHqY2KphUUr2IjObF4d/MsvXvsja+K9DGs7COlIKCpl4bUL8WDV7h1iz5EHtX1fuw==
X-Received: by 2002:a05:6000:1052:b0:32f:c3f0:f869 with SMTP id c18-20020a056000105200b0032fc3f0f869mr3911173wrx.41.1700463700603;
        Sun, 19 Nov 2023 23:01:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d4582000000b003316d1a3b05sm8777667wrq.78.2023.11.19.23.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 23:01:40 -0800 (PST)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux@armlinux.org.uk, geert+renesas@glider.be,
        magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, p.zabel@pengutronix.de, arnd@arndb.de,
        m.szyprowski@samsung.com, alexandre.torgue@foss.st.com, afd@ti.com,
        broonie@kernel.org, alexander.stein@ew.tq-group.com,
        eugen.hristev@collabora.com, sergei.shtylyov@gmail.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com
Cc:     linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, claudiu.beznea@tuxon.dev,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 13/14] arm64: dts: renesas: rzg3s-smarc-som: Enable Ethernet interfaces
Date:   Mon, 20 Nov 2023 09:00:23 +0200
Message-Id: <20231120070024.4079344-14-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

RZ/G3S Smarc Module has Ethernet PHYs (KSZ9131) connected to each Ethernet
IP. For this add proper DT bindings to enable the Ethernet communication
though these PHYs.

The interface b/w PHYs and MACs is RGMII. The skew settings were set to
zero as based on phy-mode (rgmii-id) the KSZ9131 driver enables internal
DLL which adds 2ns delay b/w clocks (TX/RX) and data signals.

Different pin settings were applied to TXC, TX_CTL compared with the rest
of the RGMII pins to comply with requirements for these pins imposed by
HW manual of RZ/G3S (see chapters "Ether Ch0 Voltage Mode Control
Register (ETH0_POC)", "Ether Ch1 Voltage Mode Control Register (ETH1_POC)",
for power source selection, "Ether MII/RGMII Mode Control Register
(ETH_MODE)" for output-enable and "Input Enable Control Register (IEN_m)"
for input-enable configurations).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Hi, Geert,

Please note that at the moment (on top of linux-next) the PHYs are probed
in poll mode as the interrupt controller support is not included yet.
It is work in progress (see [1]).

Thank you,
Claudiu Beznea

[1] https://lore.kernel.org/all/20231115142749.853106-1-claudiu.beznea.uj@bp.renesas.com/

 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 145 +++++++++++++++++-
 1 file changed, 144 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index e090a4837468..571cade41647 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -25,7 +25,10 @@ / {
 
 	aliases {
 		mmc0 = &sdhi0;
-#if !SW_SD2_EN
+#if SW_SD2_EN
+		eth0 = &eth0;
+		eth1 = &eth1;
+#else
 		mmc2 = &sdhi2;
 #endif
 	};
@@ -81,6 +84,64 @@ vcc_sdhi2: regulator2 {
 	};
 };
 
+#if SW_SD2_EN
+&eth0 {
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	phy0: ethernet-phy@7 {
+		reg = <7>;
+		interrupt-parent = <&pinctrl>;
+		interrupts = <RZG2L_GPIO(12, 0) IRQ_TYPE_EDGE_FALLING>;
+		rxc-skew-psec = <0>;
+		txc-skew-psec = <0>;
+		rxdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
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
+&eth1 {
+	pinctrl-0 = <&eth1_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii-id";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	phy1: ethernet-phy@7 {
+		reg = <7>;
+		interrupt-parent = <&pinctrl>;
+		interrupts = <RZG2L_GPIO(12, 1) IRQ_TYPE_EDGE_FALLING>;
+		rxc-skew-psec = <0>;
+		txc-skew-psec = <0>;
+		rxdv-skew-psec = <0>;
+		txen-skew-psec = <0>;
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
+#endif
+
 &extal_clk {
 	clock-frequency = <24000000>;
 };
@@ -128,6 +189,88 @@ &sdhi2 {
 #endif
 
 &pinctrl {
+	eth0-phy-irq-hog {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(12, 0) GPIO_ACTIVE_LOW>;
+		input;
+		line-name = "eth0-phy-irq";
+	};
+
+	eth0_pins: eth0 {
+		txc {
+			pinmux = <RZG2L_PORT_PINMUX(1, 0, 1)>;  /* ET0_TXC */
+			power-source = <1800>;
+			output-enable;
+			input-enable;
+			drive-strength-microamp = <5200>;
+		};
+
+		tx_ctl {
+			pinmux = <RZG2L_PORT_PINMUX(1, 1, 1)>;  /* ET0_TX_CTL */
+			power-source = <1800>;
+			output-enable;
+			drive-strength-microamp = <5200>;
+		};
+
+		mux {
+			pinmux = <RZG2L_PORT_PINMUX(1, 2, 1)>,	/* ET0_TXD0 */
+				 <RZG2L_PORT_PINMUX(1, 3, 1)>,	/* ET0_TXD1 */
+				 <RZG2L_PORT_PINMUX(1, 4, 1)>,	/* ET0_TXD2 */
+				 <RZG2L_PORT_PINMUX(2, 0, 1)>,	/* ET0_TXD3 */
+				 <RZG2L_PORT_PINMUX(3, 0, 1)>,	/* ET0_RXC */
+				 <RZG2L_PORT_PINMUX(3, 1, 1)>,	/* ET0_RX_CTL */
+				 <RZG2L_PORT_PINMUX(3, 2, 1)>,	/* ET0_RXD0 */
+				 <RZG2L_PORT_PINMUX(3, 3, 1)>,	/* ET0_RXD1 */
+				 <RZG2L_PORT_PINMUX(4, 0, 1)>,	/* ET0_RXD2 */
+				 <RZG2L_PORT_PINMUX(4, 1, 1)>,	/* ET0_RXD3 */
+				 <RZG2L_PORT_PINMUX(4, 3, 1)>,	/* ET0_MDC */
+				 <RZG2L_PORT_PINMUX(4, 4, 1)>,	/* ET0_MDIO */
+				 <RZG2L_PORT_PINMUX(4, 5, 1)>;	/* ET0_LINKSTA */
+			power-source = <1800>;
+		};
+	};
+
+	eth1-phy-irq-hog {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(12, 1) GPIO_ACTIVE_LOW>;
+		input;
+		line-name = "eth1-phy-irq";
+	};
+
+	eth1_pins: eth1 {
+		txc {
+			pinmux = <RZG2L_PORT_PINMUX(7, 0, 1)>;	/* ET1_TXC */
+			power-source = <1800>;
+			output-enable;
+			input-enable;
+			drive-strength-microamp = <5200>;
+		};
+
+		tx_ctl {
+			pinmux = <RZG2L_PORT_PINMUX(7, 1, 1)>;	/* ET1_TX_CTL */
+			power-source = <1800>;
+			output-enable;
+			drive-strength-microamp = <5200>;
+		};
+
+		mux {
+			pinmux = <RZG2L_PORT_PINMUX(7, 2, 1)>,	/* ET1_TXD0 */
+				 <RZG2L_PORT_PINMUX(7, 3, 1)>,	/* ET1_TXD1 */
+				 <RZG2L_PORT_PINMUX(7, 4, 1)>,	/* ET1_TXD2 */
+				 <RZG2L_PORT_PINMUX(8, 0, 1)>,	/* ET1_TXD3 */
+				 <RZG2L_PORT_PINMUX(8, 4, 1)>,	/* ET1_RXC */
+				 <RZG2L_PORT_PINMUX(9, 0, 1)>,	/* ET1_RX_CTL */
+				 <RZG2L_PORT_PINMUX(9, 1, 1)>,	/* ET1_RXD0 */
+				 <RZG2L_PORT_PINMUX(9, 2, 1)>,	/* ET1_RXD1 */
+				 <RZG2L_PORT_PINMUX(9, 3, 1)>,	/* ET1_RXD2 */
+				 <RZG2L_PORT_PINMUX(10, 0, 1)>,	/* ET1_RXD3 */
+				 <RZG2L_PORT_PINMUX(10, 2, 1)>,	/* ET1_MDC */
+				 <RZG2L_PORT_PINMUX(10, 3, 1)>,	/* ET1_MDIO */
+				 <RZG2L_PORT_PINMUX(10, 4, 1)>;	/* ET1_LINKSTA */
+			power-source = <1800>;
+		};
+	};
+
 	sdhi0_pins: sd0 {
 		data {
 			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3";
-- 
2.39.2

