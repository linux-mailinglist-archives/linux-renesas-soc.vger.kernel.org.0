Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA4E7109F0D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2019 14:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbfKZNRT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Nov 2019 08:17:19 -0500
Received: from mail-eopbgr50085.outbound.protection.outlook.com ([40.107.5.85]:46478
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728126AbfKZNQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Nov 2019 08:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWRkjbKXWosT47zn6WBBKW0xFtrV15qKHnsxlVXCAOs=;
 b=zllVX4QaEXQs5sq6vYcUC1WrERqhWBEONBZKo1t/cz2lMPex46xDK3X4A+hR/xlPFgJAUBSUPVlsNDtLVOyilrDWVUtD9KGqcn+6PuAU9TGN3DEiMqzfOdV/mtP0OhcWsI9tDBIM4zvqa25veR9P6Em4/ECQcW8Zev656e2Jsyo=
Received: from VI1PR08CA0106.eurprd08.prod.outlook.com (2603:10a6:800:d3::32)
 by DB6PR0802MB2133.eurprd08.prod.outlook.com (2603:10a6:4:84::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.22; Tue, 26 Nov
 2019 13:16:33 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VI1PR08CA0106.outlook.office365.com
 (2603:10a6:800:d3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.18 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:33 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:32 +0000
Received: ("Tessian outbound f7868d7ede10:v33"); Tue, 26 Nov 2019 13:16:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d8041612cdfffd86
X-CR-MTA-TID: 64aa7808
Received: from 95ca307b0d32.4 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.14.57])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id C8F618B6-898E-43B8-B39E-9F15EB3C7B3F.1;
        Tue, 26 Nov 2019 13:16:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95ca307b0d32.4
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Nov 2019 13:16:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4jif/BK1R5UAaupC8+hnRgpr1VlR4VWNzv3Sm0hc/lPA44FkFlpQajLtkxbzBHBK9ZmVGgIo/dzusKHM2WKziKyiFjXVGDjnxKfhafGBSywN8sqHk/DnuIi2YWr0OEZnE2s6MngEk0c5mdFZCzEt3If6NG1jUQg6ZCubFzBEvZBKDuu6aB50NXQZ7I5Y5xNkhZHwIjosPBv2iF1GTsOFCUket0DLH/MrBxGqgcbn/24tXsw7q+VKaACCNN5XkSnKi1h0VR5Dx/liOMxEjVa+PiTvxlUCE+OMLj+AG69uZne2SdeUX9acaxlrGThFKHILJw6lu5nuyCmH2NVDOs/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWRkjbKXWosT47zn6WBBKW0xFtrV15qKHnsxlVXCAOs=;
 b=fRA6zQVEPMkSZ+QZUF3NcrtJpaJTAE2f1C0HJXqFb/PyxRKVRDyV4WPRWftTZ60DSUiM0Pxfk0WGajZtiXrlLCLetXxoM/4YD0uAWwUtCbhjVQmy7W7e5yf3g5ApTkanG9E9THlWOhZkvuXmsNqdfDJOyBoeNNUwYXSoMJGymGkTKOhegS1ZkzJb6eKbMALYzx6G30r9uudSTXAZEneo6n+I/VcgH29cJmr8Ehozmv0bisGGRDRXNZoVPGuyRN5vjGtwqXTLxT/a2CzMmEpCwZFlatoedu2W6j4Fj9AwqIdj7+eVZ3O9ybW9Yo164+urSU/gHIfKRcQNrHt28ONVvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWRkjbKXWosT47zn6WBBKW0xFtrV15qKHnsxlVXCAOs=;
 b=zllVX4QaEXQs5sq6vYcUC1WrERqhWBEONBZKo1t/cz2lMPex46xDK3X4A+hR/xlPFgJAUBSUPVlsNDtLVOyilrDWVUtD9KGqcn+6PuAU9TGN3DEiMqzfOdV/mtP0OhcWsI9tDBIM4zvqa25veR9P6Em4/ECQcW8Zev656e2Jsyo=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:24 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:24 +0000
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
Subject: [PATCH 26/30] drm: rcar-du: lvds: Use drm_bridge_init()
Thread-Topic: [PATCH 26/30] drm: rcar-du: lvds: Use drm_bridge_init()
Thread-Index: AQHVpFuzCCWCeiajR0azDZK79iNyGA==
Date:   Tue, 26 Nov 2019 13:16:24 +0000
Message-ID: <20191126131541.47393-27-mihail.atanassov@arm.com>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
In-Reply-To: <20191126131541.47393-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 95aab737-82aa-49b2-e6e9-08d77272db66
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|DB6PR0802MB2133:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0802MB213383368982F85E816FAE168F450@DB6PR0802MB2133.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB4317;H:VI1PR08MB4078.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: jNZyCECqC/7P+UsXMnkFjI6+eNr5TCvVNSHj3njTCXUN8FCBJ0HHrB9WfooHtASIx3Umk0dV+Zz+v+oEyIsJ4ApjaoMnn3j/T15G7Ccja7xnsIwhNksC85LtVEJsB2df2ZZlrO/TTZhmar9VABdnVE+FXLiiV7cM0+NsLlqhr9vx/mfZ8hus3C5HaAMdnPXqE45WLQAmOM3SXS8KY5k39NMXJvNnE5g+A93TRqsfTSpWOgqsU20Oc8aRWIffX40PZCCKYpLEk/0dZ1a6/9QQmh2aWMUGCteH9p5Bz+fV8/8IfA4EZ03McReX6lyJY3EM405imMYqDmC5Tgkk86svX1L++nxHIrUwS3Fx8+QRvpHFDEt9Bz3WKmy28WgQKHfVAsq9X5IGfY9ibojC8OJUvR8zw2Sl2/vEC+Y7/JgyI8LGy7TIdmodRS6Xr1J1SqWx
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(189003)(199004)(6512007)(54906003)(106002)(305945005)(66066001)(11346002)(2351001)(316002)(8676002)(8746002)(8936002)(5640700003)(50226002)(81166006)(81156014)(2616005)(7736002)(36756003)(70586007)(186003)(14454004)(4326008)(86362001)(2906002)(47776003)(2501003)(478600001)(102836004)(4744005)(22756006)(23756003)(76176011)(6486002)(6506007)(386003)(70206006)(356004)(26005)(1076003)(50466002)(5660300002)(25786009)(450100002)(99286004)(26826003)(6862004)(76130400001)(6116002)(446003)(3846002)(336012);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0802MB2133;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5213e331-3562-425a-bb57-08d77272d62b
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e2WmONC0LRppKMEFXjFgJDsbY0HkzHUK4W8Y8+hr85hEFMYyrEYE/ogOsRvEKJzKV7Tii/MdWIWNqR9OpCMaiwIyDYexcn3teINktm71Sy3inZO9Uyx/mr7filJhCpvvnLhSuGhIKvp7P695b2WFtOXqMyqio9fvtzGR08xR0IlSCpeKnDw5NyF+VLWhR0wqH0ZEK1q4Q9DnH6GsBezN5dh3v/qW4CZRR8SfQ5wfFqBv5+sGuwMlQw2RPm1FvWJSmndJyiYFVQ2bwOg4UU5jU3784MRrAYc57Twk7duOql8uVRDULKr/BW9O0bggfIMpMdcfaWP0BH08mW65yCGVDvRqIarQXvCYOp9lYEsJVaDGvqcH0QBobTdjbQ65Lw7aAJWqJtqhDg709+WYZO4BJHJiv0Bo5O7RuBg6VkjOY8auffs8WinwiOoHz/O65I6j
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:32.8276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95aab737-82aa-49b2-e6e9-08d77272db66
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2133
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

