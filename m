Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5591568B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 01:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfEFXro (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 May 2019 19:47:44 -0400
Received: from pbmsgap01.intersil.com ([192.157.179.201]:33084 "EHLO
        pbmsgap01.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbfEFXro (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 May 2019 19:47:44 -0400
Received: from pps.filterd (pbmsgap01.intersil.com [127.0.0.1])
        by pbmsgap01.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x46NiPQ6003045;
        Mon, 6 May 2019 19:47:35 -0400
Received: from pbmxdp03.intersil.corp (pbmxdp03.pb.intersil.com [132.158.200.224])
        by pbmsgap01.intersil.com with ESMTP id 2s96902259-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 06 May 2019 19:47:35 -0400
Received: from pbmxdp01.intersil.corp (132.158.200.222) by
 pbmxdp03.intersil.corp (132.158.200.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Mon, 6 May 2019 19:47:34 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Mon, 6 May 2019 19:47:33 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 02/10] dt-bindings: rcar-gen3-phy-usb2: Document uses_usb_x1
Date:   Mon, 6 May 2019 18:46:23 -0500
Message-ID: <20190506234631.113226-3-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190506234631.113226-1-chris.brandt@renesas.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-06_13:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=742
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905060179
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the optional renesas,uses_usb_x1 property.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index d46188f450bf..26bf377102d3 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -46,6 +46,8 @@ channel as USB OTG:
 	       regulator will be managed during the PHY power on/off sequence.
 - renesas,no-otg-pins: boolean, specify when a board does not provide proper
 		       otg pins.
+- renesas,use_usb_x1: boolean, the dedicated 48MHz crystal inputs USB_X1 are
+                      used for the PLL source
 
 Example (R-Car H3):
 
-- 
2.16.1

