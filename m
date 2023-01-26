Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF6467D67C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 21:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbjAZUf5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 15:35:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232108AbjAZUfz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 15:35:55 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2092.outbound.protection.outlook.com [40.107.113.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648FE4E530
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 12:35:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRUSJ1jqnbiARbvOwGk8u0SQ4WUgC2Iylf6ArVOIlB0folAblDRaQZX11A3iUpZ8xAxp4nuFY76nVMgSxp5UwR7HvFWm9ORLbDKCt+HBa9nbsVe9sKQB7PPi64tWkOGaerO9yYfxWHsERYxDdAZ2X6yO9hThstyCnAF7XQSikmilTedF3HK/6RUpy/2qFmg0GocG/oqIz+6+KpOM5NNKOuSu0tH7jgBtVSAudpjjCA0XNujoRrHbWhjKVOTWVLERowV+JBPcZnJx2/ZBTX0p/pwCUONkw8tGBLQAfrKg1pxnPgBgf+he37Bc/c1elw46TXM9V+sgIz5N21HlvTc4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yK41LPlpeiZ8B6AasSaWCmrDzSg2hJJ09RcCbNnets=;
 b=TP2vPZ91SEVtoewD5ctasbZXOjhRetRPz9bBre81tjH8sc0URM1JOewynxeNGw+7cEBob/om886IZa8Xwkr2aAlT/qGNNFJ/BYemdaJJt6Ngr7AQqula/DM8pEwuL8DIp3fk8ebiivv3ZT9CMmSqhfOz89wTEa/fEHFyQGmk+3k2pHa1lBHYCLKyRGSGK9O4eTnWGURfTILoFvjqVkFOlSyYDIHoYv+c+twoFZoJ2oxpz8YaNsPF5mecYTnqiCCLUv2Y8CHxGCMAjmt1WrK/cWAUH2gMF6HH5oYlO8ryfRjUC4zqsPVls/6De3tW98dJ8Kw52ZY0FbqL0eEsw1Dh7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yK41LPlpeiZ8B6AasSaWCmrDzSg2hJJ09RcCbNnets=;
 b=L6HWcRb2ykzsURWLtwC0fDUzkYzqF8t6sQynUT9LB6FFtiDl0z2/fJBskCmCBvwMQyYdiGSWF+lOPbWyzS9WC7sfjhPeLB5KIiJWv42og1gV8PaYlmnkfiKc26dpmugV1HZyw3edljb7iSTfSUBSPtOp0tt0lOcJ0QqQdipVFSw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB7731.jpnprd01.prod.outlook.com (2603:1096:604:17a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 20:35:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 20:35:50 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        William Breathitt Gray <william.gray@linaro.org>
Subject: RE: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3a
 core driver
Thread-Topic: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3a
 core driver
Thread-Index: AQHZJ2qh0xCJ0ka0qkO8eIRJwRDaI66wmfQAgAACtkCAAD/3gIAAAymAgAAZVICAAANN8IAAPehg
Date:   Thu, 26 Jan 2023 20:35:50 +0000
Message-ID: <OS0PR01MB5922074D7BE3071D7EC481FD86CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230113161753.1073706-1-biju.das.jz@bp.renesas.com>
 <20230113161753.1073706-3-biju.das.jz@bp.renesas.com>
 <9f722f37-15da-0384-c059-a4af0f1dab10@linaro.org>
 <OS0PR01MB5922F1D5EEBE6D5B24F1820B86CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y9KTi4TYjh9qwBPE@google.com>
 <OS0PR01MB5922046617C1C9461DEAA7A786CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y9Krcd6tPI2jdYfd@google.com>
 <OS0PR01MB59221B63765833CE7B61276386CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59221B63765833CE7B61276386CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB7731:EE_
x-ms-office365-filtering-correlation-id: e24cba90-fdc0-46ab-0db1-08daffdce9ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BcdM9abcSKT5YfnyUGI6egftEGjMT/qdkjIvhmHf68/2bU4yvFxxIEMdJQsAViUdftK8XcioFbLNqPZvJ/TM1b7Ul95eLXCFqljcmWeqvlAQNxmqtwE9qa3p0i/C0en93mbgqUc4mCqcZiCHFiz4NnqSDAsRYDWq9mM6jZFvqSrvTKrXq322o1a/9KcagTkMRNFjg0LPBBnrZYDaQvndzzA8XG3NRdsj6DnXQe05OAxhbIqQWAKwMgIIT5c0w++B7ajE6pFnCtwgZzdESa3PCV5CYjUdz4d4HONPvH7m8NahSVlRA+4XKm4XQpgFDpiXVM5/XQmkmOOsZkiZOskQbCPkxE2eQSQ1pxqmyHNy2jW29/JlH8hWlL4sV4+q8OnhHD9PVCwaxQOsgNYKMGJKJ8bCJBGI0Vs4gFM7oKOfSlyI0/rN1QrY24Aw/2vWgVQ4a8g3SWxwv+YNmqmj5YYJLnkjHL2ucY60ZHPWPxAMvYYIxBfguCOigd0/zC+MRsWf6+nmYtrIYQedxih53GxQAGqGZjRcyAtRAcKZyleI4IzNgj3jH3G8+ezppe7cAPhjMRvoiT7vyeujeDyWo1aLyCtqNaPrx8TzDB54Snm7Yxly6DiudZTruOxha9F3/CkRuzWiKmeGJgmpHC/yzki3XSUDhBhO4Dhp0HukXCJ3lRYuDC517sPKayfM2hpVJp6Lujft5Qg3niAq5sTbcEn1Kc/spg5LA0M1lPyXQVyd0j8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199018)(66556008)(316002)(122000001)(33656002)(8676002)(38100700002)(55016003)(4326008)(478600001)(2940100002)(110136005)(66476007)(86362001)(64756008)(186003)(66946007)(71200400001)(38070700005)(66446008)(6506007)(54906003)(2906002)(5660300002)(53546011)(76116006)(26005)(7696005)(83380400001)(7416002)(8936002)(9686003)(52536014)(41300700001)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CUvIK91edvbfVHegFUgxzcbBQV0paiBjed9BHDR83ctJzhuf5h+rr3qjJ3YX?=
 =?us-ascii?Q?dIXiBbE8QNEgYFN9/MCI3hjJ5hZrjehhzomTe4Ny3NJpaJau/uAR8+DFml9Y?=
 =?us-ascii?Q?VE15W47de1iCqaeykeGSnzDX3evl/+un8ix/p0p40I2kyBuM4ASq5LsQIEOl?=
 =?us-ascii?Q?QdVF5KWTEktsJBEXjLqEqoeV6xGm1wcRyJ7tUGWSX8C6u1oIR5rMi//P6BIA?=
 =?us-ascii?Q?0cmlKj5VJbwCxCVwZ4DLehJRBAFwHqo4esTgOErm3EIU5qFjg3H9rqbPpE5/?=
 =?us-ascii?Q?ww/KNSxN/sKrgGcbP44tZnsIkN0BI8MKVV6QOVj2BSApFsJJNWWGrRww1Lxr?=
 =?us-ascii?Q?vYlybnDfUY/eU0CmSRvnDjwNKdW6WoOqbVZY0bpjcXWE2KyzlHbBt53GmZeK?=
 =?us-ascii?Q?EqiVHHMLiWxxZ5uZqZEhwIddySnjlneWKUGs4SWJlCi6TXAJyzKKDtk6EEMW?=
 =?us-ascii?Q?SKErEHXvMfSSH+zCjkNdurl6vDxunRcm90sFSgpXtGqgFlZcNw0qaezMXA/u?=
 =?us-ascii?Q?c2UuV8IREEccd4YCUzCdL3EEOMww6P8acZjUNMARX9FsaDTfvCKEmBf++j3W?=
 =?us-ascii?Q?CDG7IgtZ/8g4Qi9xusjN5AqkJu/hht5BsyAv0ZAHdtKht81i3KgGC5NsOZom?=
 =?us-ascii?Q?upNkwUupZvUlOk86mCrYKIkjJwLqGEh8AFHixso6iaE6DFPxGAkN5L22phTz?=
 =?us-ascii?Q?JCZHKQ+jhyu+PKr/RipOUDfGkoVxPdOsGYt0VW8tkQYmWXVPKtjcw9fiZa2v?=
 =?us-ascii?Q?mZ2DMpWkYn+a9fdeb2SogNoEDILe/S4IwL0OszcKsu6pRV1EWN3jspIw4sYB?=
 =?us-ascii?Q?OvgbcYmFQwiD/PZG2XyY4TfPrA3cnQ8xc1sVrpNUgtqpmthmgiNVuKz+f5Rq?=
 =?us-ascii?Q?KnKSJpZTqa2vVBG9sLOtxA+phwb2XcYmUjcsWW1h+v1QWRSdmUEx6H5bRCxy?=
 =?us-ascii?Q?WdJWIoEUN8aD4Um3pxi71VDZzro3b03CjneGISVsrYgmKNupz7wyV8gh9eWb?=
 =?us-ascii?Q?/bu7j39Xdi1zcXFUaEURF72MikF+0hZkMXL/e/zuctEWaTHO77YKJTbOIfFT?=
 =?us-ascii?Q?GcQNAIomJlkjjQ101dT+0lV2MYR0nhXA99C25q3s9e+wW/ND8gSzjPLEApkI?=
 =?us-ascii?Q?ZIBQtiDIqb2RlKrjEC+FC9Pr5Qo9JpQJpcsHcr4ayRL4kwxXXZmHryABwf3D?=
 =?us-ascii?Q?FGErxLjdH+OXwpVo4t/9x03abOzrlCJQ+kuF4PfltxreNRUZ472VtVyyGD/K?=
 =?us-ascii?Q?PEYopJoUCvttAjZjvRPWIJCnYM8YhNhYJypiUgUt8/YN5SpZzUVPQ6aqiN/L?=
 =?us-ascii?Q?RpVxx2csibLKOIg3H+pQyNj9b7c5cwD5mVgN77atHjiyTVBtk7iVt9Vq+soW?=
 =?us-ascii?Q?w3rPgQjxQXy/eYXo1QiPrKSxn5CferE+Pdoc1E07DmEWRizQfgZ/wB20+iy2?=
 =?us-ascii?Q?TN0jesgsmt/hqpmUwAzncA700GJMzfBbKOBpkPfMQGiQRtUG5jgONZSbJncf?=
 =?us-ascii?Q?UaLpaEAwQhtY9E1qRhqlHU2YZXCkxZ6sEMOzGlgFXPvFFaeN9U+CiTn4PqUs?=
 =?us-ascii?Q?UEvu6Ju1lTXpCyfe0Uzs1R+TJ9qMEYUpUq5MZR8TvGSMmsmFDZTnpI/wlZbr?=
 =?us-ascii?Q?2g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24cba90-fdc0-46ab-0db1-08daffdce9ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 20:35:50.8705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xh2xk9n2aWqpviRGyIa9vA74sqMnH+sJZnjqk/8dgmaWgZALTZawv+8GulFqU7hb9ebLCqlRhiVwG1qnF22xcBibobVXnm9ZcC5Kn1smWyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7731
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel and Lee Jones,

> Subject: RE: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3=
a
> core driver
>=20
> Hi Lee Jones,
>=20
> > Subject: Re: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L
> > MTU3a core driver
> >
> > On Thu, 26 Jan 2023, Biju Das wrote:
> >
> > > Hi Lee Jones,
> > >
> > > Thanks for the feedback.
> > >
> > > > -----Original Message-----
> > > > From: Lee Jones <lee@kernel.org>
> > > > Sent: Thursday, January 26, 2023 2:52 PM
> > > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>; Philipp Zabel
> > > > <p.zabel@pengutronix.de>; Thomas Gleixner <tglx@linutronix.de>;
> > > > Geert Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> > > > <Chris.Paterson2@renesas.com>; Prabhakar Mahadev Lad
> > > > <prabhakar.mahadev- lad.rj@bp.renesas.com>;
> > > > linux-renesas-soc@vger.kernel.org; Rob Herring
> > > > <robh+dt@kernel.org>; Krzysztof Kozlowski
> > > > <krzysztof.kozlowski+dt@linaro.org>
> > > > Subject: Re: [PATCH v11 2/6] clocksource/drivers: Add Renesas
> > > > RZ/G2L MTU3a core driver
> > > >
> > > > On Thu, 26 Jan 2023, Biju Das wrote:
> > > >
> > > > > Hi Daniel,
> > > > >
> > > > > + Rob and Krzysztof Kozlowski
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > > > > Sent: Thursday, January 26, 2023 10:53 AM
> > > > > > To: Biju Das <biju.das.jz@bp.renesas.com>; Philipp Zabel
> > > > > > <p.zabel@pengutronix.de>
> > > > > > Cc: Thomas Gleixner <tglx@linutronix.de>; Geert Uytterhoeven
> > > > > > <geert+renesas@glider.be>; Chris Paterson
> > > > > > <Chris.Paterson2@renesas.com>; Prabhakar Mahadev Lad
> > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-
> > > > > > renesas-soc@vger.kernel.org; Lee Jones <lee@kernel.org>
> > > > > > Subject: Re: [PATCH v11 2/6] clocksource/drivers: Add Renesas
> > > > > > RZ/G2L MTU3a core driver
> > > > > >
> > > > > > On 13/01/2023 17:17, Biju Das wrote:
> > > > > >
> > > > > > [ ... ]
> > > > > >
> > > > > > > +config RZ_MTU3
> > > > > > > +	bool "Renesas RZ/G2L MTU3a core driver"
> > > > > > > +	select MFD_CORE
> > > > > > > +	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
> > > > > > > +	help
> > > > > > > +	  Select this option to enable Renesas RZ/G2L MTU3a core
> > > > driver for
> > > > > > > +	  the Multi-Function Timer Pulse Unit 3 (MTU3a) hardware
> > > > available
> > > > > > > +	  on SoCs from Renesas. The core driver shares the clk
> and
> > > > channel
> > > > > > > +	  register access for the other child devices like
> > > > > > > +Counter,
> > > > PWM,
> > > > > > > +	  Clock Source, and Clock event.
> > > > > >
> > > > > > Do you really want to have this option manually selectable?
> > > > > > Usually we try to avoid that and keep a silent option which is
> > > > > > selected by the platform config.
> > > > >
> > > > > For critical drivers like CPG, Pinctrl we enable it by default
> > > > > by silent
> > > > option in platform config.
> > > > > For the others we add it to defconfig, once the device tree
> > > > > support is
> > > > available.
> > > > >
> > > > >
> > > > > >
> > > > > > [ ... ]
> > > > > >
> > > > > > > +
> > > > > > > +	ret =3D mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> > > > > > > +			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0,
> NULL);
> > > > > > > +	if (ret < 0)
> > > > > > > +		goto err_assert;
> > > > > > > +
> > > > > > > +	return devm_add_action_or_reset(&pdev->dev,
> > > > rz_mtu3_reset_assert,
> > > > > > > +					&pdev->dev);
> > > > > > > +
> > > > > > > +err_assert:
> > > > > > > +	reset_control_assert(ddata->rstc);
> > > > > > > +	return ret;
> > > > > > > +}
> > > > > >
> > > > > > I'm not sure this driver falls under the clocksource umbrella
> > > > > > but under mfd [cc'ed Lee Jones]
> > > > > >
> > > > >
> > > > >
> > > > > Please find [1],
> > > > >
> > > > > After a long discussion with dt maintainers, counter maintainer,
> > > > > MFD maintainer and PWM maintainer, it is concluded to Add the
> > > > > core driver to
> > > > timer subsystem.
> > > >
> > > > Which is fine.  However, you cannot then use the MFD API.
> > >
> > > Is it ok to keep the bindings in timer subsystem and move the core
> > > driver to MFD as it is using MFD api's?
> >
> > Sounds reasonable.
> >
> > I guess we'll have to see what that looks like.
>=20
> OK, Thanks.

FYI, I have prototyped this. Just want to say the core driver changes are t=
rivial changes, it is just
KConfig and Make file changes

Apart from that it is,

git mv drivers/clocksorce/rz_mtu3.c -> drivers/mfd/rz_mtu3.c
git mv include/clock-source/ rz-mtu3.h -> include/linux/mfd/rz-mtu3.h

Based on Daniel's feedback will send next version.

Cheers,
Biju
