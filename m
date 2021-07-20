Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFE83D01A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 20:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbhGTRqL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 13:46:11 -0400
Received: from mail-eopbgr1410122.outbound.protection.outlook.com ([40.107.141.122]:1790
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233502AbhGTRpL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 13:45:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKmNK1Fu1iJL+anEZ7xLnagiNr3tzhbWttDMvqIpdfp9gKmJ46AMqotwdPU8jSLBETkilOX5VMY7pXvpIL8x2+vU6El+pHf164DFR+3A94tLTjgZ3ZLUpScMwf2uYWVfi96bD0d6O8PtdLaveodFycmbZ8jEu3QVioKh1noAwGL+3/Qdw75sb4/9o/2D+qLEaEaraPRdI6L+yKTJnZnQ9MW9jyv31JuTqkZkZ3Oh9RZm1TgmL5OCzbzguTf/+4SI27soIE4L9IlzFGx07x6KFCxaVFndpYirzoNSodAY5QumrRXrGlWsEe11w3AwqdjzM4gZQT0AFOBf0BnQEeR9hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEDxR02skBXmQjUMUwonpdr/wX+/aKbfKGMFue/AsA8=;
 b=kVSmn6+GdJ0C7rOeuIZrZirhwHrEx/iOvPs84s8CMyOUj01Y6MzecV5gjBKlbMKFsCAtHGpnA9s6wDvxXxzI/X33GarFNbZhmBOilLcC7og1G4z0VVge692B+h9mX53n8pFc5dg2KyhzwKKs7gC4MQCYmy08Cuw2H31CEpBO31KU6fRFI+Ol7ik3tSX7k7qpUp8tOvs4qre9hVLOgfVMPit0wOT0XKLMqxn70cZx4ynRIJ22W7kScEcQBOgC1/MGT70F1irfEx9YtQfxjKrSdMq4FaOMBnG7o9V+NFqMle2gF73hp4wdTEE0teuWVL9T6HtFqolx/b4lQf0cjx4jew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEDxR02skBXmQjUMUwonpdr/wX+/aKbfKGMFue/AsA8=;
 b=QkR5BrfAvq9kj+zZEC6MJqaScA9jj7PTMrhZXksc2qTfxPt9iBxz1hRRSdo/mlMpXFoFZKLeF8Qe8GJht0/9Xf2eEAAqCyBHID6oxfpqU+TrLC0Z5EAbvFfLUpPWPHNIFgfNJsqJH0cY/j4YiJzsB9NYq7UMcSyrRIQm9zBB0l0=
Received: from TYCPR01MB6319.jpnprd01.prod.outlook.com (2603:1096:400:7f::5)
 by TYCPR01MB5582.jpnprd01.prod.outlook.com (2603:1096:400:41::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 18:25:35 +0000
Received: from TYCPR01MB6319.jpnprd01.prod.outlook.com
 ([fe80::10cd:b376:429:f160]) by TYCPR01MB6319.jpnprd01.prod.outlook.com
 ([fe80::10cd:b376:429:f160%3]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 18:25:35 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     Phil Edworthy <phil.edworthy@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: Regarding SDHI clocks on RZ/G2L
Thread-Topic: Regarding SDHI clocks on RZ/G2L
Thread-Index: Add7vsI9+kXhl+CeQLOqy9wopCg2QQBtkhtQAAB1h0AAB0AVwA==
Date:   Tue, 20 Jul 2021 18:25:35 +0000
Message-ID: <TYCPR01MB6319F7494FB5A69FB00AEA2A8AE29@TYCPR01MB6319.jpnprd01.prod.outlook.com>
References: <OS0PR01MB5922386AFB9BBEF95626761C86E09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <TYCPR01MB63193D71B89ED65ADFF521F58AE29@TYCPR01MB6319.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922D113C4BF2C729B01497286E29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922D113C4BF2C729B01497286E29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctZTMyODBhZjItZTk4Ny0xMWViLWFhODctOWNlYmU4Y2NjNTQ4XGFtZS10ZXN0XGUzMjgwYWY0LWU5ODctMTFlYi1hYTg3LTljZWJlOGNjYzU0OGJvZHkudHh0IiBzej0iMTI2NSIgdD0iMTMyNzEyNzkxNDE2MzQ2MjQ0IiBoPSIzbXVNV0luMnFvbmJDUlZLcVBEcUROdlN4OGc9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31c6e740-ff15-4d8b-f678-08d94babc46c
x-ms-traffictypediagnostic: TYCPR01MB5582:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYCPR01MB5582012B6D219C896E7516A28AE29@TYCPR01MB5582.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p2w/yRVPWsLRy9pLGBasTnF+2TnRmxRDirGlLmoMh+vWRjQ0n7FaKMmydUj7/Ar/rES6Xt1twr823LdkK1KnN45A2IhXq343NYgdGiICY/O+KlVLdhUiCLknSgY/wMRLYs1XFoJarrvezetaf58m1/0GwJFS4WRZBzb0kGjkau26At4v/lCOlsTv0cC40lw4Z/hlKcoEGE8PRynUKBiIB8Be5c6xpgaCZG0J4pZqoXp8xXeuu+/lyJZ0ZLSr7A+XHoqbkz5vYxkg0abkUYRDnLH1Ftj/npfz9mEom8sPQirdDyvCgXVjAm4VqkqIYU9I1hXMm05YwpbYt2nSi509I36JoljtRHqYiE1LbxEqxgW8m8fmaWgUJjOLdN6rMXdiNs930W9XmvbyjEC1uVMn7pz/pES4z454ABlrq93WNfhlfy4Ac84LM1I3FPMMDpWfQw8SPHEPfNXru+z/wbJSL1+BMGeYUTN8hGocFC7raAQet2F/9KjrUSlHtETg9zCp4KAbQ+qYOD5VB5CrDt2njpvg+H0JpO72VsNhzJhz+gv0JWMYCYiKkLS+Ht3BDbDuMnWXLLDTV2X7iREVl701N4uBsCg6t+Y7IaTTg2BRaau6EfaGUJYOMwDCcxL7xd9MoCySz/KacNWviRjg4OD+TnmMAj+YpRLnCeIPUnXNEeMzMyJzhFWS28tcVhTGiULq+a3likA6Wjq+mFZewxLGjw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB6319.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(136003)(366004)(396003)(9686003)(8936002)(26005)(4326008)(186003)(107886003)(71200400001)(52536014)(110136005)(33656002)(83380400001)(55016002)(478600001)(316002)(54906003)(7696005)(66476007)(66556008)(66446008)(76116006)(64756008)(66946007)(6506007)(86362001)(38100700002)(122000001)(5660300002)(2906002)(8676002)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U01VYvoAq+G9pEKGoEQcZbBGtPDPjPYmDQzTaP/uClb/6gtMg8FDKV87uz3t?=
 =?us-ascii?Q?iAOrmOXS9UfA8XcG/gNhBmJ+bEO60l3IaEmOavAAfkd7i2FmJ/JXniJjUI5q?=
 =?us-ascii?Q?qTUplE5QJ6vLF758DxHktuMzfzVnlxLgrtAWkBiDk9eTL+85D7diktdIalSL?=
 =?us-ascii?Q?5HrRyu9U0GyzjRAkQpbcPBnEo13eQpSrJq2OFy/9ZqmwvHxKf9jgctKXiczN?=
 =?us-ascii?Q?s0Vtj2a7OupPQcaSK1SeEV+s6MQ9O28qhbp8k4Cn1zgaTf8PfB3a6q6HkZPi?=
 =?us-ascii?Q?mVQCN3Ic3DKOd2Zh6Y91Uf4vqwd+QfIjQcnDvun8+ohITRDltPQSoXLQ+2IQ?=
 =?us-ascii?Q?umafUyQfkhzL9R2yooyqGFaWYdAic+/8/2FyAW1NXk+NNpB+W3SZ6vP8amWI?=
 =?us-ascii?Q?NQvRqW4YxGpPIDUj8qg3F9kB9OpuiErnhB0zLd/UtC6FR5ILX1e/84LguD3D?=
 =?us-ascii?Q?Rm7Z+p375qOp/i8JkvYdNU6bLBbY0xJ0EXF6c/CbU8So1eMf8wApTEf/xYmn?=
 =?us-ascii?Q?txls3AhyHYYOCIxMRDv9IIV4S7HtD9SgX7Q8gMZDRqT1sms9E/XJxqtJOhlI?=
 =?us-ascii?Q?kBj44Qoe0pGuMmPGAuEya4edzQNGMFjIP5GmqyqW37MmN0ESJR4fhWLoDD6/?=
 =?us-ascii?Q?BzmthQietTTP4H0+jBX9aGqlO9+gf0K5W2D3go/D+xlIWAsCcJXP3C/tBZ7f?=
 =?us-ascii?Q?rR9K2gJ+A0PPQCrnyh18IKWCu8ek7k3888wqEBT6G1jajYTnA99iKy5oVWnA?=
 =?us-ascii?Q?OY11mcIZaVW0nL+exFyol8v9f8ovdzlsE0zK2ObG2W/3+DewgsdqgqAu0ZXO?=
 =?us-ascii?Q?iP6H8lLT96OB4NvQ3EGwpXSIcfTOcBWkOPI/10AVdO/xGlJ5bkaLI9VGSlVp?=
 =?us-ascii?Q?L0yLhk8ZMpJ94i0BzYWkAay5BpXRf+Oq8Ng+7i4eY4ftn/bzvxKMyMiXPYTa?=
 =?us-ascii?Q?ivlaTRBCZ2Vuu0ZXjXE9MRpRP/4S2W3MpRxvSUOFNR7/FLHAg92PGxF4KYKo?=
 =?us-ascii?Q?+3mDYw8WzFUmrtzZOkHROlpNP46pfrEjWPyuUr1XfixqJZflitZPgC4kRFlL?=
 =?us-ascii?Q?yTjMSnZrwz9y1dYdD2kQ0ayoTlOE2JzJ+iLWMsP6Z9aSJgGUkleDPlS+WgDe?=
 =?us-ascii?Q?V1VdAnKOlLabYoFKMMjrtAoO3sHSMduUMaHPVKjJPBAj5g8ORVoIYAiAho9h?=
 =?us-ascii?Q?bhsVdFGe1V3VVbl9kN6idFFRbsYb9xZkUO+eEs1REla7Je5gNXqFunOhuS8h?=
 =?us-ascii?Q?6HhzMjn+rzwhRrHxwh6up18BFRtWMCn7EkECUkxb+rZYk1zXeCCjuPYjd5xx?=
 =?us-ascii?Q?P4sTHmPpk3Lm1XLCwheBlPqI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c6e740-ff15-4d8b-f678-08d94babc46c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 18:25:35.5626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mGXC6AIhtAiGFS5tnJ6wWL5lqQkNr8j5Vk+xORc7Wnneqa6gfHpsmg0Q1/CmzPOdkdFiJxlQBaVL00HvN0rDzfrK+/rYgLYcDZ2TBAXF1DU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5582
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

> -----Original Message-----
> From: Biju Das
> Sent: Tuesday, July 20, 2021 11:55 AM

> RZ/G2L document says we should not turn off cd clock during suspend.
> Otherwise card detection

From a hardware standpoint....yes.

> Won't work. So whether SDHI can reliably work in this case? Basically if
> there is no activity,
> this module can go into suspend state. If the cd clock turned off and car=
d
> detection fails
> during resume, how the SDHI functionality going to work?

What I am saying is that from a system design standpoint, you need to wake =
up the system first before you can use the SD card (even detecting a card i=
nsert/remove).


> Note:-
> Currently I am configuring CD pin as gpio rather than function due to som=
e
> reset issue[1]. After reset
> cd detection fails. But it works ok, if it configured as GPIO.

> 1) Handle it in SDHI driver? ie, enable it during probe only once and
> > avoid turning it off
> >
> > or
> >
> > 2) Add this clock as critical clock, so it will be turned on
> > permanently and don't handle it in SDHI driver?

So does that mean your #1 and #2 both do not work unless the pin is configu=
red as GPIO?

Chris


