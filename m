Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6D067C989
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 12:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237195AbjAZLPD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 06:15:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236972AbjAZLPC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 06:15:02 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2114.outbound.protection.outlook.com [40.107.114.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBFD10CD
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 03:15:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFc6G3KP7o0QWWzAs8SvvValv38oJB/drASU1b5WFtMHD4q0S9HepHE8nINyPD+iLfjY1pB1I7UWY9pmVcPYSuCQuiKUxoP+hq7aJDZfgxZKGyehIu9fOhdRC7VTHWusgN3VXeB8X86TlfrdJ4O9W1hlV+wbUELrZ3zAxHxs9/j6UCbWOIcMBrPzXrI5AQBLXzsIYQIyg0y9dUamwjU8Cf2Hod9t/Tsq81uZQRgMMO9q1i1UUNlIRAvN3pIXiq+yiecxeCYw+owXEiub5xo0/1LnTqDFd/vO2phaovdVOTPfVU/4cZCdTq4+CvRnSEmKsHcaZaVeuXnwLOPzlL71Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzFCF23T108+Q1YQNhhWaMWoeP0jQta50SAxeP8rVGE=;
 b=K/IwHyBF5BWFXgTVVr/wqpajbQ5XpPFbV7VuxJN5H6uMIMNcEGOOoeoQ3Xtx53x5frccjn159xYktDyuXCbnQgiyXXNNKJhnXb6i2Yq+ppdM4KH7NDiq8YwAUkf3capCUOfV/CVUzAiS9csrS2vH+pku3erqxnX8yuR8OI9ls6k3LBdE/zJo/1JEaPmaYKKvrNs0k1r6vVCAn1/qv8VYzAJf+z3V9jlitImW5+LLps9IQ6AG4C6HHnFV8IHk9qAeFR1MM9op+ZNMHdSbjxme501duAMCZOW7XXkN6xmLbsKTx2qIjoSROxkoccymikYa4FO6HM35IBAgK3RuWZvEvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzFCF23T108+Q1YQNhhWaMWoeP0jQta50SAxeP8rVGE=;
 b=rUWkv7RLa1zyAZwPpfV65hIseEilf+/aExN1dmjjQA3HuwW1lsNOaJ4Pwjsf/rokypDJoXaAY61kDr+5Nm8akv5GopRMhvqNq+WDVQDFUbaaoqamfRRvIKGAR6akpFouxmPTqm50GMakSLwzADxwLwzISShh0iAxPJExOkETjpg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8869.jpnprd01.prod.outlook.com (2603:1096:400:16c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 11:14:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%6]) with mapi id 15.20.6043.021; Thu, 26 Jan 2023
 11:14:58 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: RE: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3a
 core driver
Thread-Topic: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3a
 core driver
Thread-Index: AQHZJ2qh0xCJ0ka0qkO8eIRJwRDaI66wmfQAgAACtkA=
Date:   Thu, 26 Jan 2023 11:14:58 +0000
Message-ID: <OS0PR01MB5922F1D5EEBE6D5B24F1820B86CF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230113161753.1073706-1-biju.das.jz@bp.renesas.com>
 <20230113161753.1073706-3-biju.das.jz@bp.renesas.com>
 <9f722f37-15da-0384-c059-a4af0f1dab10@linaro.org>
In-Reply-To: <9f722f37-15da-0384-c059-a4af0f1dab10@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB8869:EE_
x-ms-office365-filtering-correlation-id: 4dc2dfde-863c-4f67-40f8-08daff8e8f57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1tleBfQEnJOuYTqc9Gc6EumbrQTokjo/mH4vBC8/JqinWFXGVPayFnsDnmNrZBhxvVrLGTmyqLGrj72E6gG3XWqvgvtGimWESwvq4tpNCvBPT2QWoRE9XgNJwhDwWxzlpbSZz3pnCfo8T7rDybDsD86dwYY6IYFB8rk5N9/kQAkZRuA2/+JdUoZEZEmvOpb5tRHC6IowVYueAi0bk2uFDxXfGT6E1ccKibwqIjoQrxya+eZ/HgHAaEWq+W0qxa9I/5I79aNUHAHOHgQuqAfpSrq/fsYbk/kacnaiUwfDy9lpGwzX6q4IsU/Q5ukJokSdljis89Ph+hDOqMc4ie5/9ERQJ7OVPRgU+1KwZXDboklnT/7IEqktLGywT3IdznFn8su2DW5avmjgQSrWSctXEO++zmrXwJXXrZbmXdDTv8+0cquzBV0vVipzK8Wox6Ot//C7SQFPsd7yssLxBNqOc/Ca75hwU4PQYXwnMgSF2Nd2OB8invqWXMs6nUAo6ISWH4uDP6/mvGjTzLIfYCU5NP7Jh/5Cfu9aekbImMvQcPizLN/YIFHQHcpp7BwwVMEZ6nMogxdOWKa4HjFAc86OEF/m+MarFIYFWXOWARgpiE2ZnESM57TV7kGnKjr+6cs954zoIxqigiySsxIJpo+sD1RITRBBLgkEc6jh8KicEzyk6AVfnH9N0HrCVsA0+Yo98I80PgwvIMZ92AkFawr3cyHVOcR2yxCsKVf9BqtMEtYiraPyx9QxonsICJXqSb9h
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199018)(83380400001)(33656002)(38100700002)(122000001)(26005)(478600001)(66446008)(71200400001)(54906003)(8676002)(66476007)(66556008)(64756008)(9686003)(38070700005)(76116006)(66946007)(110136005)(966005)(7696005)(41300700001)(53546011)(55016003)(86362001)(6506007)(2906002)(5660300002)(52536014)(316002)(186003)(8936002)(4326008)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HPc0o1hEWs4GHTUineCrBJBQkaJyEdgQfH1NXnUMC3NEf2YbR3UJlnRek47p?=
 =?us-ascii?Q?WDkYLTAxbbbxvzEqS1XZbTbW4nkUYR7pDMabH6Q+uHNJoC83EBIHtJfwmDuy?=
 =?us-ascii?Q?Fp1VTH4qtrksbNBN0GVuo1cvK2EoxgzeeXv0N621JaeatdR/lygHuod3o/gJ?=
 =?us-ascii?Q?q/Fcy6f0R9bOCB3Lr0KkRfOYL7Odge1VQyw7+cwJRKfFHq8z1lMXbFff24sl?=
 =?us-ascii?Q?HU8CREuX78LjL1ry2rY7mpb6uQuo1Tm+yP1pDIITfX15Bwu8QRWYYAb4YtWa?=
 =?us-ascii?Q?ux3ROXQmC8Bmubg/1NJNQ2zRH55voQi40ftsxeYshGsCgxW/XBXFszP1XERP?=
 =?us-ascii?Q?poy839G6HUFA0C881ftanTsltFPctYnP19mXSDrRjpGdhKv6DsyklTfZw/+T?=
 =?us-ascii?Q?i7tyzmS+zy/QRloC8GAZjom/8o++ph2QlN3Rofy8giW6nhNxBUHHX0TnYYXg?=
 =?us-ascii?Q?dZRSOtamRXICUd+93tXZxCtxDL5/LD9m/CoCfPUmJe6ToHxQpiFo18SUjLXo?=
 =?us-ascii?Q?eDEmRhcOMj3Oov4rtlQDO03AEI6GhWBrHRNfrFJYIlTbGPL3DyqTyqD0UJqk?=
 =?us-ascii?Q?sOjYsX1IJsNXvCoNwT1KX8O9eohlJ13/DlLLsJ7/pcTOoyDaFR0O3KFoOU2u?=
 =?us-ascii?Q?7V39D1nLWZpPsT7jS3vQ5mDVjKD/CyimtwXu7wy7RWOGOkVOrOGo3QTPHESh?=
 =?us-ascii?Q?8vMTQgIApShkNLqR38QIWp2tLq1AUsmA8h477adhzSZD9BGmDSYDW/EL5z0Q?=
 =?us-ascii?Q?4diRfCelaiZTZLFnPXJn4QsYcQ+CtjOvn4IvCDwYjGOUPdzKzCT7l/PER2WW?=
 =?us-ascii?Q?P3UgYHVnOjKMsbQNkOqmsKaVGIQO5K1mjPQQhupz33v+1DrHrQc+Uy5dzMpz?=
 =?us-ascii?Q?Hn3zpQSTxeL1f7WepHnxhqFnvssjebizPSQ1x4qKqVHmNBDbNzzk7IEM3EW+?=
 =?us-ascii?Q?CsU6Lmvh1rYPxe/WeR4E1RdOQCSusoNfdMXaJjSruryd4NZ9DhFGGdIGTlz4?=
 =?us-ascii?Q?mqBGJHB19kkU8X6QzvqrLJPpuAaq0CMNLOnRWpYBer9bvtz8UyYMWU4IqLD4?=
 =?us-ascii?Q?Q5ZqnlokSO4hthH6054yMetLppi4cKtpp+trcG8qZsbxtt+MFwRUGLQK1dJG?=
 =?us-ascii?Q?WrMeBDx1/jU9omQIaVPAMQ6AW1/UY3hHHOo2Lt7hzOYq6Lrkh9SqF+MJ/UEU?=
 =?us-ascii?Q?7RQZ55x8IbTOCamEHUBzDdgeOAgkXQvTLdjO4RdS0AXffblj/zDc4QrZpI/z?=
 =?us-ascii?Q?MDhq4TvpKTxBnpfSze9yOPK+37IH1HNo1Va82FMWCDB7ocJq3FipOn3PAoqF?=
 =?us-ascii?Q?KCYOalMEOO9i5AMxD4UG7TukUFthpQzsGY7iFmktNKgDOr1m7zwSSTsixJeT?=
 =?us-ascii?Q?+NRuEipZn/ZnNrn2K53krGUx7pbLjVc/PUY61hitCPCjOaR/1Lrdyw3ewm/K?=
 =?us-ascii?Q?TC0Kqu7PfMfnMwfAeIhY040s4XIuAmjq8c8mpFLgsBEbO8sImReKxW8XpX2O?=
 =?us-ascii?Q?dUsBK+fFs59IdziKKAE3UhfOpIsF6JDeS42ROJ6xCilspu0btYeIbrWM36Ax?=
 =?us-ascii?Q?rnvVF4MydfwG8VoEW5ELLNf+FQ79JzuI89bmXd5ECYBKUxF3Ln1IahYlTvzd?=
 =?us-ascii?Q?9Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc2dfde-863c-4f67-40f8-08daff8e8f57
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 11:14:58.1333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlKp7LsnhPA5KqBpDsT5J14/QxPFN3/L2dYtR5GA8xRSFZ6Czq5Z44Zy6GLXtK35qy0HyG1WS7vq1iWzUYUJSF7UNrg5/POMpKUxidtmowU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8869
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

+ Rob and Krzysztof Kozlowski=20

> -----Original Message-----
> From: Daniel Lezcano <daniel.lezcano@linaro.org>
> Sent: Thursday, January 26, 2023 10:53 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>; Philipp Zabel
> <p.zabel@pengutronix.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Chris Paterson <Chris.Paterson2@renesas.com>;
> Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-
> renesas-soc@vger.kernel.org; Lee Jones <lee@kernel.org>
> Subject: Re: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3=
a
> core driver
>=20
> On 13/01/2023 17:17, Biju Das wrote:
>=20
> [ ... ]
>=20
> > +config RZ_MTU3
> > +	bool "Renesas RZ/G2L MTU3a core driver"
> > +	select MFD_CORE
> > +	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
> > +	help
> > +	  Select this option to enable Renesas RZ/G2L MTU3a core driver for
> > +	  the Multi-Function Timer Pulse Unit 3 (MTU3a) hardware available
> > +	  on SoCs from Renesas. The core driver shares the clk and channel
> > +	  register access for the other child devices like Counter, PWM,
> > +	  Clock Source, and Clock event.
>=20
> Do you really want to have this option manually selectable? Usually we tr=
y
> to avoid that and keep a silent option which is selected by the platform
> config.

For critical drivers like CPG, Pinctrl we enable it by default by silent op=
tion in platform config.
For the others we add it to defconfig, once the device tree support is avai=
lable.


>=20
> [ ... ]
>=20
> > +
> > +	ret =3D mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> > +			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
> > +	if (ret < 0)
> > +		goto err_assert;
> > +
> > +	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_reset_assert,
> > +					&pdev->dev);
> > +
> > +err_assert:
> > +	reset_control_assert(ddata->rstc);
> > +	return ret;
> > +}
>=20
> I'm not sure this driver falls under the clocksource umbrella but under
> mfd [cc'ed Lee Jones]
>=20


Please find [1],

After a long discussion with dt maintainers, counter maintainer, MFD mainta=
iner and PWM maintainer, it is concluded to
Add the core driver to timer subsystem.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2022101014=
5222.1047748-2-biju.das.jz@bp.renesas.com/


Cheers,
biju

