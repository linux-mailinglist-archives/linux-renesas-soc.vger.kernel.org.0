Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD637DDD3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 16:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732006AbfHAOYq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 10:24:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41444 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731986AbfHAOYq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 10:24:46 -0400
Received: by mail-pf1-f195.google.com with SMTP id m30so34182595pff.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Aug 2019 07:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=5uT2pwDuXIe1LO/tNDR3p03ieSG9jK3CMGI5vSshufI=;
        b=U/Z6UAqOS/j/lALnpzcN26kzlcwaPJVKQcP9j7Wgrd7j8dj4d/xrdgTjIx77u0OHR6
         NuuzTOHCJEv+a8o7kcLlVUQ/lGwXUfglBZUKU1UXEaDL9P4YGJfTAh3pArvAAQDeNkPy
         f7eUEZ5wkE7ZCf/BEd9Ae5wVq8qrGPcbroVLDg9LG3TYkA6s2mNc6+OoY17Fvh1zBato
         GajSaduvhGWco2CYp29ULlIE7LkwRZJBZDvYMNXgK9nDbP+qAi2JS66GXUiA62FFCzyY
         DHA3KzcV9euwlsQSQm6i/EQ9T+Wbv6rHWZeHkGt9CVm3MPKikEU6o4Sj+kyqPA7E+57W
         nrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5uT2pwDuXIe1LO/tNDR3p03ieSG9jK3CMGI5vSshufI=;
        b=CJelc+ghrAa+hRPM3tGza/S71S2w1AkrrZDRZEEUlRDFPfUf5oy/O8RnWtfYrnejh1
         YtwbweEo/SXofUxUfvoqzkQb47LLE5FO0akrMQshOpBbLu/hq1FRXx6UnOqwbdO8oiJU
         Ht8C4SwWXwQ/0T2f7HOupYPHusbbTGGQHbmF+cqFLn55+FjS4csUOZKvG2cwfNdBSi1m
         JHtM6mSf+Ewml84g58D1RLgFPdXXc9Jh6dCPzEjR2AGqD4+98PybvwP8zfSv8QgHjWEc
         O5n6qWVcrK3Am3AhzyZH0Nt3SubqO6gxb8ij2BmxPtldyu4d8SghRt81UkdG0yKDeOb2
         FbEA==
X-Gm-Message-State: APjAAAUbe3F6ODGDXxR4kE56P2toGu3Z+hwXvcf2J8alIQN9uDp6GiKL
        bS7iiforMDr/bZ0KiKTWnAVSjvvb
X-Google-Smtp-Source: APXvYqxtGAJdtgn+8GGnATr9/vG6ptszO0XNX8xjHfPT3TT4Iz4sKu0uMzIsSXmF1i0kPbCaYKv+Hg==
X-Received: by 2002:a17:90a:109:: with SMTP id b9mr8621373pjb.112.1564669485620;
        Thu, 01 Aug 2019 07:24:45 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id h12sm5626454pje.12.2019.08.01.07.24.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 01 Aug 2019 07:24:45 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a77990: sort nodes
Date:   Thu,  1 Aug 2019 23:24:36 +0900
Message-Id: <1564669476-22680-1-git-send-email-ykaneko0929@gmail.com>
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

 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 44 +++++++++++++++----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 84d1f58..e51bc4c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1326,6 +1326,17 @@
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
@@ -1342,17 +1353,6 @@
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
@@ -1866,25 +1866,25 @@
 			thermal-sensors = <&thermal 0>;
 			sustainable-power = <717>;
 
-			trips {
-				target: trip-point1 {
-					temperature = <100000>;
-					hysteresis = <2000>;
-					type = "passive";
+			cooling-maps {
+				map0 {
+					trip = <&target>;
+					cooling-device = <&a53_0 0 2>;
+					contribution = <1024>;
 				};
+			};
 
+			trips {
 				sensor1_crit: sensor1-crit {
 					temperature = <120000>;
 					hysteresis = <2000>;
 					type = "critical";
 				};
-			};
 
-			cooling-maps {
-				map0 {
-					trip = <&target>;
-					cooling-device = <&a53_0 0 2>;
-					contribution = <1024>;
+				target: trip-point1 {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "passive";
 				};
 			};
 		};
-- 
1.9.1

