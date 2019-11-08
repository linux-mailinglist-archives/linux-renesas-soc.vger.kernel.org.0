Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 917DEF411E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2019 08:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbfKHHQy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Nov 2019 02:16:54 -0500
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:17638 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725886AbfKHHQy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Nov 2019 02:16:54 -0500
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xA87CrWv016622;
        Fri, 8 Nov 2019 02:16:39 -0500
Received: from nam04-co1-obe.outbound.protection.outlook.com (mail-co1nam04lp2050.outbound.protection.outlook.com [104.47.45.50])
        by mx0b-00128a01.pphosted.com with ESMTP id 2w41vkwu0u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Nov 2019 02:16:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W49HJPg4bQ6nSCAJuRvAJK53Z1u9OZVkf4/fqegI/uihDMiYLAQsb0x8ygJwbOIx7H6ES286R/9U6+CXZhSfYTumd4paocyaWa0TjoI/KPsxptYblSb7dKCBEOFqZaemxu1ruwnwEWr/9Q8gQYka0FCRUwsOQPxkfzfAzP0+1NsF8Zv7NZL8a7guHNQDUGclKweCE46FxzlKQMU7OaxtjJPyA4KhcDiPPRCENxN3e/tZKAXCRc3/K+DTgXoSxQx/yP66WOuFwTgGJNqriRXY/1NHXr1kpgJnAWHXvoM91fQwrzsYiv57CKAXLdiZmH8WXTLjHRMGeWzAh6GxlKKzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tX1B56yA7Z0Cntk8aKlfH+KBO7YLjt0rSgsywCEYAyA=;
 b=QkobtHNfFUTLdA0R7633tvb8MAg9G0K7lzJerdQivLcSBkQOKxqdxcGC/tMv1L2nNen7gPpBBMSbkecpXv7Deol5XO3Dr9lfKVrx6EP8kBofPJB9VRpWvHKhj2MMtEHonO6wOa4P6iUx8YqCW7eU09CWaFtAoS5frK5AyLfl2Im7YtofHE80oShiC/GmHkMLdrp4UBrJpiCZDJgBsQcaL6gey5TBn2lMF4iMbuFunQZQbL7T91PQVBsVc+c/A2+Zr88jgr+mfKpyOmqnyYSfQ4yaZB+Ltqdylr2ST2GANR+3HqRufJsrPY6OHGhanX/58mHiMM90Zh/1ZB3Kh7zQbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.55) smtp.rcpttodomain=kernel.org smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tX1B56yA7Z0Cntk8aKlfH+KBO7YLjt0rSgsywCEYAyA=;
 b=G6I/yUeQ6H+q2N36KTA4Aa2K7Raz0CTXIHfVpPz8szjYb23OhNKzHA5Zz128JacY63uSZEgdTk8rqZiBa/A4DlfTbsHPWVQ+d4ZKyhSo3v8X/87uFkIHcwsydG/dJ9/ZzJ2kP+krE0y8azqgOR/s/1a3p87rqr7OuxXM9gaq3sU=
Received: from BN3PR03CA0108.namprd03.prod.outlook.com (2603:10b6:400:4::26)
 by MN2PR03MB5021.namprd03.prod.outlook.com (2603:10b6:208:1a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22; Fri, 8 Nov
 2019 07:16:37 +0000
Received: from CY1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::203) by BN3PR03CA0108.outlook.office365.com
 (2603:10b6:400:4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via Frontend
 Transport; Fri, 8 Nov 2019 07:16:37 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 CY1NAM02FT053.mail.protection.outlook.com (10.152.74.165) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2430.20
 via Frontend Transport; Fri, 8 Nov 2019 07:16:36 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id xA87GaKg002774
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Thu, 7 Nov 2019 23:16:36 -0800
Received: from saturn.ad.analog.com (10.48.65.117) by
 NWD2HUBCAS7.ad.analog.com (10.64.69.107) with Microsoft SMTP Server id
 14.3.408.0; Fri, 8 Nov 2019 02:16:35 -0500
From:   Alexandru Ardelean <alexandru.ardelean@analog.com>
To:     <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
CC:     <sboyd@kernel.org>, <mturquette@baylibre.com>, <jsarha@ti.com>,
        <ce3a@gmx.de>, <geert+renesas@glider.be>, <horms@verge.net.au>,
        <magnus.damm@gmail.com>, <wsa+renesas@sang-engineering.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH v3] clk: clk-gpio: propagate rate change to parent
Date:   Fri, 8 Nov 2019 09:17:18 +0200
Message-ID: <20191108071718.17985-1-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191106113551.5557-1-alexandru.ardelean@analog.com>
References: <20191106113551.5557-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(376002)(346002)(136003)(396003)(54534003)(199004)(189003)(86362001)(8936002)(51416003)(336012)(36756003)(4326008)(246002)(8676002)(47776003)(1076003)(70586007)(305945005)(356004)(54906003)(5660300002)(44832011)(6666004)(110136005)(106002)(316002)(70206006)(107886003)(2201001)(186003)(426003)(50466002)(50226002)(14444005)(446003)(126002)(7636002)(48376002)(486006)(2870700001)(11346002)(2616005)(476003)(2906002)(7696005)(478600001)(7416002)(76176011)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR03MB5021;H:nwd2mta1.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail10.analog.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03ecede0-7b3f-4b67-7ee5-08d7641b97d2
X-MS-TrafficTypeDiagnostic: MN2PR03MB5021:
X-Microsoft-Antispam-PRVS: <MN2PR03MB502191099F8FB3099C0FDBB8F97B0@MN2PR03MB5021.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0215D7173F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pb6xi65b4ZzZXO3n2IfaCoIbHcw5pQ5Pzhye3lEtbm1zBw9p/1so39sRnkHjjuNhkIXa7m9OkA+qaGOH6iFHFKMEU/0Np3bKZuGAaKWf8mKfD0wX85CMVg60/mf1Ki8NMGTH9Y3i24YwO+Dt6RER5TgSur0cZkUrE4Z7OIqbYgxVubiBc2Y6AeRsfLKlWLS+77U0fxkVFMOXpXjdV/AwktuTh/C6btTY8SiYccm9BfZwO2fiFPdy2RO4139HI0fscd2wPh+/UNFgoMeJeBZGb3CGdpmkxBjPafbhF0KErD0NMjm3neUIRxK2XvBJj3nV5uaa+dSWOOdHUrRauj2MfG+o/f3VSI3pdy2h/7O83CAjh73THWsKhcI4gLV1y+e+FwPCJ0aPqoF6fbtBH4C1cbFmnYtydlisWFLKiRvR7y8wNKMB5OrLNwIjvhiQLajY
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2019 07:16:36.9032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ecede0-7b3f-4b67-7ee5-08d7641b97d2
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.55];Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5021
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-08_01:2019-11-07,2019-11-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911080071
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Michael Hennerich <michael.hennerich@analog.com>

For an external clock source, which is gated via a GPIO, the
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

Changelog v2 -> v3:
* limited CLK_SET_RATE_PARENT to both gate clk-gpio drivers; did not pay
  close attention to Stephen's comment when he mentioned to only the gate
  clk-gpio driver

Changelog v1 -> v2:
* added CLK_SET_RATE_PARENT to both gate & mux clk-gpio drivers

 drivers/clk/clk-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 9d930edd6516..13304cf5f2a8 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -280,7 +280,7 @@ static int gpio_clk_driver_probe(struct platform_device *pdev)
 	else
 		clk = clk_register_gpio_gate(&pdev->dev, node->name,
 				parent_names ?  parent_names[0] : NULL, gpiod,
-				0);
+				CLK_SET_RATE_PARENT);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-- 
2.20.1

