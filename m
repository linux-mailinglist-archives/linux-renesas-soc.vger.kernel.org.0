Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065232E8391
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jan 2021 12:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbhAALkX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jan 2021 06:40:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbhAALkR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jan 2021 06:40:17 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D3DC061575;
        Fri,  1 Jan 2021 03:39:36 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id u12so19230276ilv.3;
        Fri, 01 Jan 2021 03:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=spf9m4oySkfXRmOYLOtYXlnLuOd5zE2rN1tc7By7c8w=;
        b=VxZPj1YrXkV/JQ9RL5Ydgkcqzc6pV+SeskbjITze2+CfIt5iv3LxKeYRNYV/LrjySc
         olhUNoqhTVGgbN+hpH6gic/m+A3PJF9tYwKVq1M3GewBGgwK0shQzLs46Px1B4zZLonN
         dKry3qIV5WcDl0p5RSJlyY4fKeb0Rf+Mz2weC8nO72XTrbZY/MQ4YoLoStwM2mNW4K2Q
         5qtiNKKgGnD41iqpPZ2CTEnKTHaLD2BtNx1HiUN8ssedZG8qIPmRfxiVLSkjbjuBBmaJ
         VC4qBR5ywEajVE8n/z/X144AWfNeguifusuhZsAXfBkuVRwBhm3q3at0p58xtr8zyBy+
         s6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=spf9m4oySkfXRmOYLOtYXlnLuOd5zE2rN1tc7By7c8w=;
        b=tELJw7EwYf+/S3WF/NL7viGLOXlM8doLhhFDegr8Bh3MNHvG6IZUQ+r//S7MNWWMYI
         2rCdy3tcv/+98iCMwe0ikHN23cxyjtvwt5WpdRJKHR/RuuqTs6ELZbmYKNwx95oKNe+N
         p/OaNymjrE1KNZx72ifST8MsPY2FIZA4yjNiQybnuCh/K0NWkfc9iOMoJgg1IvfZ8EVl
         RQ6sD8MeY9+kVEmtcgRjvbJr//opQvNofwtpJJ4EWM8ovMmVU5YgJ1GoKSbTwolJIL63
         HRm73FIcL04xwsTpsD40ZvPlkeVnExZ3uPsZLIelr4zi+v01HHlZqiXxJop9XNJCOcE3
         4ZRA==
X-Gm-Message-State: AOAM533CFANujHDyXX651oXT+ZEhicZsfMu/8qwedsbwM8RIKQt/cxjY
        B0ihedfy9mI9BSlVThaMvs7MG+EEag3hjA==
X-Google-Smtp-Source: ABdhPJzoAMNu1WorVrL9ZWsEI2sToV0jWbT4iKFmF+1GOdGVqdtc5pJgC8cerivP+HX464dCGbYF6g==
X-Received: by 2002:a05:6e02:b2f:: with SMTP id e15mr57827140ilu.37.1609501175804;
        Fri, 01 Jan 2021 03:39:35 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id i6sm33774172ilm.70.2021.01.01.03.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jan 2021 03:39:35 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: rzg2: Add RPC-IF Support
Date:   Fri,  1 Jan 2021 05:39:26 -0600
Message-Id: <20210101113927.3252309-2-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210101113927.3252309-1-aford173@gmail.com>
References: <20210101113927.3252309-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/G2 series contain the SPI Multi I/O Bus Controller (RPC-IF).
Add the nodes, but make them disabled by default.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 17 +++++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index d37ec42a1caa..5246f4d91e84 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2302,6 +2302,23 @@ sdhi3: mmc@ee160000 {
 			status = "disabled";
 		};
 
+		rpc: spi@ee200000 {
+			compatible = "renesas,r8a774a1-rpc-if",
+				     "renesas,rcar-gen3-rpc-if";
+			reg = <0 0xee200000 0 0x200>,
+			      <0 0x08000000 0 0x4000000>,
+			      <0 0xee208000 0 0x100>;
+			reg-names = "regs", "dirmap", "wbuf";
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			clock-names = "rpc";
+			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1010000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 83523916d360..5862aa2ad2bf 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -2160,6 +2160,23 @@ sdhi3: mmc@ee160000 {
 			status = "disabled";
 		};
 
+		rpc: spi@ee200000 {
+			compatible = "renesas,r8a774b1-rpc-if",
+				     "renesas,rcar-gen3-rpc-if";
+			reg = <0 0xee200000 0 0x200>,
+			      <0 0x08000000 0 0x4000000>,
+			      <0 0xee208000 0 0x100>;
+			reg-names = "regs", "dirmap", "wbuf";
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			clock-names = "rpc";
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		sata: sata@ee300000 {
 			compatible = "renesas,sata-r8a774b1",
 				     "renesas,rcar-gen3-sata";
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index e0e54342cd4c..20fa3caa050e 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1654,6 +1654,23 @@ sdhi3: mmc@ee160000 {
 			status = "disabled";
 		};
 
+		rpc: spi@ee200000 {
+			compatible = "renesas,r8a774c0-rpc-if",
+				     "renesas,rcar-gen3-rpc-if";
+			reg = <0 0xee200000 0 0x200>,
+			      <0 0x08000000 0 0x4000000>,
+			      <0 0xee208000 0 0x100>;
+			reg-names = "regs", "dirmap", "wbuf";
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			clock-names = "rpc";
+			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@f1010000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 1333b02d623a..9be94945af8c 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -2393,6 +2393,23 @@ sdhi3: mmc@ee160000 {
 			status = "disabled";
 		};
 
+		rpc: spi@ee200000 {
+			compatible = "renesas,r8a774e1-rpc-if",
+				     "renesas,rcar-gen3-rpc-if";
+			reg = <0 0xee200000 0 0x200>,
+			      <0 0x08000000 0 0x4000000>,
+			      <0 0xee208000 0 0x100>;
+			reg-names = "regs", "dirmap", "wbuf";
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 917>;
+			clock-names = "rpc";
+			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		sata: sata@ee300000 {
 			compatible = "renesas,sata-r8a774e1",
 				     "renesas,rcar-gen3-sata";
-- 
2.25.1

