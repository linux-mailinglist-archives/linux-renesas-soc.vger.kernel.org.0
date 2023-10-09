Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F33687BD756
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Oct 2023 11:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345944AbjJIJj5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Oct 2023 05:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345943AbjJIJj4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2023 05:39:56 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C85694;
        Mon,  9 Oct 2023 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696844394; x=1728380394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JeWUK0ufN5IjWUK8JaRe4S+wcrQNicrtckqH96ZSDM8=;
  b=PGy7gZDVXLup/b8tgi19ODcvhMaisI/n2NRebNJX/Og6qE/nguc5gHiL
   jBkxJDNu+fn+RyWqrXOmed/FQjXCTRvlAPBY352JT67LZ/ybv+cesa5pX
   GezL1aq05+7vh+SPo829BJQ3WswCZPA0U2gTibSxaxZyi+hrAoVTUIJAv
   hr5TCxsEpJTBHiPq7/h8IJtVeb/0GCbR6dI9NS+CYC4LiblOCJkwx0Uxa
   MOgma18IFbCri9sHFEDXQ2Qmq827C2h7ctb94AxNzdtTpOzRhBQgOQ7xJ
   /NVg8X6M7HutvzBIpbVFCvfDqJL22lz4d4vUVQ9Ec50/FyKsMItfgJWcP
   Q==;
X-CSE-ConnectionGUID: nHcpOlFLSxmSorApbn9xxA==
X-CSE-MsgGUID: cZ/MGWGBSeq5RRmjdsMsOA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="9639711"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2023 02:39:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 9 Oct 2023 02:39:52 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 9 Oct 2023 02:39:48 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <linux-riscv@lists.indradead.org>
CC:     <conor@kernel.org>, <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Paul Walmsley" <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chen-Yu Tsai <wens@csie.org>,
        "Jernej Skrabec" <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "Emil Renner Berthing" <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <linux-renesas-soc@vger.kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 2/6] riscv: dts: sifive: convert isa detection to new properties
Date:   Mon, 9 Oct 2023 10:37:46 +0100
Message-ID: <20231009-economic-shorty-16422a511728@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009-approve-verbalize-ce9324858e76@wendy>
References: <20231009-approve-verbalize-ce9324858e76@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4405; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=JeWUK0ufN5IjWUK8JaRe4S+wcrQNicrtckqH96ZSDM8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnKJ1+2XVrdyCb1IPr755MXis9tyH9tzsdUVzqlLbZzS8wU f9sLHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIlzRGhgar4j2as46vONFQ0Faq1T BR/tmhtRI/bE88/TMputTGs46R4Y7GokdKzh0yFTc2X4ze9HPxsgnixcfn1H3Qn7OPdYtaExMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the fu540 and fu740 devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 15 +++++++++++++++
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 24bba83bec77..156330a9bbf3 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -30,6 +30,9 @@ cpu0: cpu@0 {
 			i-cache-size = <16384>;
 			reg = <0>;
 			riscv,isa = "rv64imac";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "c", "zicntr", "zicsr", "zifencei",
+					       "zihpm";
 			status = "disabled";
 			cpu0_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -53,6 +56,9 @@ cpu1: cpu@1 {
 			mmu-type = "riscv,sv39";
 			reg = <1>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			next-level-cache = <&l2cache>;
 			cpu1_intc: interrupt-controller {
@@ -77,6 +83,9 @@ cpu2: cpu@2 {
 			mmu-type = "riscv,sv39";
 			reg = <2>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			next-level-cache = <&l2cache>;
 			cpu2_intc: interrupt-controller {
@@ -101,6 +110,9 @@ cpu3: cpu@3 {
 			mmu-type = "riscv,sv39";
 			reg = <3>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			next-level-cache = <&l2cache>;
 			cpu3_intc: interrupt-controller {
@@ -125,6 +137,9 @@ cpu4: cpu@4 {
 			mmu-type = "riscv,sv39";
 			reg = <4>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			next-level-cache = <&l2cache>;
 			cpu4_intc: interrupt-controller {
diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index 5235fd1c9cb6..6150f3397bff 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -31,6 +31,9 @@ cpu0: cpu@0 {
 			next-level-cache = <&ccache>;
 			reg = <0x0>;
 			riscv,isa = "rv64imac";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "c", "zicntr", "zicsr", "zifencei",
+					       "zihpm";
 			status = "disabled";
 			cpu0_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -55,6 +58,9 @@ cpu1: cpu@1 {
 			next-level-cache = <&ccache>;
 			reg = <0x1>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			cpu1_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -79,6 +85,9 @@ cpu2: cpu@2 {
 			next-level-cache = <&ccache>;
 			reg = <0x2>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			cpu2_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -103,6 +112,9 @@ cpu3: cpu@3 {
 			next-level-cache = <&ccache>;
 			reg = <0x3>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			cpu3_intc: interrupt-controller {
 				#interrupt-cells = <1>;
@@ -127,6 +139,9 @@ cpu4: cpu@4 {
 			next-level-cache = <&ccache>;
 			reg = <0x4>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			tlb-split;
 			cpu4_intc: interrupt-controller {
 				#interrupt-cells = <1>;
-- 
2.40.1

