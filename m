Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08FF51568F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 01:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbfEFXsC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 May 2019 19:48:02 -0400
Received: from pbmsgap02.intersil.com ([192.157.179.202]:51912 "EHLO
        pbmsgap02.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbfEFXsC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 May 2019 19:48:02 -0400
Received: from pps.filterd (pbmsgap02.intersil.com [127.0.0.1])
        by pbmsgap02.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x46NiZQX013618;
        Mon, 6 May 2019 19:47:54 -0400
Received: from pbmxdp01.intersil.corp (pbmxdp01.pb.intersil.com [132.158.200.222])
        by pbmsgap02.intersil.com with ESMTP id 2s94wdsyy9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 06 May 2019 19:47:53 -0400
Received: from pbmxdp01.intersil.corp (132.158.200.222) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Mon, 6 May 2019 19:47:52 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Mon, 6 May 2019 19:47:51 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 04/10] dt-bindings: rcar-gen3-phy-usb2: Document dr_mode
Date:   Mon, 6 May 2019 18:46:25 -0500
Message-ID: <20190506234631.113226-5-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190506234631.113226-1-chris.brandt@renesas.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-06_13:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=853
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905060179
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the optional dr_mode property

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index 26bf377102d3..646a1748d3c4 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -48,6 +48,9 @@ channel as USB OTG:
 		       otg pins.
 - renesas,use_usb_x1: boolean, the dedicated 48MHz crystal inputs USB_X1 are
                       used for the PLL source
+- dr_mode: string, indicates the working mode for the PHY. Can be "host",
+           "peripheral", or "otg". Defaults to "host" if not defined.
+
 
 Example (R-Car H3):
 
-- 
2.16.1

