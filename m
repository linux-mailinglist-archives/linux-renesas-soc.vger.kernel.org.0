Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602D93DFE23
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Aug 2021 11:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237071AbhHDJi7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Aug 2021 05:38:59 -0400
Received: from mail-eopbgr1400134.outbound.protection.outlook.com ([40.107.140.134]:62677
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237105AbhHDJi6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 05:38:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/zv1EHH8y9iixIEj2fnu3eJlcuPkyTHefwe3zXYZJGFiggobEly99gnWvirhucbJQUPW2lJ+2E1fwHqZuVGQKKBJw8mfFa0bYxbQVd0w/rkROuRC7+uiehXPNKvGJOic6c+VdcRcgVwXDhM7PvKCWmWeZF1iS+2Mr68a63FYafh90LiBt3SnLcU49OwSuTOXXacB8SCG8UbqC+QOImRM7/IWBRcPpBJzwOJpEDYwjuQQ9ppCBbp4kamufjMWgEYvfC1ONeCvFf3ThOJZQyHayYACBO2RHUtYI8NV1TSwEZ+PeLNvuDo8AXlLDv5Chw/nfjx+LosMZ953Vaq8Pdisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+2YhiC06eC4D47esESXueLxWS2tEUgH5rgow4aJSA8=;
 b=HTwx25q10m8mO/h2PyH67o9DkM+60RTFDRzgzMQxugHTZPhhpO3NV0toDCV+55Tv2w/nldhvKj2Xa/hQWWYsQx6ppBulRpkor8ZlhY2vRH7XYpTB8kBJyVLYrNpw+dsofAmj4o+JYnHBdNDeVs1Kj7jz4uuLn4mCuuHmlTQbQ38f5pCEhC/DHzOyH2lSQHx7xLuxUp2RI7PTQFsFEew6emi1wsCdY26mGmcPtAxEjYSrCK0L9jQyjtDECdt6vLxVAnqv72AWeHKkeJ1a293a+cLOpWpBEWOO+MnRZwle2yoWkMZGgW0pyvUzSE1rRuvpIslTZDLD0+T+3PIIt8xGgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+2YhiC06eC4D47esESXueLxWS2tEUgH5rgow4aJSA8=;
 b=Ih6A7DIcnKxz6h/6Wk1Lxb51Pcmek9BkzKfrXKA0lkI2oUXedBrNslmAQvs0oI/JFH+p8x7l4wVApDVEnJqttTFBKe1kej6xRo7BrsDnFRNbjiL7GSkRo3+zPnqWLoQmfMEb322ap1EyCgGzZBussFNJi9Yxn/qRHUD2Nv/3agw=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1552.jpnprd01.prod.outlook.com (2603:1096:403:11::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Wed, 4 Aug
 2021 09:38:44 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6%3]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 09:38:44 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 3/6] phy: renesas: phy-rcar-gen3-usb2: Add USB2.0 PHY
 support for RZ/G2L
Thread-Topic: [PATCH v5 3/6] phy: renesas: phy-rcar-gen3-usb2: Add USB2.0 PHY
 support for RZ/G2L
Thread-Index: AQHXgxkDxcyB6cHQJ0GYIQsZa5qp7atjIlbA
Date:   Wed, 4 Aug 2021 09:38:44 +0000
Message-ID: <TY2PR01MB3692C209506A5FB1465EF7E3D8F19@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210727185527.19907-1-biju.das.jz@bp.renesas.com>
 <20210727185527.19907-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210727185527.19907-4-biju.das.jz@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b66e655b-6089-49a3-5fe6-08d9572ba6de
x-ms-traffictypediagnostic: TYXPR01MB1552:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYXPR01MB1552982344DBD9DDD5FAEC72D8F19@TYXPR01MB1552.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cmjI807z8N57RlfSMJTXRbekR8XXMWa6WJ/2YMtfkvv+VgNUCUSfJs5oS2indU7XwXIh64KB74gWEmfnsOeQtuBlHiZAlh7cwRBSN63CKrx2NMMDvIzYndmMRfXwUqx/gC4APVOODJuuu5rwQSMNqFPE+kF1tWbggFWJIFn5OENfKBHXN0izLce1Jy5bcofIfFV9lsTIXJs4C/fI2lchStZPM3DPfr0NUoG9OP2xmy8L9Z6kD9tSykm6/52f0/mkCX/FtJBslKKmspPx70kKOb28NLK7nBCIOnSXTkKUhwVvHbt/ndN69HLcvIISVeW5cKin/5WImEeD8IUP7cRLFG/o/msbGNiLeEVhCuIIxptzBX+SmSTbc+l8nnISpnaNZCs44rteH9n4qbIKmQTJtmmdLjAYChDl7/BEbCGyy8nDOaoLiqycQOjVOhUKBl/2K+/qrUvabDL4g72EjlWOrEkDsX//xrx2a1j6I9/rmk2FVnKSoAAVbcU6mCgV1olxikdbvh/Ck7D7Me+ztMMo0duMvoNzYNGiBimzKhDfVdQ31n0GMMZdXCmmxuKpb/6pjORkLB4fZW9fXoXOZQAsHSTdNPvz/6xrWtKrVIkZIXcclXMUsSW3TzJfbhqFqUJUF8ZRlodEy3vUaawnkAqgYObqfGtQko/lTw/Ll/Q9+8JxjUbLgfYeMaW+Maz/V/weGBaTqjvdN5PDsY7sXJXonA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(4744005)(5660300002)(508600001)(9686003)(86362001)(55236004)(2906002)(122000001)(6862004)(186003)(7696005)(6506007)(38100700002)(33656002)(52536014)(316002)(71200400001)(76116006)(66556008)(66476007)(66946007)(55016002)(107886003)(26005)(64756008)(8936002)(38070700005)(4326008)(8676002)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v1OPe4b82CMTjYqCXecDqdxp2J7MMaAn8qAUvxeQi0ItwCNGjG5m9AgDKag3?=
 =?us-ascii?Q?mxEXZHpcgFufGfNQ8FfCTbmDxwOBgPxc4tJr/IFcCMQV+sFGPz3Tsleh7TRf?=
 =?us-ascii?Q?v66B7lrZMi097roRFGVfFH2fwsbRwSDv1qKJYwXC9dnwKHowQu37RoG49TMt?=
 =?us-ascii?Q?RcSswlsVdKCQIrtPUUVbFHXxZ3pO+4SfgQcAMIbIcFX+KLj7B1PvMVBV1+Lr?=
 =?us-ascii?Q?5ip2YaOWJIYXy2PBnpxZb8MctkhsgDvgqWPhr31SV0RkWrqjpt7J3M2D1Tcz?=
 =?us-ascii?Q?+v0Big9usUuio+4E0ad+5qCBO8m6GY3/zU2Vg+O7Ct9U2DJtbIAoUSUCDX4/?=
 =?us-ascii?Q?aCwvuSqqVNt8PTX4qpw1E07Z7Z1YbGXM5q+Mv4fO/VafQ3/HVajCJEfqSKzd?=
 =?us-ascii?Q?/D6folYsjr0y33Xxh8n5SA4NB6Kn9zjyDjSFLpAHv/gsmKK7ztqxtzK+wJl/?=
 =?us-ascii?Q?EDYgSe4sfyxIg7HGA0WDpN76zFkvD10sCSyiHAvj7/Sc9to64bWqkc30v0NH?=
 =?us-ascii?Q?j27EWms9S1DGTQ1wh5nro8BBg8yvN5kxHQBzaid+y1Wotg6bcTx/orw9GN6A?=
 =?us-ascii?Q?146/AtTRBDqeYO55s3+DKmWLqQ7z2WZvz9LW1MSg0P7rCpieZuONZvdOlg+h?=
 =?us-ascii?Q?mFyMBloda4569j/nWeKIQ5OYuu0RbONwiu9GrUjhvCCmMjV178J8QiAZ5Mg/?=
 =?us-ascii?Q?vyDbp3iPpQtXqngKmtkJEFed0CX3zrhHuG/nWyYBha+Ee51Uau45ShlGc6KY?=
 =?us-ascii?Q?2pHU0RP9La09Evcd3aK24Ht1xpDeERFmw7nzhNgpyYteAptDGSfQj66Em4eH?=
 =?us-ascii?Q?GHEU4yrXmlNHnKiBiolAOgiwguMkDZ+ouyydjT0qkU5na4fNF24WlOH/i8HG?=
 =?us-ascii?Q?OIUBMS2qJqJMdwZwIx61iiVRBqslvbgbr5I+SYrsADGjEB6r2dsV0xL38qoY?=
 =?us-ascii?Q?tl5BfifIJplgOpuNfMIUaHyCgSm9T/cnY8aR84Xg/i73glJDNCDrFgcbiq1I?=
 =?us-ascii?Q?yxko82YnbITf2MT7lk0urkalEv91om5/zwoaNBBCkdrWBERT5PQVKwqDwTTu?=
 =?us-ascii?Q?oF0l9XuBTOBZP3y6RZ+ZKfPgTfNXH7XnbtTL6AdMTAeL8xfxLUJPaO53fkWB?=
 =?us-ascii?Q?4OIVEL82yogjJ3J0k+QMRlXBf3iSkAf5gMcA2mi4pnT0KvpJOYwVA149ScnE?=
 =?us-ascii?Q?H6onR4P8Zl7RR9HSBnXyqXaBZ/SPY4m2L1meivp9lUqNVb7wmLtIO4nYoicn?=
 =?us-ascii?Q?QZmRj+QvU8SR3vYBlYb5LeLY/O8HgK190hBmb2f4YamNaZ9pHHwQQMbB0yww?=
 =?us-ascii?Q?c0lg+R3J2jsUuJiOkddYHfKQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66e655b-6089-49a3-5fe6-08d9572ba6de
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2021 09:38:44.2548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JzDPMahTEZ35WTWnE5txf45E5vQpN1ePFxHuIOb39qNqbl4w2EWHpqLyqN253hhNjg1yF9XUtxsKH9zbuEh7HLX0GNzM/KgVfHW2NgMY51CjmfmPxg/RYVPJQA/5D296
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1552
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Wednesday, July 28, 2021 3:55 AM
>=20
> This patch adds USB2.0 PHY support for RZ/G2L SoC.
>=20
> We need to use a different compatible string due to some differences
> with R-Car Gen3 USB2.0 PHY. It uses line ctrl register for OTG_ID
> pin changes and different OTG-BC interrupt bit for device recognition.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Also, I tested this on my environment (r8a77951-salvator-xs),
and I didn't observe any regression. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> # on R-Car

Best regards,
Yoshihiro Shimoda

