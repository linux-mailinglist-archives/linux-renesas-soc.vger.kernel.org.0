Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 035796D00A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jul 2019 16:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390581AbfGROnt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jul 2019 10:43:49 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36385 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390574AbfGROnt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jul 2019 10:43:49 -0400
Received: by mail-pl1-f195.google.com with SMTP id k8so14019573plt.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jul 2019 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=DYz3Omxnx7BR96BFtu0zoSw+OlWD5d69rlF3AaMnJ/Y=;
        b=QhX4Qduu+XSDHNav2nzjJjeazJ+CRuQGmHH78bDulZpwaTRQpyUpoSAar+Rp3IIals
         oIbPknAGIbWRuvo0OBgdYsn0ZGQy2zwu85qY7SU2mhjCYeeDHGVE5X2GQtB85WRTIQN7
         XpP0hEn+Tu+LV1W+6xCHxnDA/p+MN++Hqgr8YHMiUB5JheTrAJHIJCQk47CRAAOSXYxn
         d85TwEuvURvbVb3u3FfavNqyOWAfM2yvR9oIv/AJHDnZhbZLpRmgPkP4Cr1eqhGqIC9z
         jraxSXt182f55XXMhjHoCo99NJIOnRRcToCPpq3BCwhN1dnRP/8PuAr7pK/ES/EGB0ud
         ozfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DYz3Omxnx7BR96BFtu0zoSw+OlWD5d69rlF3AaMnJ/Y=;
        b=pfspAnQHIPe8kbwz7s0ZKcY2wsaBNJ2N/5NVzOEBj3U8Q7IDqWkFg8iSJXA/QB+Jlj
         PAQ8E4zG19BN2bliZHQUza930gGVuXH76T9cRAbKQzgp3TfC4rpQDBSBOLyaynECm58k
         B/L4cHVERDnE7YbrxodUtCebrCdTpx5Oyr/tNNMi/+RZ8uHvA8gsjYtUsRk6HVwn6Ka6
         VK7Lj/R95L8f6/B6eSWHAQfOb8KEGzBWvxi3Rr/Z8m8BfdIKZ6MBC8hcNhdmoW7mGBiK
         fWHS9j4PQvgsYvXbmf/SpzFVHPd/PJ8sGD3ISKQ6SAvpgn64KiXKMNkgGc79Fz8n359x
         B7pg==
X-Gm-Message-State: APjAAAUT777SKUW08675znZAb5bFxWouueQWtYJX74brlhPhoHzpE1fF
        gRlpEP/3lKJJYCKNaSPS2q8DAz5z
X-Google-Smtp-Source: APXvYqzw5eNB2GTH8yRyVaozf7YaelwFuBbHD6WQBJvw85QaYPAWGx5ybvxQ+IsiuCh2/WpKznfQ4w==
X-Received: by 2002:a17:902:8bc1:: with SMTP id r1mr1675194plo.42.1563461027377;
        Thu, 18 Jul 2019 07:43:47 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id r6sm20020254pgl.74.2019.07.18.07.43.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 18 Jul 2019 07:43:46 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a7795: sort nodes
Date:   Thu, 18 Jul 2019 23:43:26 +0900
Message-Id: <1563461006-19658-1-git-send-email-ykaneko0929@gmail.com>
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

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 154 +++++++++++++++----------------
 1 file changed, 77 insertions(+), 77 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 1745ac4..6cd5fe4 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2731,6 +2731,83 @@
 			resets = <&cpg 820>;
 		};
 
+		vspbc: vsp@fe920000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe920000 0 0x8000>;
+			interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 624>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+			resets = <&cpg 624>;
+
+			renesas,fcp = <&fcpvb1>;
+		};
+
+		vspbd: vsp@fe960000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe960000 0 0x8000>;
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 626>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+			resets = <&cpg 626>;
+
+			renesas,fcp = <&fcpvb0>;
+		};
+
+		vspd0: vsp@fea20000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea20000 0 0x5000>;
+			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 623>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 623>;
+
+			renesas,fcp = <&fcpvd0>;
+		};
+
+		vspd1: vsp@fea28000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea28000 0 0x5000>;
+			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 622>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 622>;
+
+			renesas,fcp = <&fcpvd1>;
+		};
+
+		vspd2: vsp@fea30000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea30000 0 0x5000>;
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 621>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 621>;
+
+			renesas,fcp = <&fcpvd2>;
+		};
+
+		vspi0: vsp@fe9a0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe9a0000 0 0x8000>;
+			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 631>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+			resets = <&cpg 631>;
+
+			renesas,fcp = <&fcpvi0>;
+		};
+
+		vspi1: vsp@fe9b0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfe9b0000 0 0x8000>;
+			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 630>;
+			power-domains = <&sysc R8A7795_PD_A3VP>;
+			resets = <&cpg 630>;
+
+			renesas,fcp = <&fcpvi1>;
+		};
+
 		fdp1@fe940000 {
 			compatible = "renesas,fdp1";
 			reg = <0 0xfe940000 0 0x2400>;
@@ -2832,83 +2909,6 @@
 			iommus = <&ipmmu_vi1 10>;
 		};
 
-		vspbd: vsp@fe960000 {
-			compatible = "renesas,vsp2";
-			reg = <0 0xfe960000 0 0x8000>;
-			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 626>;
-			power-domains = <&sysc R8A7795_PD_A3VP>;
-			resets = <&cpg 626>;
-
-			renesas,fcp = <&fcpvb0>;
-		};
-
-		vspbc: vsp@fe920000 {
-			compatible = "renesas,vsp2";
-			reg = <0 0xfe920000 0 0x8000>;
-			interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 624>;
-			power-domains = <&sysc R8A7795_PD_A3VP>;
-			resets = <&cpg 624>;
-
-			renesas,fcp = <&fcpvb1>;
-		};
-
-		vspd0: vsp@fea20000 {
-			compatible = "renesas,vsp2";
-			reg = <0 0xfea20000 0 0x5000>;
-			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 623>;
-			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			resets = <&cpg 623>;
-
-			renesas,fcp = <&fcpvd0>;
-		};
-
-		vspd1: vsp@fea28000 {
-			compatible = "renesas,vsp2";
-			reg = <0 0xfea28000 0 0x5000>;
-			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 622>;
-			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			resets = <&cpg 622>;
-
-			renesas,fcp = <&fcpvd1>;
-		};
-
-		vspd2: vsp@fea30000 {
-			compatible = "renesas,vsp2";
-			reg = <0 0xfea30000 0 0x5000>;
-			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 621>;
-			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-			resets = <&cpg 621>;
-
-			renesas,fcp = <&fcpvd2>;
-		};
-
-		vspi0: vsp@fe9a0000 {
-			compatible = "renesas,vsp2";
-			reg = <0 0xfe9a0000 0 0x8000>;
-			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 631>;
-			power-domains = <&sysc R8A7795_PD_A3VP>;
-			resets = <&cpg 631>;
-
-			renesas,fcp = <&fcpvi0>;
-		};
-
-		vspi1: vsp@fe9b0000 {
-			compatible = "renesas,vsp2";
-			reg = <0 0xfe9b0000 0 0x8000>;
-			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 630>;
-			power-domains = <&sysc R8A7795_PD_A3VP>;
-			resets = <&cpg 630>;
-
-			renesas,fcp = <&fcpvi1>;
-		};
-
 		csi20: csi2@fea80000 {
 			compatible = "renesas,r8a7795-csi2";
 			reg = <0 0xfea80000 0 0x10000>;
-- 
1.9.1

