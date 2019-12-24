Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD9D12A39C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Dec 2019 18:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfLXRg3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Dec 2019 12:36:29 -0500
Received: from mail-eopbgr30065.outbound.protection.outlook.com ([40.107.3.65]:40256
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726171AbfLXRem (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Dec 2019 12:34:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9JSn30pd0NF9LZaiJcXz3M/19eZMzstYf8xwo/HeZc=;
 b=VBzlj762SUlnBKYjfYXmRlh8xTn9dnIHQ5mGihfwyfEb22xerSYdt4YVVhFp3Xm8CqpdikqS94j27XhiMmCINNZX5YzO+OGuXSvzmxsiowBeHkduCQULVKoCCizGjQWahHNEuVoWd+ryVi0B97xZ41tPCcQcXs6fthSSdYgNoC0=
Received: from HE1PR08CA0073.eurprd08.prod.outlook.com (2603:10a6:7:2a::44) by
 DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Tue, 24 Dec 2019 17:34:30 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::204) by HE1PR08CA0073.outlook.office365.com
 (2603:10a6:7:2a::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Tue, 24 Dec 2019 17:34:30 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:34:30 +0000
Received: ("Tessian outbound 0eaff1016ea4:v40"); Tue, 24 Dec 2019 17:34:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3bf3048c4c4a1075
X-CR-MTA-TID: 64aa7808
Received: from ac55e6cc70e7.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5C7F5543-B940-4F1E-A330-7173FC3EA0D9.1;
        Tue, 24 Dec 2019 17:34:24 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ac55e6cc70e7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Dec 2019 17:34:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsSMSt/HwEDGiX1QXXi7H0Pd6uz20PDHAeOR97iSeYjW6tMcS/LxfWP3Slr3PQx7cXjSiriRR5iKUFr44dmBWleA3leQ0OZKKusO0A5YfRFXo+j6QLakqjLDfOrw0a38p7Os2VnjjiVJbjZMTdZDE+BCJk0w0RE4sCgwj8YMAPBGwYx7TmztRGkJDuhoP/zZTGD6jktSZTZ5wf/6EPi5rQRXiKMBTOzsgti5agbhNAXz2KqgPqvxFbssHvYlQu2LhJGohr1Pdj+fCNQAHavmzaUM5hwGbb/lfRN6MU9E7EM+Vm2rrL2EmQyZXgcBQu7lejs5/IhBvvOom5df+u2F+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9JSn30pd0NF9LZaiJcXz3M/19eZMzstYf8xwo/HeZc=;
 b=OWI4zc5oRV37uHCe65P0HJIlMTgzsEhrDjsj0SsBPy+4itA0O7SQ50UcEOxeDK1jN6WcbIehShZettAOfZ2HLkRzyGeRheo8WteZ4ycZrJ3H0mpucCycdcF3K2ONa0n6kxrjj/gqvzeHLPP9MMG3KoT751VBDgAkQOPichYHBx7sNkNV4h6OPEXI4pCc9o7IUeuppQ26JpIwdwrqL+uVv8oeoK/0lGkPkYjMAKUsV1Jh/8fq/rp4Swh/D9jBQc7Bstt0yPCFR69x0mywkATIV4+5nnF9JJjDhzwF8MtCEqmHnqQr4yICS3PiHC8th8U6XV3UWu2z8SfvCpx0gLAERQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9JSn30pd0NF9LZaiJcXz3M/19eZMzstYf8xwo/HeZc=;
 b=VBzlj762SUlnBKYjfYXmRlh8xTn9dnIHQ5mGihfwyfEb22xerSYdt4YVVhFp3Xm8CqpdikqS94j27XhiMmCINNZX5YzO+OGuXSvzmxsiowBeHkduCQULVKoCCizGjQWahHNEuVoWd+ryVi0B97xZ41tPCcQcXs6fthSSdYgNoC0=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2702.eurprd08.prod.outlook.com (10.170.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 17:34:21 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:21 +0000
From:   Mihail Atanassov <Mihail.Atanassov@arm.com>
To:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC:     Mihail Atanassov <Mihail.Atanassov@arm.com>, nd <nd@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maarten Lankhorst <maarten.lankhosrt@linux.intel.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 01/35] drm: Remove drm_bridge->dev
Thread-Topic: [PATCH v3 01/35] drm: Remove drm_bridge->dev
Thread-Index: AQHVuoBfpcizub2IkkiBwuTayWU61g==
Date:   Tue, 24 Dec 2019 17:34:20 +0000
Message-ID: <20191224173408.25624-2-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: a6c895e6-71c1-49e7-5021-08d788978820
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|DB8PR08MB5481:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB548169E137EE995A2841373C8F290@DB8PR08MB5481.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:232;OLM:232;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(81156014)(8676002)(478600001)(36756003)(4326008)(8936002)(30864003)(66446008)(64756008)(66946007)(66476007)(66556008)(26005)(7416002)(186003)(44832011)(6506007)(2616005)(81166006)(966005)(71200400001)(316002)(2906002)(1076003)(6512007)(54906003)(6916009)(6486002)(86362001)(5660300002)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB2702;H:VI1PR08MB4078.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 8g8c7UIwi5iwc51BWI7XJfnPC1B13s2oz/hBTuw635JCb5b4UgUtUtvIIr7kIqGaVSpD9K2JVLisJSYli3L9wtHnxMZitUeciLz5HlwMjJoN1h53TGIsajrdoMdHKo3RuuCWhiBQ2GGbOKc7umttOz05W9iOFFEJmQaw7cPSiI/LSaDNQ7JIcEEJUiAJ1ETr3wwTb2CLhzT6hWuidzdgoEqUPFlCXGfI/IfWYA9aFhedQM49hxp0RsGM0ZV3KWIymqEawNK1sGj2lzIXUp9MuJVBDG+prVPeput4kS1yg5Y8Hcj5dFlUoBO3iKgfgWTmCJ2PkmtRHbjGv7dV+jS+e6Zy+UAm08XVLIpOeVOWqy1ljTspn6EtsNx7wDJRLByXADrb9waTZBeeXRZVheMq1Vfr6/Extm2PrV17OyPKWHe5VoDsS0VlvR91De30GJvMwe2Ab3JAXTeIS12Z5zXFsZJF4LAg0NftGtlcpWQjDVU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(189003)(199004)(81166006)(81156014)(26005)(6512007)(8936002)(6486002)(4326008)(450100002)(107886003)(966005)(26826003)(186003)(6506007)(356004)(86362001)(8676002)(478600001)(1076003)(36756003)(70206006)(70586007)(6862004)(2616005)(54906003)(76130400001)(316002)(336012)(5660300002)(2906002)(30864003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR08MB5481;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: a3e74795-5584-4a7c-bade-08d78897814c
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0QcIot+AV1wivyI4BPdfVwlvl8rlnaMNfItIE/GH78y4klTXIaVgQQS/3DinmYKDMftE384IU55BNwY/dwQcZKA24I87Poe3jXGMiKRVzxtucuf6y9eqEgTWUSGFx3wvKC9SC7Kmm/ItcEhv9k7LrJk2gw/4o0BTo1jlyb6RYEWw2ER3JybZqooEKmk8UPD4z+9JBIDQKh/gIhacIztH3GA6FeWI0keDNTwiiaCvprdQlgbo7WV8kPDkkhy0JLjyLX+H5002UlrsMaiIoFLu4vlh3NaIQUxThwiQNl/C8BLigYpQsalfi9p804BT11R0lMZV5WBaZoltEv/KaUGu8pvIA9yOJ5xf1bjaGhEpSzoDZTr5CxyE69KYhSmi6aPjGHxV5f7aVMSMmeBTkA50n/fuIwYyVHvyonTbtGZWdxona1qrXzHON/I745f456KtOpg+w8gwyowb1q1GqAvLHS6EC77uUKoVGb/IoH8WDAs=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:34:30.0301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c895e6-71c1-49e7-5021-08d788978820
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5481
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As suggested in [1], the 'dev' field is a bit repetitive, since it 1:1
follows the setting and NULLing of the 'encoder' field. Therefore, use
drm_bridge->encoder->dev in place of drm_bridge->dev.

[1] https://patchwork.freedesktop.org/patch/343824/

v3:
 - resend as part of drm_bridge_init() series
v2:
 - fix checkpatch complaint about unnecessary parentheses in
 drm_bridge.c

Cc: Daniel Vetter <daniel@ffwll.ch>
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c           |  2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c     |  2 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c     |  2 +-
 drivers/gpu/drm/bridge/cdns-dsi.c                      |  2 +-
 drivers/gpu/drm/bridge/dumb-vga-dac.c                  |  2 +-
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |  2 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c                   |  2 +-
 drivers/gpu/drm/bridge/panel.c                         |  2 +-
 drivers/gpu/drm/bridge/parade-ps8622.c                 |  2 +-
 drivers/gpu/drm/bridge/sii902x.c                       |  6 +++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c              |  6 +++---
 drivers/gpu/drm/bridge/tc358764.c                      |  4 ++--
 drivers/gpu/drm/bridge/tc358767.c                      |  6 +++---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c                  |  2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                     |  6 +++---
 drivers/gpu/drm/drm_bridge.c                           | 10 ++++------
 drivers/gpu/drm/i2c/tda998x_drv.c                      |  2 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                        |  2 +-
 drivers/gpu/drm/msm/edp/edp_bridge.c                   |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c                 |  4 ++--
 drivers/gpu/drm/rcar-du/rcar_lvds.c                    |  3 ++-
 include/drm/drm_bridge.h                               |  2 --
 22 files changed, 35 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm=
/bridge/adv7511/adv7511_drv.c
index 9e13e466e72c..009cf1fef8d4 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -863,7 +863,7 @@ static int adv7511_bridge_attach(struct drm_bridge *bri=
dge)
 		adv->connector.polled =3D DRM_CONNECTOR_POLL_CONNECT |
 				DRM_CONNECTOR_POLL_DISCONNECT;
=20
-	ret =3D drm_connector_init(bridge->dev, &adv->connector,
+	ret =3D drm_connector_init(bridge->encoder->dev, &adv->connector,
 				 &adv7511_connector_funcs,
 				 DRM_MODE_CONNECTOR_HDMIA);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/g=
pu/drm/bridge/analogix/analogix-anx6345.c
index 9917ce0d86a0..5b806d23fcb3 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -541,7 +541,7 @@ static int anx6345_bridge_attach(struct drm_bridge *bri=
dge)
 		return err;
 	}
=20
-	err =3D drm_connector_init(bridge->dev, &anx6345->connector,
+	err =3D drm_connector_init(bridge->encoder->dev, &anx6345->connector,
 				 &anx6345_connector_funcs,
 				 DRM_MODE_CONNECTOR_eDP);
 	if (err) {
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/g=
pu/drm/bridge/analogix/analogix-anx78xx.c
index 41867be03751..7463537950cb 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -908,7 +908,7 @@ static int anx78xx_bridge_attach(struct drm_bridge *bri=
dge)
 		return err;
 	}
=20
-	err =3D drm_connector_init(bridge->dev, &anx78xx->connector,
+	err =3D drm_connector_init(bridge->encoder->dev, &anx78xx->connector,
 				 &anx78xx_connector_funcs,
 				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (err) {
diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdn=
s-dsi.c
index 3a5bd4e7fd1e..32863e3ad537 100644
--- a/drivers/gpu/drm/bridge/cdns-dsi.c
+++ b/drivers/gpu/drm/bridge/cdns-dsi.c
@@ -651,7 +651,7 @@ static int cdns_dsi_bridge_attach(struct drm_bridge *br=
idge)
 	struct cdns_dsi *dsi =3D input_to_dsi(input);
 	struct cdns_dsi_output *output =3D &dsi->output;
=20
-	if (!drm_core_check_feature(bridge->dev, DRIVER_ATOMIC)) {
+	if (!drm_core_check_feature(bridge->encoder->dev, DRIVER_ATOMIC)) {
 		dev_err(dsi->base.dev,
 			"cdns-dsi driver is only compatible with DRM devices supporting atomic =
updates");
 		return -ENOTSUPP;
diff --git a/drivers/gpu/drm/bridge/dumb-vga-dac.c b/drivers/gpu/drm/bridge=
/dumb-vga-dac.c
index cc33dc411b9e..67ad6cecf68d 100644
--- a/drivers/gpu/drm/bridge/dumb-vga-dac.c
+++ b/drivers/gpu/drm/bridge/dumb-vga-dac.c
@@ -112,7 +112,7 @@ static int dumb_vga_attach(struct drm_bridge *bridge)
=20
 	drm_connector_helper_add(&vga->connector,
 				 &dumb_vga_con_helper_funcs);
-	ret =3D drm_connector_init_with_ddc(bridge->dev, &vga->connector,
+	ret =3D drm_connector_init_with_ddc(bridge->encoder->dev, &vga->connector=
,
 					  &dumb_vga_con_funcs,
 					  DRM_MODE_CONNECTOR_VGA,
 					  vga->ddc);
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/dri=
vers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index e8a49f6146c6..c914f01e4707 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -223,7 +223,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bri=
dge)
 	drm_connector_helper_add(connector,
 				 &ge_b850v3_lvds_connector_helper_funcs);
=20
-	ret =3D drm_connector_init(bridge->dev, connector,
+	ret =3D drm_connector_init(bridge->encoder->dev, connector,
 				 &ge_b850v3_lvds_connector_funcs,
 				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/=
nxp-ptn3460.c
index 57ff01339559..3999bb864eb9 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -247,7 +247,7 @@ static int ptn3460_bridge_attach(struct drm_bridge *bri=
dge)
 	}
=20
 	ptn_bridge->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
-	ret =3D drm_connector_init(bridge->dev, &ptn_bridge->connector,
+	ret =3D drm_connector_init(bridge->encoder->dev, &ptn_bridge->connector,
 			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector with drm\n");
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.=
c
index f66777e24968..4ba4e9d9537a 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -67,7 +67,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge)
 	drm_connector_helper_add(connector,
 				 &panel_bridge_connector_helper_funcs);
=20
-	ret =3D drm_connector_init(bridge->dev, connector,
+	ret =3D drm_connector_init(bridge->encoder->dev, connector,
 				 &panel_bridge_connector_funcs,
 				 panel_bridge->connector_type);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridg=
e/parade-ps8622.c
index 10c47c008b40..c32af9c2bbcc 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -487,7 +487,7 @@ static int ps8622_attach(struct drm_bridge *bridge)
 	}
=20
 	ps8622->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
-	ret =3D drm_connector_init(bridge->dev, &ps8622->connector,
+	ret =3D drm_connector_init(bridge->encoder->dev, &ps8622->connector,
 			&ps8622_connector_funcs, DRM_MODE_CONNECTOR_LVDS);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector with drm\n");
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii9=
02x.c
index b70e8c5cf2e1..6ca297d78a26 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -402,7 +402,7 @@ static void sii902x_bridge_mode_set(struct drm_bridge *=
bridge,
 static int sii902x_bridge_attach(struct drm_bridge *bridge)
 {
 	struct sii902x *sii902x =3D bridge_to_sii902x(bridge);
-	struct drm_device *drm =3D bridge->dev;
+	struct drm_device *drm =3D bridge->encoder->dev;
 	int ret;
=20
 	drm_connector_helper_add(&sii902x->connector,
@@ -820,8 +820,8 @@ static irqreturn_t sii902x_interrupt(int irq, void *dat=
a)
=20
 	mutex_unlock(&sii902x->mutex);
=20
-	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.dev)
-		drm_helper_hpd_irq_event(sii902x->bridge.dev);
+	if ((status & SII902X_HOTPLUG_EVENT) && sii902x->bridge.encoder)
+		drm_helper_hpd_irq_event(sii902x->bridge.encoder->dev);
=20
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/br=
idge/synopsys/dw-hdmi.c
index dbe38a54870b..99274ca0fdf6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2346,7 +2346,7 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *b=
ridge)
=20
 	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
=20
-	drm_connector_init_with_ddc(bridge->dev, connector,
+	drm_connector_init_with_ddc(bridge->encoder->dev, connector,
 				    &dw_hdmi_connector_funcs,
 				    DRM_MODE_CONNECTOR_HDMIA,
 				    hdmi->ddc);
@@ -2554,8 +2554,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
 		dev_dbg(hdmi->dev, "EVENT=3D%s\n",
 			phy_int_pol & HDMI_PHY_HPD ? "plugin" : "plugout");
-		if (hdmi->bridge.dev)
-			drm_helper_hpd_irq_event(hdmi->bridge.dev);
+		if (hdmi->bridge.encoder)
+			drm_helper_hpd_irq_event(hdmi->bridge.encoder->dev);
 	}
=20
 	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc3=
58764.c
index 96207fcfde19..e35e17b1f396 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -352,7 +352,7 @@ static void tc358764_enable(struct drm_bridge *bridge)
 static int tc358764_attach(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx =3D bridge_to_tc358764(bridge);
-	struct drm_device *drm =3D bridge->dev;
+	struct drm_device *drm =3D bridge->encoder->dev;
 	int ret;
=20
 	ctx->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
@@ -378,7 +378,7 @@ static int tc358764_attach(struct drm_bridge *bridge)
 static void tc358764_detach(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx =3D bridge_to_tc358764(bridge);
-	struct drm_device *drm =3D bridge->dev;
+	struct drm_device *drm =3D bridge->encoder->dev;
=20
 	drm_connector_unregister(&ctx->connector);
 	drm_fb_helper_remove_one_connector(drm->fb_helper, &ctx->connector);
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc3=
58767.c
index 3709e5ace724..ab1524c00777 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1407,7 +1407,7 @@ static int tc_bridge_attach(struct drm_bridge *bridge=
)
 {
 	u32 bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
 	struct tc_data *tc =3D bridge_to_tc(bridge);
-	struct drm_device *drm =3D bridge->dev;
+	struct drm_device *drm =3D bridge->encoder->dev;
 	int ret;
=20
 	/* Create DP/eDP connector */
@@ -1514,7 +1514,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 		dev_err(tc->dev, "syserr %x\n", stat);
 	}
=20
-	if (tc->hpd_pin >=3D 0 && tc->bridge.dev) {
+	if (tc->hpd_pin >=3D 0 && tc->bridge.encoder) {
 		/*
 		 * H is triggered when the GPIO goes high.
 		 *
@@ -1528,7 +1528,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 			h ? "H" : "", lc ? "LC" : "");
=20
 		if (h || lc)
-			drm_kms_helper_hotplug_event(tc->bridge.dev);
+			drm_kms_helper_hotplug_event(tc->bridge.encoder->dev);
 	}
=20
 	regmap_write(tc->regmap, INTSTS_G, val);
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge=
/ti-sn65dsi86.c
index 9a2dd986afa5..8a4e64cfca1e 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -275,7 +275,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridg=
e)
 						   .node =3D NULL,
 						 };
=20
-	ret =3D drm_connector_init(bridge->dev, &pdata->connector,
+	ret =3D drm_connector_init(bridge->encoder->dev, &pdata->connector,
 				 &ti_sn_bridge_connector_funcs,
 				 DRM_MODE_CONNECTOR_eDP);
 	if (ret) {
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti=
-tfp410.c
index aa3198dc9903..76229367e2f4 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -135,7 +135,7 @@ static int tfp410_attach(struct drm_bridge *bridge)
=20
 	drm_connector_helper_add(&dvi->connector,
 				 &tfp410_con_helper_funcs);
-	ret =3D drm_connector_init_with_ddc(bridge->dev, &dvi->connector,
+	ret =3D drm_connector_init_with_ddc(bridge->encoder->dev, &dvi->connector=
,
 					  &tfp410_con_funcs,
 					  dvi->connector_type,
 					  dvi->ddc);
@@ -179,8 +179,8 @@ static void tfp410_hpd_work_func(struct work_struct *wo=
rk)
=20
 	dvi =3D container_of(work, struct tfp410, hpd_work.work);
=20
-	if (dvi->bridge.dev)
-		drm_helper_hpd_irq_event(dvi->bridge.dev);
+	if (dvi->bridge.encoder)
+		drm_helper_hpd_irq_event(dvi->bridge.encoder->dev);
 }
=20
 static irqreturn_t tfp410_hpd_irq_thread(int irq, void *arg)
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c2cf0c90fa26..258094169706 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -119,13 +119,12 @@ int drm_bridge_attach(struct drm_encoder *encoder, st=
ruct drm_bridge *bridge,
 	if (!encoder || !bridge)
 		return -EINVAL;
=20
-	if (previous && (!previous->dev || previous->encoder !=3D encoder))
+	if (previous && previous->encoder !=3D encoder)
 		return -EINVAL;
=20
-	if (bridge->dev)
+	if (bridge->encoder)
 		return -EBUSY;
=20
-	bridge->dev =3D encoder->dev;
 	bridge->encoder =3D encoder;
=20
 	if (previous)
@@ -137,7 +136,6 @@ int drm_bridge_attach(struct drm_encoder *encoder, stru=
ct drm_bridge *bridge,
 		ret =3D bridge->funcs->attach(bridge);
 		if (ret < 0) {
 			list_del(&bridge->chain_node);
-			bridge->dev =3D NULL;
 			bridge->encoder =3D NULL;
 			return ret;
 		}
@@ -152,14 +150,14 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	if (WARN_ON(!bridge))
 		return;
=20
-	if (WARN_ON(!bridge->dev))
+	if (WARN_ON(!bridge->encoder))
 		return;
=20
 	if (bridge->funcs->detach)
 		bridge->funcs->detach(bridge);
=20
 	list_del(&bridge->chain_node);
-	bridge->dev =3D NULL;
+	bridge->encoder =3D NULL;
 }
=20
 /**
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998=
x_drv.c
index a63790d32d75..17a66ef3dfd4 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1360,7 +1360,7 @@ static int tda998x_bridge_attach(struct drm_bridge *b=
ridge)
 {
 	struct tda998x_priv *priv =3D bridge_to_tda998x_priv(bridge);
=20
-	return tda998x_connector_init(priv, bridge->dev);
+	return tda998x_connector_init(priv, bridge->encoder->dev);
 }
=20
 static void tda998x_bridge_detach(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_ds=
i.c
index 32e94bcb4a69..276a77c020c7 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -989,7 +989,7 @@ static void mcde_dsi_bridge_disable(struct drm_bridge *=
bridge)
 static int mcde_dsi_bridge_attach(struct drm_bridge *bridge)
 {
 	struct mcde_dsi *d =3D bridge_to_mcde_dsi(bridge);
-	struct drm_device *drm =3D bridge->dev;
+	struct drm_device *drm =3D bridge->encoder->dev;
 	int ret;
=20
 	if (!drm_core_check_feature(drm, DRIVER_ATOMIC)) {
diff --git a/drivers/gpu/drm/msm/edp/edp_bridge.c b/drivers/gpu/drm/msm/edp=
/edp_bridge.c
index b65b5cc2dba2..301dd7a80bde 100644
--- a/drivers/gpu/drm/msm/edp/edp_bridge.c
+++ b/drivers/gpu/drm/msm/edp/edp_bridge.c
@@ -47,7 +47,7 @@ static void edp_bridge_mode_set(struct drm_bridge *bridge=
,
 		const struct drm_display_mode *mode,
 		const struct drm_display_mode *adjusted_mode)
 {
-	struct drm_device *dev =3D bridge->dev;
+	struct drm_device *dev =3D bridge->encoder->dev;
 	struct drm_connector *connector;
 	struct edp_bridge *edp_bridge =3D to_edp_bridge(bridge);
 	struct msm_edp *edp =3D edp_bridge->edp;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/h=
dmi/hdmi_bridge.c
index ba81338a9bf8..07c098dce310 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -20,7 +20,7 @@ void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
=20
 static void msm_hdmi_power_on(struct drm_bridge *bridge)
 {
-	struct drm_device *dev =3D bridge->dev;
+	struct drm_device *dev =3D bridge->encoder->dev;
 	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);
 	struct hdmi *hdmi =3D hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config =3D hdmi->config;
@@ -56,7 +56,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
=20
 static void power_off(struct drm_bridge *bridge)
 {
-	struct drm_device *dev =3D bridge->dev;
+	struct drm_device *dev =3D bridge->encoder->dev;
 	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);
 	struct hdmi *hdmi =3D hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config =3D hdmi->config;
diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/=
rcar_lvds.c
index 2cf44b91853c..83538125a722 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -622,7 +622,8 @@ static int rcar_lvds_attach(struct drm_bridge *bridge)
 	if (!lvds->panel)
 		return 0;
=20
-	ret =3D drm_connector_init(bridge->dev, connector, &rcar_lvds_conn_funcs,
+	ret =3D drm_connector_init(bridge->encoder->dev, connector,
+				 &rcar_lvds_conn_funcs,
 				 DRM_MODE_CONNECTOR_LVDS);
 	if (ret < 0)
 		return ret;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 694e153a7531..695d0898df38 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -380,8 +380,6 @@ struct drm_bridge_timings {
  * struct drm_bridge - central DRM bridge control structure
  */
 struct drm_bridge {
-	/** @dev: DRM device this bridge belongs to */
-	struct drm_device *dev;
 	/** @encoder: encoder to which this bridge is connected */
 	struct drm_encoder *encoder;
 	/** @chain_node: used to form a bridge chain */
--=20
2.24.0

