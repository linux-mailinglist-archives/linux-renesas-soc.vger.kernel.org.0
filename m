Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6121939E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 22:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbfEIUjf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 16:39:35 -0400
Received: from pbmsgap01.intersil.com ([192.157.179.201]:34796 "EHLO
        pbmsgap01.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbfEIUjf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 16:39:35 -0400
Received: from pps.filterd (pbmsgap01.intersil.com [127.0.0.1])
        by pbmsgap01.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x49KD5RN018305;
        Thu, 9 May 2019 16:14:39 -0400
Received: from pbmxdp02.intersil.corp (pbmxdp02.pb.intersil.com [132.158.200.223])
        by pbmsgap01.intersil.com with ESMTP id 2scabqgu2g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 09 May 2019 16:14:38 -0400
Received: from pbmxdp03.intersil.corp (132.158.200.224) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Thu, 9 May 2019 16:14:37 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp03.intersil.corp (132.158.200.224) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Thu, 9 May 2019 16:14:37 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        "Chris Brandt" <chris.brandt@renesas.com>
Subject: [PATCH v2 15/15] ARM: dts: rza2mevb: Add USB host support
Date:   Thu, 9 May 2019 15:11:42 -0500
Message-ID: <20190509201142.10543-16-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190509201142.10543-1-chris.brandt@renesas.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-09_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=541
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905090115
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable USB Host support for both the Type-C connector on the CPU board
and the Type-A plug on the sub board.

Both boards are also capable of USB Device operation as well after the
appropriate Device Tree modifications.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v2:
 * added blank line between nodes
 * removed 'r7s9210-' from patch title
 * removed 'renesas,uses_usb_x1' property
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index 7da409170db5..c0a4484a0bde 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -107,6 +107,18 @@
 		pinmux = <RZA2_PINMUX(PORT5, 4, 3)>,	/* SD1_CD */
 			 <RZA2_PINMUX(PORT5, 5, 3)>;	/* SD1_WP */
 	};
+
+	usb0_pins: usb0 {
+		pinmux = <RZA2_PINMUX(PORT5, 2, 3)>,	/* VBUSIN0 */
+			 <RZA2_PINMUX(PORTC, 6, 1)>,	/* VBUSEN0 */
+			 <RZA2_PINMUX(PORTC, 7, 1)>;	/* OVRCUR0 */
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZA2_PINMUX(PORTC, 0, 1)>,	/* VBUSIN1 */
+			 <RZA2_PINMUX(PORTC, 5, 1)>,	/* VBUSEN1 */
+			 <RZA2_PINMUX(PORT7, 5, 5)>;	/* OVRCUR1 */
+	};
 };
 
 /* High resolution System tick timers */
@@ -161,3 +173,28 @@
 	bus-width = <4>;
 	status = "okay";
 };
+
+/* USB-0 as Host */
+/* NOTE: Requires JP3 to be fitted */
+&usb2_phy0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_pins>;
+	dr_mode = "host";
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+/* USB-1 as Host */
+&usb2_phy1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb1_pins>;
+	dr_mode = "host";
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
-- 
2.16.1

