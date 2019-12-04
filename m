Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFE11112AAD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2019 12:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbfLDLsj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Dec 2019 06:48:39 -0500
Received: from mail-eopbgr00048.outbound.protection.outlook.com ([40.107.0.48]:29215
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727857AbfLDLsi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Dec 2019 06:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWRkjbKXWosT47zn6WBBKW0xFtrV15qKHnsxlVXCAOs=;
 b=A3pXRVFo714LkNf9Wyl4I+BTgk9tdncSLCKardW/g8mRV67lVgwjEc2l2rWZqeTlkD7l5+ZQdhf9OmNL1yKbxyCRNoLLji06a51UXl802A/EHxcecb06Yx2LtykpkcOqj/7i6gvEp5fHLhpAcD8QCNw7vHNTyG6tgcWCJJ2oeBU=
Received: from VI1PR08CA0234.eurprd08.prod.outlook.com (2603:10a6:802:15::43)
 by VI1PR08MB5406.eurprd08.prod.outlook.com (2603:10a6:803:133::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Wed, 4 Dec
 2019 11:48:34 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by VI1PR08CA0234.outlook.office365.com
 (2603:10a6:802:15::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:34 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:34 +0000
Received: ("Tessian outbound 92d30e517f5d:v37"); Wed, 04 Dec 2019 11:48:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e55bdf3c9c4a2513
X-CR-MTA-TID: 64aa7808
Received: from de4fd4e6043b.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id BD27ABFD-5B0F-4F83-9D8D-9704A1EADBA1.1;
        Wed, 04 Dec 2019 11:48:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de4fd4e6043b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 04 Dec 2019 11:48:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCID9YAp7sq+xcCIJcHDaGvxyj6opTivrGZ8fSiY5CWEOAiugCP84agLYo56txSufgfHk4YAGxQa08nZ7BFAweqy/oGjJjIt6Hlgm32OytZQP8HlLi0hBx2R0YhREPCieuLj7xF1yQ11EpkP9+KMPQVJg48zLb/mDwHC5rkNZU96+42tVjUtbECM4ACfzqYjvxAl+1plrnyRAEmws6EQdFygWEU6m3Ynr0k8LWKFGj4A4HCuvG+KDl5GgX177Ep5Tj1TKhAjEmsGqErKdmI/LHK4r+KV3WOclj+s9S8AD0iI2/iE666IpArpQir/tK+P6AOnh00sEXJV+FzmLHGukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWRkjbKXWosT47zn6WBBKW0xFtrV15qKHnsxlVXCAOs=;
 b=H8U48vnk8uMOrcs/2njVm6TYQmOFQ+MZQD1H9zD8LH6Rvlbdk7uNxq1W6bjZg6tbgx9bmH37UdKpYUff+uVpQSyiLH9OxNcNhrT4tQB7AUBE7dDcCG4rKM3P5XZdbxXQ0t4xOL7sfz1bMit7hlBL5Pw6AlmYQwtSHmXiFf421vDzph3PlDBtdc9yArADKlNg/vUnbc6Ll7ylN9JlEYTvWMPqnBGHexqy+9N8OYbCBwelxYAW6FunSSkHE4XQllrDFOTK3QEo76qlebktA0nIutY6WXOFfuWpMSVf4nkK+B/x5NvkJHQPEipadIkkiWNmfjc5iucZF48vCFqxUzZ4tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWRkjbKXWosT47zn6WBBKW0xFtrV15qKHnsxlVXCAOs=;
 b=A3pXRVFo714LkNf9Wyl4I+BTgk9tdncSLCKardW/g8mRV67lVgwjEc2l2rWZqeTlkD7l5+ZQdhf9OmNL1yKbxyCRNoLLji06a51UXl802A/EHxcecb06Yx2LtykpkcOqj/7i6gvEp5fHLhpAcD8QCNw7vHNTyG6tgcWCJJ2oeBU=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4624.eurprd08.prod.outlook.com (20.178.13.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Wed, 4 Dec 2019 11:48:24 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:24 +0000
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
Subject: [PATCH v2 25/28] drm: rcar-du: lvds: Use drm_bridge_init()
Thread-Topic: [PATCH v2 25/28] drm: rcar-du: lvds: Use drm_bridge_init()
Thread-Index: AQHVqpi792P4gVb94Ee5mVAYsOXvbA==
Date:   Wed, 4 Dec 2019 11:48:23 +0000
Message-ID: <20191204114732.28514-26-mihail.atanassov@arm.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
In-Reply-To: <20191204114732.28514-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fa816a05-425b-4ed1-28cb-08d778afe459
X-MS-TrafficTypeDiagnostic: VI1PR08MB4624:|VI1PR08MB4624:|VI1PR08MB5406:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB54066B961DA2E8DC0F9AD02A8F5D0@VI1PR08MB5406.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(199004)(189003)(2351001)(305945005)(316002)(6436002)(81166006)(7736002)(6916009)(4326008)(186003)(99286004)(6486002)(66446008)(5640700003)(4744005)(66476007)(1076003)(66556008)(54906003)(2501003)(5660300002)(66946007)(64756008)(6512007)(86362001)(11346002)(2906002)(44832011)(2616005)(14454004)(50226002)(6506007)(36756003)(25786009)(81156014)(8676002)(3846002)(71190400001)(52116002)(26005)(478600001)(71200400001)(8936002)(102836004)(6116002)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB4624;H:VI1PR08MB4078.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rBFTgSalywc0B4nnqzU7j4HgyujuZwGRyjKtQdDntZ2rMjQfYy3YjkMGqbUY0dYqVrsyWDuRNUglWGW20mbmGFqMcGIWIo7Qip+zHS9wpqpc5V8V13C2nbP9PqC6X1ndmhtemJj95UVojB38zUxw7JvuuXlRlrFvC1UuGrICtC1LpVcmDm+mkBcY8CDsYxxCCWIF6bOd+htAsIeO1+/1WiWXLw4sEXrul/xTair4+LVgCi3IThYzQlfgLGyfjbfzmiLXIaXJwmqYYjXPM4dR5P9ySjnwYnpzPwLko9UMebTVICYdI8VTNZRDw7nRew5w6mQpmK1rkW0grA9spBFCHsx7eBLReeGUxXp6vac8KEVurr0IHpXYb9G5x2c0q91RhsXR+APSdx+lesipBThZsbExrYaoj7Z4K/Hl2BqVmM0d0QY3KzeCKG2aGUMoTbf/
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4624
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(189003)(199004)(6506007)(102836004)(4744005)(6486002)(186003)(5660300002)(26005)(22756006)(316002)(36906005)(1076003)(6512007)(54906003)(23756003)(336012)(356004)(5640700003)(76176011)(2351001)(4326008)(99286004)(450100002)(2501003)(50466002)(6862004)(14454004)(8936002)(8676002)(305945005)(7736002)(6116002)(3846002)(25786009)(2616005)(86362001)(50226002)(36756003)(11346002)(26826003)(478600001)(76130400001)(70586007)(81156014)(81166006)(70206006)(2906002)(8746002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB5406;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: b326ecac-c72b-420e-e445-08d778afde10
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: znKewsXl48g0QaD2M3xpEDb6aOiXY8jIenbNxgNbS6U5csn2HrDXROy+Csng7NM3VW5CSA814Grsa8BcewvHAMzmPhwND44AzIbfHlVISUHNRW/xURFh8jO+pLZp2ilrlpRtIU2ssXBSRedJGb1N4oY/XXciSyI62RsEMrHSSLq7B65ikq7lF+Tdde20i9YPK3PvH2cQB9ZMjmS8n3DAg5wnLNOPEsESjlSvfSgKBug/ArqtSQvYFBL4z5gHMDhIfLwxXOPBk9gIadAo69Ipc78Vxy8TF1tFlvivix+dMyUSFA0ZTl6m+U2mHcR041EHpvvZJITLHIlu+1M0jkYYYfPKM56nHjtdKUvPmKvns0NyRRgjrxj4tprdXX7AwohPcvg24OjkuukpI0EI9AleIZ7b9kJ2x6DY0lGtti4pLnUP1B+ZBcsEDHjrJCwefLh7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:34.1072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa816a05-425b-4ed1-28cb-08d778afe459
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5406
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

No functional change.

Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/=
rcar_lvds.c
index 8c6c172bbf2e..ac1f29bacfcb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -881,9 +881,8 @@ static int rcar_lvds_probe(struct platform_device *pdev=
)
 	if (ret < 0)
 		return ret;
=20
-	lvds->bridge.driver_private =3D lvds;
-	lvds->bridge.funcs =3D &rcar_lvds_bridge_ops;
-	lvds->bridge.of_node =3D pdev->dev.of_node;
+	drm_bridge_init(&lvds->bridge, &pdev->dev, &rcar_lvds_bridge_ops,
+			NULL, lvds);
=20
 	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	lvds->mmio =3D devm_ioremap_resource(&pdev->dev, mem);
--=20
2.23.0

