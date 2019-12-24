Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8AC812A397
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Dec 2019 18:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbfLXRei (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Dec 2019 12:34:38 -0500
Received: from mail-eopbgr10064.outbound.protection.outlook.com ([40.107.1.64]:18063
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726214AbfLXRei (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Dec 2019 12:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNwfnenGsO46uWioPEasS2RfIRG0V894CZ2YaTDU8TU=;
 b=VBqNaUrTuaKNnfcUyTbCWdE+88s21aV/NmJwbxXVJcDUVHn5cQ1xk96FbJri8pDEEBDo9rQ9BumXlP/SQqc1HLuohYzhm6pnv8CV84R1fGMZhC+ubSxvyG1bcUoVwEOwghoilT01lEUOfxfiwtzEnhgiKmRyr9Gx2AtgKa8Equ0=
Received: from VI1PR08CA0105.eurprd08.prod.outlook.com (2603:10a6:800:d3::31)
 by AM0PR08MB4433.eurprd08.prod.outlook.com (2603:10a6:208:13b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15; Tue, 24 Dec
 2019 17:34:33 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by VI1PR08CA0105.outlook.office365.com
 (2603:10a6:800:d3::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:33 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:33 +0000
Received: ("Tessian outbound 1da651c29646:v40"); Tue, 24 Dec 2019 17:34:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 49fd52f0b70b58b6
X-CR-MTA-TID: 64aa7808
Received: from 64861fc03c2f.5
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id E3FF6F31-8B9E-490A-A69C-F64175C62902.1;
        Tue, 24 Dec 2019 17:34:27 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 64861fc03c2f.5
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Dec 2019 17:34:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b78/KyylvTst23TEt0nzDfoJW5rJ52QJXz5a/L+8Jf5NLGw/meDIv8YHsy2Y41j/eCUIQ6xTLVSWv5PB2nxRu/17slsZCKmt/w7KMzGiaTvSHV8gPK+9wu4wIqyBp9VE+TNGTW+TGEJ3Wqi2LHju+UYwz1kFl8tqoN7IClquqqXZIn1JPapGvTQ0doBlGsTdxKr7RGFPPgTckjyNXG/R1G+dbSyfM1IgdMsgLUYT0laMgRSOPpfj5mGNlhL+fSdjJqUAnwuk9fTefoCjNAOg/doKuHFirXOQqHH3mlk1XAk2EOF08ZDi3+VCzU8T1DGZDURoguKKAtxdWmBSbEReJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNwfnenGsO46uWioPEasS2RfIRG0V894CZ2YaTDU8TU=;
 b=HFxCbyBwF+NkMoZkQ2NvdBnjhF0Y/ad9kdLGvTIoBeAbnAj6PsqRmI+LTPXH/RBNdANCSK0X1wUoXIHoqTD7vBfTFlMq+UsfobsFtps7bLBRm/SVHgSh20X8WtTVI0li0Bf/E+1amfUFfJgE68QKLI3T5w9x8ay6N/F3xzItIwPLlQRJPpW/To1Wfk2YDLCkWqShg/t4VIm8oq/PkRqBn2IYnd09eFoylb+48rIX7HNSOjlmPHLAu88TBCss3rEdzSeACD/pSSF6MpQINnDsN2Hq3fJrbvaYtKrkh4vXQiW8SjagNY0uySjHQGRucWBx4Et6VvtRsReVKjk8Xc7HhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNwfnenGsO46uWioPEasS2RfIRG0V894CZ2YaTDU8TU=;
 b=VBqNaUrTuaKNnfcUyTbCWdE+88s21aV/NmJwbxXVJcDUVHn5cQ1xk96FbJri8pDEEBDo9rQ9BumXlP/SQqc1HLuohYzhm6pnv8CV84R1fGMZhC+ubSxvyG1bcUoVwEOwghoilT01lEUOfxfiwtzEnhgiKmRyr9Gx2AtgKa8Equ0=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2702.eurprd08.prod.outlook.com (10.170.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 17:34:26 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:26 +0000
From:   Mihail Atanassov <Mihail.Atanassov@arm.com>
To:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC:     Mihail Atanassov <Mihail.Atanassov@arm.com>, nd <nd@arm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 06/35] drm: rcar-du: lvds: Don't set
 drm_bridge->driver_private
Thread-Topic: [PATCH v3 06/35] drm: rcar-du: lvds: Don't set
 drm_bridge->driver_private
Thread-Index: AQHVuoBjrtytYs2ApUGJ8PcgRsSw4g==
Date:   Tue, 24 Dec 2019 17:34:25 +0000
Message-ID: <20191224173408.25624-7-mihail.atanassov@arm.com>
References: <20191224173408.25624-1-mihail.atanassov@arm.com>
In-Reply-To: <20191224173408.25624-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.53]
x-clientproxiedby: LNXP123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::35) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.24.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 77fe6aac-76ce-4b2f-3c5c-08d788978a28
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|AM0PR08MB4433:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4433EED297F68C2F69769AB68F290@AM0PR08MB4433.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(81156014)(8676002)(478600001)(36756003)(4326008)(8936002)(66446008)(64756008)(66946007)(66476007)(66556008)(26005)(186003)(44832011)(6506007)(2616005)(81166006)(71200400001)(316002)(2906002)(1076003)(6512007)(4744005)(54906003)(6916009)(6486002)(86362001)(5660300002)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB2702;H:VI1PR08MB4078.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: F99dQzWikPK+PSU9/67ADWTyytTTkRNRd029NEBK7wrGRxaiFk1T7pSWh2hyxbcgaPvtR/Yc1tT5TouD0LIIitebe+HawPMOv+XHiLFE5+45mVhQ0fdReyQdjfPmS89OQMZheXq7J8Y+K3o7u2SvwucZ2rBSy7KK9zGkWnZ/icrm4qN4kNTlM9vTbsuBIWYUmEttBrinq7X1hPAvbVd8m63R26kNZZZj+wm9c1o/4id9lgY1HeLMglWbvqLuv0sTbo88MMpo0ymQNn4YpOUcMrldfVYI3Po1Si99ugsRgQ32KsH+WOXkTDiT7m7XRNcIMXtGY9y0ztFfpMONpAg5vJ6y4cuXpGZUIklslzQ81oqKsgVQTgtBjFkqrYghatf0vzMvmeAziQOBmoqThSVsLfC0m0Dy961W65/BU0tqq6LN5yK7uq3hs0sfWyKE/8pK
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(199004)(189003)(70586007)(2906002)(356004)(6486002)(478600001)(450100002)(26005)(4326008)(2616005)(186003)(70206006)(6862004)(76130400001)(6512007)(36756003)(1076003)(5660300002)(54906003)(336012)(316002)(8936002)(81166006)(6506007)(81156014)(8676002)(4744005)(86362001)(26826003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB4433;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1c0ae6b4-7e81-469a-5404-08d78897856e
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aKCvCYrz9V7CW3iIJDRQXwYfUg23pPcDx2FwDEbslG0688guqAzg/rRCzGUtZzGsEX1wHtXQrq6J3jlFwDzvYdKVui3ZdpP2HZIEVJ/QxHSygeeuMS4H0Mss0zNQ30zdFNIo4krzCHdQYZ2qeEz2dG52Ir3UtCeGm3akUaK1NCnzVXhUHvAelHhqTKWcMrHmL2KjRqgBUDKrzlKgPRAtKALQh3mqDeOiDGzzbaMTQ35cptZTm7Jamgf+Mql+/7zFEpcMStPQNDilvYs3Yn4Ik5hSs+HYs0c3krF13hzVxQxbo3NmqM3RrQ6PHeDdbneuE+QVQEnZLZ8J2ZLgE2x2ckkzRhxCLUKtoG/d9u9Uc+r0DHiiFe2SWUWoKDrR4RPfJoxa4nt3M0pJizJcmFtfdRI5NtYN9CWvbp2bRK6tpQy1kYD3hQaoNXqnXGx1wUk/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:33.4865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77fe6aac-76ce-4b2f-3c5c-08d788978a28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4433
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It's unused.

Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/=
rcar_lvds.c
index 83538125a722..1d6dfae8a200 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -882,7 +882,6 @@ static int rcar_lvds_probe(struct platform_device *pdev=
)
 	if (ret < 0)
 		return ret;
=20
-	lvds->bridge.driver_private =3D lvds;
 	lvds->bridge.funcs =3D &rcar_lvds_bridge_ops;
 	lvds->bridge.of_node =3D pdev->dev.of_node;
=20
--=20
2.24.0

