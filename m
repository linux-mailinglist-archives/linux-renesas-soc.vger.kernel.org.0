Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8B3509B6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 11:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387227AbiDUJDm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 05:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387226AbiDUJDi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 05:03:38 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D31822509;
        Thu, 21 Apr 2022 02:00:48 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 8D7116001D;
        Thu, 21 Apr 2022 09:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650531646;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R/gL8psCUex15I9iG3R0MKEQB83NBv2dh3XrVuv3CyM=;
        b=a0YwgfAC7rYzOe5ILn+k1y8CbGUjgz+3F4wm1STj0kM2MUv0tC16Mxr8Q7ujOZljDaPhaQ
        6LChAAnRMrx0zFFCwrA4GLCPUmMKPuZEOo/OHCHYVKOmJUJbxBeMI9J2iBk7QWBNAcsuu5
        0Gu9ZqF4jB3f8qH1nArvKIy4ikJr6uzPlpQtP1B7B0rm7JclbLX3VHqTOZn10SPIcZm9Y2
        M0axJZDyhfcW8+eDM+vQXhCLV7WfdAQhJznT02V048/vo2hrKIhz70R791XIxNcWoEmxJ9
        7cp5l7zPBCy3ANSa9YhT3O8FNDWXInMS3S4AbcOoBHKycnadP8lORo0dbO6pMQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: [PATCH v2 7/7] ARM: dts: r9a06g032: Describe the RTC
Date:   Thu, 21 Apr 2022 11:00:16 +0200
Message-Id: <20220421090016.79517-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220421090016.79517-1-miquel.raynal@bootlin.com>
References: <20220421090016.79517-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the SoC RTC which counts time and provides alarm support.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm/boot/dts/r9a06g032.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 4288b935fcea..cdb3341cb3c6 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -66,6 +66,18 @@ soc {
 		interrupt-parent = <&gic>;
 		ranges;
 
+		rtc0: rtc@40006000 {
+			compatible = "renesas,r9a06g032-rtc", "renesas,rzn1-rtc";
+			reg = <0x40006000 0x1000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 67 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "alarm", "timer", "pps";
+			clocks = <&sysctrl R9A06G032_HCLK_RTC>;
+			clock-names = "hclk";
+			status = "disabled";
+		};
+
 		wdt0: watchdog@40008000 {
 			compatible = "renesas,r9a06g032-wdt", "renesas,rzn1-wdt";
 			reg = <0x40008000 0x1000>;
-- 
2.27.0

