Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02DA6690BB2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 15:29:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjBIO3D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 09:29:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjBIO3D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 09:29:03 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2135.outbound.protection.outlook.com [40.107.117.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF985C49C;
        Thu,  9 Feb 2023 06:29:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hH8nrthdYXEUeKHT6mW9C9sCb82COuG5BV7o1Vf4+TeF6F4aUvc+oEyKH3VfZOCEHp4pU2qS1bG5VzDO3GX2X/XUZqmCeqtarSg4PcJFUp3Tua5kNLoJ4tXlUpbSAjqdd/7VP4muX3DjYArhmuBsvMuN+pYLJBxGAfBmg7wjb2ar/TbYF3Wjd6EOhYO117tgA7vS2web06353khrLMms1k7x4LR7BK5ZuLILAlz/3OcUna/Caow6/7XNpvCAYHx21hcTcSOs6U6cqMgtEnfrdWuKvA57Um+J7TEBc29At3PCwuqWS8ytPz52Oohn1SnVi3BPeEH8WDhddNF2OltqMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HU6gbHnzhKPo3ktWc2hmxCMtMpwY98q777jJA3ZT/sE=;
 b=bQfhzpKQyfdlJPh0lkmePGpBB85Pr6iMq3rcX4Mpaay2jkrGiWY1A2AAr30InhX+N5MKVwh6TRNTNxWGHmtxv1aqQWDCwz7c20vqk3Bten4C4X1xgVhhKESPfKYSqgpu0f1vAtzTx2OX5BF3wK9a8MRZhwKBnstCep0sstpfHBLZanlyDx8G8uJ1/7xqmR2uZOI7ESH3fpTa+hWu5HEbG2qI3JbYY8h7ybM8l9vmALBlx8vfN88+X72ey7TEXv9i8twYnLzapRY89YE+hy8wdqT7LVZcFxzEwk6XAvtBnsNBUWvMhC11QtA2xTfG2ytrKsIH5E6Nr2BMcYT2AMtyFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HU6gbHnzhKPo3ktWc2hmxCMtMpwY98q777jJA3ZT/sE=;
 b=obQytOmBX/DmumklHhoGTKwPP51tmJ1jaC1Dx2CLsI2pJE+GOyhzLkLBCr6QiV8VxtegpQ+n79a5iBR2txmpvPQrxtkB1FkRYfL/F1P/GIhnrwkcpAmZfUmhFvIjrAkEGrLsSYgGpWB6RaHcZiXihEWg/v0pKIk5EAok8E0A/q8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB6172.jpnprd01.prod.outlook.com (2603:1096:402:34::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 14:28:58 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%7]) with mapi id 15.20.6086.019; Thu, 9 Feb 2023
 14:28:55 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Wander Lairson Costa <wander@redhat.com>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/3] serial: 8250: Identify Renesas RZ/V2M 16750 UART
Thread-Topic: [PATCH 1/3] serial: 8250: Identify Renesas RZ/V2M 16750 UART
Thread-Index: AQHZPIoo27lI1/ND9EOlwJCIJRVMQa7GpwWAgAAEK7A=
Date:   Thu, 9 Feb 2023 14:28:55 +0000
Message-ID: <OS0PR01MB5922AC5FF10FFF5F8590B8AA86D99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
 <20230209132630.194947-2-biju.das.jz@bp.renesas.com>
 <4470e054-ebe6-b3ca-ffd7-1c7c3ae09f1a@linux.intel.com>
In-Reply-To: <4470e054-ebe6-b3ca-ffd7-1c7c3ae09f1a@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYAPR01MB6172:EE_
x-ms-office365-filtering-correlation-id: 422cf7a4-3336-410e-0656-08db0aa9f98e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HZZ3+nn17eqt1i5TJfBUzA5c12QXPndzscuYoGMNdLJhRSpIgjaZ9JONig6Wzy5eDmLF3HsCzQCZWO1fMAMREDN6rerWSQ3qkdZ0NzI4jpI1h/lnLGM4iBrLqGTnQkRnrHUr6ZNhRIK2Zyo80RXaAZ2O/VS18XvZxWMJVJVWGY84e2iXHMKQqRB+EMJYZ22cKa33V7nJOTS9lGFSEQCjtGiEX++6i8XV1gZTIIOU+KyF86JsoXjhG3O4Pq8l14KTONUmQUh+TS/dsfIAG4r1zC2C7Ebwyer2Zh/oiUHovRYCgLy3PjuWtVa/sh6aLCVTUVV7tzl5G2Xerx5dB3s0RUcR108/YMx12nXDTXWFKS5y5f/JXBMKOUnO/diRkTYQf/0YpU1/ui1usPnqh86DuIUaXWIGauZ1bwQ9o9fBVUIdHkwxdqqKPWQ4c0x2DgH9fOgSsScKPHybD+C2sa8pMNK4TSiIhSss5k3JbkRUxwa1ZqopOg/9JQ1oMUn4i4h88WqxMTfQgFyzu9BpDECWsQ9ER5gopL5RyQSbaXuPR/WoVUJTm8qId+Awims1QD7VYAlJ6qywDNCQNrFM5APb+3UDbqX9WrXX+0c+9sAneRNQy5//BWWvkv5Ipc9BfXvbqjnpqXDT7nH/zYCz93rGgIH07h8CJ8l52J+WrGJHqnu9s+qgI9IDPyYCSyz/PXYvSeaYlD9TDjIDyEUj93ZyAA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199018)(66574015)(83380400001)(7416002)(5660300002)(2906002)(26005)(186003)(54906003)(53546011)(9686003)(6506007)(33656002)(41300700001)(52536014)(71200400001)(7696005)(86362001)(478600001)(122000001)(55016003)(8936002)(38070700005)(38100700002)(66946007)(316002)(8676002)(66556008)(64756008)(66476007)(66446008)(6916009)(4326008)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?x0qEzQDbcBI4lncZesII6IDK/Lm5EvwzIlANqP0T9ccNtrR/AU6Ua9YMhb?=
 =?iso-8859-1?Q?9wO2IbtGlJwt3+yQtXr0Uew35jyfYZYuySTKeNPk5C7bgpgPYgLMODx6LI?=
 =?iso-8859-1?Q?doL7vgej20wBwl1AWB5nlE4oXRcVsU3FDuL/kvalOX/zBMT03YaJX6MYYz?=
 =?iso-8859-1?Q?JO1UXl9y5ThpQNGsNXCw4QqScbuB3tm15B4g7DSntT0IeGDA5LYcwQB2/7?=
 =?iso-8859-1?Q?Dt6K66a5tXQA4NDcUERE+3GKv9TPJH5csoDAYkE3XPZdsKalaMG7unZevu?=
 =?iso-8859-1?Q?6TF1IbOToT/7MwP4/z9KmbirpH93iKiPy5dvfHRRNvoZ+phHQKVlqtrrfT?=
 =?iso-8859-1?Q?BBiLszI4DMsl7W4BxqTNuO3jGLRlU/0xw5g7NICYsKWRPXfOBCdq8doNrK?=
 =?iso-8859-1?Q?lpkSbxSMAplkSs26m6zi4OakDJgog97Rwr7knWHQVBQ6z08VK0N3717XO4?=
 =?iso-8859-1?Q?mndEsqIhTgI9Ytdn2E5rrBCuF+/xzhBhQ2OpUNZxFT53OjBC7/bOU4cmrr?=
 =?iso-8859-1?Q?WmZTACvaabtDlnqtFohvd/97IKjib2c198CW0PfS9vHyKfdHTiDjsIFhyn?=
 =?iso-8859-1?Q?ngB1EOiNbZFXtfamJQ8Ii+fxhcFhCQ2Jqy3rh/oskj5DkYwsNvom9Ssfay?=
 =?iso-8859-1?Q?8RP+JHqO8LyFtiu2T3iDAy9katcT38hDPd95C4m8Mn3F5NLhkgFBz0ZVNx?=
 =?iso-8859-1?Q?U8GnFRJzlkrFSvmujGSDIVElrtk7GLeWh54YT7Pf9BHP/dn3h/nhRWA8z2?=
 =?iso-8859-1?Q?i1bkaYv5z5u3xGay+V9cUTZ1A356Hgdy4RA3inEIZ8oGco3S6C86xhYX9/?=
 =?iso-8859-1?Q?tuqiSSQ7v3QgtyroqItrL98ctccvPRWBJJkVF80KhyPkZaXEAa4gpsTt0s?=
 =?iso-8859-1?Q?xe75s6KP5MibVg3O9eNIw9hLXYU8k19cfFk/iQ+ZwVdeWwhgY33RD//yqh?=
 =?iso-8859-1?Q?33Br3htt1Wf5VTpUiyg34kH2J/FRdKoKdmEVQgD+NKZKrTPAJLwE6wx9qo?=
 =?iso-8859-1?Q?TrjGzVf/Sr9Qz2I1xd/AbM6ouVdb0tuHkzrBtcEbu9uU3dXtgGXaPyGNac?=
 =?iso-8859-1?Q?gVi6u/Ytb0hXB1mBdi86z2ylfdkLyTuYUIQ8jSnSBRrSRQTntgKcv/yJ6a?=
 =?iso-8859-1?Q?hQQ7o0fWJ3txhPA+MgvCjsA5f4EYzz6eQiYfoet1Smj2rcBFUna+SO1C9j?=
 =?iso-8859-1?Q?kJGksZ9t+qX5LE0GvJsV/eDnWLg/+6vijnIJk9pIyN62IAEl5YnBIm4+BB?=
 =?iso-8859-1?Q?l2hFDYwUOhqG2jtDuA3xqioYvYirMErr9pyQuWEB1Y3WOg1YxcYQauGWZB?=
 =?iso-8859-1?Q?F9zGKIz7g/xkUdGBmOsjmbjegsju7h4xvLFr3QX0uH96A1wMAY45DNcTlE?=
 =?iso-8859-1?Q?tl6y7Bb4sAEfxiDsfgtFrqa+hqQmIT51lt/x0lvVjOeWz9+ctOVEepLLFl?=
 =?iso-8859-1?Q?7q97tyqpQ97G9L2FL+IQJl9Awwnq8Nof/KnZ7rAh+WcT5+wZXePdywWzRL?=
 =?iso-8859-1?Q?z4uuSf8lahmGzT7ah0px4nypZbO3p/dKMSvUFW53+yA0nceYlKEB68SrNz?=
 =?iso-8859-1?Q?imSOZOdwBCfPBO6VDNuXWE3icsr0XsDDD9/DSV2DQSK4/L/f8E4m4NcDsB?=
 =?iso-8859-1?Q?CtUHJ4Mmkk8MtpiDob1uK+MW06LvyihPUwMlnv41SUWE5ipfXcjls8cg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422cf7a4-3336-410e-0656-08db0aa9f98e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 14:28:55.5330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ibFpzv6HiDLpqCDo38Pv7UpZImgz/UN/btWJAVxB6ZEi+OLBQlv4WV7p+ky3azKkX3Dq5oXPoKV2MYVr1D3m5pVyp9lnWpyF2z0dRGFR3Fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6172
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ilpo J=E4rvinen,

Thanks for the feedback.

> -----Original Message-----
> From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> Sent: Thursday, February 9, 2023 2:09 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Jiri Slaby
> <jirislaby@kernel.org>; Andy Shevchenko <andriy.shevchenko@linux.intel.co=
m>;
> Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>; Maciej W. Rozycki
> <macro@orcam.me.uk>; Eric Tremblay <etremblay@distech-controls.com>; Wand=
er
> Lairson Costa <wander@redhat.com>; linux-serial <linux-
> serial@vger.kernel.org>; Geert Uytterhoeven <geert+renesas@glider.be>;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>; linux-renesas-
> soc@vger.kernel.org
> Subject: Re: [PATCH 1/3] serial: 8250: Identify Renesas RZ/V2M 16750 UART
>=20
> On Thu, 9 Feb 2023, Biju Das wrote:
>=20
> > Add identification support for RZ/V2M 16750 UART.
> >
> > Currently, RZ/V2M UART is detected as 16550A instead of 16750.
> > "a4040000.serial: ttyS0 at MMIO 0xa4040000 (irq =3D 14, base_baud =3D
> > 3000000) is a 16550A"
> >
> > After adding identification support, it is detected as
> > "a4040000.serial: ttyS0 at MMIO 0xa4040000 (irq =3D 24, base_baud =3D
> > 3000000) is a Renesas RZ/V2M 16750".
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/tty/serial/8250/8250_port.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/drivers/tty/serial/8250/8250_port.c
> > b/drivers/tty/serial/8250/8250_port.c
> > index e61753c295d5..e4b205e3756b 100644
> > --- a/drivers/tty/serial/8250/8250_port.c
> > +++ b/drivers/tty/serial/8250/8250_port.c
> > @@ -111,6 +111,15 @@ static const struct serial8250_config uart_config[=
] =3D
> {
> >  		.rxtrig_bytes	=3D {1, 16, 32, 56},
> >  		.flags		=3D UART_CAP_FIFO | UART_CAP_SLEEP | UART_CAP_AFE,
> >  	},
> > +	[PORT_16750] =3D {
> > +		.name		=3D "Renesas RZ/V2M 16750",
> > +		.fifo_size	=3D 64,
> > +		.tx_loadsz	=3D 64,
> > +		.fcr		=3D UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10 |
> > +				  UART_FCR7_64BYTE,
> > +		.rxtrig_bytes	=3D {1, 16, 32, 56},
> > +		.flags		=3D UART_CAP_FIFO | UART_CAP_AFE,
> > +	},
>=20
> Eh, how can you reuse [PORT_16750] again in the initializer like that?

Oops. Missed it. Is it ok to introduce PORT_RENESAS_16750_F64 instead
as PORT_16750 is used by TI16750?

Cheers,
Biju

>=20
> --
>  i.
>=20
> >  	[PORT_STARTECH] =3D {
> >  		.name		=3D "Startech",
> >  		.fifo_size	=3D 1,
> > @@ -1142,6 +1151,24 @@ static void autoconfig_16550a(struct uart_8250_p=
ort
> *up)
> >  		return;
> >  	}
> >
> > +	/*
> > +	 * No EFR.  Try to detect a Renesas RZ/V2M 16750, which only sets bit
> 5
> > +	 * of the IIR when 64 byte FIFO mode is enabled.
> > +	 * Try setting/clear bit5 of FCR.
> > +	 */
> > +	serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO);
> > +	status1 =3D serial_in(up, UART_IIR) & (UART_IIR_64BYTE_FIFO |
> > +UART_IIR_FIFO_ENABLED);
> > +
> > +	serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO | UART_FCR7_64BYTE);
> > +	status2 =3D serial_in(up, UART_IIR) & (UART_IIR_64BYTE_FIFO |
> > +UART_IIR_FIFO_ENABLED);
> > +
> > +	if (status1 =3D=3D UART_IIR_FIFO_ENABLED_16550A &&
> > +	    status2 =3D=3D (UART_IIR_64BYTE_FIFO | UART_IIR_FIFO_ENABLED_1655=
0A))
> {
> > +		up->port.type =3D PORT_16750;
> > +		up->capabilities |=3D UART_CAP_AFE;
> > +		return;
> > +	}
> > +
> >  	/*
> >  	 * Try writing and reading the UART_IER_UUE bit (b6).
> >  	 * If it works, this is probably one of the Xscale platform's
> >

