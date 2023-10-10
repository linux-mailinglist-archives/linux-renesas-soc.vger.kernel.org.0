Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 650EE7BFD74
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Oct 2023 15:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232360AbjJJN1b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Oct 2023 09:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232231AbjJJN1U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 09:27:20 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21162B8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 06:27:18 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so9960777a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2023 06:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1696944436; x=1697549236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTS0RsVqbjVNm/cAfof2qqXtb+VFg82/jG1YYiHr1T0=;
        b=gTFrILYKCcsIPK70wq4c8lJ5V0lvOwEru3v2+NBy/JLbnyO4AzZldFA0hixyyVlmHf
         Lg08TQXDD0Ftm2xVUiJ0rmUIqwRwc+vEArhuXqS3q+sDZBsIjJlrM4+h0Ynrnp0zIVWH
         QfDivPEcWc527hekFRsLjijnrHcHhCd2JZTULwLxo7ZklxGj8pC0XYZD5G4fwUQM2oV/
         18gNUm+TtUmXv/g7QhsJijTByBnhv/s0nxIo5eDOh2nILS1mdUBFOumetQogH9EU+iK+
         28NkN5nJ0jmQ1BikgAsVNSkSXvGiKw9O/LZ7iLQUy9uuusGuUul7Z02Clneu545aIxnt
         48oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696944436; x=1697549236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTS0RsVqbjVNm/cAfof2qqXtb+VFg82/jG1YYiHr1T0=;
        b=JqH3SWKXQSw0JCGohm1ZVxZGRywtVuex4ato3IwMVd9pkvv3lXZiupYlbDOowdAV4N
         Og7blivh8K5psX3NZqENudlGFpEqjEriwVfkvuCNBtwN884P5ePbf+MoogKI1hqera5c
         edK8vI1QuNDKrnvwzr52rVOazg5j+KeplhLTbb2Sj2HtEp8jVDRn/szL5j7gBysY4LF0
         yKZQjE+oOVbm277qV8F1d0tzxrofIHFXa2D1NLjXEJmLXQJ23jeoil67uu8MEMVth3KP
         ZQSqJ04/S+lxBcTNKDRB8XB3CKkIMl4W2jeUrScXHrsJcJ2TPbkLihAqooFDCjZRdlat
         mdhQ==
X-Gm-Message-State: AOJu0YxETheXLBzgJz0t6H4E7z8YuAzImw1+LCLR132B/hV0PCG8XwZu
        WX9MAdiAAj9qfnADPSp5dopGuA==
X-Google-Smtp-Source: AGHT+IFqR5Nd0aHbkI7c4o1xnDoLgLUB07HdkarXNaM7IrjdRUuK3ik3XgXtC93V3/O2ewGZcptABA==
X-Received: by 2002:a17:907:6c14:b0:9ae:5c99:f2e2 with SMTP id rl20-20020a1709076c1400b009ae5c99f2e2mr14341810ejc.43.1696944436632;
        Tue, 10 Oct 2023 06:27:16 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.152])
        by smtp.gmail.com with ESMTPSA id i16-20020a1709064ed000b0099bd0b5a2bcsm8526578ejv.101.2023.10.10.06.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 06:27:16 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 5/6] arm64: dts: renesas: rzg3s-smarc: Enable SDHI1
Date:   Tue, 10 Oct 2023 16:27:00 +0300
Message-Id: <20231010132701.1658737-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231010132701.1658737-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231010132701.1658737-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add SDHI1 to RZ/G3S Smarc Carrier-II board. This is connected to a uSD
interface. Although Vccq doesn't cross the boundary of SoM it has
been added to RZ/G3S Smarc Carrier-II dtsi to have all the bits related to
SDHI1 in a single place. At the moment SoM is used only with RZ/G3S Smarc
Carrier-II board.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 66 ++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index e7073a09ed2e..71c0cbee6258 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -11,6 +11,27 @@
 / {
 	aliases {
 		serial0 = &scif0;
+		mmc1 = &sdhi1;
+	};
+
+	/* Reserved regulators 0-9 for SoM. */
+	vcc_sdhi1: regulator10 {
+		compatible = "regulator-fixed";
+		regulator-name = "SDHI1 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG2L_GPIO(2, 3) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vccq_sdhi1: regulator11 {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHI1 VccQ";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG2L_GPIO(4, 2) GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <3300000 1>, <1800000 0>;
 	};
 };
 
@@ -19,6 +40,38 @@ scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(6, 3, 1)>, /* RXD */
 			 <RZG2L_PORT_PINMUX(6, 4, 1)>; /* TXD */
 	};
+
+	sdhi1_pins: sd1 {
+		data {
+			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
+			power-source = <3300>;
+		};
+
+		ctrl {
+			pins = "SD1_CLK", "SD1_CMD";
+			power-source = <3300>;
+		};
+
+		cd {
+			pinmux = <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
+		};
+	};
+
+	sdhi1_pins_uhs: sd1-uhs {
+		data {
+			pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3";
+			power-source = <1800>;
+		};
+
+		ctrl {
+			pins = "SD1_CLK", "SD1_CMD";
+			power-source = <1800>;
+		};
+
+		cd {
+			pinmux = <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
+		};
+	};
 };
 
 &scif0 {
@@ -26,3 +79,16 @@ &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	status = "okay";
 };
+
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_pins_uhs>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&vcc_sdhi1>;
+	vqmmc-supply = <&vccq_sdhi1>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	max-frequency = <125000000>;
+	status = "okay";
+};
-- 
2.39.2

