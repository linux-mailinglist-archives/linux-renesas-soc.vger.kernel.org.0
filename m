Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C95B4611C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Nov 2021 11:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344423AbhK2KLR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Nov 2021 05:11:17 -0500
Received: from mail-tycjpn01on2128.outbound.protection.outlook.com ([40.107.114.128]:41462
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245113AbhK2KJQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 05:09:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFj8Rpp6+Q+bGzrou2mQ/9t0BnFNktBWoJ6S/2UAIxWF0T0ctN4mFZ5C3HXeftFwiO5wELB5NtlEIyyki9RV26f2zDvAAfbTeQ9Xswmcju4Vd+wbcluS6H0PGanZEPeRxqc1ZSbEDOiFj8/0zrezubAIz513zpP2WQ+6mParFUsMd+UdoMq9x5z/tkQ4r0MWQkynmhzDmzqoYM+hB144OvAohKrkTFjgU6T5M0S/zuVhn66qxBWIMl3oe+3IGbposoSAQZ9rruK8c996WRxIzwaxthrFLx4KFCVI/X42ytcMvy4jBh998U05FhAn6XNE3C1ggl7KOcVck0f5QGBgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pywyNrtFUpbAxsDcinbTXLFmYstQAbqTY8FuArGPn00=;
 b=FY2OmD7BvH98+1Kb227m2vlQlm4gvwopjhITilxT+hY0xQRPR06S9nHbK1qnOhpJC3AQiniQk+jwFqD8Sh/2b6WanbIVQLVm0QMTHYRDl/AudvAbfXyhTpPEh9hJlCGTlNWeYTxFj5wHaW+pljVKjpm70usOusIynwHcEI1g3+ql8OQ4RQYxBLzU33knNZqaq/tqingTy8Uahy1L44pmhysHOFkKVtLNM+NAXk/cXWTKVFG+MmKSPCmfOZsHQJLvy6NVpBGE6Q7BdhONYUf9QT/MX5fNVdWVbEq0+PUlqxr1xKIERrg5jUdCPiO9vM0czEsSNgEs6E7f1pY8ch7KCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pywyNrtFUpbAxsDcinbTXLFmYstQAbqTY8FuArGPn00=;
 b=PFMMLaXTJn7quIIyTlg600eE7jPYsRV1Rvg4JYOrErR5SRFZaJ/sF/igfJnzqPcbaLJqQe3B2kyxYGxgEAem4l3A6j1CRgAEHKo88OoVxKtLAteLytmCEfTmN0eeP20wwEo/vlkuJ1UC0JUdqx1GjByN8ko8r0rDLfemOxn4//0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4979.jpnprd01.prod.outlook.com (2603:1096:604:61::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 10:05:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 10:05:55 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
Thread-Topic: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
Thread-Index: AQHX1/VTNGOVE1u5M0uN8s5g60zIn6waXgOAgAAB8vA=
Date:   Mon, 29 Nov 2021 10:05:54 +0000
Message-ID: <OS0PR01MB592240481D7503FFC505BD5E86669@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
 <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
 <c4869451-e879-aa58-29ba-ef3e94b03527@linaro.org>
In-Reply-To: <c4869451-e879-aa58-29ba-ef3e94b03527@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 996d1453-1a04-4735-746c-08d9b31fd52b
x-ms-traffictypediagnostic: OSAPR01MB4979:
x-microsoft-antispam-prvs: <OSAPR01MB4979D5D10CD513A708FA0BF086669@OSAPR01MB4979.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g2cyCRkB5v7VccyOoaAswBBHbAlGVanMAA4U2m5/8VCZ1DO6kcP/9qIxq6J42UU4ptvu6F76/qzueEs2WaKXauDdoiIpZlBmXapvIi9JJ3gFYbEt1tvDkjFPMdbTytF8vwv9PLKMmKxpuTrxRTc018qxMUiMTXJTd1POF0Wb7ckQEv3p2vSjpuPGbt8iChmvt4js2s0+V6Pk4/NqKR77ydBJ3YJbrC4/mwT9TBaOzFWJM9XhgScUyhNeucZnTL92I5HWCbAS1qSBSvuWuYHxeKVHT+sMEZMoILJnNA5UDDSI8qGGROdLzQZ3cIFYKyWHqGvAO9m6+rwRoDewcwK+ZEqSR4Lc2fPaKPJaTnNkq5iACqfOigB/eIzLrPp3BVNa19Hlfi918i3OphGxl3hM0KBFxuT9eyyxywUaJXhNp1lq0hZ/sECXxdXtaY3Zf1hBIRfGy2DKot+Ax90VgRRIZ4leRmWHRYwtSxJT5ms0xaZhb/RCtQbwC0mdxus8KgJJhZSamF1On+Etp16CfuPP0v+wBqv7ggGqoBtZ4BWRVpq9Ptd7aiISl3i66F0hCMXjVeCaTwN2M6CN1oRND+tALoqakLAIH3xkyWmhiVqf8K2o/JoM4FrKjKDFNM1bpa2dLQli7QCFH4NKGutYqAP39h9tP/3Jd/4NJ2AUIyQMun7LAOMxtZFpw1mDiGDSIAdsFdPoSbZ9+pOAs5Ca0WeIml6/H8VOyb+HRCK9F6ysDIgDN+XA7jlNh6x+IUS9+0kYNHDmp2mPOW3MhERv3YpfMjOsjUIE8VBZbgPbtg/RZZY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(53546011)(55016003)(6506007)(66556008)(8676002)(316002)(71200400001)(26005)(76116006)(186003)(66946007)(64756008)(66476007)(38070700005)(8936002)(83380400001)(122000001)(52536014)(66446008)(508600001)(38100700002)(9686003)(7696005)(86362001)(54906003)(2906002)(110136005)(4326008)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?koi8-r?Q?w+qr4FmwmcQwZWfpkBQf2DoKcqveVHzqbdZ/o6pKSRdh5HqPTgHVa192L7hhO+?=
 =?koi8-r?Q?r6T7SmL4ZrIS2fkgk6ks0q3YDrn9qKr0x4fdqbk9tPCaVJPPjB/JJWCm0zOBdQ?=
 =?koi8-r?Q?b45YlEPYiNDH6xkbjbROCmHv2fyou9RlQrA/whdzQhbaOsWe627FVn4bt75p+S?=
 =?koi8-r?Q?p+wWdG+6lqZbhtnISKdOqxRB8pyJ4o5aNM6WDZuL+P/wD3Gk7ig9nz42V62n6B?=
 =?koi8-r?Q?b9OwkflJHoBlRa0mrNl8qBbLuKFIPPrCmUJ5d8VY2HCgnRVJ2SFRTTdllle1sn?=
 =?koi8-r?Q?a7AQLrqakavIFoY9QTgrYtIFH9X/MtRu8vy4XuleSMkoOdHWwHyVugW8i/vAom?=
 =?koi8-r?Q?uIcuHUv8txsPGCkJUTqOGrGJBhsFMeCv825Kn07jei4qX8ZrgiHE5DRwGun2dn?=
 =?koi8-r?Q?kpiO+0P1sVPxbKluU7F/uZMswJJQDaZGDOv5jfl7l6NdX1L1wwen8MHpdh7vZs?=
 =?koi8-r?Q?aFdJM1J3F3MgIq42NzC+sQQksUgq+rkBRR3Dmc6U1e4Q2XgR2iGIkomuBgjRIk?=
 =?koi8-r?Q?ZKRjXvaF/FdngHkuhBka5vlmEsyK6ccxatgKvOBtvVmalc9LWH7xCcyom1BPqF?=
 =?koi8-r?Q?QwsWP+J0nOhzLdizVnlDQwii3thBbq5nFmfDqY5siAobUKRRcyuDr8oiJPbYkU?=
 =?koi8-r?Q?0BY88f8ivqZywvT++iTYvXc3yE8ayE2xNR3vMQgT3aV0lIoMLdWovZ3CK76lhp?=
 =?koi8-r?Q?x1ODnKZeDSd54MxibsZ6ktAHUU1WZjco3O8HaUsRRoKJ9JKfRhpaOBNWnU6XNq?=
 =?koi8-r?Q?L+AANHHCDQrU5jq8PR9YgmmnJPxUp6JOEF/B/u90yrFnvGuAZwgoegQHFCgeQc?=
 =?koi8-r?Q?xDfiB9/flGtRZP+v3pkhn22Y9mLXlYp/6S94rhYKTTVJZp3isPzfpS7ExP/oxf?=
 =?koi8-r?Q?QlFGbSKyAGPqQBJeogI6hNHeQQsLfFeCLfpILB+FGzVW0w9fwMoPXsHiWPdiT9?=
 =?koi8-r?Q?XuHpe4ss4cLb3Vrzq85EpwxdDjmA1c5BpR/C+8XQ29qNdiCQfDZgj1vx15WgPY?=
 =?koi8-r?Q?ihKJ49WWeTkQtmW1SYIyfYrewwtpqlbvCsUqUj4Pik8GOHqpnukoK9KvwJTYk/?=
 =?koi8-r?Q?n5e4eG+aHpB0FgAg0IIdLtJxFbPcL+gJiazEZ0IRkRmRYQCnBX2lLG60wAd0DS?=
 =?koi8-r?Q?FOisWoOraIPh65fX+XiL8TTpQWgJ8r4TkcSKAAAaYVRPW9v0SY61lkSnhkXkrf?=
 =?koi8-r?Q?kYeg3tChiUR2UEdxKPjKHw/7sfkkXc6QvnkT4cN8mBPv42p5O/zXSLNGwvwY0K?=
 =?koi8-r?Q?Q1Xm0du+rSVyvMi47BHj6Z7RQ4YnyeG3WRwV1wFdxkO8PLZ+xB8PE9xJpQRyVJ?=
 =?koi8-r?Q?XIMjQ5TTHXvqW72Lm3CADkoIT/bOO5hq3Y42Jx2MHBm9CF331vIn9rYnXjDqio?=
 =?koi8-r?Q?tOM9qctAqF3KR31dLkd3nyzjNYCsVN91WP5lNdQ/swiO7557kpz4oT3YmWXhQI?=
 =?koi8-r?Q?J+ItnJXuOTQQk7FbqIfkqM7XNauVMnPyarht7A1wZjuVycQ10j36ALd0g3tSv/?=
 =?koi8-r?Q?DD+vlR1RIW7cdKnSqV6cC/rwUQ3qdSSYQc0eP024Jc4ff3iPKm9SJdYc4VQCJP?=
 =?koi8-r?Q?tcnoni820+KYrUkxyiuMnVgf5s2DPr4KWZSaqAQlCwJbhxuce2BhtlUGRiXyYA?=
 =?koi8-r?Q?6JnXNID1DT/g=3D=3D?=
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 996d1453-1a04-4735-746c-08d9b31fd52b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2021 10:05:55.0124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QrV95wqBE5yEsLsngmNY7K7yAx9GF5gytGdnENs7m9zR4q2gNUOH+NhiNefmVdz3Kt3hKbkLP4Bw6c5hUOFaVkL+lP6sW8ZqzspeOjyXhbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4979
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel Lezcano,

Thanks for the feedback.

> Subject: Re: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L
> OSTM support
>=20
> On 12/11/2021 19:44, Biju Das wrote:
> > RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
> > deassert the reset line before accessing any registers.
> >
> > This patch adds an entry point for RZ/G2L so that we can deassert the
> > reset line in probe callback.
>=20
> What is the connection between adding the reset line control and the
> platform driver at the end of the driver ?

The original driver has no arm architecture timer, so it needs to be
called very early in the boot and using of calls for handling the clocks.

Where as RZ/G2L has arm architecture timer and it needs to release the modu=
le
Reset before accessing any registers. So it has to be built in and it needs=
 cpg driver
which happens at later stage compared to the original case, for de-assertin=
g the reset.

Geert, please correct me if I am wrong.

Regards,
Biju

>=20
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Added reset_control_put() on error path.
> >  * enabled suppress_bind_attrs in ostm_device_driver structure
> > v1->v2:
> >  * Added reset handling inside ostm_init
> >  * Used same compatible for builtin driver aswell
> > ---
> >  drivers/clocksource/renesas-ostm.c | 39
> > +++++++++++++++++++++++++++++-
> >  1 file changed, 38 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clocksource/renesas-ostm.c
> > b/drivers/clocksource/renesas-ostm.c
> > index 3d06ba66008c..21d1392637b8 100644
> > --- a/drivers/clocksource/renesas-ostm.c
> > +++ b/drivers/clocksource/renesas-ostm.c
> > @@ -9,6 +9,8 @@
> >  #include <linux/clk.h>
> >  #include <linux/clockchips.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> >  #include <linux/sched_clock.h>
> >  #include <linux/slab.h>
> >
> > @@ -159,6 +161,7 @@ static int __init ostm_init_clkevt(struct timer_of
> > *to)
> >
> >  static int __init ostm_init(struct device_node *np)  {
> > +	struct reset_control *rstc;
> >  	struct timer_of *to;
> >  	int ret;
> >
> > @@ -166,6 +169,14 @@ static int __init ostm_init(struct device_node *np=
)
> >  	if (!to)
> >  		return -ENOMEM;
> >
> > +	rstc =3D of_reset_control_get_optional_exclusive(np, NULL);
> > +	if (IS_ERR(rstc)) {
> > +		ret =3D PTR_ERR(rstc);
> > +		goto err_free;
> > +	}
> > +
> > +	reset_control_deassert(rstc);
> > +
> >  	to->flags =3D TIMER_OF_BASE | TIMER_OF_CLOCK;
> >  	if (system_clock) {
> >  		/*
> > @@ -178,7 +189,7 @@ static int __init ostm_init(struct device_node
> > *np)
> >
> >  	ret =3D timer_of_init(np, to);
> >  	if (ret)
> > -		goto err_free;
> > +		goto err_reset;
> >
> >  	/*
> >  	 * First probed device will be used as system clocksource. Any @@
> > -203,9 +214,35 @@ static int __init ostm_init(struct device_node *np)
> >
> >  err_cleanup:
> >  	timer_of_cleanup(to);
> > +err_reset:
> > +	reset_control_assert(rstc);
> > +	reset_control_put(rstc);
> >  err_free:
> >  	kfree(to);
> >  	return ret;
> >  }
> >
> >  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> > +
> > +#ifdef CONFIG_ARCH_R9A07G044
> > +static int __init ostm_probe(struct platform_device *pdev) {
> > +	struct device *dev =3D &pdev->dev;
> > +
> > +	return ostm_init(dev->of_node);
> > +}
> > +
> > +static const struct of_device_id ostm_of_table[] =3D {
> > +	{ .compatible =3D "renesas,ostm", },
> > +	{ /* sentinel */ }
> > +};
> > +
> > +static struct platform_driver ostm_device_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "renesas_ostm",
> > +		.of_match_table =3D of_match_ptr(ostm_of_table),
> > +		.suppress_bind_attrs =3D true,
> > +	},
> > +};
> > +builtin_platform_driver_probe(ostm_device_driver, ostm_probe); #endif
> >
>=20
>=20
> --
> <https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.l=
ina
> ro.org%2F&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7C6a3a066ec7b=
040
> b4676208d9b31e1c26%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637737764=
1
> 83838352%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
T
> iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DHqvzD3lqCDlhyh1cQfu5Asa09jz6=
TJ6
> vLWYBNtQU6iA%3D&amp;reserved=3D0> Linaro.org =81 Open source software for=
 ARM
> SoCs
>=20
> Follow Linaro:
> <https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.f=
ace
> book.com%2Fpages%2FLinaro&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.renesas.c=
om%
> 7C6a3a066ec7b040b4676208d9b31e1c26%7C53d82571da1947e49cb4625a166a4a2a%7C0=
%
> 7C0%7C637737764183838352%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
I
> joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DQ89%2BeIzRBr=
UF8
> PM1yOmQJGdg0gv1BDZLkHsEQIsQTq8%3D&amp;reserved=3D0> Facebook |
> <https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Ftwitt=
er.
> com%2F%23!%2Flinaroorg&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%=
7C6
> a3a066ec7b040b4676208d9b31e1c26%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C=
0
> %7C637737764183838352%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
i
> V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D2FNqNGFpFA%2BHr=
Axj
> mtbsStWmK5Y7T87F0MzHn8uQoK4%3D&amp;reserved=3D0> Twitter |
> <https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.l=
ina
> ro.org%2Flinaro-
> blog%2F&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7C6a3a066ec7b04=
0b4
> 676208d9b31e1c26%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63773776418=
3
> 838352%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I
> 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DQd0urMYGtY2UBxYyQwhwLYgwB%2FZj=
poA
> %2F9weINf%2FVIMY%3D&amp;reserved=3D0> Blog
