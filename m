Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00DA9923F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2019 14:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfHSM4L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 08:56:11 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36953 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbfHSM4L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 08:56:11 -0400
Received: by mail-pg1-f193.google.com with SMTP id d1so1187018pgp.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Aug 2019 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1kPpq697KE4I4yTusDLL7kboeTs5chvAdrFun387Jig=;
        b=b3L2uHkONuGXDGC5PLbTt27tgkTdwhspafLb7YHiU0YjK67gzft+AmjfL6mvmXWfCM
         52SdPnCgOOYzjKuYPOLsHhvs94SI7kfrdsmYFQLAXor0ApQp9pHQnkKIQkoZSgppy55O
         Hre7nEX0vczfsXyQ6oTIEHGetwAHSx8oDKNlMzOdke22kgpTjSRCZR91TRebPsMAvAec
         NF2S6JKh6OxOLrTSdah6rWTskw+ysdFcuKYBViCz0pa7UxlhWPb3x9K/ITQ/eEVpgcTy
         fWYMlK7N7zk5Rg0NYjZ0jnllJtURvZmt/Fl+8lOMCGStL2JKYNpV3+RaPzkKtGWkyaNI
         v58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1kPpq697KE4I4yTusDLL7kboeTs5chvAdrFun387Jig=;
        b=HAYQ9tkxXum/SvaaBNdjrnSySFPTbdCmei055h7eIg8LeNIAB9i9jJhSmZaCBPQvvZ
         Ga1VN8CtRtbAVzadKovEhjaGSstCqDUKnJSKBmHHlVlZvb2u1mejZra+sQ2clWoZdyXQ
         pIXr86EatlcSyTRhIkHufoSty/fuAkFSAY5WSoXwSrl1DSoXmPmRSXtPhO3yD660hbgA
         GNm2Bn+utQyukuDpSLQd/iSnFEDQ7kKuhJPZ8xfKJy7M2ERF4gLQCGVHRbbMByeYMxpi
         nLE749cE3blO5B00+20IH9spwT0tSY51nPqAlddSw1igqexHecWNytN8QHhxJQCCrl0X
         fr3g==
X-Gm-Message-State: APjAAAVi7/oTGOyDMY+TqUm5bZQCSWoozYENff5gOtOjjZtjfIROoGcJ
        HkoZI+isflFJHE9Z3z9F+EfEuJtG
X-Google-Smtp-Source: APXvYqzKHxoT5zJ9NhwlAyYxbQGvvg/Tsw5V1OH4uzg5aeRYBcen6npeHWV1ieTAmdkb6dXS45+S5Q==
X-Received: by 2002:a65:64c6:: with SMTP id t6mr20204842pgv.323.1566219369615;
        Mon, 19 Aug 2019 05:56:09 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id 14sm17421178pfy.40.2019.08.19.05.56.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 19 Aug 2019 05:56:09 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a774c0: sort nodes
Date:   Mon, 19 Aug 2019 21:56:01 +0900
Message-Id: <1566219361-23088-1-git-send-email-ykaneko0929@gmail.com>
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

This patch is based on the master branch of Geert Uytterhoeven's renesas-devel
tree.

 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 90 +++++++++++++++----------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 746775f..dc80c1a 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1371,6 +1371,17 @@
 				      "ssi.1", "ssi.0";
 			status = "disabled";
 
+			rcar_sound,ctu {
+				ctu00: ctu-0 { };
+				ctu01: ctu-1 { };
+				ctu02: ctu-2 { };
+				ctu03: ctu-3 { };
+				ctu10: ctu-4 { };
+				ctu11: ctu-5 { };
+				ctu12: ctu-6 { };
+				ctu13: ctu-7 { };
+			};
+
 			rcar_sound,dvc {
 				dvc0: dvc-0 {
 					dmas = <&audma0 0xbc>;
@@ -1387,17 +1398,6 @@
 				mix1: mix-1 { };
 			};
 
-			rcar_sound,ctu {
-				ctu00: ctu-0 { };
-				ctu01: ctu-1 { };
-				ctu02: ctu-2 { };
-				ctu03: ctu-3 { };
-				ctu10: ctu-4 { };
-				ctu11: ctu-5 { };
-				ctu12: ctu-6 { };
-				ctu13: ctu-7 { };
-			};
-
 			rcar_sound,src {
 				src0: src-0 {
 					interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
@@ -1706,13 +1706,24 @@
 			renesas,fcp = <&fcpvb0>;
 		};
 
-		fcpvb0: fcp@fe96f000 {
-			compatible = "renesas,fcpv";
-			reg = <0 0xfe96f000 0 0x200>;
-			clocks = <&cpg CPG_MOD 607>;
+		vspd0: vsp@fea20000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea20000 0 0x7000>;
+			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 623>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
-			resets = <&cpg 607>;
-			iommus = <&ipmmu_vp0 5>;
+			resets = <&cpg 623>;
+			renesas,fcp = <&fcpvd0>;
+		};
+
+		vspd1: vsp@fea28000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea28000 0 0x7000>;
+			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 622>;
+			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
+			resets = <&cpg 622>;
+			renesas,fcp = <&fcpvd1>;
 		};
 
 		vspi0: vsp@fe9a0000 {
@@ -1725,23 +1736,13 @@
 			renesas,fcp = <&fcpvi0>;
 		};
 
-		fcpvi0: fcp@fe9af000 {
+		fcpvb0: fcp@fe96f000 {
 			compatible = "renesas,fcpv";
-			reg = <0 0xfe9af000 0 0x200>;
-			clocks = <&cpg CPG_MOD 611>;
-			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
-			resets = <&cpg 611>;
-			iommus = <&ipmmu_vp0 8>;
-		};
-
-		vspd0: vsp@fea20000 {
-			compatible = "renesas,vsp2";
-			reg = <0 0xfea20000 0 0x7000>;
-			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 623>;
+			reg = <0 0xfe96f000 0 0x200>;
+			clocks = <&cpg CPG_MOD 607>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
-			resets = <&cpg 623>;
-			renesas,fcp = <&fcpvd0>;
+			resets = <&cpg 607>;
+			iommus = <&ipmmu_vp0 5>;
 		};
 
 		fcpvd0: fcp@fea27000 {
@@ -1753,16 +1754,6 @@
 			iommus = <&ipmmu_vi0 8>;
 		};
 
-		vspd1: vsp@fea28000 {
-			compatible = "renesas,vsp2";
-			reg = <0 0xfea28000 0 0x7000>;
-			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 622>;
-			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
-			resets = <&cpg 622>;
-			renesas,fcp = <&fcpvd1>;
-		};
-
 		fcpvd1: fcp@fea2f000 {
 			compatible = "renesas,fcpv";
 			reg = <0 0xfea2f000 0 0x200>;
@@ -1772,6 +1763,15 @@
 			iommus = <&ipmmu_vi0 9>;
 		};
 
+		fcpvi0: fcp@fe9af000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfe9af000 0 0x200>;
+			clocks = <&cpg CPG_MOD 611>;
+			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
+			resets = <&cpg 611>;
+			iommus = <&ipmmu_vp0 8>;
+		};
+
 		csi40: csi2@feaa0000 {
 			compatible = "renesas,r8a774c0-csi2";
 			reg = <0 0xfeaa0000 0 0x10000>;
@@ -1908,6 +1908,9 @@
 			polling-delay = <1000>;
 			thermal-sensors = <&thermal>;
 
+			cooling-maps {
+			};
+
 			trips {
 				cpu-crit {
 					temperature = <120000>;
@@ -1915,9 +1918,6 @@
 					type = "critical";
 				};
 			};
-
-			cooling-maps {
-			};
 		};
 	};
 
-- 
1.9.1

