Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F94A112AAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2019 12:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbfLDLsj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Dec 2019 06:48:39 -0500
Received: from mail-eopbgr10067.outbound.protection.outlook.com ([40.107.1.67]:63814
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727866AbfLDLsj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Dec 2019 06:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXiSa2cDPynqi1pZWZTQXR63peA1QHF+7CCWR6/itq8=;
 b=3aHsOV1DMk5dYZFhEbVHin+dXuT+2boCnq7JIDurPU75G6OQeWBqpeOqITEG9qMJnYUJFtXhOyvR9fRi4mMRBBMqmtCNe46jsf2HaIW/OX5MJyI0syfBzskm57Hwqs+ukhZk+nhucoRvWxLjBDarqZT7gpNGdiLvl1A64alYaIs=
Received: from VI1PR08CA0165.eurprd08.prod.outlook.com (2603:10a6:800:d1::19)
 by DB6PR0801MB1718.eurprd08.prod.outlook.com (2603:10a6:4:2f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Wed, 4 Dec
 2019 11:48:35 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by VI1PR08CA0165.outlook.office365.com
 (2603:10a6:800:d1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:35 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:35 +0000
Received: ("Tessian outbound a8ced1463995:v37"); Wed, 04 Dec 2019 11:48:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e36a23b3ed79946
X-CR-MTA-TID: 64aa7808
Received: from 27b0b5ea6d36.5
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8B1B234E-B987-442C-9429-D3644B9B857A.1;
        Wed, 04 Dec 2019 11:48:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27b0b5ea6d36.5
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 04 Dec 2019 11:48:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWIS3Prj/Wl+7ArLRvPs0nzaBXQ3fh9Lz+jV/WFsxjiCG6sRN0xlhru4rW74lNNydb6PzBlhULR3QToZD0vIgshrvxmKu0gXRgiRi8kWM+76Aaf6cLn35/g+ht5jwOb+fahj308ffucWwLZqNrrEALCEnQThF8Fkf++Xzvhr0PnaKTySTW90+wRaCNuXRkn/lKFuxfTO53V5N2hVVdAoycz1GDbRlLGFoLK3HY8RIuRbx261yyyQ1X5g54Up5MvynEl9IfMRY0GJCqp/PB1VcGmu02YUFdiYf3gOFytVM6adsnZc+9duVF2aR9fQqnNJoWBngMrRHwqeHdBU3CrKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXiSa2cDPynqi1pZWZTQXR63peA1QHF+7CCWR6/itq8=;
 b=G/MYzy/kllgVvDPOe2HzhAl0KvBJYdbiafhlBz8KwBgis4hgATC6cssvz4Txg9R+RnnyVM69cVkdmRIiaQZ78hNKnOAzKajGRmPw1HL7Ple/89t5sLWiTqwtCG44tkm4s8JqG37UcK97BTnEtXLUYabIO/lZp4Sl3BqO8sNMVjp/AkPwq4cbWNK3kCpvWSWyeEdhPpLHMrirKDmPXy4cXu7t1dQQjzO3UjDxjcenV2VvaB1Ao9rGMDNqz7CD0HXgL8ptLo+1v30kn7zkDol9UGTwLYkWHlDlmHFH3IJyZRhOj7wSHdl8JiOwWeN8H+5Y4VCdGdn+ky7ZlPDysctMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXiSa2cDPynqi1pZWZTQXR63peA1QHF+7CCWR6/itq8=;
 b=3aHsOV1DMk5dYZFhEbVHin+dXuT+2boCnq7JIDurPU75G6OQeWBqpeOqITEG9qMJnYUJFtXhOyvR9fRi4mMRBBMqmtCNe46jsf2HaIW/OX5MJyI0syfBzskm57Hwqs+ukhZk+nhucoRvWxLjBDarqZT7gpNGdiLvl1A64alYaIs=
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
Subject: [PATCH v2 26/28] drm: rcar-du: lvds: Don't set drm_bridge private
 pointer
Thread-Topic: [PATCH v2 26/28] drm: rcar-du: lvds: Don't set drm_bridge
 private pointer
Thread-Index: AQHVqpi8ZpAv1tSEIUSOt4HDPKXKpw==
Date:   Wed, 4 Dec 2019 11:48:24 +0000
Message-ID: <20191204114732.28514-27-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: bf10c7b0-1ce7-4951-5680-08d778afe4e6
X-MS-TrafficTypeDiagnostic: VI1PR08MB4624:|VI1PR08MB4624:|DB6PR0801MB1718:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1718462C29FE846E9DF2CA588F5D0@DB6PR0801MB1718.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:546;OLM:546;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(199004)(189003)(2351001)(305945005)(316002)(6436002)(81166006)(7736002)(6916009)(4326008)(186003)(99286004)(6486002)(66446008)(5640700003)(4744005)(66476007)(1076003)(66556008)(54906003)(2501003)(5660300002)(66946007)(64756008)(6512007)(86362001)(11346002)(2906002)(44832011)(2616005)(14454004)(50226002)(6506007)(36756003)(25786009)(81156014)(8676002)(3846002)(71190400001)(52116002)(26005)(478600001)(71200400001)(8936002)(102836004)(6116002)(14444005)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB4624;H:VI1PR08MB4078.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rXWJ51sHT7p7ufAIjU70oDvsNmNKPCuXNN9HZ4iRfgLp8oUpIa38H+3tS7x83X3BwzSvsRPCd2CigFhgDd6Kin86OfEhrb51NliO5I9W0Pv+mMx1ewq5mWadCdAFibikW2z1/o2qAMuSXg/fI+ObsHYX1ICXE+tdhT1l3cCV6JxHaTYza5t11eVUXe09lKp6MIyio3befiKWhhzjtaTVsUzFYbqdgSd6R3F+j+V4MJllKmS/XFJgjDMGanKxaAYlxzukPEXwqaXZApDJJMCbmi9BdrqVIEdm7L34ZOmkF4p3caXmp7O5mpADSTy6QQOWTrWbwZ7FJqfhAXNK3UXGm4p+VWFaLHHnYbKk0CSrfebn/r0D6thEQzQyZ0IkFudNjMX/7rjpCodz61vvy/RLapOsm9Uvfr3S4gg+XPZwDdbMUcUGWYyToywDipgRzyBc
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4624
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(199004)(189003)(2501003)(26005)(99286004)(186003)(2906002)(70206006)(76176011)(36906005)(23756003)(305945005)(50226002)(336012)(26826003)(7736002)(6506007)(11346002)(478600001)(6512007)(14454004)(14444005)(102836004)(2616005)(70586007)(76130400001)(1076003)(8676002)(81156014)(8936002)(6116002)(6862004)(2351001)(81166006)(3846002)(25786009)(50466002)(5640700003)(8746002)(22756006)(4326008)(356004)(4744005)(6486002)(5660300002)(450100002)(36756003)(86362001)(316002)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0801MB1718;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 49d71ba9-6f4f-436d-e11f-08d778afde7a
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oaf+BP3r2JH3pt1GrpHMPn+hfuPUFzaJzOfJRG667S+b4I39l92e4AGgo/MkLFblRIHdvsTFdF7wzJuCMPaXLiKm9TV+EVEtBGPy+7tktyc+y/955UhdYHBkZ3OmjzWmWoxb667dqBkjToEmG+6pVZppmt9v0zDDkZ3cNnf1iE0hyD3z2MCVqPDphd8dGFwQESjGuAo3PYWNDIl4+pgskOj89FmLGo8OXMuusYDgiGlhfWxkRX2oJR/Bnu8xY8Soc+NtqivlfnY7yg+ZVaG4Sci8GnP+XFWQXsxFjmmcvgfHL/tGy+rz7v4JWcDJdRELBGgclh5GKyO5xHQyo9kgd9o7F9oCCNDzl0mBU/8xgw1TkWXJm5Zr4W18+hVbLvGjBmJJdVvpxRfIC2H1SrAQd4E+cgXdEJoVTYamPoyELQUBqbfkDNgwpQbg+FvOQHHe
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:35.0394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf10c7b0-1ce7-4951-5680-08d778afe4e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1718
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

