Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22FB2E6BDA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Dec 2020 00:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730707AbgL1Wzx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 17:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729400AbgL1UXL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 15:23:11 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A566C061793;
        Mon, 28 Dec 2020 12:22:31 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id w17so10404979ilj.8;
        Mon, 28 Dec 2020 12:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xxquc3ewI0O/zXR70TYlCPWwGQHiUyK2IYglZ5RF74A=;
        b=nI5EVkWP7ysJbwXaE7zmsLZdQIpnUzaFmfAVb+yYDkZMw+ujnURX3vBspKBr3RKPy3
         rv78MVBaARcvwFI1zF0Exy+3KSCK/Ych6PD9ZYDcdCsPIePM8kOixqkI90jNLPsPtrym
         jlyTQfM7Mu3JhUGwhnRA6Jews19b8wt+JHRvKwjv56SP1Agr37vePticr//k4eK6OMlt
         /ra7faTENbsrWWl+ENowvOf87kjMoHclwzRl64/LhcIzUIyNKe+ateXagmHRwH4zU24N
         XwOljSFcXXXcO1VpfenhtqlB5nJ+2cug6ogT888qP3bzFu4CMI9kcjpKlEmxrZmB+dKQ
         J5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xxquc3ewI0O/zXR70TYlCPWwGQHiUyK2IYglZ5RF74A=;
        b=sLXyfJsxu5kAuxMaKJ+Gt7iLnxEBIImK66htqjFtXoDsJZD8eLWAZ+P5VzzOkw54Jm
         jfB8+tSzlvIl2HXuJbHP/Ch7fcPtVF8XCnQpZHGQUDk7ChOfB09T31/iQg8PTXn6pbOn
         mT8YfVN7rLypuDulV0t69oJch8Yy9ImNAd5Asr+PjZ60nZVvgdPV1JsqghZftUXZAjMG
         9sGGZPoglWEU9LJSgGJJrkR2piPn/a8pm6Pl72PF/orhRw3eApWa1ONfnolbKvYPQsdJ
         c4dpGYp+AkbWaHf9wGjYY558VREVcM3T6Cg2RtYhz5jciT6LhZAkCdFo0uIYyoP2S7cX
         EhZA==
X-Gm-Message-State: AOAM533A52soE4jhf+WgqvUdigZkodzRSrO2xPeqe5vaIxL97neaMZCG
        WJmcNM/0mkyyz9gw0mXs9VfEFl9IKjx5PA==
X-Google-Smtp-Source: ABdhPJx18NiuthAgsp/AZRDVzF4gtVdZbpuTRTpo5OQMqYy22nfnMuxNCXmx9vuxHmmjGi7711yv8w==
X-Received: by 2002:a92:8495:: with SMTP id y21mr44221168ilk.55.1609186950476;
        Mon, 28 Dec 2020 12:22:30 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id w3sm29043763ilk.17.2020.12.28.12.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:22:30 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: Add usb2_clksel to RZ/G2 M/N/H
Date:   Mon, 28 Dec 2020 14:22:21 -0600
Message-Id: <20201228202221.2327468-2-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201228202221.2327468-1-aford173@gmail.com>
References: <20201228202221.2327468-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Per the reference manal for the RZ/G Series, 2nd Generation,
the RZ/G2M, RZ/G2N, and RZ/G2H have a bit that can be set to
choose between a crystal oscillator and an external oscillator.

Because only boards that need this should enable it, it's marked
as disabled by default for backwards compatibility with existing
boards.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index d37ec42a1caa..60e150320ce8 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -835,6 +835,21 @@ hsusb: usb@e6590000 {
 			status = "disabled";
 		};
 
+		usb2_clksel: clock-controller@e6590630 {
+			compatible = "renesas,r8a774a1-rcar-usb2-clock-sel",
+				     "renesas,rcar-gen3-usb2-clock-sel";
+			reg = <0 0xe6590630 0 0x02>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>,
+				 <&usb_extal_clk>, <&usb3s0_clk>;
+			clock-names = "ehci_ohci", "hs-usb-if",
+				      "usb_extal", "usb_xtal";
+			#clock-cells = <0>;
+			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
+			resets = <&cpg 703>, <&cpg 704>;
+			reset-names = "ehci_ohci", "hs-usb-if";
+			status = "disabled";
+		};
+
 		usb_dmac0: dma-controller@e65a0000 {
 			compatible = "renesas,r8a774a1-usb-dmac",
 				     "renesas,usb-dmac";
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 83523916d360..20003a41a706 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -709,6 +709,21 @@ hsusb: usb@e6590000 {
 			status = "disabled";
 		};
 
+		usb2_clksel: clock-controller@e6590630 {
+			compatible = "renesas,r8a774b1-rcar-usb2-clock-sel",
+				     "renesas,rcar-gen3-usb2-clock-sel";
+			reg = <0 0xe6590630 0 0x02>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>,
+				 <&usb_extal_clk>, <&usb3s0_clk>;
+			clock-names = "ehci_ohci", "hs-usb-if",
+				      "usb_extal", "usb_xtal";
+			#clock-cells = <0>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 703>, <&cpg 704>;
+			reset-names = "ehci_ohci", "hs-usb-if";
+			status = "disabled";
+		};
+
 		usb_dmac0: dma-controller@e65a0000 {
 			compatible = "renesas,r8a774b1-usb-dmac",
 				     "renesas,usb-dmac";
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 1333b02d623a..2e6c12a46daf 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -890,6 +890,21 @@ hsusb: usb@e6590000 {
 			status = "disabled";
 		};
 
+		usb2_clksel: clock-controller@e6590630 {
+			compatible = "renesas,r8a774e1-rcar-usb2-clock-sel",
+				     "renesas,rcar-gen3-usb2-clock-sel";
+			reg = <0 0xe6590630 0 0x02>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>,
+				 <&usb_extal_clk>, <&usb3s0_clk>;
+			clock-names = "ehci_ohci", "hs-usb-if",
+				      "usb_extal", "usb_xtal";
+			#clock-cells = <0>;
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 703>, <&cpg 704>;
+			reset-names = "ehci_ohci", "hs-usb-if";
+			status = "disabled";
+		};
+
 		usb_dmac0: dma-controller@e65a0000 {
 			compatible = "renesas,r8a774e1-usb-dmac",
 				     "renesas,usb-dmac";
-- 
2.25.1

