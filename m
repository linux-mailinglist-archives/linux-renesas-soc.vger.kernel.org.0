Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D56456CE08
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Jul 2022 10:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiGJIqy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 10 Jul 2022 04:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGJIqy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 10 Jul 2022 04:46:54 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2123.outbound.protection.outlook.com [40.107.114.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D971A11177;
        Sun, 10 Jul 2022 01:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfaYS/JDopcBbHD6gnwnQUjaKcqHzTuvNDLOnQP4mmyhLQ42bnmEVUCTh4Thq4buwkwgP7N24SJCbqBT006zskOscyX6Guz7WbeAKkG9/LPjT6CMHmgsFLf3MvsFupKxuZBWdNEXn3lRIoaTV5e+9IbN7zfzzgMyTMfmXD7i/ZAbwCGNt5csNQF8o0PcvoRz1b+5AI1ahJW3DLyn4tzJgnl8hBJ3kzYHEg5x+WpgBLV3OL3/ztMtTIjzCbefF3+dF/tb6WYciElaJCABpyO5/F0dmHwTNzvIMTFBYl+F1RWgLRpLB0B/NdA2iwcWoXvc/qnZVCodmqurtSMwGpZBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glbaUAH5x2g8Aejq/gteA4MfVVYGctJBMaI7y0Vsk+0=;
 b=A+1rJGyQc6Ja0/Z9qhkekZZvK5v8+mla/YvYrVbVzceZtFHpTvJc0vX4qZfHpWp0T0/jybwPpE0wgF9fBfQhsoWNjcglNCLY144sh7F+Ms/pQ8bNHMooT5AUyH6aJHTZTi6ror+e9lrgS33kipeLL6iU2qP8+HjH7RIl79n9EfJ/2RNc/cB1nb0eV8TkDr3kfutv/AgQBwiwFTIe6Z5zhSW862QBdNZFg5jNq2EH9Doqxs4KnNCj5lqres0oxG+LxMKo1ECJBb+VXtz9gS17pisTdqIXiDvKqquJbLGSkCBpcpdY/vY1WQSYIyzblQkYNpWloK5zEKuqtGYZNpSPrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glbaUAH5x2g8Aejq/gteA4MfVVYGctJBMaI7y0Vsk+0=;
 b=RETNYRyoVIlvBkZJmoESWRe356QHeBmY8Nx3gbMHwkdZKYxDuCWRrQg9hCb5n1EoX/JwKakMRiHJ3PuJE6RZnberOc599sA3Y/STNCRAyiX1L+DdxVG96mNF7VfFIB01OkAzrA9iCaM7sgGW+T5gPVWbMRw4MPV5PfcGpZ8NlXg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8668.jpnprd01.prod.outlook.com (2603:1096:604:19a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Sun, 10 Jul
 2022 08:46:48 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce%8]) with mapi id 15.20.5417.025; Sun, 10 Jul 2022
 08:46:47 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Johan Hovold <johan@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] serial: 8250: dw: Fix the macro
 RZN1_UART_xDMACR_8_WORD_BURST
Thread-Topic: [PATCH] serial: 8250: dw: Fix the macro
 RZN1_UART_xDMACR_8_WORD_BURST
Thread-Index: AQHYjFzicLJAOXueakmTUlp0Tbrj9q1tx+UAgAAIuvCAAYRegIAANeKAgAB14gCAB0td8A==
Date:   Sun, 10 Jul 2022 08:46:46 +0000
Message-ID: <OS0PR01MB5922893187635B2F128CA93B86849@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220630083909.4294-1-biju.das.jz@bp.renesas.com>
 <7431817a-ed5e-1de6-9f69-fda2c1907861@kernel.org>
 <OS0PR01MB5922F80CCAF4DFA9C2970FB686BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922189B75A4C3A93BFE273B86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VfBPou1TLk4ygsqF3VSJV84_UQLpwSojELsOt9F42Z_4w@mail.gmail.com>
 <20220705163156.56ybg35w3ytdmhgl@mobilestation>
In-Reply-To: <20220705163156.56ybg35w3ytdmhgl@mobilestation>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a813978a-ecf6-49cf-7930-08da6250b932
x-ms-traffictypediagnostic: OS3PR01MB8668:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EUJotFxcOWnWxreyA2N4Y9YOH7X+EMZynCgXgAtkYjltHca0kezBuSF5ZaU+23NLuZ598uAjBhZQ5EgBvVBJZ/Dt/gxQA8rVG3KFProELWolqo8tNO19yoa20nwIVXQa5yLazDt5YqsZ+zH6aOhdDUGFsTah7yIYu9vieceTyW4Rz8bNLIfwPasLmIN7zMsAYAwCPCNr7LERnit42iU/TQT8S95/QOSTJBR33U843ovfe7auzTQwGn9vc4r4ixBqfUfWLNU7rlpL+8WTzk2B0MOX5HT3UMtNzro9uWG9hpyLhmZqSKPficWRNj6VAj61jwjKMGW40/I6QVLG7N4AyoXqCgTunKDkCiB6karZcSKkSXiDMHwcEZs92fFn/2cnJlRTglYdg2VSunDVpubJQKTXE6ELt91EZ66ONfFYwZdfUowi80T74lFSsD5kg3NhnZlGyMpY30Dj0M9fLkSRWPBfVCl92/1cYwElHX8BJOteDw+Ck1VEXJIx+J898WVBftvSDgBPtHAa5EYWSqxdnL+tMTLb1fFxRZoUjdanTTHrHqjOsyXaXNzwS8NKKKid4T92rjDevjwDsNiU3Asl6eCFLmI8CBS0/aVWxpnQ5cpQ2U/jukYUrEXuXFT7cloYJd+c7zBwHnmGmtrAKvLEwtXsKIKEbBGUKp0P3i7nGm/S4mpt+joNi9a01svXxkHX55C/ZW2XHoOFDIK/FPnAZaRj6LEfyKWgJS9I9VBLnwsBH5OdcmtNsnH1RQ5zDwGjCcncz6GCGnMSYpVAxFy2Sz4jfS2wnotzTRyQhqVy5O59Jq7tz4eHy9kjfwtwAilL8yDFu9mJAzgngdaWcoI2iBlRCHF0AUkL2MMqOEsBO+o3EHXHlNec1sFmQ2KfqK2P
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(33656002)(8936002)(8676002)(52536014)(186003)(4326008)(316002)(7416002)(83380400001)(5660300002)(2906002)(86362001)(38070700005)(7696005)(122000001)(66446008)(66946007)(38100700002)(966005)(66476007)(9686003)(54906003)(26005)(66556008)(64756008)(110136005)(6506007)(76116006)(71200400001)(41300700001)(478600001)(53546011)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?9h9R/syYV2vJdPUlr8bOaDV7cpu0gMzPZjSiyyvHBgJFOpL6asg+fVKwoE?=
 =?iso-8859-1?Q?No/tU6zwLaFZ+iPWxEKFM/qCJUnckvcOV1vKT0ZSUT7WJqHOY9l3Z3WVWB?=
 =?iso-8859-1?Q?ezJyNsheD2jyXxH87+3pFquAjRqRcHFRWS9BdatILYZ9v+G9YupQ0HFOOG?=
 =?iso-8859-1?Q?SZjjFh+KtgKR3PKoLf+VCjxPZqzXfnNa+iyxMoNa7hjCTQbxhIwhcv7Yf1?=
 =?iso-8859-1?Q?LQqwTtKG7Ka1qpbqjs71dsyn+vXrLA1ZpYraV6RQ4L85Aoyyn2MBC8e9Jy?=
 =?iso-8859-1?Q?19vF85aTEKtTg0hVxRvYfiZf4AWgpwEYG1PdnWAHf5t4EIHJ61cCkz+myv?=
 =?iso-8859-1?Q?Cwvt3M30HVoLHmaTQRCHM/HPbFimA/YPmae7bhlDUOCnVmTIb22FRLNLa9?=
 =?iso-8859-1?Q?PH1brAJRt95rEERaUCJrfin++Pgi44iFyisFBmVTEdBWvSi6MhLIpNEQgt?=
 =?iso-8859-1?Q?UL0Vwj6nUiwxH3+7acfUZnWnwZzUFUcJHia+eiK/x5QA5CHZtVwTcgx7he?=
 =?iso-8859-1?Q?r9dMU4+tiwFgVMo5d4zO63eq4+ocMk8rEfAGWGfm6tsLXhq0XPPa/2wTPt?=
 =?iso-8859-1?Q?xNG5nYF+Ns90jMLlsmNZCNUKecnUHDo9UPIBA6Xq+BCfUDQNYgrkvA3P2K?=
 =?iso-8859-1?Q?yd2uO+G8pAgP7MFSjyJyhtXKtbY/C6LoSy4U5peP2NWnigChHxztbo2gtZ?=
 =?iso-8859-1?Q?Qumk8HjIas/2m26dgzvGQXBtAP9bbjvFtz/fFTm8AfjGciudx5aJI2OoEG?=
 =?iso-8859-1?Q?rcb+128B5tyohB2WKu9OPz97wdUUUTWpaqPyOZhSXcAes4UcyRLSDHcrFG?=
 =?iso-8859-1?Q?p6w9CypJAk88gyQJsy0i7QMEef1VHqTlO41hA3ZBfOgQvcdA8rij6gcOGE?=
 =?iso-8859-1?Q?idKJ8I+z8cnySOryTP0OghhvmvTHncl/dUn/PaJlfQZ5QDFAUrr4VGuG/E?=
 =?iso-8859-1?Q?cYDMD+53uImKm75q1V+dPz7hSh8SSYilnoPplUD27Alj7yvUw8d4z8H1Lz?=
 =?iso-8859-1?Q?PGMNRc9DmiZUW9+eItC8qURzBp0Tx5tlP1wJgBZzNmuCXn7pKjIdUKdee/?=
 =?iso-8859-1?Q?Lsngri/SabAY07/+7MivWCiDTtfimz3U3K6ehYrsrgsSQZKXtrmrSO1Bci?=
 =?iso-8859-1?Q?+SKRrAS5fXIRglueLDKs3XyFwVu6I/QotQL0m+cz5LHwgACPEzB22OtIvw?=
 =?iso-8859-1?Q?Pp+0iK3QMHV7z9RoiPdBW5bE+CSyrxbazlyB1tgf0uMQ2Jjq9NlinKefwU?=
 =?iso-8859-1?Q?/T35925oejw7isIbLZOhP0+rg0wNBFCXklzIpr/dpRxQ48GXnCSH9V6dGj?=
 =?iso-8859-1?Q?oGVZ/EsjfgNALTs0Tkg9vP3TOSd1nHJE/XadykPwuw+JYKYDNl0YF3dUOc?=
 =?iso-8859-1?Q?WxRVb0zvqWZRinU+Wzw0ftGkBZ58mkedo6vU9v0UF9QerJHfexs65GlzR7?=
 =?iso-8859-1?Q?fVw9J95l0K6X6v7GbIuRmeiXFGhmfxpJhiyvo/BM7H2U/84K3UK/OmPUss?=
 =?iso-8859-1?Q?H/LiPghQUblSeMwxHweM8Typg3OOyT8LRo0lU5KRnjrtFucndjjxQZpk6T?=
 =?iso-8859-1?Q?xuq9Su9aWWIJdH3WithgToDEl5LyYzkHI6LJCFrDlWKJfe6xo4l16j+f5q?=
 =?iso-8859-1?Q?WZb9akYUI0VArk8R9kf4MNdvmxYAqEn3eF4r98/EYi1M57czQ9eQwHQQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a813978a-ecf6-49cf-7930-08da6250b932
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2022 08:46:46.9876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Db3HuVtCbOVPntddKFQJqo6dv4jLlbTsy7Br8XZwyGqGfHrnl/t9Z9bzzSVag+NX/GXhuO+JuP9/RrjZhb+nZox+i/DkZxbggsYvG+UjN4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8668
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Serge Semin,

Thanks for the feedback.

> Subject: Re: [PATCH] serial: 8250: dw: Fix the macro
> RZN1_UART_xDMACR_8_WORD_BURST
>=20
> Hi Andy,
>=20
> On Tue, Jul 05, 2022 at 11:30:01AM +0200, Andy Shevchenko wrote:
> > +Cc: Ilpo, the 8250_dw maintainer
>=20
> > +Cc: Serge, who I believe is the author of the lines in 8250_port you
> > cited, sorry if I'm mistaken.
>=20
> Right, I was the one who got back the line with the proper max baud rate
> calculation procedure in commit 7b668c064ec3 ("serial: 8250: Fix max baud
> limit in generic 8250 port"). In accordance with [1, 2] the interface
> baud rate is (DIV*16)-th of the reference clock frequency. So the patch
> suggested by Biju will work only until he gets to the zero divisor value.
> Without my fix the baud-rate search algorithm may end up with getting
> unsupported baud-rates causing to have zero-divisor, which will lead to
> the serial interface freeze/disable [2].
>=20
> [1] DesignWare DW_apb_uart Databook 4.03a, December 2020, p. 24 [2]
> DesignWare DW_apb_uart Databook 4.03a, December 2020, p. 125

Thanks for sharing the details.

>=20
> >
> > On Tue, Jul 5, 2022 at 8:25 AM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> > >
> > > Hi Jiri and Miquel,
> > >
> > > While testing serial driver with RZ/N1 on 5.15 kernel, which is the
> > > backport of mainline kernel, I seen performance issue with serial DMA
> for higher baud rates.
> > >
> > > The test app is taking 25 minutes finish, whereas with the below
> patch[1] it takes only 3 minutes to finish.
> > >
> > > Not sure has anyone seen this performance issue?
> > >
> > > [1]
> > > diff --git a/drivers/tty/serial/8250/8250_port.c
> > > b/drivers/tty/serial/8250/8250_port.c
> > > index 468d1aca5968..321430176698 100644
> > > --- a/drivers/tty/serial/8250/8250_port.c
> > > +++ b/drivers/tty/serial/8250/8250_port.c
> > > @@ -2680,7 +2680,7 @@ static unsigned int
> serial8250_get_baud_rate(struct uart_port *port,
> > >                 max =3D (port->uartclk + tolerance) / 4;
> > >         } else {
> > >                 min =3D port->uartclk / 16 / UART_DIV_MAX;
>=20
> > > -               max =3D (port->uartclk + tolerance) / 16;
> > > +               max =3D port->uartclk;
>=20
> Are you sure uartclk is initialized with a real reference clock value?

Looks like your code is correct.

The reason for performance issue is because of the out of range and it defa=
ults to 9600 instead of the nearest possible max baud value. The requested =
baud rate(for eg:-5M), is higher than max possible baud rate(4.9M), because=
 of the rounding of the clocks and uart baud calculation defaults to 9600.

We have PLL(1 GHz)->PLL Divider(12to 128)-> UARTCLK
Currently clk driver uses default divider value of 21 which set by the
Bootloader and it doesn't allow to change this as it has other users.

With this max possible baud rate is (1G/21)/16=3D2.97M

If we want to test baudrate in the order of 5M(1G/12)/16=3D 83MHz/16 =3D 5.=
2M , we need to remove the hack from Clk driver[1]
[1] https://elixir.bootlin.com/linux/v5.19-rc5/source/drivers/clk/renesas/r=
9a06g032-clocks.c#L658

But the clk driver finds best divider as 13 instead of 12 and reduces the=20
Rate from 83MHz to 76.9MHz.

With 76.9Mhz, max possible baud rate is ~4.8M as per your calculation. The =
original requested baud rate 5.2M is now out of bound and baud rate is defa=
ulted to Very low value say 9600, this results in the performance issue.

Cheers,
Biju


>=20
> -Sergey
>=20
> > >         }
> > >
> > > Note:-
> > > I have added below change on 5.15 kernel to test on all possible use
> cases.
> > >
> > > diff --git a/drivers/tty/serial/8250/8250_dw.c
> > > b/drivers/tty/serial/8250/8250_dw.c
> > > index 7884fcd66d39..6d352981fb3e 100644
> > > --- a/drivers/tty/serial/8250/8250_dw.c
> > > +++ b/drivers/tty/serial/8250/8250_dw.c
> > > @@ -643,6 +643,26 @@ static int dw8250_probe(struct platform_device
> *pdev)
> > >                 up->dma =3D &data->data.dma;
> > >         }
> > >
> > > +       if (data->pdata->quirks & DW_UART_QUIRK_IS_DMA_FC) {
> > > +               /*
> > > +                * When the 'char timeout' irq fires because no more
> data has
> > > +                * been received in some time, the 8250 driver stops
> the DMA.
> > > +                * However, if the DMAC has been setup to write more
> data to mem
> > > +                * than is read from the UART FIFO, the data will
> *not* be
> > > +                * written to memory.
> > > +                * Therefore, we limit the width of writes to mem so
> that it is
> > > +                * the same amount of data as read from the FIFO. You
> can use
> > > +                * anything less than or equal, but same size is
> optimal
> > > +                */
> > > +               data->data.dma.rxconf.dst_addr_width =3D p->fifosize =
/
> > > + 4;
> > > +
> > > +               /*
> > > +                * Unless you set the maxburst to 1, if you send only
> 1 char, it
> > > +                * doesn't get transmitted
> > > +                */
> > > +               data->data.dma.txconf.dst_maxburst =3D 1;
> > > +       }
> > > +
> > >
> > > Cheers,
> > > Biju
> > >
> > > > -----Original Message-----
> > > > From: Biju Das
> > > > Sent: 04 July 2022 08:12
> > > > To: Jiri Slaby <jirislaby@kernel.org>; Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org>
> > > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>; Miquel
> > > > Raynal <miquel.raynal@bootlin.com>; Emil Renner Berthing
> > > > <kernel@esmil.dk>; Phil Edworthy <phil.edworthy@renesas.com>;
> > > > Johan Hovold <johan@kernel.org>; linux-serial@vger.kernel.org;
> > > > Geert Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> > > > <Chris.Paterson2@renesas.com>; Biju Das <biju.das@bp.renesas.com>;
> > > > linux-renesas-soc@vger.kernel.org
> > > > Subject: RE: [PATCH] serial: 8250: dw: Fix the macro
> > > > RZN1_UART_xDMACR_8_WORD_BURST
> > > >
> > > > Hi Jiri,
> > > >
> > > > Thanks for the feedback.
> > > >
> > > > > Subject: Re: [PATCH] serial: 8250: dw: Fix the macro
> > > > > RZN1_UART_xDMACR_8_WORD_BURST
> > > > >
> > > > > On 30. 06. 22, 10:39, Biju Das wrote:
> > > > > > As per RZ/N1 peripheral user
> > > > > > manual(r01uh0752ej0100-rzn1-peripheral.pdf)
> > > > > > rev 1.0.0 Mar,2019,
> > > > >
> > > > > Is this public anywhere?
> > > >
> > > > Yes, It is available here[1] see page 72 and 73.
> > > >
> > > > [1]
> > > > https://www.renesas.com/us/en/document/mah/rzn1d-group-rzn1s-group
> > > > -
> > > > rzn1l-group-users-manual-peripherals?language=3Den&r=3D1054561
> > > >
> > > >
> > > > >
> > > > > > the value for 8_WORD_BURST is 4(b2,b1=3D2'b10).
> > > > > >
> > > > > > This patch fixes the macro as per the user manual.
> > > > >
> > > > > I'm curious, is the bottom bit from "3" ignored by the HW or
> > > > > does this fix a real problem in behavior? Stating that might
> > > > > help backporters to decide if to take the patch or not.
> > > >
> > > > See page 72 and 73.
> > > >
> > > > Yes, it fixes a real problem as by using a value of 8 , you are
> > > > wrongly configuring DMA_BURST_SIZE of 1 instead of DMA_BURST_SIZE
> of 8.
> > > >
> > > > b2, b1 bUart_DEST_BURST
> > > > _SIZE
> > > > DEST_BURST_SIZE
> > > > Destination Burst Transaction Size in Transmit FIFO.
> > > > UART is the flow controller. Thus, the user must write this field
> > > > before or at the same time the DMA mode is enabled. Number of data
> > > > byte, to be written to the Transmit FIFO every time a transmit
> > > > burst transaction request are made on DMA request.
> > > > 2'b00 =3D 1 byte
> > > > 2'b01 =3D 4 bytes
> > > > 2'b10 =3D 8 bytes
> > > > 2'b11 =3D Reserved, not used
> > > >
> > > > Cheers,
> > > > Biju
> > > >
> > > >
> > > > >
> > > > > > Fixes: aa63d786cea2 ("serial: 8250: dw: Add support for DMA
> > > > > > flow controlling devices")
> > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > ---
> > > > > >   drivers/tty/serial/8250/8250_dw.c | 2 +-
> > > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/tty/serial/8250/8250_dw.c
> > > > > > b/drivers/tty/serial/8250/8250_dw.c
> > > > > > index f57bbd32ef11..931490b27d6b 100644
> > > > > > --- a/drivers/tty/serial/8250/8250_dw.c
> > > > > > +++ b/drivers/tty/serial/8250/8250_dw.c
> > > > > > @@ -47,7 +47,7 @@
> > > > > >   #define RZN1_UART_xDMACR_DMA_EN         BIT(0)
> > > > > >   #define RZN1_UART_xDMACR_1_WORD_BURST   (0 << 1)
> > > > > >   #define RZN1_UART_xDMACR_4_WORD_BURST   (1 << 1)
> > > > > > -#define RZN1_UART_xDMACR_8_WORD_BURST    (3 << 1)
> > > > > > +#define RZN1_UART_xDMACR_8_WORD_BURST    (2 << 1)
> > > > > >   #define RZN1_UART_xDMACR_BLK_SZ(x)      ((x) << 3)
> > > > > >
> > > > > >   /* Quirks */
> > > > >
> > > > > thanks,
> > > > > --
> > > > > js
> >
> >
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
