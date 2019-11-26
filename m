Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDA3109F0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2019 14:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbfKZNRT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Nov 2019 08:17:19 -0500
Received: from mail-eopbgr40059.outbound.protection.outlook.com ([40.107.4.59]:35230
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728128AbfKZNQh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Nov 2019 08:16:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXiSa2cDPynqi1pZWZTQXR63peA1QHF+7CCWR6/itq8=;
 b=69d5vRmKAwZ5E5i2SfbFOrjsvu7rBi4QG12K9hYv0OIXrAPvbAlRlKm7EOJWZ+jOQ/OUea1ALgrMOkrCJUs0NLkRqXu93Tuf923YAUYzbXvFIXx0pp7IDi7u1J/EnCNfNkAolru4QB5Q3itdmCtxtGF+w54W0ZONhCTX8KtToQk=
Received: from VI1PR08CA0258.eurprd08.prod.outlook.com (2603:10a6:803:dc::31)
 by AM0PR08MB3585.eurprd08.prod.outlook.com (2603:10a6:208:d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Tue, 26 Nov
 2019 13:16:33 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by VI1PR08CA0258.outlook.office365.com
 (2603:10a6:803:dc::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:33 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:33 +0000
Received: ("Tessian outbound 512f710540da:v33"); Tue, 26 Nov 2019 13:16:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 54495c6cc4f08a7f
X-CR-MTA-TID: 64aa7808
Received: from f4b123a35b0f.2 (ip-172-16-0-2.eu-west-1.compute.internal [104.47.14.50])
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2C2F2565-C22B-4BD8-9147-90B0661C3173.1;
        Tue, 26 Nov 2019 13:16:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4b123a35b0f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Nov 2019 13:16:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3YLhHGCaG87oEYNSlxiibDSBe0JkXKy2rslCutmWZOB1MMliAP0pgCAvTOzRS0bmtYZxXVoQYsqfffgquKGLK2UZM5glX1waZtwmO71iT9INDj5RJNehPINl8rf0GILP6TqYRSpz9isiKh4LI4hYKccOxOzo4qntGvBT1d5LoTUnXflCqaIXb04xXaFCz0TwgULOIIGozm4bBNtiI1dKkH07j33nJzOP80j99ulVLsd9Wl75id4rA3SCyEPoHMNGsNsCTDHkR0HiTm5NslyOqrlsXViDt3X/vKvUEHwTfrgK/lYt6Fqz1lqiWCiEiFHVHuDhtUh0suzE0A9E3frbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXiSa2cDPynqi1pZWZTQXR63peA1QHF+7CCWR6/itq8=;
 b=Vv44870OD5WjXkk5naSmOHeYWeubwVXtaQe3iWXRgyx546vAimAZC8EC2xchHZO6zIA2GAPs2L7ZDxQpbYyqEdNTI1YwIV/4hbkzAHgZIifIdcDTSK8YuLi95U1nrV2axQ8I5eTwQSAh0iChulUpIQWhCV7AdZkCwLAMFJogoYPQrwrWIGHmo/ii+5Oi+yr7F7L02+Z/mew3LokT4U7ayaFpDVhkWI1zcWQvGucfEwgKoRybHcHlXsbeAq3ywf9pK4gtVzQoF+cSz7bwlMcz5adb3y7cXKVJK+hie2bjINijFF5aG8qUxG60Hry4awj35nkrnsvHC9I8w+R7WPdiLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXiSa2cDPynqi1pZWZTQXR63peA1QHF+7CCWR6/itq8=;
 b=69d5vRmKAwZ5E5i2SfbFOrjsvu7rBi4QG12K9hYv0OIXrAPvbAlRlKm7EOJWZ+jOQ/OUea1ALgrMOkrCJUs0NLkRqXu93Tuf923YAUYzbXvFIXx0pp7IDi7u1J/EnCNfNkAolru4QB5Q3itdmCtxtGF+w54W0ZONhCTX8KtToQk=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:25 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:25 +0000
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
Subject: [PATCH 27/30] drm: rcar-du: lvds: Don't set drm_bridge private
 pointer
Thread-Topic: [PATCH 27/30] drm: rcar-du: lvds: Don't set drm_bridge private
 pointer
Thread-Index: AQHVpFu0AaX4+WqtW0efGC3rTYsu4g==
Date:   Tue, 26 Nov 2019 13:16:25 +0000
Message-ID: <20191126131541.47393-28-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: cc471311-4d1e-4a07-5b46-08d77272dba0
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|AM0PR08MB3585:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB35851F6405C9EACAE5B0B2078F450@AM0PR08MB3585.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:546;OLM:546;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(14444005)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB4317;H:VI1PR08MB4078.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 0bplAz7M7EOz1UCgRq3RawokjrsTXRkN6Ft61+dbUbyp9wpzugB/oCg163ScqVsA8ICjwn3KmSACh31sqsqN3H3jrewsMvgR+Og7tRsyxNNO/dtlC9FiaMKWIIbSeZJiJHm5kbhKRrCE+a1E/YDDGc1F+96Ipk7MMESBs40P9GFUexQJQE8zj+yTrEFxzTwzWWT2w9NrdyFHwCjB+29dW9LYBcEcNGxSQfh29c2hdk/8z/3e2Af8Zr+ADahI3JfRMG165hl+JwderTs7pwjsrQO80daI+hvJzEVyS2nUuljT/0tctT9mLRcqGYvFWaKjnYAWeJIh4RSx2eq1B9su6jLTLqv/n1g30QIUyI6vfw87LjZCNTxHs0JnExXSIvP5deZBJrHtOWth31f/hYN0DSkA/HChnaEdHHMsCi+1RYWm9KUmaf3zR1YwqGsvi+DW
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(346002)(396003)(136003)(199004)(189003)(336012)(70586007)(70206006)(14444005)(316002)(26826003)(305945005)(25786009)(2616005)(14454004)(54906003)(4744005)(36756003)(478600001)(50226002)(7736002)(106002)(8676002)(3846002)(6116002)(8746002)(446003)(81156014)(8936002)(81166006)(2906002)(11346002)(50466002)(2501003)(5640700003)(26005)(76176011)(186003)(2351001)(99286004)(76130400001)(450100002)(23756003)(356004)(6512007)(6486002)(47776003)(66066001)(386003)(6506007)(5660300002)(86362001)(6862004)(4326008)(102836004)(22756006)(1076003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB3585;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6bb0853c-f121-4134-b1f5-08d77272d6b2
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kNWKDl4nRyrh8YRF4XK3Z9gKDGmDG0RI1LvWZBbsMyAIvAvTXchu3v3B4MIXUKg9bM5OzCveBuCcq8OmOjISepQEVq9xXHGd5U/vBMcJmXLZCAry7Dk2GB0/g28p6px8ooe/iYLLuaKXvbMpQ++Kir+yPT93Y7XpjV8i+kCWLyk/3Cz8JHNNZD96GAepvvyLweC2jh8lXFcqny7h3yng6abQR8h4ZacUG3K9Y3b3MR7eii4UbNoz+RuDlhZhGLxXPqC1hzDnxd6zyB0xQ5aYnNVCo4epPdAsQaCndA87eMkdgmRKTpqkEVR2ZA2Q0bJzNCiVvJSahVCVtM8TvUsu/yp168ILv/zACf02D0NgLWX7/9Zie9RfgqOjztrfYlEoQkVlIdTlMHl55VBuEIot5Vi7WWiekVpKcvEKBVlymsffScmQANwGJJaRi5AI06oS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:33.2001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc471311-4d1e-4a07-5b46-08d77272dba0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3585
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

No functional change: it's not used anywhere.

Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/=
rcar_lvds.c
index ac1f29bacfcb..168a718cbcbd 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -882,7 +882,7 @@ static int rcar_lvds_probe(struct platform_device *pdev=
)
 		return ret;
=20
 	drm_bridge_init(&lvds->bridge, &pdev->dev, &rcar_lvds_bridge_ops,
-			NULL, lvds);
+			NULL, NULL);
=20
 	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	lvds->mmio =3D devm_ioremap_resource(&pdev->dev, mem);
--=20
2.23.0

