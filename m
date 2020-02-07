Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32A1A155C06
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Feb 2020 17:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgBGQo5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Feb 2020 11:44:57 -0500
Received: from pbmsgap01.intersil.com ([192.157.179.201]:53510 "EHLO
        pbmsgap01.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgBGQo5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Feb 2020 11:44:57 -0500
X-Greylist: delayed 1041 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Feb 2020 11:44:56 EST
Received: from pps.filterd (pbmsgap01.intersil.com [127.0.0.1])
        by pbmsgap01.intersil.com (8.16.0.27/8.16.0.27) with SMTP id 017GNhIj013889;
        Fri, 7 Feb 2020 11:27:24 -0500
Received: from pbmxdp02.intersil.corp (pbmxdp02.pb.intersil.com [132.158.200.223])
        by pbmsgap01.intersil.com with ESMTP id 2y0wrpre75-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 07 Feb 2020 11:27:24 -0500
Received: from pbmxdp02.intersil.corp (132.158.200.223) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Fri, 7 Feb 2020 11:27:22 -0500
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Fri, 7 Feb 2020 11:27:21 -0500
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        "Chris Brandt" <chris.brandt@renesas.com>
Subject: [PATCH] ARM: dts: r7s72100: Add SPIBSC clocks
Date:   Fri, 7 Feb 2020 11:27:04 -0500
Message-ID: <20200207162704.18914-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2020-02-07_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=812
 adultscore=10 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-2002050000 definitions=main-2002070122
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clocks for SPIBSC blocks

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 75b2796ebfca..0a567d8ebc66 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -467,11 +467,12 @@ mstp9_clks: mstp9_clks@fcfe0438 {
 			#clock-cells = <1>;
 			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0xfcfe0438 4>;
-			clocks = <&p0_clk>, <&p0_clk>, <&p0_clk>, <&p0_clk>;
+			clocks = <&p0_clk>, <&p0_clk>, <&p0_clk>, <&p0_clk>, <&b_clk>, <&b_clk>;
 			clock-indices = <
 				R7S72100_CLK_I2C0 R7S72100_CLK_I2C1 R7S72100_CLK_I2C2 R7S72100_CLK_I2C3
+				R7S72100_CLK_SPIBSC0 R7S72100_CLK_SPIBSC1
 			>;
-			clock-output-names = "i2c0", "i2c1", "i2c2", "i2c3";
+			clock-output-names = "i2c0", "i2c1", "i2c2", "i2c3", "spibsc0", "spibsc1";
 		};
 
 		mstp10_clks: mstp10_clks@fcfe043c {
-- 
2.24.1

