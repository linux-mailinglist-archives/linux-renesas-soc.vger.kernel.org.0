Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E894612A3A5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Dec 2019 18:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbfLXRgy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Dec 2019 12:36:54 -0500
Received: from mail-eopbgr40063.outbound.protection.outlook.com ([40.107.4.63]:22947
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726203AbfLXRgy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Dec 2019 12:36:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWvJevW4xRToyZQGigK+R8NypYOG19jLBIcxe/VCxDY=;
 b=2BEAS5H5+Ej5RjwcSYQYnNdfCouOCVr6PZkZ8OWtBfl/7GePPdkAkU8trQIkAqI3f8y8lIDQlP0N9CqATf+wkxfDWjPos6FX+zZ6bhgnnVy4OQS/nXzs/LCffER4U39ROeFBIjykGUsephUyfBK3ySegsc/qxiHONyd7ayvzb50=
Received: from VI1PR08CA0130.eurprd08.prod.outlook.com (2603:10a6:800:d4::32)
 by AM6PR08MB3205.eurprd08.prod.outlook.com (2603:10a6:209:4a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14; Tue, 24 Dec
 2019 17:36:45 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by VI1PR08CA0130.outlook.office365.com
 (2603:10a6:800:d4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via Frontend
 Transport; Tue, 24 Dec 2019 17:36:45 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14 via Frontend Transport; Tue, 24 Dec 2019 17:36:44 +0000
Received: ("Tessian outbound e09e55c05044:v40"); Tue, 24 Dec 2019 17:36:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e233a8ff672766e4
X-CR-MTA-TID: 64aa7808
Received: from df58a739e11a.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 304581A2-2F56-4A1F-84E8-EAF1F21F7C60.1;
        Tue, 24 Dec 2019 17:34:21 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df58a739e11a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Dec 2019 17:34:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8VA9gifruGxHBkDiKih9yj2ORXS5HorrYfs/nA61CHix36rT5XIWT4vlx/PvqShBt4q9Le1mIp7e/Wx3VvfnZd/b2wqUQfVg379fmcOV0T4v7Jr4yZgPu9dIje2hzBjvcionh35OwX0XbqKeZyqcsGSP/GSL3dFPG2hn7OW13QxJErIfHdz+RkUyjLR0Ay0STIOxoeK8tqOsrIKOjpE4LKq8NGcTjIz3Pz8ucmN6dZTV0RLyZL5jmt7+p7QIl0YLTQZT+0uqo3KDWnCWPfOQ+d9wzjlSaZNmw/Tm1gjb3fLWpbV/pZ6Mf04AMUt1acUeEaXqNcNCQzX1xg+9uddGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWvJevW4xRToyZQGigK+R8NypYOG19jLBIcxe/VCxDY=;
 b=CZOFSxCdOaBG57IQ1ITwIFNSUru1dZHr54t7ShRsdQVlQ6q0pZTmKMlsKaTx+3cTX5svtWsA2FRI/f4kjR6PRgPOoYAqg513TS9qlqDml3WJiKjoakunBX593Cjr3BXzYTeUDFMLSLAqdH4DfvFPQ71CEhgGvvV4gbtWCz9qDmV6JalB2mC3YXAWsShDkTSNapHJt9eBCxiF6CWNCZGiA4Kyte8GkFZJbSjrBPLVhwnS1CLHZLgXGozixDYviXWlDPnmz8r7KX16zGtFadR6R1nCh6IArjeCzJE1upaznQlQYFfCb733S5RfcA1Hi6rncIdATAh2kEvfHOBrWdPtnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWvJevW4xRToyZQGigK+R8NypYOG19jLBIcxe/VCxDY=;
 b=2BEAS5H5+Ej5RjwcSYQYnNdfCouOCVr6PZkZ8OWtBfl/7GePPdkAkU8trQIkAqI3f8y8lIDQlP0N9CqATf+wkxfDWjPos6FX+zZ6bhgnnVy4OQS/nXzs/LCffER4U39ROeFBIjykGUsephUyfBK3ySegsc/qxiHONyd7ayvzb50=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB2702.eurprd08.prod.outlook.com (10.170.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 17:34:18 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 17:34:18 +0000
From:   Mihail Atanassov <Mihail.Atanassov@arm.com>
To:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC:     Mihail Atanassov <Mihail.Atanassov@arm.com>, nd <nd@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Martyn Welch <martyn.welch@collabora.co.uk>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Vincent Abriou <vincent.abriou@st.com>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Subject: [PATCH v3 00/35] drm/bridge: Consolidate initialization
Thread-Topic: [PATCH v3 00/35] drm/bridge: Consolidate initialization
Thread-Index: AQHVuoBd9M/nIZUWsU+Eo17ASMPFrw==
Date:   Tue, 24 Dec 2019 17:34:17 +0000
Message-ID: <20191224173408.25624-1-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2176afa3-2a4b-4781-6cb7-08d78897d886
X-MS-TrafficTypeDiagnostic: VI1PR08MB2702:|VI1PR08MB2702:|AM6PR08MB3205:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3205AFEE4F61C36D088464C68F290@AM6PR08MB3205.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:182;OLM:182;
x-forefront-prvs: 0261CCEEDF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(53754006)(189003)(199004)(81156014)(8676002)(478600001)(36756003)(4326008)(8936002)(66446008)(64756008)(66946007)(66476007)(66556008)(26005)(7416002)(186003)(44832011)(6506007)(7406005)(2616005)(81166006)(71200400001)(316002)(2906002)(1076003)(6512007)(54906003)(6916009)(6486002)(86362001)(5660300002)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB2702;H:VI1PR08MB4078.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Gb7NFTsHGBhDbgR2I/htyd9tebpsIWIpCB+qvmXhXnJ+Du19QU6xOKxhhbbaNYB94gaPiVr0IF9b+K3eDqkUel9rn3qviyF4VDitMqtMM/9+w4FXGm2GFbWzwPyKaJ6h2RyTHglI97QA650colcRFnLiAe4UHEM30RWRVm5QERysHbtuDqPntsZ7XizkECBI66DX3SPYs2kbEVCHvJdR7XjpQbO5kbTFzii5jkUsxA18mQTqYed9noqJbfIlXBzCIRXv75G6eJ8YFFRicytpd8K7r0200q7Cmj5bXAS7NcKjo5P9757jaqz3EfWFECzdL/xs6N/9ARblVInHajEnmrMpeB3STmsct1ULKKOh1Azz15MxRu7CxDZe+1NarVXimtTBmOSbrFaksF9Q8G33TeNrWo4LJeEq6ZnRhDNZti52A8+Xf+snmOzd+3NEezm4+zF6FOAMeh4nLkBvQZzhx4muN/DR4BBxazWT2916gXeg7w5g9C6U2gcL0AcfDeGM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2702
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(53754006)(189003)(199004)(81156014)(8676002)(356004)(26826003)(70206006)(186003)(26005)(478600001)(336012)(2616005)(8936002)(4326008)(36756003)(450100002)(6506007)(81166006)(6862004)(2906002)(1076003)(6512007)(54906003)(5660300002)(70586007)(36906005)(6486002)(316002)(86362001)(76130400001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR08MB3205;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: d70dcff6-a071-4c2b-18fa-08d788978063
NoDisclaimer: True
X-Forefront-PRVS: 0261CCEEDF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6UMsMeAP+mJLEVU3qFLzFdc2iQLsAKNO+ihLN+AHHlJ1EGyqxiu7mjlVKBdpOWEkcGQGL/aXiw0ERdn6xvGq7CFIbPmvKLMqnbPCWYIqHDy6ntdu08mUI6gNrWYZHGFHuxxjILWl7TSmYHzXxpCjYiZSjED8VbBZuPcVanmUvNd5XulNslbyGWKm+aeUca3GZCOcfOPsrYEhKEZEcBFzwYr+JhEkzKhCMO0wf/kBWz9UExeftGMzr1aDVaHws06pgxcB8jemCm1xYRBwFCcnIqZ4j2AD3T7EMgSTpg83jDvu7JhyPKfS3ghcte53IYpJzFYjCJf+Xwm6BturUKZsJ3F6sBYVFPW0Z67XlppgnZmkhw/Zwit1LI3W6ZGDO8zZbOCMMShN6qCz41yOZt/qRo5eAD3mEJ9P1uRmhP52UAjBFZrvWiL/uMkrisSid4nLRFLJDp//JW3ZWUP1bIWydSmCoU96aQ1C6+EW8Ty+Tue9IQS1ONXGm54YRYqBgcxc
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2019 17:36:44.9081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2176afa3-2a4b-4781-6cb7-08d78897d886
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3205
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi all,

Version 3 of my drm_bridge_init() series here. The biggest change from
the previous version is the removal of drm_bridge->dev (1/35) and the
removal of ->driver_private (2-7/35). The rest of the patches are mostly
the same, save for dropping the driver_private argument from
drm_bridge_init().

v3:
 - remove drm_bridge->dev (Thomas)
 - convert ->driver_private users to container_of() (Laurent)
 - remove drm_bridge->driver_private (Laurent)
 - remove driver_private argument from drm_bridge_init() (Laurent)
 - clean up the wording on some comments (Laurent)
 - pass the correct struct device to drm_bridge_init in analogix
   (Laurent)
 - I've kept the rcar-du patches separate but changed their order; this
   should make it easier to take only one part of the series if needed

v2:
 - expanded commit messages and added some extra bridge-related
   documentation (Daniel)
 - dropped v1 patches 29 and 30: 29 needs more work, and 30 depends on
   it
 - added all remaining drm_bridge implementers, found by searching for
   drm_bridge_funcs which is mandatory for any bridge; new uses in
   patches 3, 27, and 28 (Sam)
 - due to the above, I've decided to squash all analogix changes into
   one patch

Mihail Atanassov (35):
  drm: Remove drm_bridge->dev
  drm/bridge: analogix_dp: Stop using drm_bridge->driver_private
  drm/bridge/synopsys: Stop using drm_bridge->driver_private
  drm/bridge: thc63lvd1024: Don't set drm_bridge->driver_private
  drm/exynos: mic: Stop using drm_bridge->driver_private
  drm: rcar-du: lvds: Don't set drm_bridge->driver_private
  drm/sti: Stop using drm_bridge->driver_private
  drm: Remove drm_bridge->driver_private
  drm: Introduce drm_bridge_init()
  drm/bridge: adv7511: Use drm_bridge_init()
  drm/bridge/analogix: Use drm_bridge_init()
  drm/bridge: cdns: Use drm_bridge_init()
  drm/bridge: dumb-vga-dac: Use drm_bridge_init()
  drm/bridge: lvds-codec: Use drm_bridge_init()
  drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Use drm_bridge_init()
  drm/bridge: nxp-ptn3460: Use drm_bridge_init()
  drm/bridge: panel: Use drm_bridge_init()
  drm/bridge: ps8622: Use drm_bridge_init()
  drm/bridge: sii902x: Use drm_bridge_init()
  drm/bridge: sii9234: Use drm_bridge_init()
  drm/bridge: sil_sii8620: Use drm_bridge_init()
  drm/bridge: dw-hdmi: Use drm_bridge_init()
  drm/bridge/synopsys: dsi: Use drm_bridge_init()
  drm/bridge: tc358764: Use drm_bridge_init()
  drm/bridge: tc358767: Use drm_bridge_init()
  drm/bridge: thc63: Use drm_bridge_init()
  drm/bridge: ti-sn65dsi86: Use drm_bridge_init()
  drm/bridge: ti-tfp410: Use drm_bridge_init()
  drm/exynos: mic: Use drm_bridge_init()
  drm/i2c: tda998x: Use drm_bridge_init()
  drm/mcde: dsi: Use drm_bridge_init()
  drm/mediatek: hdmi: Use drm_bridge_init()
  drm: rcar-du: lvds: Use drm_bridge_init()
  drm/sti: Use drm_bridge_init()
  drm/msm: Use drm_bridge_init()

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |  6 +--
 .../drm/bridge/analogix/analogix-anx6345.c    |  7 ++--
 .../drm/bridge/analogix/analogix-anx78xx.c    | 10 ++---
 .../drm/bridge/analogix/analogix_dp_core.c    | 42 +++++++------------
 .../drm/bridge/analogix/analogix_dp_core.h    |  8 +++-
 drivers/gpu/drm/bridge/cdns-dsi.c             |  6 +--
 drivers/gpu/drm/bridge/dumb-vga-dac.c         |  8 ++--
 drivers/gpu/drm/bridge/lvds-codec.c           |  8 ++--
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  6 +--
 drivers/gpu/drm/bridge/nxp-ptn3460.c          |  5 +--
 drivers/gpu/drm/bridge/panel.c                |  9 ++--
 drivers/gpu/drm/bridge/parade-ps8622.c        |  5 +--
 drivers/gpu/drm/bridge/sii902x.c              | 11 +++--
 drivers/gpu/drm/bridge/sii9234.c              |  3 +-
 drivers/gpu/drm/bridge/sil-sii8620.c          |  3 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 26 ++++++------
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  7 +---
 drivers/gpu/drm/bridge/tc358764.c             |  8 ++--
 drivers/gpu/drm/bridge/tc358767.c             |  9 ++--
 drivers/gpu/drm/bridge/thc63lvd1024.c         |  7 +---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  7 ++--
 drivers/gpu/drm/bridge/ti-tfp410.c            | 10 ++---
 drivers/gpu/drm/drm_bridge.c                  | 40 +++++++++++++++---
 drivers/gpu/drm/exynos/exynos_drm_mic.c       | 16 +++----
 drivers/gpu/drm/i2c/tda998x_drv.c             |  8 +---
 drivers/gpu/drm/mcde/mcde_dsi.c               |  5 +--
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  4 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c         |  3 +-
 drivers/gpu/drm/msm/edp/edp_bridge.c          |  5 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        |  7 ++--
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |  7 ++--
 drivers/gpu/drm/sti/sti_dvo.c                 | 23 ++++------
 drivers/gpu/drm/sti/sti_hda.c                 | 19 ++++-----
 drivers/gpu/drm/sti/sti_hdmi.c                | 15 +++----
 drivers/gpu/drm/sti/sti_hdmi.h                |  5 +++
 include/drm/drm_bridge.h                      | 16 +++++--
 36 files changed, 181 insertions(+), 203 deletions(-)

--=20
2.24.0

