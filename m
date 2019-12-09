Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16B36116BD6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 12:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbfLILI6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 06:08:58 -0500
Received: from mail-eopbgr70085.outbound.protection.outlook.com ([40.107.7.85]:58946
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727628AbfLILI5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 06:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KObIKmOul30/wdgaaLfLddlLWgevjRSvoR4urKSF5Oo=;
 b=o0V5fQ8lmIL/mzjEJUsMLuJjrhwzVtVo40UUC+jM7S7t99vndJV1lXkNuNrmc38+1kSHMfgCzc66BaddmROQHkt+m5L/TBRIcirndXg7FiQOllbuy5Q3N4KfjvIuMJwzbIQRkwvFrd2EPUYAD4ej8gm/mEQbND+YASdAxjKHfYQ=
Received: from HE1PR08CA0062.eurprd08.prod.outlook.com (2603:10a6:7:2a::33) by
 VI1PR0801MB2064.eurprd08.prod.outlook.com (2603:10a6:800:8b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.16; Mon, 9 Dec
 2019 11:08:48 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::201) by HE1PR08CA0062.outlook.office365.com
 (2603:10a6:7:2a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Mon, 9 Dec 2019 11:08:48 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Mon, 9 Dec 2019 11:08:47 +0000
Received: ("Tessian outbound 5574dd7ffaa4:v37"); Mon, 09 Dec 2019 11:08:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce6e759f3d951b5c
X-CR-MTA-TID: 64aa7808
Received: from 99659ef87d22.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 69F66424-0E93-4006-9F26-971950A802A7.1;
        Mon, 09 Dec 2019 11:08:40 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 99659ef87d22.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 09 Dec 2019 11:08:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLU/lG0C4SveixcWptv+ykkBp2GEJiov9kF6HBmAdPVvGqRGdMZlfVuqDV8tkblwulrBcDfQl1cxTuZf3qfQClKodr3eFdomFtOJP1QHia7AeLV9XddLIEB2gVm55JGH/3fnqrHWy//GMGi6vNnFLyt6AeKcOqrqUhLB/u/cB+CUtcxgef/i78Dnf0Ney3d/9aqAnPEB6Cs0hSAU7HFYkyEOZQ0yGMBoS42fP1qkiaNw/tcAD/YY2IgobwxtyKLwAyr5bb451A1S/MZ4NSlBiZdx6w7WROWeCuWCgM6JACylgutVEBuEC5UIV4wDPRJUb+9WxVHdEH90/ATKguMMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KObIKmOul30/wdgaaLfLddlLWgevjRSvoR4urKSF5Oo=;
 b=XCVmCakkxuXWD/2cWb2KCNDdwVvO2OySLKXui05uzSFL8DvYL5/RDUHoArxQh00I1UKQfjEG682dc+GfrVaIvtf44h5hlhTjinfOZH9FGB8Olwfo1g9J6J3k7Wsj1FjZ9I/UJxGUiYNSJaUyCc0fg/ndQVQMPmxqBW9j8dZjVz3QL0/5GgJlG7FPMGhpgdYY1xdTr8uF8PdcHt7cFxHJ85MY7CtGfx3OU4S4n5XqQDz87/Ej8/oJsLXLbxnGMKoonepUOTmhpOvBq7nE0Skc/NawjXCpeRkvIRKz9NpbvwbYeD7B3n3dm5FRFS3UMRPvD/1FNvQzCXkKeaC1k0ZnIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KObIKmOul30/wdgaaLfLddlLWgevjRSvoR4urKSF5Oo=;
 b=o0V5fQ8lmIL/mzjEJUsMLuJjrhwzVtVo40UUC+jM7S7t99vndJV1lXkNuNrmc38+1kSHMfgCzc66BaddmROQHkt+m5L/TBRIcirndXg7FiQOllbuy5Q3N4KfjvIuMJwzbIQRkwvFrd2EPUYAD4ej8gm/mEQbND+YASdAxjKHfYQ=
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4206.eurprd08.prod.outlook.com (20.178.204.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Mon, 9 Dec 2019 11:08:36 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::3d0a:7cde:7f1f:fe7c%7]) with mapi id 15.20.2516.018; Mon, 9 Dec 2019
 11:08:35 +0000
From:   Mihail Atanassov <Mihail.Atanassov@arm.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC:     Martyn Welch <martyn.welch@collabora.co.uk>,
        David Airlie <airlied@linux.ie>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Martin Donnelly <martin.donnelly@ge.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Kukjin Kim <kgene@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Jonas Karlman <jonas@kwiboo.se>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>, nd <nd@arm.com>,
        Sean Paul <sean@poorly.run>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Douglas Anderson <dianders@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?iso-8859-1?Q?Yannick_Fertr=E9?= <yannick.fertre@st.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Torsten Duwe <duwe@lst.de>,
        Dariusz Marcinkiewicz <darekm@google.com>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v2 00/28] drm/bridge: Consolidate initialization
Thread-Topic: [PATCH v2 00/28] drm/bridge: Consolidate initialization
Thread-Index: AQHVqpiuNcYsgGgOskGx3fwlqVtM9aexpJKAgAAIAIA=
Date:   Mon, 9 Dec 2019 11:08:35 +0000
Message-ID: <2634531.l7d0rgvqDW@e123338-lin>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <2989c044-8134-bb7c-a7e0-c518334bf4a6@baylibre.com>
In-Reply-To: <2989c044-8134-bb7c-a7e0-c518334bf4a6@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P123CA0044.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::32)
 To VI1PR08MB4078.eurprd08.prod.outlook.com (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f340e284-a6f6-46c3-e0bc-08d77c982a1c
X-MS-TrafficTypeDiagnostic: VI1PR08MB4206:|VI1PR0801MB2064:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB206466774686C9C8BE69B9068F580@VI1PR0801MB2064.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:298;OLM:298;
x-forefront-prvs: 02462830BE
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(51914003)(199004)(189003)(53754006)(7416002)(229853002)(6512007)(2906002)(186003)(5660300002)(7406005)(966005)(8936002)(71190400001)(52116002)(9686003)(8676002)(6486002)(66556008)(53546011)(316002)(305945005)(71200400001)(6506007)(33716001)(66476007)(81166006)(81156014)(54906003)(64756008)(4326008)(86362001)(110136005)(66946007)(478600001)(26005)(66446008)(39026012);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB4206;H:VI1PR08MB4078.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 8z/I4+ZeXMvRgLBU8q8Do1Fop3db4YUeAUvfDy5fw+fv7moLU4/xWtv9ZHAFvBAIpMb/GNuQBBUtsXO6o4muxdwHtH/W7TvRVsmSgIOtTxndPkGc1awIe4I88H3qkEjM/CJgKNtDLzR8iQj6R4I+c5VHhIn/Z4GoPF3DmfR43CcQC5BmW1zW4cJSUJQNV7OedCmjfB2j6eHZNxluaYJY0vQuy2Wjvs3a8MyBIHBLvJjj8RM+naSwsIDSKsQ+CCOWHXJcOGk4heZmLbL95z/0URrdXoZ402QeXIdZCcmksocrOg3w9qKgFh35+GhKTLS1BFf2qQpn+S7BUJfHsYsNHZO1UKtd8dgT0xAc08gWeTlayKXmf/XkPQtRpVibWnx760BTdhe3L0XBlGIC/BHPC1M6zbkoI2xDYx1tUAJQPsURv7WiB/Ir9s3XmKIMjdL9N/1ExRC/7HtMo/CRp0UR85mb1OHSItjnmw3i5aGRU1gMpHOTy9xOevMp+9zw3HgrfdNheZIKNVctKkSgQ1uAwxtBIEmOpFhOxYSpkPGgCUuUaVF/jhWErL8x1UlFjLVjq9/Vys8/86s1zeVwAQBhvA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <6DE8CEF268029D48A1091A9874B0AA3F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4206
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(7916004)(396003)(136003)(346002)(376002)(39860400002)(189003)(51914003)(199004)(53754006)(186003)(53546011)(356004)(5660300002)(26005)(305945005)(316002)(6506007)(36906005)(54906003)(76130400001)(110136005)(70586007)(70206006)(86362001)(336012)(450100002)(9686003)(966005)(6512007)(478600001)(2906002)(6486002)(26826003)(229853002)(8936002)(4326008)(81166006)(8676002)(81156014)(33716001)(107886003)(39026012);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0801MB2064;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: bb56fc6b-b4c8-4697-d8a5-08d77c9822af
NoDisclaimer: True
X-Forefront-PRVS: 02462830BE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xXJ+FUGve9YV4yCAWbre50Wa7AaFBhp5x0T/VrGB0twwRzs+iYe37O2FJB080YifseF1shqJIqXIbD6mWld9yMx451B5Yd1Srch959F+k3z0EshC0+vlwlaY62okmyFRPZ2qac2P+OXim9erk1+3GMmbQnUZ4butNbg8/vhpiu4nzna1FMLtErricSNw+QsPTzgwfoeAwCxTNvKH8PhxjjOymMj0bYJYDqpmTBVyvge2jrowwLW+/tMg2Po2C9gu/AKUHdbrbALNHX/neSyrx2fdcdMcF2Z6be9Cr93G11Yly3zHzxV9A0YlJ/uGv0FRr3dy0pS6UkgHGGeskyYl9gLW2xpoicI3Co+BIMRsKB+wkZjH2TatMHJuNtwfSMTA769jWEMtrYMoQIwRGjsJJYgFwXAP6TfAXuCs/iJRrSnpFKxFRa0jgyOCRugWPWTz+DusxTA4Dv2j4L74/8m1JpeNxTA3r2yZVBi7TdBOHsju68PWI+/F933LZacP/xDUDYlfYsxAIUCatko2Ds/4AICnQmrV3d7v58hHuZ6Ebb9nCgHnYwqH0kLtY/ZW0PaEmT46VYl7gyMXHGK0tP1wHg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2019 11:08:47.7381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f340e284-a6f6-46c3-e0bc-08d77c982a1c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2064
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Monday, 9 December 2019 10:39:07 GMT Neil Armstrong wrote:
> Hi Mihail,

Hi Neil,

>=20
> On 04/12/2019 12:48, Mihail Atanassov wrote:
> > Hi all,
> >=20
> > I've dropped the fun parts of this series since they need more work, bu=
t
> > figured drm_bridge_init() as a concept is still valuable on its own (an=
d
> > I think I'll need it to roll out device links for registered bridges),
> > so here goes.
> >=20
> > v2:
> >  - expanded commit messages and added some extra bridge-related
> >    documentation (Daniel)
> >  - dropped v1 patches 29 and 30: 29 needs more work, and 30 depends on
> >    it
> >  - added all remaining drm_bridge implementers, found by searching for
> >    drm_bridge_funcs which is mandatory for any bridge; new uses in
> >    patches 3, 27, and 28 (Sam)
> >  - due to the above, I've decided to squash all analogix changes into
> >    one patch
> >=20
> > ---
> > v1 [https://patchwork.freedesktop.org/series/70039/] cover text below:
> >=20
> > This series adds device links support to drm_bridge. The motivation
> > behind it is that a drm_bridge in a module could get removed under the
> > feet of the bridge user without warning, so we need a way to remove and
> > reprobe the client as needed to avoid peering into the void.
> >=20
> > 1: Add a drm_bridge_init() function which wraps all initialisation of
> > the structure prior to calling drm_bridge_add().
> >=20
> > 2-26,28: Apply the drm_bridge_init() refactor to every bridge that uses
> > drm_bridge_add().
> >=20
> > 27: Minor cleanup in rcar-du.
> >=20
> > 29: Add of_drm_find_bridge_devlink() which functions the same as
> > of_drm_find_bridge() plus adds a device device link from the owning
> > drm_device to the bridge device.
> >=20
> > 30: As a motivating example, convert komeda to exclusively use
> > drm_bridge for its pipe outputs; this isn't a regression in usability
> > any more since device links bring the same automatic remove/reprobe
> > feature as components.
> >=20
> > Mihail Atanassov (28):
> >   drm: Introduce drm_bridge_init()
> >   drm/bridge: adv7511: Use drm_bridge_init()
> >   drm/bridge/analogix: Use drm_bridge_init()
> >   drm/bridge: cdns: Use drm_bridge_init()
> >   drm/bridge: dumb-vga-dac: Use drm_bridge_init()
> >   drm/bridge: lvds-encoder: Use drm_bridge_init()
> >   drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Use drm_bridge_init()
> >   drm/bridge: nxp-ptn3460: Use drm_bridge_init()
> >   drm/bridge: panel: Use drm_bridge_init()
> >   drm/bridge: ps8622: Use drm_bridge_init()
> >   drm/bridge: sii902x: Use drm_bridge_init()
> >   gpu: drm: bridge: sii9234: Use drm_bridge_init()
> >   drm/bridge: sil_sii8620: Use drm_bridge_init()
> >   drm/bridge: dw-hdmi: Use drm_bridge_init()
> >   drm/bridge/synopsys: dsi: Use drm_bridge_init()
> >   drm/bridge: tc358764: Use drm_bridge_init()
> >   drm/bridge: tc358767: Use drm_bridge_init()
> >   drm/bridge: thc63: Use drm_bridge_init()
> >   drm/bridge: ti-sn65dsi86: Use drm_bridge_init()
> >   drm/bridge: ti-tfp410: Use drm_bridge_init()
> >   drm/exynos: mic: Use drm_bridge_init()
> >   drm/i2c: tda998x: Use drm_bridge_init()
> >   drm/mcde: dsi: Use drm_bridge_init()
> >   drm/mediatek: hdmi: Use drm_bridge_init()
> >   drm: rcar-du: lvds: Use drm_bridge_init()
> >   drm: rcar-du: lvds: Don't set drm_bridge private pointer
> >   drm/sti: Use drm_bridge_init()
> >   drm/msm: Use drm_bridge_init()
> >=20
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |  5 ++-
> >  .../drm/bridge/analogix/analogix-anx6345.c    |  5 ++-
> >  .../drm/bridge/analogix/analogix-anx78xx.c    |  8 ++---
> >  .../drm/bridge/analogix/analogix_dp_core.c    |  5 ++-
> >  drivers/gpu/drm/bridge/cdns-dsi.c             |  4 +--
> >  drivers/gpu/drm/bridge/dumb-vga-dac.c         |  6 ++--
> >  drivers/gpu/drm/bridge/lvds-encoder.c         |  7 ++--
> >  .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  4 +--
> >  drivers/gpu/drm/bridge/nxp-ptn3460.c          |  4 +--
> >  drivers/gpu/drm/bridge/panel.c                |  7 ++--
> >  drivers/gpu/drm/bridge/parade-ps8622.c        |  3 +-
> >  drivers/gpu/drm/bridge/sii902x.c              |  5 ++-
> >  drivers/gpu/drm/bridge/sii9234.c              |  3 +-
> >  drivers/gpu/drm/bridge/sil-sii8620.c          |  3 +-
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  7 ++--
> >  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  7 ++--
> >  drivers/gpu/drm/bridge/tc358764.c             |  4 +--
> >  drivers/gpu/drm/bridge/tc358767.c             |  3 +-
> >  drivers/gpu/drm/bridge/thc63lvd1024.c         |  7 ++--
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  5 ++-
> >  drivers/gpu/drm/bridge/ti-tfp410.c            |  5 ++-
> >  drivers/gpu/drm/drm_bridge.c                  | 34 ++++++++++++++++++-
> >  drivers/gpu/drm/exynos/exynos_drm_mic.c       |  8 +----
> >  drivers/gpu/drm/i2c/tda998x_drv.c             |  6 +---
> >  drivers/gpu/drm/mcde/mcde_dsi.c               |  3 +-
> >  drivers/gpu/drm/mediatek/mtk_hdmi.c           |  4 +--
> >  drivers/gpu/drm/msm/dsi/dsi_manager.c         |  4 +--
> >  drivers/gpu/drm/msm/edp/edp_bridge.c          |  3 +-
> >  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        |  4 +--
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  5 ++-
> >  drivers/gpu/drm/sti/sti_dvo.c                 |  4 +--
> >  drivers/gpu/drm/sti/sti_hda.c                 |  3 +-
> >  drivers/gpu/drm/sti/sti_hdmi.c                |  3 +-
> >  include/drm/drm_bridge.h                      | 15 +++++++-
> >  34 files changed, 100 insertions(+), 103 deletions(-)
> >=20
>=20
> Can you check it doesn't collides with Boris 1-7 of "drm: Add support for=
 bus-format negotiation" patches he just pushed on drm-misc-next ?

Thanks for the heads-up. There's no technical conflict but the build fails.
I'll fix it for v3 after I get the de-midlayering of drm_bridge done
(see https://patchwork.freedesktop.org/patch/343643/?series=3D70432&rev=3D1=
 for
context) and the s/bridge->dev/bridge->drm/ patch merged
(https://patchwork.freedesktop.org/patch/343824/).

>=20
> Neil
>=20

--=20
Mihail



