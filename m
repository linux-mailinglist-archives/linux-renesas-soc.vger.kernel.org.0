Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16F8463A3FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Nov 2022 10:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbiK1JDB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Nov 2022 04:03:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbiK1JDA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Nov 2022 04:03:00 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2111.outbound.protection.outlook.com [40.107.114.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70DE767E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Nov 2022 01:02:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFzctS6WgiMvcx2GJPRWneupI7qw8W1+nri+px+Tf+SpLKFyABXmlzc7dTii5JD6sFia1eqZsO8ZJCKqJh1o2ac/6+/+50JZIhBmd9KeJ7eT2x6hivGXTWDVTMvrsqU4cL69Z/8h59F4rCcC9u2fr5ohj3j1kZBGfck65fWmFJTwWXU4jFmG+r9OFwOJ+KJQOnfE9J8JY0ChoPgfKqMquQzYoW3w2CDeGWBIGpRXQcGnCRIDRqU5QbGD8NfDy5eN1M8iRFntXRLbzV6Y9e4PgGCzE8+ElnpWaEg8im8WLlH1A+bN1c6sX8ixgXdrqNlj2wDP6X83UlqBPnVbAsBYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfRNujvPCh2G0OHqV2AxwWkPdr/4RMskU4/QwxOxfQE=;
 b=Of8WEn2S5AOqfg0mqqeUyXpwLzsWjYfANMza+5Bhxu5yCuOmEyAOEBAVGMEXYLkYnQf9aRe1QjIZytvmzQ5rQrGdQNUOroeEWg0dS7qxHo09+SulSIlZRQDwVtXSCz7Fv9TIQFWsamr1iXlpJY9wXVkHYrEkj8s/jbk9azfgJ/lqtX1WQEm2BIa5tsFq2b7DxglQzxrVQ2W9qMKslBmXlDX8SId54S8MI5jobWrEZP3TiFjptq99e1puqpUBvyAIe1uFUuJJqp0qG8DUEq3bGqv126ls7KFnRMGhiQDP/ZhmisnPEu7EdE6tfO+l7pym39sKPAPGMY3LAVycrf8jhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfRNujvPCh2G0OHqV2AxwWkPdr/4RMskU4/QwxOxfQE=;
 b=D3jxcJrUgAUBwkdI3/ECewez6Nb4nz2Ut1ZgnKiJ8OSwZwDVA4Ujv0/O4S8iuXIx2crxdp3HWDHbwK7NZJQaffj9ARqWJ1rQUc63lL03HkiAPUDg/ExVyHj5SrFx5ge0Py4Yu/oeHKjw1PnrsjJHaJETiUSoz1nD88OdPTrsUk4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9448.jpnprd01.prod.outlook.com (2603:1096:400:196::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Mon, 28 Nov
 2022 09:02:56 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 09:02:56 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        William Breathitt Gray <william.gray@linaro.org>
Subject: RE: Regarding clock event driver testing
Thread-Topic: Regarding clock event driver testing
Thread-Index: AdkArJrKvDyZvzK5SrWcU5XSVDoKPQADzR0AAAGo0IAAkR/OwA==
Date:   Mon, 28 Nov 2022 09:02:56 +0000
Message-ID: <OS0PR01MB5922D38405816D6A4483F62286139@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB5922C23B892D938AD1675C9C860E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y4CeFrBzfUkNiV3d@ninjato>
 <OS0PR01MB5922C1D7276EFEEA753EA734860E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922C1D7276EFEEA753EA734860E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB9448:EE_
x-ms-office365-filtering-correlation-id: 7bd9b6b4-e1e5-4182-d2a1-08dad11f5720
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XPtXeNSr1ea+jb70SkAVPgCXwg4gPvrUU/+2srdtpFkyJWh+9tAv6J9ul8zcVhS9mNonTArBFSkShJtmyZEctM4e1RCmQ/oaq9WUbU8SaJ0hJ/5maTVgyR4Zm9x94Mk9IFXz+/Fdx+yPdmd3jJOlnCIfENVUh0vwlge3o7cHMG2mcGGwKxaDBhA0mfV1DyeByISDwI8qQ4LScGmmISXPILUwUBh3aityAYt1cZQBt3nLtolWZUxq/qXaq5UDCnckrL1QKr6xz/XHLv3Xdlu2+6BlFZrRjebDCwoq8KMhHy1evhELztgd1a+we3Lp9P95SqdXuIwMZF3qIP/F3gaJR2MwCrFtuG9wNx27ZCa9w226u7aO9RhaMKSvcWzuosIMWXtzLBLyaF1sFK3q+TZeBiHcgVnS2xlE9QA0q5OhT1/HyvlGJLOBOjUbSvNVJCCHSqGvoxfNhQuz303Odfunt+p19vkX4+AfLTF81rkDKPPUpuGpN4RzT5WLmDomOU868j4tGYY8cErI71IyWYRXYRNG5QlMEy+69Cx040NaH6Ii65ycHE+IXkl2MlakzHrThsgu1Y9peddkg44uHvUkZ7YsDBPdB+ADX0KklkbHqOcl7+daE5+hrr+n17lPeJn8omIhUiJsMAxDG+l4oSmgn+QXyUVNBivvViU56DnSwrFQ2F3/1IjTsqfZ/frv4bidTSEquhn0mGZm3Xw0otRkH08Xyf5g8YCJxRP6IbmPhwAJvUXXD1ceBieeZBCKi2O8aQY8xaDRJYHbCnbXRa2N8w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199015)(66556008)(8676002)(66946007)(9686003)(64756008)(66476007)(66446008)(86362001)(4326008)(478600001)(55016003)(26005)(33656002)(966005)(316002)(54906003)(38100700002)(53546011)(5660300002)(2906002)(83380400001)(6506007)(7696005)(71200400001)(8936002)(41300700001)(52536014)(122000001)(76116006)(38070700005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MpCJMYXFT/l4NHXeKzmO13Ns8JpGZTOaSaO2Rp1c/2bfluwQRqER9eJLFT5R?=
 =?us-ascii?Q?+alCIt0bqVaXhsApmd1WyrqzVeZRGl1GqNnWyklNIxtawBfIH+5ZA20Z6UKB?=
 =?us-ascii?Q?3h6KNeYsERBFWpN1FFMwHgK4Bh1fyZDLW5orHRqBrBDWYU11iGnYKSXY6VaS?=
 =?us-ascii?Q?wva5OB18WunujIZQF/AgFrYJWTOZy0RuZL7EOX5aRLA7jbPz5n4UanmmoylC?=
 =?us-ascii?Q?U1WIh5wPkd2He0fraG9tUXUQuR6ySpNwSzw7T5zGy8EGHX3N+74EmPGDugR0?=
 =?us-ascii?Q?Xb0L+HTGzHm6ggCzmRRY73KgJK+hoaSEQUdJ6PMeKuiUkzakUctkd0oOySty?=
 =?us-ascii?Q?/N2tSCOLJNrTPVPS/Hc8TQuA/D/LmJ0cXoGhLL4/BEQQ4pUT+fxj5LizKZSZ?=
 =?us-ascii?Q?7mmQ7QRMbwdlX6bgJGfKGWRsISCmUaUGHY7AFLZ4KA46UIkPolR9K5tkbIGc?=
 =?us-ascii?Q?jTK6t5lw8horWj6vxZPoyBFY5YUU6ULTLQa8uGbcXESDf9pdaePiGU+IwBQc?=
 =?us-ascii?Q?NAsMg55nQHAQxw90qWGuA/5SzzDydts9PdxPzrscvflFBshc5Yusr2nB+rYL?=
 =?us-ascii?Q?BpCSQKpiWaom2ahy/uba6XOCmYBd/3J7yHobOEl7JrKaWZlHAeATRux0RGD9?=
 =?us-ascii?Q?J8nKnTLpveGZIABIuFSc6q/j03YyL/RR6vNKsT0N4IxA/C6LQUytNwEL3uZ6?=
 =?us-ascii?Q?ZLlWSZFClvCEccc+5EL0rTCFgV8qS2F6uOlOz6GRWBp62JUh7/cBvarEJW0J?=
 =?us-ascii?Q?Qk7J3Ji/5BAumRlOf+q371PNbZgpYpesijcgXa1YXb/I0UDsEq6ITlnZsCI6?=
 =?us-ascii?Q?94yRwXTtOEtgmk7gvngD0n6YsyXgGlSN2kkgAEpmDfXhJe4VzrvAJ5AysPKm?=
 =?us-ascii?Q?+zSbFbkM+m/5sc/kus5sazKWg6H5BGQiMq0A38Uu0F2ScLcS8WgHV94dQ5wS?=
 =?us-ascii?Q?K2rAkJOrKuW0exAiwpJw39ghaz2uXcgYTuY42WyAsJO6GgiUbbl12GJiCeIf?=
 =?us-ascii?Q?nh4jIyq1bv8BM7f9Oo56dKQZYeBq39dcDouWzeJFa51ggSqzr1dxTwxFNdpU?=
 =?us-ascii?Q?IOXO8qlHDUq+pn6i86z3wIDM0PzSlhlP1mx5E5Myolex6jzr30eRnUHNmYs/?=
 =?us-ascii?Q?uKzFJaWGlnxfDb/NurOnzWWZn2rX7u0xV9KG52m6zxLhwcatvr0hMmDaHBOi?=
 =?us-ascii?Q?/ury4IFe27OuCNyEwMqhuyCxj1vECOHuvx3JpGQK/QzpSzd07wzdokSZCOnX?=
 =?us-ascii?Q?hYo8KU/L/h3b4P/j5ZPa11mLfhLBw1O5xaGtdqUH4wmrkSD1rVryq5V2WrDi?=
 =?us-ascii?Q?0VvlkZQfv9HSgaVOd8M6Cpek+MMPm2lSslLxM9qUDXm7V4XvHwoM5fZLWyUY?=
 =?us-ascii?Q?VmTS5i2OBdXZe2Suuur0/ac8P0VYuYA37BgnQQCaEhw0ra85qHiXqCak5MzI?=
 =?us-ascii?Q?eGhDX6XJ/tP/GRJ/iBJ0eC0Vv8w3LEGlzD2a56EGvRSyT0cfGwAT+RcRgRA6?=
 =?us-ascii?Q?XCFZvso7ht2pYN9e/kO8CvWcZWYe3D39KSq556xIiSBdFNT/rJ6pAH4MKl7s?=
 =?us-ascii?Q?BcuI+5KebHIoJu/8W5tbPXArhQuPMbJLcCapEPJrKc7R+U310zlW4yv3RFhP?=
 =?us-ascii?Q?Ww=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd9b6b4-e1e5-4182-d2a1-08dad11f5720
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 09:02:56.1838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mzv7jsaXjjTNnGLKbsbVCZRF2utoNDJHUfQ961ccsEiw5rmR/dL/HjVwVp9J0LtG7jjGvcInzRRfh9o6f3dm3sfPkpi7NpaIl0YOjY04x8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9448
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Just an update, we could use counter subsystem as well for testing timers.

For eg: RZ/V2M TIM has a 32 bit counter with interrupts.

Basically, it needs, counter values and interrupt notification to user spac=
e
Both can be achieved using counter subsystem. In that case we don't need to
assign all the 16 channels to clock source and clock events in the timer su=
bsystem

Just use 2 channels 1 for clock source and 1 for clock event and=20
Other channels to counter subsystem, so that it can be used for various
Purposes.

I am going model TIM as timer and counter bindings.

I have modified [1] to test interrupt notification and counter value

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/to=
ols/counter/counter_example.c?h=3Dnext-20221128

sample test app:

for i in {0..13};
do
	echo 1 > /sys/bus/counter/devices/counter$i/count0/enable
	echo 10000 > /sys/bus/counter/devices/counter$i/count0/ceiling
	echo "########## Counter channel $((8 +$i))####"
	for j in {0..2};
	do
		cat /sys/bus/counter/devices/counter$i/count0/count
		sleep 1
	done
	/counter_example $i   &
	PID=3D$!
	sleep 1
	kill -9 $PID > /dev/null 2>&1

	echo 0 > /sys/bus/counter/devices/counter$i/count0/enable
done

Cheers,
Biju

> -----Original Message-----
> From: Biju Das
> Sent: 25 November 2022 11:41
> To: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org; Chris Paterson
> <Chris.Paterson2@renesas.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>
> Subject: RE: Regarding clock event driver testing
>=20
> Hi Wolfram,
>=20
> Thanks for the response. I will check.
>=20
> Meantime, I got a way to test clock event device.
> Hacked the driver to make the channel as clock event device rather than
> architectural timer.
>=20
> +       ced->rating =3D 500;
>=20
> Cheers,
> Biju
>=20
> >; Geert Uytterhoeven
> > <geert+renesas@glider.be>
> > Subject: Re: Regarding clock event driver testing
> >
> > Hi Biju,
> >
> > > On RZ/V2M, we have 16 timer channels. First channel we planned to
> > > use it as clock source And remaining 15 channels as clock event
> > > devices. I used clocksource-switch to verify Clocksource
> > > functionality. But
> > currently I do not know how to test the clock event?
> >
> > I would love to help, but sadly I can't. CMT/TMU haven't been changed
> > in ages. So, when I upstream them for new SoCs, I test basic/slightly
> > advanced functionality with 'clocksource-switch' and assume the rest
> > has been tested before. I didn't test clocksource events. Magnus seems
> > to have started something, but AFAIU it does the same as your devmem
> tests:
> >
> > https://patchwork.kernel.org/project/linux-renesas-
> > soc/list/?series=3D&submitter=3D19&state=3D*&q=3Dcmt&archive=3D&delegat=
e=3D
> >
> > Sorry I can't be of more help.
> >
> >    Wolfram

