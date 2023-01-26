Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF4BA67D239
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 17:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbjAZQ4P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 11:56:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjAZQ4M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 11:56:12 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2137.outbound.protection.outlook.com [40.107.215.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1FDC4689
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 08:56:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XaHweEMN86ZZ8H/Ai8MjGouW21rxYy9Uyp7BciuER4czT45evmuvPXqKdYij7B9tuYORfoMeWkjYiprg+KcwHPz7vsqPAhfgLwTzLl7RsHqJZh5FSc+sqwlj5eKjTLhpqyX+AbfWpY0YqT6sLGMwdbojwaYgynxZSeBJQOW2L8Ik0ZZNnw7cRkGyb4P17VAQw0wwA0EG8YVM/VanykULGo0oL/Zyw58LYrRdS9Wik/9SZ9tziHEqiRPIx5wp2EELTwET3GYsAuRSDF0zTplhIfWa4f2f5qg9DjMCmsUMlmvUFwk3C8Yfi/l9l13kZlxQhaVKOhYxgIjSkFc3jR7n1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXWzBRUbIB4ghlxmJLHkJ9wYASBKOU0QS4kt842HRMg=;
 b=Mt/uh7ZGCCZ4g2ojAZVu7yTN+zB36JREd4XX0OdpS6i0AV/qPTrRB8SXRc1eU7D4Lj8qMhRXyfR/CJdfsocxycM/J1FdichbdNDtcDm6vXOfq3u50UymhAGfEszxpe+FmEl40R4wTdALj+J2Oy2+AFydAWpYyv1ZdAkI4K658jMTwZlGArMPkmniwopWLbQye7MsWY7x3+SWQM0azO4BD2m10+fjGFh4T/31Z7WS7CfvK8xk7jvlbWrbMptkBQ2tJWyXftUPnhJXkPtRMKPinWnwbaE42IiEuP7X4BlXogb8waRP39VJt+gGxVC7aPmjoY6i8elA0w5/i77VwiLSXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXWzBRUbIB4ghlxmJLHkJ9wYASBKOU0QS4kt842HRMg=;
 b=OIz/85v9jQELezr8rtW7RgfIdlX+bpR67Zn6YmEVxNMOZlTr0Nhrma2TGxDO9PdE4EGneGwcfzD8xJg3QKRML/VaqX1IKKBQF8GeZTP5o8l6yQlkVUamv8dhqLrVjgK5rFfcZuLW3y/F5ZT5ZRO6zrENnWR/zEVLQmKNVsTpKYQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB5513.jpnprd01.prod.outlook.com (2603:1096:404:803f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Thu, 26 Jan
 2023 16:56:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 16:56:06 +0000
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
Thread-Index: AQHZJ2qh0xCJ0ka0qkO8eIRJwRDaI66wmfQAgAACtkCAAD/3gIAAAymAgAAZVICAAANN8A==
Date:   Thu, 26 Jan 2023 16:56:06 +0000
Message-ID: <OS0PR01MB59221B63765833CE7B61276386CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230113161753.1073706-1-biju.das.jz@bp.renesas.com>
 <20230113161753.1073706-3-biju.das.jz@bp.renesas.com>
 <9f722f37-15da-0384-c059-a4af0f1dab10@linaro.org>
 <OS0PR01MB5922F1D5EEBE6D5B24F1820B86CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y9KTi4TYjh9qwBPE@google.com>
 <OS0PR01MB5922046617C1C9461DEAA7A786CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y9Krcd6tPI2jdYfd@google.com>
In-Reply-To: <Y9Krcd6tPI2jdYfd@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYAPR01MB5513:EE_
x-ms-office365-filtering-correlation-id: 667488eb-7549-4498-301c-08daffbe374a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MW/uOi4gD0L73NdJk4gilGkOxUu4nvl/vrZH7zBxZNo9fxT4emRDg/BdeCkQMg8Wjs/GIeowRwMEs0YJ8E2DQCOvKFz5C0/Iai9C5jV6Lw8X1gqfVUQuZFxWeDCzWIqVMWrUmvoHbBicmTOhSS6iWWwAl0NRd1Lq2Qe0l5CNayS+vLBHrmmuKhHIDWKpPbjVHZVl58zgJ7o9UI1cSPLzlJkearEkNqHlFMSXQpXrDqOlFVwG/384GDnrDqckcBErvqhyIakbEIfYiKzMs1JjXhshE4rR/JUJHVV9ek8yexIkWPk5NOfCoyhsnm9fo0ZJqXdLqW8WDXiKnTVz/gqw7FoAq6YhZi4xeUJbiQsZsfCLc95ZsI8zR+GgnjnQfLGTn6tKFxctxz1L+a6P/3yMCKbNAb4ky9vYoXEZOKY9MTKo9GcuSi6a+lY0OqWBYrDlquc78j2h2I577ZALIJJKzOnekJRCK1gi1U5C0xD2Cuj1RRD3rnmN4689yrtxcPIwZl1loqoz6CaSdgXp/D+icpPpHmdXPO/ZjEURtzeWiIKfOJdmfYsYTDhWdgl+FJMrWB7RylmMxBUlWrEEQR/MvWuE8K2SUZw1hY3nZjbZInCEpK0Dde8qRpUMaDBxW1CNoR6IIJTH9TdH+MWeN5AhJ5eQwX3pm/tVjuCDIY3E3QV7SH3q6bfhNubaPUUF2X6v2JLuP+CgdYn0ZdtW84FImEbjK3dw/3kaUsWnn/T8UtI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199018)(33656002)(54906003)(316002)(110136005)(8676002)(66946007)(76116006)(4326008)(66476007)(66556008)(66446008)(64756008)(52536014)(41300700001)(8936002)(38100700002)(38070700005)(122000001)(86362001)(6506007)(53546011)(7696005)(71200400001)(9686003)(26005)(186003)(7416002)(55016003)(5660300002)(2906002)(83380400001)(478600001)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UdKCaj+P0WArm4nj4Ie1DeVcVrlOJaEAPsA347K5FygZMaLlmylXmh/+hUwl?=
 =?us-ascii?Q?c/5iP/Q9wlJvR76e69brA1w/oOrnVZBuYMEPDQ3bwVrYOaPOdmElA6GTF5Ov?=
 =?us-ascii?Q?Yryr+foLM2oXA5yI3wowfRgKqYi0B6q+UHaB8fdXrsJzIBt5FE0AripLxS/9?=
 =?us-ascii?Q?PHUcnBrtv3ZDz6/qEsuUSxoQ0uskpIUqDmwaF+NHobChmFgsgMLqUyWaH85A?=
 =?us-ascii?Q?xWqRQRcsV2PA9K3S6LKW8aC0n6WVT8oqCRy2k2zKxN1DO1p9kLHYAN/PQpFv?=
 =?us-ascii?Q?v1y9H6hA4Eg8jl0ksXvsGw+kuEgSBOdTeXp5wJOapeas2Fbo7RACT8YNfCEa?=
 =?us-ascii?Q?XzG0eHr3sQIKe/oBvocpR2PxZ8o/20uR7tZ8h/uQgW6VXjsh+tj307i2I9UZ?=
 =?us-ascii?Q?y0/Dz908upNFcHrdJywCojJQIQXLkAXxBtqddqvq00Ml0dNkUsh+eReXmwwd?=
 =?us-ascii?Q?j5psFdodfq7JObaOoguAs9Qw5lRRLlH8PzTuYgJ64jwSm5n/EGipWtYN2TJD?=
 =?us-ascii?Q?hY0W10f+bjFee8CKsnhXZUtf+l74ABw+Rw8bLxHcFxrRz61HPVcjjvSj44+U?=
 =?us-ascii?Q?nz4dGgWW6cQcsKqwm7Ub9Ae7XV3x8fHPjF++thbdqTKPvb46KiDVLKE+OH7A?=
 =?us-ascii?Q?GtAp/o54Q6u3vkcCR1xW3EpJYSt0fLrxOchlYZpiekMmPGojwn3tzoOzLcTg?=
 =?us-ascii?Q?QUvGSJMHqrhZ7SYed8Etb4ZUL/z9maREzNMajLRJYc7rbCozxWV/Gm2kBc4/?=
 =?us-ascii?Q?Zki8FRSyfN9kYxmpL+PY7BRPBw1g6S5E41+caVaIkGEhemXixNOcFIhJE4SB?=
 =?us-ascii?Q?OANQZUit8OE5A9FYedgjsvG+IDHbk9PB7ojO+sPL5y17Ya+eg2xKiDOZVSs5?=
 =?us-ascii?Q?GNsfcsztSb9AsIUwVZxde/EX91vTuKiEI2cfkjeJpJLHQM8AnfjHRCwvUEK6?=
 =?us-ascii?Q?kq32o7426qL0G4IToWiK6aLu61hlpHAbIRa3cD4fsofKPv4tSiEw5Mnj+aHf?=
 =?us-ascii?Q?/SFNUGKymyAKoZZX2k/CA8a5LzgEZncyuhyrH1UkmaFtZ9ECpZYpOlCx5Q40?=
 =?us-ascii?Q?NtWzL2dbZF86lyLJw5W76PMrLRTD1MtZmc7w2BhdVw/p7I3E6U6jb1gUaGaB?=
 =?us-ascii?Q?3UzmT/srPXgzFs7f3+8zkSxqFPP5aeNL3POh1ECeXYGksrlyUzC1Jm3AM4SC?=
 =?us-ascii?Q?KS0aUae29jhE6TiDUf7Ex51j1HyZgu3SUFtXoGtMAafhO6RNcc5ctvbH/kL+?=
 =?us-ascii?Q?+IVqmoNPo2v2TDiJpHeMjVOq2YboGVl4tpSU46OYU813dpgiNwwv4pMNW3ey?=
 =?us-ascii?Q?8ryZhWZ2Oa3vkYZLeURZyJX6yyisK0fDx1qG42pIj8BMBFm2SKd2dETGq0Q5?=
 =?us-ascii?Q?ornUJVWgeh+Tu8R90QbkwJY6xeDnucKg38g//VwB+kt4RnS0tuPHb+zyBq8G?=
 =?us-ascii?Q?Hlm3nH2MyxoCR6UoUsEafUq8wSFfJrS+qUguoTlIKipKzSWg0LeT/bi6iyph?=
 =?us-ascii?Q?lwC7lJ1uA+PE6s4c65TrECnoQU52wm2d4JI61F4Ycryt1bdcWwIIAjEUh5JG?=
 =?us-ascii?Q?yp6TiUu4984wzNspSdKSgLRaermlrLQICMmDyyCiuAIhapj59YIdlIiwuSSV?=
 =?us-ascii?Q?yg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667488eb-7549-4498-301c-08daffbe374a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 16:56:06.2512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPNyAYSTsAb1GbnRpV1mf1BiwFxdMG10cgvUyNETUsfWBVj5/VkJzrxhCNV2Zi5N0Q49wU/1E8zpF8EbFwXQpRaogdBy1GlkRHOZ4Q0ergg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5513
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lee Jones,

> Subject: Re: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3=
a
> core driver
>=20
> On Thu, 26 Jan 2023, Biju Das wrote:
>=20
> > Hi Lee Jones,
> >
> > Thanks for the feedback.
> >
> > > -----Original Message-----
> > > From: Lee Jones <lee@kernel.org>
> > > Sent: Thursday, January 26, 2023 2:52 PM
> > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>; Philipp Zabel
> > > <p.zabel@pengutronix.de>; Thomas Gleixner <tglx@linutronix.de>;
> > > Geert Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> > > <Chris.Paterson2@renesas.com>; Prabhakar Mahadev Lad
> > > <prabhakar.mahadev- lad.rj@bp.renesas.com>;
> > > linux-renesas-soc@vger.kernel.org; Rob Herring <robh+dt@kernel.org>;
> > > Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > > Subject: Re: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L
> > > MTU3a core driver
> > >
> > > On Thu, 26 Jan 2023, Biju Das wrote:
> > >
> > > > Hi Daniel,
> > > >
> > > > + Rob and Krzysztof Kozlowski
> > > >
> > > > > -----Original Message-----
> > > > > From: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > > > Sent: Thursday, January 26, 2023 10:53 AM
> > > > > To: Biju Das <biju.das.jz@bp.renesas.com>; Philipp Zabel
> > > > > <p.zabel@pengutronix.de>
> > > > > Cc: Thomas Gleixner <tglx@linutronix.de>; Geert Uytterhoeven
> > > > > <geert+renesas@glider.be>; Chris Paterson
> > > > > <Chris.Paterson2@renesas.com>; Prabhakar Mahadev Lad
> > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-
> > > > > renesas-soc@vger.kernel.org; Lee Jones <lee@kernel.org>
> > > > > Subject: Re: [PATCH v11 2/6] clocksource/drivers: Add Renesas
> > > > > RZ/G2L MTU3a core driver
> > > > >
> > > > > On 13/01/2023 17:17, Biju Das wrote:
> > > > >
> > > > > [ ... ]
> > > > >
> > > > > > +config RZ_MTU3
> > > > > > +	bool "Renesas RZ/G2L MTU3a core driver"
> > > > > > +	select MFD_CORE
> > > > > > +	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
> > > > > > +	help
> > > > > > +	  Select this option to enable Renesas RZ/G2L MTU3a core
> > > driver for
> > > > > > +	  the Multi-Function Timer Pulse Unit 3 (MTU3a) hardware
> > > available
> > > > > > +	  on SoCs from Renesas. The core driver shares the clk and
> > > channel
> > > > > > +	  register access for the other child devices like Counter,
> > > PWM,
> > > > > > +	  Clock Source, and Clock event.
> > > > >
> > > > > Do you really want to have this option manually selectable?
> > > > > Usually we try to avoid that and keep a silent option which is
> > > > > selected by the platform config.
> > > >
> > > > For critical drivers like CPG, Pinctrl we enable it by default by
> > > > silent
> > > option in platform config.
> > > > For the others we add it to defconfig, once the device tree
> > > > support is
> > > available.
> > > >
> > > >
> > > > >
> > > > > [ ... ]
> > > > >
> > > > > > +
> > > > > > +	ret =3D mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> > > > > > +			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
> > > > > > +	if (ret < 0)
> > > > > > +		goto err_assert;
> > > > > > +
> > > > > > +	return devm_add_action_or_reset(&pdev->dev,
> > > rz_mtu3_reset_assert,
> > > > > > +					&pdev->dev);
> > > > > > +
> > > > > > +err_assert:
> > > > > > +	reset_control_assert(ddata->rstc);
> > > > > > +	return ret;
> > > > > > +}
> > > > >
> > > > > I'm not sure this driver falls under the clocksource umbrella
> > > > > but under mfd [cc'ed Lee Jones]
> > > > >
> > > >
> > > >
> > > > Please find [1],
> > > >
> > > > After a long discussion with dt maintainers, counter maintainer,
> > > > MFD maintainer and PWM maintainer, it is concluded to Add the core
> > > > driver to
> > > timer subsystem.
> > >
> > > Which is fine.  However, you cannot then use the MFD API.
> >
> > Is it ok to keep the bindings in timer subsystem and move the core
> > driver to MFD as it is using MFD api's?
>=20
> Sounds reasonable.
>=20
> I guess we'll have to see what that looks like.

OK, Thanks.

Daniel,=20

Is it ok to keep bindings in timer subsystem, which is ok with all the othe=
r maintainers?
You mentioned, "The simplest way is I create an immutable branch based on v=
6.2-rc1 with these two patches and then I merge it back to the timers/next =
branch?"
Is immutable branch required, if it is just the bindings?

Cheers,
Biju
