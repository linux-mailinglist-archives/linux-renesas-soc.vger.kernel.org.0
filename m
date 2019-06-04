Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F46435191
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 23:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfFDVDB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 17:03:01 -0400
Received: from pbmsgap01.intersil.com ([192.157.179.201]:57642 "EHLO
        pbmsgap01.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfFDVDB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 17:03:01 -0400
X-Greylist: delayed 3197 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 Jun 2019 17:03:00 EDT
Received: from pps.filterd (pbmsgap01.intersil.com [127.0.0.1])
        by pbmsgap01.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x54K2npv012444;
        Tue, 4 Jun 2019 16:09:35 -0400
Received: from pbmxdp03.intersil.corp (pbmxdp03.pb.intersil.com [132.158.200.224])
        by pbmsgap01.intersil.com with ESMTP id 2sumvxtqpe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 04 Jun 2019 16:09:35 -0400
Received: from pbmxdp02.intersil.corp (132.158.200.223) by
 pbmxdp03.intersil.corp (132.158.200.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Tue, 4 Jun 2019 16:09:34 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Tue, 4 Jun 2019 16:09:33 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 1/2] ARM: dts: r7s9210: Add IRQC device node
Date:   Tue, 4 Jun 2019 15:09:13 -0500
Message-ID: <20190604200914.64896-2-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190604200914.64896-1-chris.brandt@renesas.com>
References: <20190604200914.64896-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-04_12:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=786
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906040127
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for the IRQC on RZ/A2M, which is a small front-end to the
GIC.  This allows to use up to 8 external interrupts with configurable
sense select.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s9210.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
index 3d0bbc1f4543..72b79770e336 100644
--- a/arch/arm/boot/dts/r7s9210.dtsi
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -473,6 +473,25 @@
 			reg = <0xfcfe8004 4>;
 		};
 
+		irqc: interrupt-controller@fcfef800 {
+			compatible = "renesas,r7s9210-irqc",
+				     "renesas,rza1-irqc";
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0xfcfef800 0x6>;
+			interrupt-map =
+				<0 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				<1 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				<2 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				<3 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				<4 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				<5 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				<6 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				<7 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map-mask = <7 0>;
+		};
+
 		pinctrl: pin-controller@fcffe000 {
 			compatible = "renesas,r7s9210-pinctrl";
 			reg = <0xfcffe000 0x1000>;
-- 
2.16.1

