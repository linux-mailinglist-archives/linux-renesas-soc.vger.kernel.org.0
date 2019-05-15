Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCF61F7D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 17:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfEOPlN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 11:41:13 -0400
Received: from pbmsgap02.intersil.com ([192.157.179.202]:51696 "EHLO
        pbmsgap02.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfEOPlM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 11:41:12 -0400
Received: from pps.filterd (pbmsgap02.intersil.com [127.0.0.1])
        by pbmsgap02.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x4FFCHJp019290;
        Wed, 15 May 2019 11:21:15 -0400
Received: from pbmxdp02.intersil.corp (pbmxdp02.pb.intersil.com [132.158.200.223])
        by pbmsgap02.intersil.com with ESMTP id 2sdrjcb6gm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Wed, 15 May 2019 11:21:15 -0400
Received: from pbmxdp01.intersil.corp (132.158.200.222) by
 pbmxdp02.intersil.corp (132.158.200.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Wed, 15 May 2019 11:21:13 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Wed, 15 May 2019 11:21:13 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        "Chris Brandt" <chris.brandt@renesas.com>
Subject: [PATCH v4 01/13] phy: renesas: rcar-gen3-usb2: detect usb_x1 clock
Date:   Wed, 15 May 2019 10:20:36 -0500
Message-ID: <20190515152048.42363-2-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20190515152048.42363-1-chris.brandt@renesas.com>
References: <20190515152048.42363-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-15_10:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=988
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905150094
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/A2 has an optional dedicated 48MHz clock input for the PLL.
If a clock node named 'usb_x1' exists and set to non-zero, then we can
assume we want it use it.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
v4:
 * added reviewed-by
v3:
 * avoid magic number
 * use devm_clk_get and clk_get_rate
v2:
 * use 'usb_x1' clock node instead of 'renesas,uses_usb_x1' property
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 1322185a00a2..06e0fc804226 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -12,6 +12,7 @@
 #include <linux/extcon-provider.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -34,6 +35,7 @@
 #define USB2_VBCTRL		0x60c
 #define USB2_LINECTRL1		0x610
 #define USB2_ADPCTRL		0x630
+#define USB2_PHYCLK_CTRL	0x644
 
 /* INT_ENABLE */
 #define USB2_INT_ENABLE_UCOM_INTEN	BIT(3)
@@ -75,6 +77,9 @@
 #define USB2_ADPCTRL_IDPULLUP		BIT(5)	/* 1 = ID sampling is enabled */
 #define USB2_ADPCTRL_DRVVBUS		BIT(4)
 
+/* PHYCLK_CTRL */
+#define PHYCLK_CTRL_UCLKSEL		BIT(0)
+
 #define NUM_OF_PHYS			4
 enum rcar_gen3_phy_index {
 	PHY_INDEX_BOTH_HC,
@@ -110,6 +115,7 @@ struct rcar_gen3_chan {
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
+	bool uses_usb_x1;
 };
 
 /*
@@ -391,6 +397,9 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	void __iomem *usb2_base = channel->base;
 	u32 val;
 
+	if (channel->uses_usb_x1)
+		writel(PHYCLK_CTRL_UCLKSEL, usb2_base + USB2_PHYCLK_CTRL);
+
 	/* Initialize USB2 part */
 	val = readl(usb2_base + USB2_INT_ENABLE);
 	val |= USB2_INT_ENABLE_UCOM_INTEN | rphy->int_enable_bits;
@@ -583,6 +592,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rcar_gen3_chan *channel;
 	struct phy_provider *provider;
+	struct clk *usb_x1_clk;
 	struct resource *res;
 	const struct phy_ops *phy_usb2_ops;
 	int irq, ret = 0, i;
@@ -630,6 +640,10 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		}
 	}
 
+	usb_x1_clk = devm_clk_get(dev, "usb_x1");
+	if (!IS_ERR(usb_x1_clk) && clk_get_rate(usb_x1_clk))
+		channel->uses_usb_x1 = true;
+
 	/*
 	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
 	 * And then, phy-core will manage runtime pm for this device.
-- 
2.16.1

