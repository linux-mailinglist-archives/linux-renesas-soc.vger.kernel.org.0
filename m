Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 767C76D022
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jul 2019 16:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390648AbfGROpz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jul 2019 10:45:55 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36571 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390790AbfGROpu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jul 2019 10:45:50 -0400
Received: by mail-pl1-f195.google.com with SMTP id k8so14022225plt.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jul 2019 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=22TP+EsS0qrsFEK5vjA0k+YJKse/UutvNeSo8BDeRck=;
        b=lrzfvMfq0Wn6uPPxUAI16+Mhq1kbQgZwCQwNGxf9YOhdDKn/d/7r/8FDXqzqN+H6bZ
         URKAG3mJ5ZTBquF+kZyWSKEH7hmFBNl9vjCYc2A/X77YvcehVmWOWEUXmEMhu+/VQO7l
         H8jA/82EN6hTJx0vKlgjbwL051yGP6EMfocNmuvDQajXQrYhcMlOnmQ1epmfkW9ibBsC
         NXrNjptBPFjwj1aDKgsk3kYjU8ebEGMlHQLYy20Yu1yaAp8+ouxxFb95lAoQvy/BkRK7
         y9rhy9T+ZxZccSqKhsJkIHjpC8xPl47xr0MjIy7e/t8t/XTc7haHVFu3hOzgY6m2llhk
         iaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=22TP+EsS0qrsFEK5vjA0k+YJKse/UutvNeSo8BDeRck=;
        b=m9Tnhbm2HckyR69m4NUzj4abDMXHtuwfdib4/fUnTP8SZ+22fkZiEuu67h9AMAVuPg
         Jgfc/atF3OaQXLFFH3h49AstzNinQpOHDXk5Yss0lQZ0N7UkzrdSD/tGVgFZcG/A2V7E
         ZVKmy9wfmPDK/4UrvruQ6Cd4b0KaWvTxB5OwgUg38twFMX9Cre4dNGmFhSBpAdOG/WAj
         /WRzQ0JWc99wYywOjIseC8vWOUzqJ2pjpjK7JN4NBgh/nbabybC0XpB6KCVgTBnxktdh
         dLA60ZT8lCMSc87F7nd5EbPe35BFwpRF3Yi5roQ8rEQTDrUGvO8uBDzwkfdBo+gtd72d
         SkrA==
X-Gm-Message-State: APjAAAVhGVWFGJVOf7B2ux+yjkSiH8tK+si1HGZ4YsULmdYOYJz24pV2
        3oVGqMmjZyYWa/VqOy5fTXRiM9YU
X-Google-Smtp-Source: APXvYqwbf0H2fddRVcNiWnbsXXoqJEUkE9n3Hz/2+0dhQWrV1WG45YfEQhXMg09S7AfIpY/Y0dZECQ==
X-Received: by 2002:a17:902:2bcb:: with SMTP id l69mr50853234plb.155.1563461149006;
        Thu, 18 Jul 2019 07:45:49 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id k186sm8478754pga.68.2019.07.18.07.45.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 18 Jul 2019 07:45:48 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a77965: sort nodes
Date:   Thu, 18 Jul 2019 23:45:37 +0900
Message-Id: <1563461137-19827-1-git-send-email-ykaneko0929@gmail.com>
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

 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 48 +++++++++++++++----------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 131f895..09e4f52 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2255,14 +2255,6 @@
 			renesas,fcp = <&fcpvb0>;
 		};
 
-		fcpvb0: fcp@fe96f000 {
-			compatible = "renesas,fcpv";
-			reg = <0 0xfe96f000 0 0x200>;
-			clocks = <&cpg CPG_MOD 607>;
-			power-domains = <&sysc R8A77965_PD_A3VP>;
-			resets = <&cpg 607>;
-		};
-
 		vspi0: vsp@fe9a0000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfe9a0000 0 0x8000>;
@@ -2274,14 +2266,6 @@
 			renesas,fcp = <&fcpvi0>;
 		};
 
-		fcpvi0: fcp@fe9af000 {
-			compatible = "renesas,fcpv";
-			reg = <0 0xfe9af000 0 0x200>;
-			clocks = <&cpg CPG_MOD 611>;
-			power-domains = <&sysc R8A77965_PD_A3VP>;
-			resets = <&cpg 611>;
-		};
-
 		vspd0: vsp@fea20000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfea20000 0 0x5000>;
@@ -2293,14 +2277,6 @@
 			renesas,fcp = <&fcpvd0>;
 		};
 
-		fcpvd0: fcp@fea27000 {
-			compatible = "renesas,fcpv";
-			reg = <0 0xfea27000 0 0x200>;
-			clocks = <&cpg CPG_MOD 603>;
-			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
-			resets = <&cpg 603>;
-		};
-
 		vspd1: vsp@fea28000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfea28000 0 0x5000>;
@@ -2312,6 +2288,22 @@
 			renesas,fcp = <&fcpvd1>;
 		};
 
+		fcpvb0: fcp@fe96f000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfe96f000 0 0x200>;
+			clocks = <&cpg CPG_MOD 607>;
+			power-domains = <&sysc R8A77965_PD_A3VP>;
+			resets = <&cpg 607>;
+		};
+
+		fcpvd0: fcp@fea27000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea27000 0 0x200>;
+			clocks = <&cpg CPG_MOD 603>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			resets = <&cpg 603>;
+		};
+
 		fcpvd1: fcp@fea2f000 {
 			compatible = "renesas,fcpv";
 			reg = <0 0xfea2f000 0 0x200>;
@@ -2320,6 +2312,14 @@
 			resets = <&cpg 602>;
 		};
 
+		fcpvi0: fcp@fe9af000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfe9af000 0 0x200>;
+			clocks = <&cpg CPG_MOD 611>;
+			power-domains = <&sysc R8A77965_PD_A3VP>;
+			resets = <&cpg 611>;
+		};
+
 		csi20: csi2@fea80000 {
 			compatible = "renesas,r8a77965-csi2";
 			reg = <0 0xfea80000 0 0x10000>;
-- 
1.9.1

