Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFC841939C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 22:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfEIUin (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 16:38:43 -0400
Received: from pbmsgap01.intersil.com ([192.157.179.201]:34932 "EHLO
        pbmsgap01.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbfEIUin (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 16:38:43 -0400
Received: from pps.filterd (pbmsgap01.intersil.com [127.0.0.1])
        by pbmsgap01.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x49KCQhY017964;
        Thu, 9 May 2019 16:13:24 -0400
Received: from pbmxdp02.intersil.corp (pbmxdp02.pb.intersil.com [132.158.200.223])
        by pbmsgap01.intersil.com with ESMTP id 2scabqgu15-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Thu, 09 May 2019 16:13:24 -0400
Received: from pbmxdp03.intersil.corp (132.158.200.224) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Thu, 9 May 2019 16:13:22 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp03.intersil.corp (132.158.200.224) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Thu, 9 May 2019 16:13:22 -0400
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
Subject: [PATCH v2 07/15] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
Date:   Thu, 9 May 2019 15:11:34 -0500
Message-ID: <20190509201142.10543-8-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190509201142.10543-1-chris.brandt@renesas.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-09_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905090115
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/A2 (R7S9210) SoC bindings.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index d2bbfe577345..d6b48704e3f2 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -1,10 +1,12 @@
 * Renesas R-Car generation 3 USB 2.0 PHY
 
 This file provides information on what the device node for the R-Car generation
-3, RZ/G1C and RZ/G2 USB 2.0 PHY contain.
+3, RZ/G1C, RZ/G2 and RZ/A2 USB 2.0 PHY contain.
 
 Required properties:
-- compatible: "renesas,usb2-phy-r8a77470" if the device is a part of an R8A77470
+- compatible: "renesas,usb2-phy-r7s9210" if the device is a part of an R7S9210
+	      SoC.
+	      "renesas,usb2-phy-r8a77470" if the device is a part of an R8A77470
 	      SoC.
 	      "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A1
 	      SoC.
@@ -20,8 +22,8 @@ Required properties:
 	      R8A77990 SoC.
 	      "renesas,usb2-phy-r8a77995" if the device is a part of an
 	      R8A77995 SoC.
-	      "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3 or RZ/G2
-	      compatible device.
+	      "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3, RZ/G2 or
+	      RZ/A2 compatible device.
 
 	      When compatible with the generic version, nodes must list the
 	      SoC-specific version corresponding to the platform first
-- 
2.16.1

