Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7E5A35109
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 22:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfFDUeB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 16:34:01 -0400
Received: from pbmsgap02.intersil.com ([192.157.179.202]:60246 "EHLO
        pbmsgap02.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbfFDUeA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 16:34:00 -0400
Received: from pps.filterd (pbmsgap02.intersil.com [127.0.0.1])
        by pbmsgap02.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x54K3xZq017262;
        Tue, 4 Jun 2019 16:09:44 -0400
Received: from pbmxdp01.intersil.corp (pbmxdp01.pb.intersil.com [132.158.200.222])
        by pbmsgap02.intersil.com with ESMTP id 2sukhdjn3m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 04 Jun 2019 16:09:44 -0400
Received: from pbmxdp02.intersil.corp (132.158.200.223) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Tue, 4 Jun 2019 16:09:43 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Tue, 4 Jun 2019 16:09:42 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/2] ARM: dts: rza2mevb: Add input switch
Date:   Tue, 4 Jun 2019 15:09:14 -0500
Message-ID: <20190604200914.64896-3-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190604200914.64896-1-chris.brandt@renesas.com>
References: <20190604200914.64896-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-04_12:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=785
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906040127
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for input switch SW3 on the Renesas RZ/A2M EVB
development board.

Note that this uses the IRQ interrupt, as the RZ/A2 GPIO controller
does not include interrupt support

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index 4baf4a965090..6049145c120c 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -9,6 +9,7 @@
 /dts-v1/;
 #include "r7s9210.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/r7s9210-pinctrl.h>
 
 / {
@@ -26,6 +27,21 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	keyboard {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&keyboard_pins>;
+
+		key-3 {
+			interrupt-parent = <&irqc>;
+			interrupts = <0 IRQ_TYPE_EDGE_BOTH>;
+			linux,code = <KEY_3>;
+			label = "SW3";
+			wakeup-source;
+		};
+	};
+
 	lbsc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -121,6 +137,10 @@
 			 <RZA2_PINMUX(PORTL, 1, 5)>; /* IRQ5 */
 	};
 
+	keyboard_pins: keyboard {
+		pinmux = <RZA2_PINMUX(PORTJ, 1, 6)>;	/* IRQ0 */
+	};
+
 	/* Serial Console */
 	scif4_pins: serial4 {
 		pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
-- 
2.16.1

