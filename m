Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09CED6D011
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jul 2019 16:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbfGROoE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jul 2019 10:44:04 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42373 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727623AbfGROoE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jul 2019 10:44:04 -0400
Received: by mail-pf1-f196.google.com with SMTP id q10so12723999pff.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jul 2019 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UAl1W7MImbSfwTdh8xgsN/YlzD+PyMoJaAV8+pubsJU=;
        b=Jq3tt+C+LjMAOvp3ALVg8NgVht3plq/vQd5L1A/xgJgXMsJ2EMy8MNv21FLs3zP5pb
         YURB1IYZorCCBnJdFAzvHUi2c7Fw4SY3GK+A7jRl0U+gyMhwCjoSQ6ybMCISPWAsjH+E
         +eYiWJ6bBKczBTrHbGnqOrj8Vfic6EX0xuXgTLcQ5MYrfDW1d+woxiiQ2AQBfntrQmLV
         7FaWlThWVQxGWUhf9cv2aeU4eaQzblZLVgZ2jTYnMm5ZGoApf9Ib2g4Vtjw9/HgvuYCj
         CotSL6WmUroEG8y3rReS7bkoOezJysxlCNB+gb5u4xlSGbPPhC0dN++4DTk+wThdf7j3
         jeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UAl1W7MImbSfwTdh8xgsN/YlzD+PyMoJaAV8+pubsJU=;
        b=XpWQTGRVO46CQujs0zzoIHyI6k4Of7nczhZ+JdY2AaOtaNXpckn3DQOlerwbyCX7FS
         T6mBzPMLh0MIxKtnCv51lfovhOH6nNc+S1iYTWE/CuuaPYPe+vexBTmDHRc/1DunEgCu
         btSepLuaw0TWAua6xjaWDVnPOp+/rR5WUu9hVPP20KR4kubSBUMbkJfMyEbpLsIzGjru
         Uu1sghOeMsn7YXVBIGD4lPX/vGoAT2XCimtKKQR+W3pHMhu9zTdfr93Py8P5pZQYMhu0
         hSF5AzkgC2263VPfzKPd4zTNG92anygoZbV/IGkAIoD8xBYddBZSmKZA8lGz173Gn3e+
         aN6Q==
X-Gm-Message-State: APjAAAW+qxUft+LpF/HrO6c1Xfq6O4OHFIz4HY9NCdNpPg+g17+Rtj0f
        H4qDdxYgqHlkK+3k6Goaq2Zdijs1
X-Google-Smtp-Source: APXvYqwK1/wxa7fnanMyRW8cyiNApaeWzQk0QNyNtgRqZzy+va6aNyMS7YmRl8TzukaiH/U3DtTpwA==
X-Received: by 2002:a63:1918:: with SMTP id z24mr46047729pgl.94.1563461042895;
        Thu, 18 Jul 2019 07:44:02 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id j15sm28585934pfr.146.2019.07.18.07.44.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 18 Jul 2019 07:44:01 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a7795-es1: sort nodes node
Date:   Thu, 18 Jul 2019 23:43:53 +0900
Message-Id: <1563461033-19708-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sort nodes.

If node address is present
   * Sort by node address, grouping all nodes with the same compat string
     and sorting the group alphabetically.
Else
   * Sort alphabetically

This should not have any run-time effect.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the devel branch of Simon Horman's renesas tree.

 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 223 ++++++++++++++-------------
 1 file changed, 112 insertions(+), 111 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 40d10da..e4650ae 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -7,22 +7,75 @@
 
 #include "r8a7795.dtsi"
 
-&soc {
-	xhci1: usb@ee040000 {
-		compatible = "renesas,xhci-r8a7795", "renesas,rcar-gen3-xhci";
-		reg = <0 0xee040000 0 0xc00>;
-		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_MOD 327>;
-		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-		resets = <&cpg 327>;
-		status = "disabled";
-	};
+&audma0 {
+	iommus = <&ipmmu_mp1 0>, <&ipmmu_mp1 1>,
+	       <&ipmmu_mp1 2>, <&ipmmu_mp1 3>,
+	       <&ipmmu_mp1 4>, <&ipmmu_mp1 5>,
+	       <&ipmmu_mp1 6>, <&ipmmu_mp1 7>,
+	       <&ipmmu_mp1 8>, <&ipmmu_mp1 9>,
+	       <&ipmmu_mp1 10>, <&ipmmu_mp1 11>,
+	       <&ipmmu_mp1 12>, <&ipmmu_mp1 13>,
+	       <&ipmmu_mp1 14>, <&ipmmu_mp1 15>;
+};
 
-	/delete-node/ mmu@febe0000;
-	/delete-node/ mmu@fe980000;
-	/delete-node/ mmu@fd950000;
-	/delete-node/ mmu@fd960000;
-	/delete-node/ mmu@fd970000;
+&audma1 {
+	iommus = <&ipmmu_mp1 16>, <&ipmmu_mp1 17>,
+	       <&ipmmu_mp1 18>, <&ipmmu_mp1 19>,
+	       <&ipmmu_mp1 20>, <&ipmmu_mp1 21>,
+	       <&ipmmu_mp1 22>, <&ipmmu_mp1 23>,
+	       <&ipmmu_mp1 24>, <&ipmmu_mp1 25>,
+	       <&ipmmu_mp1 26>, <&ipmmu_mp1 27>,
+	       <&ipmmu_mp1 28>, <&ipmmu_mp1 29>,
+	       <&ipmmu_mp1 30>, <&ipmmu_mp1 31>;
+};
+
+&du {
+	vsps = <&vspd0 &vspd1 &vspd2 &vspd3>;
+};
+
+&fcpvb1 {
+	iommus = <&ipmmu_vp0 7>;
+};
+
+&fcpf1 {
+	iommus = <&ipmmu_vp0 1>;
+};
+
+&fcpvi1 {
+	iommus = <&ipmmu_vp0 9>;
+};
+
+&fcpvd2 {
+	iommus = <&ipmmu_vi0 10>;
+};
+
+&gpio1 {
+	gpio-ranges = <&pfc 0 32 28>;
+};
+
+&ipmmu_vi0 {
+	renesas,ipmmu-main = <&ipmmu_mm 11>;
+};
+
+&ipmmu_vp0 {
+	renesas,ipmmu-main = <&ipmmu_mm 12>;
+};
+
+&ipmmu_vc0 {
+	renesas,ipmmu-main = <&ipmmu_mm 9>;
+};
+
+&ipmmu_vc1 {
+	renesas,ipmmu-main = <&ipmmu_mm 10>;
+};
+
+&ipmmu_rt {
+	renesas,ipmmu-main = <&ipmmu_mm 7>;
+};
+
+&soc {
+	/delete-node/ dma-controller@e6460000;
+	/delete-node/ dma-controller@e6470000;
 
 	ipmmu_mp1: mmu@ec680000 {
 		compatible = "renesas,ipmmu-r8a7795";
@@ -40,13 +93,37 @@
 		#iommu-cells = <1>;
 	};
 
-	/delete-node/ usb-phy@ee0e0200;
-	/delete-node/ usb@ee0e0100;
-	/delete-node/ usb@ee0e0000;
+	/delete-node/ mmu@fd950000;
+	/delete-node/ mmu@fd960000;
+	/delete-node/ mmu@fd970000;
+	/delete-node/ mmu@febe0000;
+	/delete-node/ mmu@fe980000;
+
+	xhci1: usb@ee040000 {
+		compatible = "renesas,xhci-r8a7795", "renesas,rcar-gen3-xhci";
+		reg = <0 0xee040000 0 0xc00>;
+		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 327>;
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		resets = <&cpg 327>;
+		status = "disabled";
+	};
+
 	/delete-node/ usb@e659c000;
+	/delete-node/ usb@ee0e0000;
+	/delete-node/ usb@ee0e0100;
 
-	/delete-node/ dma-controller@e6460000;
-	/delete-node/ dma-controller@e6470000;
+	/delete-node/ usb-phy@ee0e0200;
+
+	fdp1@fe948000 {
+		compatible = "renesas,fdp1";
+		reg = <0 0xfe948000 0 0x2400>;
+		interrupts = <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 117>;
+		power-domains = <&sysc R8A7795_PD_A3VP>;
+		resets = <&cpg 117>;
+		renesas,fcp = <&fcpf2>;
+	};
 
 	fcpf2: fcp@fe952000 {
 		compatible = "renesas,fcpf";
@@ -57,15 +134,13 @@
 		iommus = <&ipmmu_vp0 2>;
 	};
 
-	vspi2: vsp@fe9c0000 {
-		compatible = "renesas,vsp2";
-		reg = <0 0xfe9c0000 0 0x8000>;
-		interrupts = <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_MOD 629>;
-		power-domains = <&sysc R8A7795_PD_A3VP>;
-		resets = <&cpg 629>;
-
-		renesas,fcp = <&fcpvi2>;
+	fcpvd3: fcp@fea3f000 {
+		compatible = "renesas,fcpv";
+		reg = <0 0xfea3f000 0 0x200>;
+		clocks = <&cpg CPG_MOD 600>;
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		resets = <&cpg 600>;
+		iommus = <&ipmmu_vi0 11>;
 	};
 
 	fcpvi2: fcp@fe9cf000 {
@@ -88,23 +163,15 @@
 		renesas,fcp = <&fcpvd3>;
 	};
 
-	fcpvd3: fcp@fea3f000 {
-		compatible = "renesas,fcpv";
-		reg = <0 0xfea3f000 0 0x200>;
-		clocks = <&cpg CPG_MOD 600>;
-		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-		resets = <&cpg 600>;
-		iommus = <&ipmmu_vi0 11>;
-	};
-
-	fdp1@fe948000 {
-		compatible = "renesas,fdp1";
-		reg = <0 0xfe948000 0 0x2400>;
-		interrupts = <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_MOD 117>;
+	vspi2: vsp@fe9c0000 {
+		compatible = "renesas,vsp2";
+		reg = <0 0xfe9c0000 0 0x8000>;
+		interrupts = <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 629>;
 		power-domains = <&sysc R8A7795_PD_A3VP>;
-		resets = <&cpg 117>;
-		renesas,fcp = <&fcpf2>;
+		resets = <&cpg 629>;
+
+		renesas,fcp = <&fcpvi2>;
 	};
 
 	csi21: csi2@fea90000 {
@@ -163,72 +230,6 @@
 	};
 };
 
-&gpio1 {
-	gpio-ranges = <&pfc 0 32 28>;
-};
-
-&ipmmu_vi0 {
-	renesas,ipmmu-main = <&ipmmu_mm 11>;
-};
-
-&ipmmu_vp0 {
-	renesas,ipmmu-main = <&ipmmu_mm 12>;
-};
-
-&ipmmu_vc0 {
-	renesas,ipmmu-main = <&ipmmu_mm 9>;
-};
-
-&ipmmu_vc1 {
-	renesas,ipmmu-main = <&ipmmu_mm 10>;
-};
-
-&ipmmu_rt {
-	renesas,ipmmu-main = <&ipmmu_mm 7>;
-};
-
-&audma0 {
-	iommus = <&ipmmu_mp1 0>, <&ipmmu_mp1 1>,
-	       <&ipmmu_mp1 2>, <&ipmmu_mp1 3>,
-	       <&ipmmu_mp1 4>, <&ipmmu_mp1 5>,
-	       <&ipmmu_mp1 6>, <&ipmmu_mp1 7>,
-	       <&ipmmu_mp1 8>, <&ipmmu_mp1 9>,
-	       <&ipmmu_mp1 10>, <&ipmmu_mp1 11>,
-	       <&ipmmu_mp1 12>, <&ipmmu_mp1 13>,
-	       <&ipmmu_mp1 14>, <&ipmmu_mp1 15>;
-};
-
-&audma1 {
-	iommus = <&ipmmu_mp1 16>, <&ipmmu_mp1 17>,
-	       <&ipmmu_mp1 18>, <&ipmmu_mp1 19>,
-	       <&ipmmu_mp1 20>, <&ipmmu_mp1 21>,
-	       <&ipmmu_mp1 22>, <&ipmmu_mp1 23>,
-	       <&ipmmu_mp1 24>, <&ipmmu_mp1 25>,
-	       <&ipmmu_mp1 26>, <&ipmmu_mp1 27>,
-	       <&ipmmu_mp1 28>, <&ipmmu_mp1 29>,
-	       <&ipmmu_mp1 30>, <&ipmmu_mp1 31>;
-};
-
-&fcpvb1 {
-	iommus = <&ipmmu_vp0 7>;
-};
-
-&fcpf1 {
-	iommus = <&ipmmu_vp0 1>;
-};
-
-&fcpvi1 {
-	iommus = <&ipmmu_vp0 9>;
-};
-
-&fcpvd2 {
-	iommus = <&ipmmu_vi0 10>;
-};
-
-&du {
-	vsps = <&vspd0 &vspd1 &vspd2 &vspd3>;
-};
-
 &vin0 {
 	ports {
 		port@1 {
-- 
1.9.1

