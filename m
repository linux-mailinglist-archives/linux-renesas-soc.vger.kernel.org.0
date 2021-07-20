Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1973CFE85
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 18:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240030AbhGTPSg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 11:18:36 -0400
Received: from mail-eopbgr1410117.outbound.protection.outlook.com ([40.107.141.117]:31238
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236898AbhGTPOD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 11:14:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzQQOh61V3fesrvdBVc9bjqU0JxnyDsGRWIhtmcGcXVUZCTqe9w/Jfi35vtvynXcxBVMor0dUvmVESO08nZlGG3sbALAYcjGtyAUCuqelE12mqJbzda8v5JPGGU9keJfk7dKyuXtIVFkwyfcKff7qgf15Xr96wegRKgwkgKvmF78l+2FjJPrzfVblnjQsVAf+RZsbkmglrvEH/2H/5BjG+82pfyepRJ+asDy4D0R/ZmIfgA+H6RRfsQguRdPsj67Q31Z/gff5wczwSRvRpq3VAl2VTXG5ZRoyxDS8jcm7MX8JQnpUzTZhNUsT2Jt4AhJdUKECZiRSfhjBN1st2aV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJT6HFP4XCJ8s/OHuOLnOgJX6ykiAb+lapg2aiCv32A=;
 b=Da6J+89xRI8e6AWOl7uY1tYTJcHRcmSYpLBQmsZmxCk6tatKV87gYlvo7GD6mFhHCQpwCxvshaynQV1emFrt0HQ8I9kXTK5MRKio1v+d+GpUUJG4Z1JJP9hhzmr4bZdHlQKH5f0yxIdsp6BZDRN9c4sWTufhJcgsanm4sifLD5y0DKScd2C8/a52PeeqVcVxW7VX5KtNvzJFvEc9apuyqpRti1bdme++iWaxdDXKDit5XuXrHXm8FGC7AwtbOOpz6vQqcoRFDadQFNDNjmXhhe2jt2OErXG1nOtiJ+Dyuzp7X1KbvjYoc6yt7rZYfiMS1jTKjIWMHdAuByQeJo9tSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJT6HFP4XCJ8s/OHuOLnOgJX6ykiAb+lapg2aiCv32A=;
 b=baNlWuSHxh69Im8cnkk7z0TX15Is+e16VYiVoj3Veh/Rvl3L4RA7JykUMS/C/gbRSm9OMDBO+hE2wfjXqztU7A1LmTEXMO1kt26wY+d8cv3WvG38XS+yDqgxEVdPM5GPpyPF26Hb4zMV8SOi4rKRFXSPF8GT9cite+7EX88WkC0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2740.jpnprd01.prod.outlook.com (2603:1096:603:3a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 15:54:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 15:54:38 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     Phil Edworthy <phil.edworthy@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: Regarding SDHI clocks on RZ/G2L
Thread-Topic: Regarding SDHI clocks on RZ/G2L
Thread-Index: Add7vsI9+kXhl+CeQLOqy9wopCg2QQBtkhtQAAB1h0A=
Date:   Tue, 20 Jul 2021 15:54:37 +0000
Message-ID: <OS0PR01MB5922D113C4BF2C729B01497286E29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB5922386AFB9BBEF95626761C86E09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <TYCPR01MB63193D71B89ED65ADFF521F58AE29@TYCPR01MB6319.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB63193D71B89ED65ADFF521F58AE29@TYCPR01MB6319.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-Mentions: wsa+renesas@sang-engineering.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03c4e630-8c0f-44d0-9cee-08d94b96ada7
x-ms-traffictypediagnostic: OSAPR01MB2740:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB27409F58D00275B6569EC47786E29@OSAPR01MB2740.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nMTKqCxKsPasuPXFTFM9CtTbVyfRvG9vFaNFIuio8ylEh19u+H1hTlt+3HvHbYgix9ZDVtkIvhYVmZDz33p2fPqkTQEtiQin3aTtPA4f3pcDtfuHPoAiM6ZriEYxjs60cT4D7mWBqP1ZPO/pICrmdgPGC0sPRYNtKgrxHuwJExp7ldwqaU6To5bZPcJrwwaL3v6lXNNHVtgwBfuNXxFDL4TEy+QpGK+HN00Zhbn1BzhqZG2AcSRFhhgMjmPKOs0NbhVVo70nGxD9RDw4fC19vt+k2pf89CRetwJAbiLbb+K1A9MaOqP6CY4/4DpKz5CobNQXKG66Xc6L+RL1fQYuFQnzIjaggyIgZ4mQgacCGGcKm6LQh9Bxfqyv1GSAEjRO3jCcCtGnrUi/UVDZT3h+FNyH6MckUAiX28F9NDSwuoto/noI3kguLSCHufxMYj5VIYU0jHr3C9FDvAEWsifHgjYn55DWMPAJG90wT9/bUU8ew6AMdCKJAE1u9g11m52dzhI73aGnSeNtGiJc2W6KCmD9lqIxW9+zFcVFpD1D3OOX6lnrPD8SphXi1A4Fbfha4oRmzT82x9G3GpEE7Fv35VcXwp3pewwfoSz/8WgnPM62BpdV0+wHMFJ0fDtHbVubhaAaUBeGhjhP7bFPquPRYbP7rG0TACvcK1zAUi/Z+KFjV4nJ/TCHIElBFjvQcz2j56MPp9vLBgOjuGTE6JZtQecMx0zQmqWL+aGtXL6jz2HtkDC4c58MQICZCk+vuMPKt3IGHeg78XFaV6uVdpjhdR8lGo+FW0uN2vkrZyEKLVk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39840400004)(346002)(396003)(376002)(54906003)(110136005)(2906002)(107886003)(122000001)(66446008)(66556008)(8936002)(76116006)(33656002)(9686003)(8676002)(316002)(5660300002)(86362001)(55016002)(66476007)(64756008)(71200400001)(66946007)(478600001)(966005)(83380400001)(52536014)(38100700002)(26005)(7696005)(53546011)(4326008)(186003)(6506007)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I2XyOhIwrN/qyNfBl/k3CpCe0yhdabGBGXthwP9XLcIY09TrJSgR93t1PFZ7?=
 =?us-ascii?Q?sVf00g10tvPT8UKmTMjmoog/hZ/LXPqRp/d3Fgphx62V9a2CS6pNpdqJj/nT?=
 =?us-ascii?Q?kq1wQwJC8tmfE9q/4oQhcv4I6RV1/hJIZ2Tr3oxvBcHBVtE+cyC3NaL8y3DJ?=
 =?us-ascii?Q?HNGGwfDxdJqYKKIvJT1nMHMq2iSFE3BPTVAbKPwQgmizyBdyo5wRF1stHGXr?=
 =?us-ascii?Q?8+P6ayemyXhihmzHuTrxbct9vMO7ceLPvOQ4FlWaYwQQTLxN8Yy+M/TEl/bN?=
 =?us-ascii?Q?x7iOEE/Ob38eSTOAY9pfvV2Cr//j31bcf3GyNOKbjQIbcR9pSRLC9Bk5IACu?=
 =?us-ascii?Q?zZq5fua44RpEmFWjBIeFKy4r8efk4NXu+VdW2WT1+hKdHZOeM7Nets+Yc3MK?=
 =?us-ascii?Q?hl4m9C7shxJkpTFm9LM9PZ4Xt8wcMvui0iOrjhyGWXezMdAzX5OG5LUQBlMJ?=
 =?us-ascii?Q?XPX7/QO3ajNVlOsf5iivWeV2s81GfiXYKKJH4QXzQi2UHbiSKKqCbYFhIcV5?=
 =?us-ascii?Q?gGl4Wj4qvpohdRdzjPC2GJqdnmEsJoTGGry5WM4H7bABVS2vYPWUCbiprvAd?=
 =?us-ascii?Q?aVmq4tiy0MteJB8dtdEZSungkDRdoPKn1dTQ89iU9Gr8pknTHTVY3DUjJTzV?=
 =?us-ascii?Q?FYeiTn6C4V2uWgrdAWlo3xctZQVmo/yTzPzNHd+k3yK2SVF0DjqK8d4eqGVL?=
 =?us-ascii?Q?E8jTxGgky9swFqbDcqtMcOTyr11//MLrMboshDAp10uLk4YZiuygMmKisbXI?=
 =?us-ascii?Q?pxHvBxLw04YfZ+ZHOazWxsQitJBorxpT41UmGg+3IcJXQ7A/h6nETvzbtrHS?=
 =?us-ascii?Q?M4UeY1Wi8m8YSnKWEeNOMDT706SopIz+tw8IvNSfQMxgoWqIyz46jgr6GVDm?=
 =?us-ascii?Q?9DIN+fNnRl6t+Y+6ry9fGuKPsYv6DSxzU+VMlBQgPOA6oCmbA071okdGFy9O?=
 =?us-ascii?Q?M8YBtRST5b3KPGwKKw1BnbywTC8xU2V6tHxQe2eN3ohR+OjlQu626RLfLzK9?=
 =?us-ascii?Q?BAAvDyk3ocjYwJ9BzGvf/GW9XJp4nentDHURoRDNEZYDnquUhZ3Z1cF+D3wJ?=
 =?us-ascii?Q?p1tz1topT6CP2yULsDaK4saO/98LR7YAbWaOkOvJZKSm0ZyJUuymLX5dSm1C?=
 =?us-ascii?Q?4uMisSGNaFw8RsoBZvXAsatMUq5heTjVyu4vSC61vuKzCaFSmUWVQoZm1Al/?=
 =?us-ascii?Q?D8+EKonUt5nrx20lCpxf3yfVUJliEiJfKjxismzyXY+zmK3oOzCSFAyk5eMZ?=
 =?us-ascii?Q?PHpY1ySHxCksG9lCxvfRiZBz2K38/Y+Ncho6xu2aKrvW+xRSMC06Ot5KZjQp?=
 =?us-ascii?Q?4/78a9+2Wtkj+ahJX2LoBP78?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c4e630-8c0f-44d0-9cee-08d94b96ada7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 15:54:37.9230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZZGYXVkykDwtfUN0civbhiLV5is159JzGFWxNVKQnvxpWkcd/g3Uf8c4mdJETozcjBIVkhk7dQ7eRp85QLF1+nVhksi2ok4u3brAiFuFA8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2740
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

> Subject: RE: Regarding SDHI clocks on RZ/G2L
>=20
> Hi Biju,
>=20
> > But on the SDHI driver, we are handing cd clocks for RZ/A devices.
> > Unfortunately we are turning of this clock during suspend state.
>=20
> I think it is fine to shut off the cd clock in a suspend state because
> plug/unplug a SD card is not really something that should wake up a
> system.

Some of the Mobile SoC's, SDHI is  a wakeup source for deep sleep.=20
For that use case, We need to configure CD/WP pin as GPIO rather than funct=
ion.
So looks like we don't have any use case like that here.


> SHDI should not be a 'wake up' event source in a system, so we don't need
> it running during a suspend state.

Agreed, if cd pin is configured as function. But for some use case It can b=
e a wakeup source,
If it is configured as GPIO.

Run time PM enabled is in SDHI. So it will turn off both the clocks during =
suspend.

RZ/G2L document says we should not turn off cd clock during suspend. Otherw=
ise card detection
Won't work. So whether SDHI can reliably work in this case? Basically if th=
ere is no activity,
this module can go into suspend state. If the cd clock turned off and card =
detection fails
during resume, how the SDHI functionality going to work?=20


> Things like interrupt pins and GPIO are wake up triggers.
>=20
> From a power perspective, I don't think it will save much power to turn
> all the clocks off. So your #1 or #2 would be fine.
>=20
> As for #2, it's not really a 'critical clock' for the system.....it is
> more of a 'clock we don't care about'.

OK.

> I would say go with the one that is the easiest and makes the least code
> changes. If adding these to the SDHI driver make it very ugly,=20

Easiest is to handle it in SDHI driver. May be to address "cd" clock for RZ=
/G2L SoC
we need special handling for suspend/resume callbacks.

@Wolfram Sang, What do you think?


Note:-
Currently I am configuring CD pin as gpio rather than function due to some =
reset issue[1]. After reset
cd detection fails. But it works ok, if it configured as GPIO.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/mmc/host/renesas_sdhi_core.c?h=3Dv5.14-rc2#n580

Cheers,
Biju


> should just add them as critical clock and be done with it.





> > -----Original Message-----
> > From: Biju Das
> > Sent: Sunday, July 18, 2021 6:26 AM
> > To: Wolfram Sang <wsa+renesas@sang-engineering.com>; Geert
> > Uytterhoeven <geert+renesas@glider.be>; Linux-Renesas
> > <linux-renesas-soc@vger.kernel.org>
> > Cc: Phil Edworthy <phil.edworthy@renesas.com>; Chris Brandt
> > <Chris.Brandt@renesas.com>; Chris Paterson
> > <Chris.Paterson2@renesas.com>
> > Subject: Regarding SDHI clocks on RZ/G2L
> >
> > Hi All,
> >
> > As per the RZ/G2L clock list document, SDHI has 4 clocks and  IMCLK2
> > should not be turn off during suspend.
> >
> > 1)IMCLK  Main Clock 1
> > 2)IMCLK2 Main Clock 2, this clk should be not be turned off during
> > suspend state, otherwise card detection won't work.
> > 3)CLK_HS High speed clock
> > 4)ACLK	Bus clock
> >
> > Multi clock PM domain support for SDHI is available in RZ/G2L and we
> > are filtering this clock not to add PM domain.
> >
> > But on the SDHI driver, we are handing cd clocks for RZ/A devices.
> > Unfortunately we are turning of this clock during suspend state.
> >
> > Q1) Is it expected behaviour for this device?
> >
> > Q2)What is the best way to handle cd clocks for RZ/G2L?
> >
> > 1) Handle it in SDHI driver? ie, enable it during probe only once and
> > avoid turning it off
> >
> > or
> >
> > 2) Add this clock as critical clock, so it will be turned on
> > permanently and don't handle it in SDHI driver?
> >
> >
> > Regards,
> > Biju
