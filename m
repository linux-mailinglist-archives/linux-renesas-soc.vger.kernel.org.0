Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3383115699
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 01:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfEFXsm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 May 2019 19:48:42 -0400
Received: from pbmsgap02.intersil.com ([192.157.179.202]:51946 "EHLO
        pbmsgap02.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfEFXsm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 May 2019 19:48:42 -0400
Received: from pps.filterd (pbmsgap02.intersil.com [127.0.0.1])
        by pbmsgap02.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x46NiFLr013586;
        Mon, 6 May 2019 19:48:35 -0400
Received: from pbmxdp01.intersil.corp (pbmxdp01.pb.intersil.com [132.158.200.222])
        by pbmsgap02.intersil.com with ESMTP id 2s94wdt00a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 06 May 2019 19:48:34 -0400
Received: from pbmxdp01.intersil.corp (132.158.200.222) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Mon, 6 May 2019 19:48:33 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Mon, 6 May 2019 19:48:33 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 09/10] ARM: dts: r7s9210: Add USB Device support
Date:   Mon, 6 May 2019 18:46:30 -0500
Message-ID: <20190506234631.113226-10-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190506234631.113226-1-chris.brandt@renesas.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-06_13:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=979
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905060179
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add USB Device support for RZ/A2.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s9210.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
index 1a992e6197c3..67ac746142d0 100644
--- a/arch/arm/boot/dts/r7s9210.dtsi
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -354,6 +354,18 @@
 			status = "disabled";
 		};
 
+		usbhs0: usbhs@e8219000 {
+			compatible = "renesas,usbhs-r7s9210","renesas,rza2-usbhs";
+			reg = <0xe8219000 0x724>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 61>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy0>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		ohci1: usbhcd@e821a000 {
 			compatible = "generic-ohci";
 			reg = <0xe821a000 0x100>;
@@ -386,6 +398,18 @@
 			status = "disabled";
 		};
 
+		usbhs1: usbhs@e821b000 {
+			compatible = "renesas,usbhs-r7s9210","renesas,rza2-usbhs";
+			reg = <0xe821b000 0x724>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 60>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		sdhi0: sd@e8228000 {
 			compatible = "renesas,sdhi-r7s9210";
 			reg = <0xe8228000 0x8c0>;
-- 
2.16.1

