Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD2D3709A0A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 May 2023 16:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbjESOjG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 May 2023 10:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbjESOjF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2023 10:39:05 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B964ECE;
        Fri, 19 May 2023 07:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zi8X4Q2hsLQcI/Z6G4v9Tuy87uWrxR2dBL/YN26NSnef6UqObEEmpYxpWjd3d3svMe3tHqpQQjqmomR4Sv3nPbDhGEpWK8m3bbj5GxusTEnPE9ad4kbhRqvo80KhVGmQznVJ5oVErWtzBPqtIcDQWqcvWloqW3SNfYogEBDVOYeAGyMymLHYTZlMCM21lmE/Hkqv7WWmSWUKcJOCzCr2Y5tnvVVP7hTmeHc4KBvHFEOt84ImdAHJxfxSpqzTWefNVNayRvjpoEER4I3ReMkpeQCIVBwArZneBU5hqhvdkxcgSF3Pg6vs21AwBG95MEYw/sz2SOJE7Qxp27M1AHmG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVOGK45MlTz8Up4T+JEwrYg3eWT2TPcrWGEBkWbs0QU=;
 b=XryeBChL6LR8+Xkk+miPGlYg6FnY1LTxZSyrXMeT+2ScjxF/ppyuu/2RN2dcgE+cElrV2EFUk2mdEndhpz8UTXrBoiAX9t/DBCM1UxaUNZ2HG0S9QNpTrLfAJu/HayRfIpzVCnhWeNRsFkn1gVDRO62TOLLx2yFZt4Q1qUxps4Q45FH2jvVhBVKn9VxOKGx+TaSruPTzuCiPy6cLusMnJ9T5q92tQZOpGIXsxf5uLgzgVzJcP9etRnKHQxY2xcC3cLr+iQvR1mLcEay0oX2pMbWCSjfACIdBC8MxZRXg8zypdcZIeivKSFsgYUFFXypDwxpFLiRrN6ZMDOBlQarg2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVOGK45MlTz8Up4T+JEwrYg3eWT2TPcrWGEBkWbs0QU=;
 b=Xe3Po2nr+7WtyuUSFe5Id3H9w3b81Mz7Q69hufhLcBBAaat1JtbUBrabXAwZGF/sJnkRJyUpgJzenT5lrvqTBljB+ZDUMUbykjFwhIpfgjfkzax8dQ2XxO9GehyYc1niEcZl0iGkbV3vG6yiA7iMp3AGcOLMAq6lIqHacaus+dw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10590.jpnprd01.prod.outlook.com (2603:1096:400:302::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.20; Fri, 19 May
 2023 14:39:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 14:39:00 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Conor Dooley <conor.dooley@microchip.com>
CC:     Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas RAA215300
 PMIC bindings
Thread-Topic: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas RAA215300
 PMIC bindings
Thread-Index: AQHZiX0f8Q76HwTBKEKFLFKF5VU7o69gZsiAgAC5I9CAAIRqgIAABxsQ
Date:   Fri, 19 May 2023 14:39:00 +0000
Message-ID: <OS0PR01MB5922F379C4DF20124CBDEED3867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-10-biju.das.jz@bp.renesas.com>
 <20230518-prompter-helium-91d0139a61e2@spud>
 <OS0PR01MB59226BDCD4D67430EC7377C6867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230519-civic-idiocy-5ac6d95675f0@wendy>
In-Reply-To: <20230519-civic-idiocy-5ac6d95675f0@wendy>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10590:EE_
x-ms-office365-filtering-correlation-id: f2d9ec34-21b0-4b83-3610-08db5876c8f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GEU5fAj0AbrMN3t1tr4+YyHjYhNp80vJZ9qkDY9xTaMEVNQKM+g0bzfk4PyeKHv47cgn2xgnOtM1LzYO0NdBQi4jufCVPAR/QVK5Xz6HT7rrEDqGn9cKLb7jpTUhiY8EWE7bL3c3Oy5YKW4RBhysujlJdPVzAFCkzg5ZlZeDzyhaZSCzwcyMhv3ZaTwr5GTect4WNSRg/5CaaYPmtF/wYrfbsMzuYiYA5WTZNpKnCVQq86rWaYiHXeZuAr2OjNvYob0VfHz19X5mVLqQBTOOCI19fCyGMkNAEkbCnpFwIFI1VtibyOorDbS4uN0mIBOSS5AnKt/a3MSYtZCOJY6tSGSOanq2jFkN0+hFrW6vTWO96ty6OOULGkNLzS0+J9X9dxsx4yWOEK1JWlq2o8xNq07MpaJhIsa3AnVuO9W5veypF3EFl/eoXKOv9SDvb6gpZ8s16ItWHY4kD7iqmMN++t2AHqpXvda+ulpu4yqsOJ6wjBplu3/fr6TvDqwIjPUiB44OFAJmNJCKGqJicAR92E+UV3fa0yeQk3/x3hstrQDVjcYdBhSBhA0gzTYkUd08/0oF9eUhCbFo4wZme8YsROWZwx2YPvM8LKcgwH3oAnnoiQnZWqrZx8exQWd8LGtq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199021)(83380400001)(33656002)(71200400001)(55016003)(186003)(107886003)(9686003)(6506007)(53546011)(26005)(7696005)(4326008)(316002)(66446008)(2906002)(66556008)(6916009)(64756008)(66476007)(66946007)(38100700002)(76116006)(7416002)(8676002)(8936002)(86362001)(5660300002)(52536014)(38070700005)(66899021)(54906003)(478600001)(41300700001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ed9xcd8d0ZOgk8fCxCh0Ki8cjmX1ovqOqQw0MyjzkWZsrtAK81urUMsjkelw?=
 =?us-ascii?Q?5IEhoL32p2MSBuXgG3uFWPEVjqFIm4Zv7gGhyJdgaEsf9iugdvWskdZjMij/?=
 =?us-ascii?Q?IFVnPejbZvT1OWFxzzXZ/y/jFicUs4AAy/aqIWtrhv0IKkcEAz/Rxb+h/+ei?=
 =?us-ascii?Q?muxlcjcquQwgPVl+mOZosEBUGHM2/wm9+3+7HR5oCdWDuhKw8VzJU5sjmrut?=
 =?us-ascii?Q?meQPqTlF8QrOdDZ8XD3j3y2Pe2NRJjY/to86fwgiQ2KtOEaOgclubgGOBsZS?=
 =?us-ascii?Q?0PDYM2ZrgilgYKiG73Tofn7X8qpAiFPCp8i3AoFqDw0NBRo0tfgFqmtDDleH?=
 =?us-ascii?Q?c5/tJ53gVVzTbMeJ6s7xPYKwwboz/BTP7UPn+yVIFtmWarXApp1Z9VM1RO4C?=
 =?us-ascii?Q?tMf3/tgD3fWqCXv0j3VtVHi5C1pFirvcj61GN/AyunOkL+ucp68Lnqyzshoa?=
 =?us-ascii?Q?CtwZLIJSyl+sbOO/PrV9OQ5B2bpKr9ma5xhYfbq2O1bfWNrdyhOzV9YVe54O?=
 =?us-ascii?Q?7ot7TugRqcGDX33PJ6b/5ecK/Br2BaHyDqRw0+6Q9caaylBc/o6dMyHXf6Di?=
 =?us-ascii?Q?yShWouBqo/FxB8vU7MweBEs14S3d4xMKZQ8J+sQhrEQaQ+f01nrRWbHxKRVZ?=
 =?us-ascii?Q?bv63VNev8dC2UZEtmMYJt5Xxa2dlacrhZ+frDY8O9TPjkWbdpcizE3h3H5Ux?=
 =?us-ascii?Q?TjzJ2jHcBYPVY3CQ9ibTRDstSbUrBV6Isd6GVwzmOC8ufIox2zZme5F7X45s?=
 =?us-ascii?Q?vvLC1MItMqMZR+cEdTbUfbb/LAghbYmBhqHb5pZ8Vf54kgbOE+1BqJ1rBu1q?=
 =?us-ascii?Q?8NNp8r0UixEmwcnwneyn7tUDSvCJbJUFsuVeRl7YLl10gy3Ho9H5xEO/NHRV?=
 =?us-ascii?Q?Ggm36MQeZQirAPTu1vnpnckTtp1gRvaKaDNdx8sgNBvZZBI2iDCNstYUCsfq?=
 =?us-ascii?Q?ij2hLeaa4xYLandvqHEhsTydjumkr//9OcJZSkHRdJPLj2Mj3OLZskIMs07R?=
 =?us-ascii?Q?xGOe4DEXXH61O6fWD6DQQg0eejenfC5HkgHdc54W4CXngN8CLo9KOq864OUL?=
 =?us-ascii?Q?FsFjwyytBGjLwsb5cgp7+Kd0wFj4Gc4wtn8nx6//UbHhLzS4t9Zpes+F5uoF?=
 =?us-ascii?Q?AuuQWvEeVSZcAHNtbZFH1FXl62/+p1meac4LkyYYrRaq3acORP2H3FlbHV6w?=
 =?us-ascii?Q?JZ8kvtW+aZQNDkmZt+V+adtj10B4HWTxyEwVOZGuYxS6dcqupA9Z3h7lp3x1?=
 =?us-ascii?Q?vqSKPQqYdLKyOR2WPgmeNYXfukGoJiyI3gASSzFuv8Ya0lBiuhGchZbbFBjF?=
 =?us-ascii?Q?iUAYYf9+2Ihmjne7TR5eyPocj7MEVy49Fi0J1hs/D3GyWR3Ay3+IY0ix2eFz?=
 =?us-ascii?Q?GKE2xmwFzb0J2hDAx23EOgMZ52yS/k0SZ97SpUrXh5nhj5GLJ7557yJPK9R9?=
 =?us-ascii?Q?7AH6INsKpxzQw7MMFFtL2uvLX+gFey8VM8NfglyV48ZKEsYSriwnhMHEN25O?=
 =?us-ascii?Q?wBtWCz0nLPBRbOIMjpX2R0fZNIDg3CYTKFDtpY9qmvUQKL14ssyXM6zwHLXP?=
 =?us-ascii?Q?4ddPZgHBedLa4T8Bb03hVIxU0t07LrhtPFBPupQ9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d9ec34-21b0-4b83-3610-08db5876c8f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 14:39:00.3412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GhnRdLSD6odPI5GRAI+zq1TEsQSDOBiYokKBrgeo7v8Y4WNTu7Rrtm7tYiiQCF1FXw5mEXD2/LJTfzxpff6aXledr8skEwPrz1A0QLVaCgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10590
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Conor,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor.dooley@microchip.com>
> Sent: Friday, May 19, 2023 3:10 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Conor Dooley <conor@kernel.org>; Rob Herring <robh+dt@kernel.org>;
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley
> <conor+dt@kernel.org>; Liam Girdwood <lgirdwood@gmail.com>; Mark Brown
> <broonie@kernel.org>; Geert Uytterhoeven <geert+renesas@glider.be>;
> Magnus Damm <magnus.damm@gmail.com>; devicetree@vger.kernel.org; linux-
> renesas-soc@vger.kernel.org; Fabrizio Castro
> <fabrizio.castro.jz@renesas.com>
> Subject: Re: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas
> RAA215300 PMIC bindings
>=20
> On Fri, May 19, 2023 at 06:53:03AM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas
> > > RAA215300 PMIC bindings
> > >
> > > On Thu, May 18, 2023 at 12:36:41PM +0100, Biju Das wrote:
> > > > Document Renesas RAA215300 PMIC bindings.
> > > >
> > > > The RAA215300 is a high Performance 9-Channel PMIC supporting DDR
> > > > Memory, with Built-In Charger and RTC.
> > > >
> > > > It supports DDR3, DDR3L, DDR4, and LPDDR4 memory power
> requirements.
> > > > The internally compensated regulators, built-in Real-Time Clock
> > > > (RTC), 32kHz crystal oscillator, and coin cell battery charger
> > > > provide a highly integrated, small footprint power solution ideal
> > > > for System-On-Module (SOM) applications. A spread spectrum feature
> > > > provides an ease-of-use solution for noise-sensitive audio or RF
> > > > applications.
> > > > +  reg:
> > > > +    maxItems: 2
> > > > +
> > > > +  reg-names:
> > > > +    items:
> > > > +      - const: main
> > > > +      - const: rtc
> > >
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - reg-names
> > >
> > > Out of curiosity as much as anything else, why do you need reg-names
> > > if the two registers are always required?
> >
> > The device has always 2 address spaces and "reg-names" provides a
> > means of clear differentiation compared to indices.
> >
> > By enforcing "reg-names" as required property, dt can do some
> > schema-validation forcing users to specify "reg-names" in device tree.
>=20
> Is that not what we have the following for:
>   reg:
>    items:
>      - description: main register space...
>      - description: special sauce rtc stuff...
> ?

OK, will add description.

>=20
> The schema validation doesn't stop them putting in the wrong address
> either way!

OK, will drop reg-names from required property.

>=20
> > Implementation wise, we use "rtc" for getting resource details while
> > creating the second i2c device which overrides the default address.
> >
> > Strictly speaking reg-names is not required, but from a validation
> > perspective and since driver is using the same "resource-name" it is
> > better to have it??
>=20
> If the order is set by the descriptions, reg-names seem superfluous
> /shrug

Agreed.

Cheers,
Biju
