Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45927F40F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2019 08:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbfKHHJV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Nov 2019 02:09:21 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:18240 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725802AbfKHHJV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Nov 2019 02:09:21 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xA878GXJ012903;
        Fri, 8 Nov 2019 02:08:59 -0500
Received: from nam05-co1-obe.outbound.protection.outlook.com (mail-co1nam05lp2057.outbound.protection.outlook.com [104.47.48.57])
        by mx0a-00128a01.pphosted.com with ESMTP id 2w41vvnekg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Fri, 08 Nov 2019 02:08:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZai8kZeM10IM/jVQjf++DjwLEoSpRYpFprHBZhrvW6nWXeoDrJvzZsbb4Tqw9TQGxZKcYXhTQDr4T5Mtlq7MCsGR4dlkQuITjXumaOuF4aPYAa26tBWY/DWfUN9EMbtDUMtlLj0FO4k7vwusWxTRW7GvfPlF16W9MYLH9Wp7Iva1zsEXF6REnvREgfrCCpyquyUH0TYqiJYsiLW+BRAXjkp08iZDmsa/O32Ymi8ozNHe+Eh+ioVpRb6PqE1L59t/WWbEOeS7vSJ9z//0roYZIP59MHgDFWlQMhdbiaxDAxbEJP3NnW9yEArLeEubVbxoerZ71W8cVAXuE3228EZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUOzuz1Rse4thKUlQzu3co8Jrq1AtKjEndBSyhtqBE4=;
 b=IVk9wGBurD44MudaVUl1RDhwRP6736lpzczqIr75sFFjlSBakSUv+DcgyZj+JFiwdZbN7IxuHjbv3cEwQtWfMcxxZLJOOsohfX39y41aVBv6pGvCLWb/1zeW+V8QhbdbuObqcnqTF/cLk7uYXduej9IXGvCmY/rJ+CaEhUkrB7DPB8rMORiuHAdubXzQDyu/LTgBE+7wYsFuF0cApCI8dnuM0SmFVH4bCgqm3da6I2YcqKx6fTif8QAGDynqV1KKzFcJNCWzOLxeXmyktEsiErg5P/ohazpcqzSNe0Q/RIrpNp4kZ9jHOraWK7iSCqmK9TEFUfuDM5aJv3fLhHoj+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUOzuz1Rse4thKUlQzu3co8Jrq1AtKjEndBSyhtqBE4=;
 b=UQZ2ISYuvJz38PsOTEW8Q291BsxrmphqkOV2CZywLhdbEPzTSzctNSSWpooFgcycam9WBaxQMDYhM1ESfEGhugaUgLl7zBBerLtDuPEjnrvbRvAdHvJ384+V0+bZkkGTqw6GxfcLupKn0ee5X5tPnTmsK3lVNfskGfU7sHlElTs=
Received: from BN6PR03CA0113.namprd03.prod.outlook.com (2603:10b6:404:10::27)
 by MN2PR03MB5263.namprd03.prod.outlook.com (2603:10b6:208:1f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Fri, 8 Nov
 2019 07:08:58 +0000
Received: from BL2NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::204) by BN6PR03CA0113.outlook.office365.com
 (2603:10b6:404:10::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Fri, 8 Nov 2019 07:08:58 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 BL2NAM02FT046.mail.protection.outlook.com (10.152.76.118) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2430.20
 via Frontend Transport; Fri, 8 Nov 2019 07:08:57 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id xA878nkL003344
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 7 Nov 2019 23:08:49 -0800
Received: from saturn.ad.analog.com (10.48.65.117) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Fri, 8 Nov 2019 02:08:56 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
CC:     <sboyd@kernel.org>, <mturquette@baylibre.com>, <jsarha@ti.com>,
        <ce3a@gmx.de>, <geert+renesas@glider.be>, <horms@verge.net.au>,
        <magnus.damm@gmail.com>, <wsa+renesas@sang-engineering.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v2] clk: clk-gpio: propagate rate change to parent
Date:   Fri, 8 Nov 2019 09:09:24 +0200
Message-ID: <20191108070924.16077-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191106113551.5557-1-alexandru.ardelean@analog.com>
References: <20191106113551.5557-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(136003)(396003)(39860400002)(376002)(346002)(199004)(189003)(50466002)(8936002)(48376002)(76176011)(11346002)(476003)(2870700001)(7696005)(51416003)(478600001)(305945005)(186003)(7416002)(2906002)(107886003)(2616005)(44832011)(1076003)(26005)(336012)(486006)(4326008)(426003)(356004)(6666004)(126002)(446003)(316002)(106002)(5660300002)(8676002)(70586007)(70206006)(54906003)(7636002)(110136005)(2201001)(36756003)(246002)(47776003)(86362001)(50226002);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR03MB5263;H:nwd2mta2.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail11.analog.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89b46e0e-a519-4758-bf8b-08d7641a8626
X-MS-TrafficTypeDiagnostic: MN2PR03MB5263:
X-Microsoft-Antispam-PRVS: <MN2PR03MB526368CB2DF08BE580980C7AF97B0@MN2PR03MB5263.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0215D7173F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hmgf0Sc0A21y9ec1UQtPbBbxfopvaTyQGX/SCdbC6UIwGE+f/XwkOVFtVcI5zeMbRVbzrBtwbRVElvPF1dQeC0m7kESKLS8Viz++b3TPQV3m0uGpKiKmubQgGPoOV0NDVJyFHYmb+wiUuQCp4G+iIu8E0riYhZhkXMHCaDGxmcEt4OIa6BwDI4stKNWmId4vfiJEiuz1MlheCOoqy+vFYc62AAxyNOMSSJ11K19H1FSizJuA9W7oxHDJ9PDUx7BHymkhathCtEcOCgfYHxiPnNlDWEh//zEMcvDhISBj0UexJRK+3xab4PXPaVObtVnvLEwBSisnO/CcoEJPi1SaqMpifx+ipwkRZoeTq6wFjk0OP3eY86Uj5zO1NPTxpCxN4h54zYeDttkN8VDEAz50JNCaZ8Nqs8KwKwM1MPlBf1wbJJCDBx3ujqaUL/gF7ufe
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2019 07:08:57.8337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b46e0e-a519-4758-bf8b-08d7641a8626
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.57];Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5263
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-08_01:2019-11-07,2019-11-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911080070
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Michael Hennerich <michael.hennerich@analog.com>

For an external clock source, which is gated or (mux-ed) via a GPIO, the
rate change should typically be propagated to the parent clock.

The situation where we are requiring this propagation, is when an
external clock is connected to override an internal clock (which typically
has a fixed rate). The external clock can have a different rate than the
internal one, and may also be variable, thus requiring the rate
propagation.

This rate change wasn't propagated until now, and it's unclear about cases
where this shouldn't be propagated. Thus, it's unclear whether this is
fixing a bug, or extending the current driver behavior. Also, it's unsure
about whether this may break any existing setups; in the case that it does,
a device-tree property may be added to disable this flag.

Signed-off-by: Michael Hennerich <michael.hennerich@analog.com>
Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/clk/clk-gpio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 9d930edd6516..255ed505444c 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -276,11 +276,12 @@ static int gpio_clk_driver_probe(struct platform_device *pdev)
 
 	if (is_mux)
 		clk = clk_register_gpio_mux(&pdev->dev, node->name,
-				parent_names, num_parents, gpiod, 0);
+				parent_names, num_parents, gpiod,
+				CLK_SET_RATE_PARENT);
 	else
 		clk = clk_register_gpio_gate(&pdev->dev, node->name,
 				parent_names ?  parent_names[0] : NULL, gpiod,
-				0);
+				CLK_SET_RATE_PARENT);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-- 
2.20.1

