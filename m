Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81E571CBFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2019 17:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfENPfn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 May 2019 11:35:43 -0400
Received: from pbmsgap01.intersil.com ([192.157.179.201]:53244 "EHLO
        pbmsgap01.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfENPfn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 May 2019 11:35:43 -0400
Received: from pps.filterd (pbmsgap01.intersil.com [127.0.0.1])
        by pbmsgap01.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x4EEqfma026046;
        Tue, 14 May 2019 10:57:17 -0400
Received: from pbmxdp02.intersil.corp (pbmxdp02.pb.intersil.com [132.158.200.223])
        by pbmsgap01.intersil.com with ESMTP id 2sdswyjjqq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 14 May 2019 10:57:17 -0400
Received: from pbmxdp02.intersil.corp (132.158.200.223) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Tue, 14 May 2019 10:57:16 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Tue, 14 May 2019 10:57:15 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        "Chris Brandt" <chris.brandt@renesas.com>
Subject: [PATCH v3 05/15] phy: renesas: rcar-gen3-usb2: Check dr_mode when not using OTG
Date:   Tue, 14 May 2019 09:55:55 -0500
Message-ID: <20190514145605.19112-6-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190514145605.19112-1-chris.brandt@renesas.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-14_09:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=987
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905140106
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When not using OTG, the PHY will need to know if it should function as
host or peripheral by checking dr_mode in the PHY node (not the parent
controller node).

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v3:
 * changed 'if' to 'switch'
 * use rcar_gen3_set_host_mode() instead of writel()
v2:
 * added braces to else statement
 * check if dr_mode is "host"
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 06e0fc804226..29da9c46ad9b 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -412,6 +412,18 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 		if (rcar_gen3_needs_init_otg(channel))
 			rcar_gen3_init_otg(channel);
 		rphy->otg_initialized = true;
+	} else {
+		/* Not OTG, so dr_mode should be set in PHY node */
+		switch (usb_get_dr_mode(channel->dev)) {
+		case USB_DR_MODE_HOST:
+			rcar_gen3_set_host_mode(channel, 1);
+			break;
+		case USB_DR_MODE_PERIPHERAL:
+			rcar_gen3_set_host_mode(channel, 0);
+			break;
+		default:
+			break;
+		}
 	}
 
 	rphy->initialized = true;
-- 
2.16.1

