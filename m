Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1027DDC3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 16:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731975AbfHAOXn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 10:23:43 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43063 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbfHAOXn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 10:23:43 -0400
Received: by mail-pg1-f196.google.com with SMTP id r22so6701840pgk.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Aug 2019 07:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=gEHkLVhFpaWyVkOWtSOnh5cikq+qzc45obgcO+XHLmI=;
        b=S9pbw3QLBQrAGR1FPGl4+HGr+DUGn/RFUHFTpeMdQ3sQs73nnvlcG82KrdI9/EEBYz
         Zq/8ugI7UdsJll7Avws1B2d/sLbI/ie89wuUQqouqLBYrM/c6x6u+WN4vGvQVipK/214
         VJfAHP2jAeAN/iGReraGLvC3O4IMNydK02ZxJ0TlzYxuy8TUJCPnllwF+RhoPkFhdxtI
         WeUe08RCT8YwJzgzQ7TnjZPNWsgn95WhtOtBcJKgJUvQB1c38MgF8BnnzfnumBhMsLeb
         tRVbAf1GBlj35cZXcb10a7wDLhraDUg1Q8aK+pAbwl0aYkJsjeoHx6GWQ44e4GfFGfHP
         21PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gEHkLVhFpaWyVkOWtSOnh5cikq+qzc45obgcO+XHLmI=;
        b=Qqn2TEm+Se08ygTCBdtoowfH82f5H4tvbApYL/57gSSupNhtXGMrSQIIFVxZNmsCsl
         BnwajKVhwqL2Z5S/jRsYUkRZlSB+uicbQlvvIcm6FfU+b78EME/xKmA/Fw8Pwypg4+me
         NmoBAXIT7hK61bHb8NVxJmH0lUz2RJrJ0kim1XGHwtTkTlHkXWbTnVedXaivj1+kBtPg
         fzwvc//dCubQM6cQvKWmb6tTARP8ABHKur5K9w3Fq2tQeAPOkJPNCIBdfBqs/UVaAa1n
         KedMgprI1psnCMoxuvEI3jN00XnVRaEUSowZM84zPtl6yikP7eV+9kYJUpzd7Sj5A5Au
         mc4g==
X-Gm-Message-State: APjAAAV73laiiIW3RiPSMnyn0BFD5xqST8TxWo5CIRZAq7Jrmw57rRLz
        7JaGLFL2bEZpeE9/wfvIqZwRheDt
X-Google-Smtp-Source: APXvYqwzFLQLK93RztXK1efleqDv65R10XUo4b8mRBiYQQNyRFopUWRdlAyX8rpFzlRV77f0hiP1nQ==
X-Received: by 2002:a63:561b:: with SMTP id k27mr19892459pgb.380.1564669422641;
        Thu, 01 Aug 2019 07:23:42 -0700 (PDT)
Received: from localhost.localdomain (p6796086-ipngn28101marunouchi.tokyo.ocn.ne.jp. [114.165.92.86])
        by smtp.gmail.com with ESMTPSA id s7sm4217689pjn.28.2019.08.01.07.23.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 01 Aug 2019 07:23:41 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: renesas: r8a77980-condor: sort nodes
Date:   Thu,  1 Aug 2019 23:23:34 +0900
Message-Id: <1564669414-22553-1-git-send-email-ykaneko0929@gmail.com>
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

 arch/arm64/boot/dts/renesas/r8a77980-condor.dts | 42 ++++++++++++-------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
index 5a7012b..3dde028 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -22,35 +22,20 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@48000000 {
-		device_type = "memory";
-		/* first 128MB is reserved for secure area. */
-		reg = <0 0x48000000 0 0x78000000>;
-	};
-
-	d3_3v: regulator-0 {
-		compatible = "regulator-fixed";
-		regulator-name = "D3.3V";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-boot-on;
-		regulator-always-on;
-	};
-
-	vddq_vin01: regulator-1 {
+	d1_8v: regulator-2 {
 		compatible = "regulator-fixed";
-		regulator-name = "VDDQ_VIN01";
+		regulator-name = "D1.8V";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		regulator-boot-on;
 		regulator-always-on;
 	};
 
-	d1_8v: regulator-2 {
+	d3_3v: regulator-0 {
 		compatible = "regulator-fixed";
-		regulator-name = "D1.8V";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
+		regulator-name = "D3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
 		regulator-boot-on;
 		regulator-always-on;
 	};
@@ -90,6 +75,21 @@
 		};
 	};
 
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0 0x48000000 0 0x78000000>;
+	};
+
+	vddq_vin01: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDQ_VIN01";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	x1_clk: x1-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
1.9.1

