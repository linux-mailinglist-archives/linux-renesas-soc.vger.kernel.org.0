Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6FBF1569B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 01:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfEFXsz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 May 2019 19:48:55 -0400
Received: from pbmsgap01.intersil.com ([192.157.179.201]:33180 "EHLO
        pbmsgap01.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfEFXsz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 May 2019 19:48:55 -0400
Received: from pps.filterd (pbmsgap01.intersil.com [127.0.0.1])
        by pbmsgap01.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x46NiLtH002837;
        Mon, 6 May 2019 19:48:45 -0400
Received: from pbmxdp03.intersil.corp (pbmxdp03.pb.intersil.com [132.158.200.224])
        by pbmsgap01.intersil.com with ESMTP id 2s9690226k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 06 May 2019 19:48:45 -0400
Received: from pbmxdp01.intersil.corp (132.158.200.222) by
 pbmxdp03.intersil.corp (132.158.200.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Mon, 6 May 2019 19:48:43 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Mon, 6 May 2019 19:48:43 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 10/10] ARM: dts: r7s9210-rza2mevb: Add USB host support
Date:   Mon, 6 May 2019 18:46:31 -0500
Message-ID: <20190506234631.113226-11-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190506234631.113226-1-chris.brandt@renesas.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-06_13:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=608
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905060179
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
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index 1eba37db7cdc..79d9d4b4779f 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -100,6 +100,18 @@
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
@@ -154,3 +166,28 @@
 	bus-width = <4>;
 	status = "okay";
 };
+
+/* USB-0 as Host */
+/* NOTE: Requires JP3 to be fitted */
+&usb2_phy0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_pins>;
+	renesas,uses_usb_x1;
+	dr_mode = "host";
+	status = "okay";
+};
+&ehci0 {
+	status = "okay";
+};
+
+/* USB-1 as Host */
+&usb2_phy1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb1_pins>;
+	renesas,uses_usb_x1;
+	dr_mode = "host";
+	status = "okay";
+};
+&ehci1 {
+	status = "okay";
+};
-- 
2.16.1

