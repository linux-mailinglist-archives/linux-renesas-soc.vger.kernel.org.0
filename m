Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 349A2693FFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 09:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbjBMIxZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 03:53:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjBMIxX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 03:53:23 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2122.outbound.protection.outlook.com [40.107.255.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8434D13525;
        Mon, 13 Feb 2023 00:53:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3ATI6zmWKok3OFupBxH1F7t69azrmTVVxaUpaZMICY84QIT1eX4ci9Xp78PI0JRciDLkQJYLyEv7lsYGW3gJyIVxWKrxJj4vQ9W+JAsj2x1XsIJ9+Swuh+qdEuo7M9vuTPvEeSECA6tYTlQbsYa6pIb7kMlclpcyIgcUXB312yuFNl4UeEWWeVQH1GafGMKdIfq769onEJC9Luij/iELWK8REt8E3Z/mqes0gcRWv/IpWEwTAVLIrvQb8z3l4ZVhdvo6KuHVUv/VRy+T8ikh7QHBv1kegpYJUU1t6umezUwGJP8k7WJMfvE/CnbtoffpiFCDA8OIQzCqaWlDoKBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gN+D0Ez0WhtYfo1eOsHci4ZEHuxK+glBghIcSKb14oI=;
 b=ejuh8ABfdpOl6yVqYCLsxKZMnhtCqtQ+c4DY5xj6RBR8DqL/8bBHCqIT3+kBKDQezGQYr9z+dVRaFlySPkOlRsX6ZdkXWlHYouKbA0p6UAOY5bamVbfmabGrd6tTl2esZokKYibwat6o2438VEcwaqxgmaYpDWI3hcAa5fklQRVd+TPTHC3p6Z4nHfTseE6aZOFYEQDtXSrnpbGtQ50DbTdaWdXsPRs5OeKvEBjT0wQ0WUJ+gWOKsfjOGi7XO481km+T1WwgcQs1zk6bjaAH4Rc2AMqLqSelVx/kAC9U59mBjArzKuh5jwV2YZUDcK3g0Jpn8IcTtYVTbGtahCBWCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gN+D0Ez0WhtYfo1eOsHci4ZEHuxK+glBghIcSKb14oI=;
 b=WuueRax31yN7yhv4JYYg4BSJ+kcsv3Yxl2h3+vX4MK1PRKuaDbZgDOfh1wx/1vl/wEd5eabIB2Gzu97S52Md9VyOkJlW5HbZo99TT1Rg2MQl4jgOygxqyqO1g2i6LJbEsLBF17DD7bGQAbwzCBl1cWO8Nn8QVZkMOT/TTu5cvrc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11561.jpnprd01.prod.outlook.com (2603:1096:400:374::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Mon, 13 Feb
 2023 08:53:17 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 08:53:15 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Topic: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Index: AQHZPY8kj9QN2R7bt0udUTepz/GAba7Mkw8AgAAAZ9A=
Date:   Mon, 13 Feb 2023 08:53:15 +0000
Message-ID: <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
 <20230210203439.174913-4-biju.das.jz@bp.renesas.com>
 <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com>
In-Reply-To: <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11561:EE_
x-ms-office365-filtering-correlation-id: f1ca90ec-e98d-4a08-aee8-08db0d9fbec2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i9aylI5nz8mpg9oTSxyfX/t0PltFVAtSfAZfIJYnPSdzAD9wLpjzdCgK8XnscbqSzNsgDj67SrKpb2RVA3bRvMlz4aBcPxZWiXBk4YdA4Spsx63zBaceqM/xfVk6vyIVl73tYdBfOnLjFAHbyWiZnaUHYUSlOqf92i/NN9P7OQVJ+h1FBOCpO2hUYKT139k5nEcFvO7EFDimC+029o4Q+WP8DL+MmLFZdm6GByxsBJyuyEt2aKCRTqxbfNwRDSIYQh9SuNoa0IIvIgGQT+COOT0Oe5mkTVuurSeGCWWojA2Uqe7C5H8V8ZJJsrxkJpkQrf5l/jFnhOkgwayOlxbMSCKhhbARIidyDLtth8evgcZcNcEBqdaCn9KxVQAl2dmA27emLEiDjdli7Y6jsBx3TCuWt7uLCIOMeCl934xhT27tguiXRNjdV+nGBp2hu8b0NcoOPDM52BMQLqmOLJpLoMAB94P2hAOmxy8rN7UpxjhYj4o5+FgmsfQPJAFb6wkDQO8iUSMGm3NJ4GMrvzqWA+M0eL8TbegmK7WOu5rhesBOqsIPzk6nONgOOTscuicuahE7ZiGnBJJrfLIpuYqElzgHNESRXK6qe48harDnqvUOImHpjuZevuam1XOAPhHpXLzr4/kA6lVrNjU4UpR4XqG3jxa/xO3AabDndCTVbXZdkV5e7DwW3FwkbFR2gNrkLwRWyWS2nkRpzrzdC0zL2g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199018)(2906002)(86362001)(52536014)(55016003)(38100700002)(478600001)(9686003)(5660300002)(33656002)(186003)(26005)(7696005)(6506007)(8936002)(71200400001)(38070700005)(41300700001)(83380400001)(8676002)(66446008)(66476007)(6916009)(66556008)(4326008)(76116006)(122000001)(66946007)(54906003)(316002)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VIV0JPl3rFFSn24rXXkC6aS6nxqHDabYcsKOYgbLij1zrO5aHiqU9sRwha?=
 =?iso-8859-1?Q?7qpAT/N6zFQwZFp5xJ+GKs/FXNCWKwSZzv0bfPTv1lc+v8D/dNAGWg5BFp?=
 =?iso-8859-1?Q?MkRM3+I/s+gIKMwJKtcakZ9c++FollfO1TFZkkOZx6VhYhbbnygqo3WEOH?=
 =?iso-8859-1?Q?56K2tQhtSBOGZzefiQsY1t+3Sc6E9/5FH6sAjanEOSVhcjzyY+s6/ppk1T?=
 =?iso-8859-1?Q?hlk98+ez9ekQb37DqwcDGL7FFLJ+h4ab0p5O3n6nETEFxRF5u0u3PcZgd3?=
 =?iso-8859-1?Q?FmUi4i0K7FxOTN2fnYOTAG5zDYDFf4AfwNfM2VWGjrTAL4MxXrFw3pU7kN?=
 =?iso-8859-1?Q?0Eur+TmbIHpxPOS2yWcuI60IsAXkcyxsgKEJL1M8vyuxjhXBD9FXgkZz2X?=
 =?iso-8859-1?Q?sSCwyIv/UtaaIwM2kPpsqIUAk8x11mGgKj/+NOor8qL+hKDTesbOVe2j4b?=
 =?iso-8859-1?Q?rMAF2J+GIV6JWSKV0mXgFlyxrqJ426ku91LO66JuhKUkyZE5ex6P2JrWQw?=
 =?iso-8859-1?Q?OZTM/+MeU88y4yUlURSAQ4qP/CEYJi3h0wq+330u/9UMUADIZlZ5gSDzAz?=
 =?iso-8859-1?Q?fevYS6JqfmrliShOytZ8W6uX147ojUGJ6B7TrdtwzHoFE+cCG+ldhDKL5P?=
 =?iso-8859-1?Q?yesBwEAFcPjHF/0+6iF1g2OGT2lsgL/qfRCcf0ZOoTjEQ59Lp0NbEvAwWf?=
 =?iso-8859-1?Q?EHnz27mlcyieuPYa0TaMymEyGItalt5otL+z0M3MYDc/rPPvT4ws73ZCJZ?=
 =?iso-8859-1?Q?80clGd7vl6z8FLE5ZAgkU2zel9orzttTqL9CT55Vj5RwkBd3PgENes9ncq?=
 =?iso-8859-1?Q?3QpqBDpNrClxjd3fJpY48hmvAXrotEOXVE5dLAKjnxhcnxIC6bqagFxjae?=
 =?iso-8859-1?Q?5oG7sI5SodOSjYay/+kel0gegmbne5A2A4ng5DtE3FxgAFhRka2K7eKYlf?=
 =?iso-8859-1?Q?EkN5iLtptVaQnyHkvmypI6kq+vX5qDcoVDzLU4b5k//mxYPPFf0UJBwQRz?=
 =?iso-8859-1?Q?z6y8k1/qjLbEkygiGsjtQ7higtINvCJdPZ7XQ+cXZPga3a3W4U1eNOmba0?=
 =?iso-8859-1?Q?ryQPbkp2ZsKb/wdQWZZLGNuyd82qssgyYi5SCp7tFrikV9dO2tNLvJ65q8?=
 =?iso-8859-1?Q?r9i/sQuv76s0OkbvDUX8e7ewbNUgkio512gBhj9HrhCONz2f+aBqIzEzDP?=
 =?iso-8859-1?Q?Tbpp3JtbrdaRlUbPBmzfOa2AjdMRrbg49lzkwowJyiFsacdOOmlSY3pCiR?=
 =?iso-8859-1?Q?b+loCVHE5TyjrddEbLsasmFp+N+6dh7rQXGlBTX2ki0Kxeq7i1IqJrO2Li?=
 =?iso-8859-1?Q?tXhO0NN6/kX17wbSjPKQIGyErsCaOrrkXZxqGc3GSoWB1WlBgGqBvQ8Yug?=
 =?iso-8859-1?Q?ihvOnINoo4MyizUIKyn1vMw23UyResIf+H6pLMzscIPNvCYLfPBVrI2c6L?=
 =?iso-8859-1?Q?iI0hxARLoNZfYjeYgim6crEe0v8O4syRRJ4YpaKufc9RisOiAPw5XI4Xma?=
 =?iso-8859-1?Q?7uN+YOGtdrY3C6pD2qS2UCy7J9QUMJPzu6FdyNIYaybu05k+R0OgVQ07AO?=
 =?iso-8859-1?Q?lYLaLj5aqyZETNVeFb/DSz6x8hXOQX+dbdJDEUh1d6XnIDvCX7ABrFOuH6?=
 =?iso-8859-1?Q?Sv6pkcuA7r42yKL7vB4FhLX10i/Luv+Hx9EbkIbXAete/nJOa4Ea//Ow?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ca90ec-e98d-4a08-aee8-08db0d9fbec2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 08:53:15.3979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pVVmc8wnQrUfHjESRr7tsawe1Ss7URRuFiPq740339AcjV8y0dojxySWscaMO83T1/jTDHPi78HFptIzxYitypu47XmyfHPQyfxDw9x17Pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11561
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

HI Ilpo,

Thanks for the feedback.

> Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
> serial8250_em_hw_info
>=20
> On Fri, 10 Feb 2023, Biju Das wrote:
>=20
> > As per HW manual section 40.6.1, we need to perform FIFO reset + SW
> > reset before updating the below registers.
> >
> > FCR[7:5], FCR[3:0], LCR[7][5:0], MCR[6:4], DLL[7:0], DLM[7:0] and
> > HCR0[6:5][3:2].
> >
> > This patch adds serial_out() to struct serial8250_em_hw_info to handle
> > this difference between emma mobile and rz/v2m.
> >
> > DLL/DLM register can be updated only by setting LCR[7]. So the
> > updation of LCR[7] will perform reset for DLL/DLM register changes.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Replaced readl/writel()->serial8250_em_serial_in/out() in
> serial8250_rzv2m_
> >    reg_update() to avoid duplication of offset trickery.
> >  * Added support for HCR0 read/write in serial8250_em_{serial_in,
> > serial_out}
> >  * Added UART_LCR macro support in serial8250_em_serial_in() to read
> > LCR
> >  * Reordered serial8250_em_{serial_in, serial_out} above serial8250_rzv=
2m_
> >    reg_update().
> >  * Replaced priv->info->serial_out to info->serial_out.
> > v1->v2:
> >  * Added serial_out to struct serial8250_em_hw_info
> > ---
> >  drivers/tty/serial/8250/8250_em.c | 67
> > ++++++++++++++++++++++++++++++-
> >  1 file changed, 66 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/8250/8250_em.c
> > b/drivers/tty/serial/8250/8250_em.c
> > index 69cd3b611501..a90a5cc4234a 100644
> > --- a/drivers/tty/serial/8250/8250_em.c
> > +++ b/drivers/tty/serial/8250/8250_em.c
> > @@ -19,10 +19,14 @@
> >
> >  #define UART_DLL_EM 9
> >  #define UART_DLM_EM 10
> > +#define UART_HCR0 11
> > +
> > +#define UART_HCR0_SW_RESET	BIT(7) /* SW Reset */
> >
> >  struct serial8250_em_hw_info {
> >  	unsigned int type;
> >  	upf_t flags;
> > +	void (*serial_out)(struct uart_port *p, int off, int value);
> >  };
> >
> >  struct serial8250_em_priv {
> > @@ -46,6 +50,7 @@ static void serial8250_em_serial_out(struct uart_port
> *p, int offset, int value)
> >  		fallthrough;
> >  	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
> >  	case UART_DLM_EM: /* DLM @ 0x28 (+9) */
> > +	case UART_HCR0: /* HCR0 @ 0x2c */
> >  		writel(value, p->membase + (offset << 2));
> >  	}
> >  }
> > @@ -55,6 +60,7 @@ static unsigned int serial8250_em_serial_in(struct
> uart_port *p, int offset)
> >  	switch (offset) {
> >  	case UART_RX: /* RX @ 0x00 */
> >  		return readb(p->membase);
> > +	case UART_LCR: /* LCR @ 0x10 (+1) */
> >  	case UART_MCR: /* MCR @ 0x14 (+1) */
> >  	case UART_LSR: /* LSR @ 0x18 (+1) */
> >  	case UART_MSR: /* MSR @ 0x1c (+1) */ @@ -64,11 +70,68 @@ static
> > unsigned int serial8250_em_serial_in(struct uart_port *p, int offset)
> >  	case UART_IIR: /* IIR @ 0x08 */
> >  	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
> >  	case UART_DLM_EM: /* DLM @ 0x28 (+9) */
> > +	case UART_HCR0: /* HCR0 @ 0x2c */
> >  		return readl(p->membase + (offset << 2));
> >  	}
> >  	return 0;
> >  }
> >
> > +static void serial8250_rzv2m_reg_update(struct uart_port *p, int off,
> > +int value) {
> > +	unsigned int ier, fcr, lcr, mcr, hcr0;
> > +
> > +	ier =3D serial8250_em_serial_in(p, UART_IER);
> > +	lcr =3D serial8250_em_serial_in(p, UART_LCR);
> > +	mcr =3D serial8250_em_serial_in(p, UART_MCR);
> > +	hcr0 =3D serial8250_em_serial_in(p, UART_HCR0);
> > +	/*
> > +	 * The value of UART_IIR and UART_FCR are 2, but corresponding
> > +	 * RZ/V2M address offset are different(0x08 and 0x0c). So we need to
> > +	 * use readl() here.
> > +	 */
> > +	fcr =3D readl(p->membase + ((UART_FCR + 1) << 2));
>=20
> I don't get the meaning of that comment. It doesn't seem to match what yo=
ur
> code does as the code seemingly has nothing to do with IIR (and none of y=
ou
> changelogs refer to IIR either)?

The generic macro UART_IIR and UART_FCR in linux/serial_reg.h has a value o=
f 2.

The RZ/V2M register offset don't match with standard ones, we are doing rem=
apping
inside case statements in serial8250_em_serial_in() and serial8250_em_seria=
l_out().

Currently IIR is already present in serial8250_em_serial_in(), so no issue.

But when I tried to add UART_FCR in case, it gives the compilation error.
You cannot have same case values inside switch.

>=20
> Is the only reason for this that serial8250_em_serial_in() currently lack=
s
> case UART_FCR: ? Why cannot that just be added there?

Yes, It gives build error.=20

Cheers,
Biju

>=20
> --
>  i.
>=20
> > +	serial8250_em_serial_out(p, UART_FCR, fcr | UART_FCR_CLEAR_RCVR |
> > +				 UART_FCR_CLEAR_XMIT);
> > +	serial8250_em_serial_out(p, UART_HCR0, hcr0 | UART_HCR0_SW_RESET);
> > +	serial8250_em_serial_out(p, UART_HCR0, hcr0 & ~UART_HCR0_SW_RESET);
> > +
> > +	switch (off) {
> > +	case UART_FCR:
> > +		fcr =3D value;
> > +		break;
> > +	case UART_LCR:
> > +		lcr =3D value;
> > +		break;
> > +	case UART_MCR:
> > +		mcr =3D value;
> > +		break;
> > +	}
> > +
> > +	serial8250_em_serial_out(p, UART_IER, ier);
> > +	serial8250_em_serial_out(p, UART_FCR, fcr);
> > +	serial8250_em_serial_out(p, UART_MCR, mcr);
> > +	serial8250_em_serial_out(p, UART_LCR, lcr);
> > +	serial8250_em_serial_out(p, UART_HCR0, hcr0); }
> > +
> > +static void serial8250_em_rzv2m_serial_out(struct uart_port *p, int
> > +offset, int value) {
> > +	switch (offset) {
> > +	case UART_TX:
> > +	case UART_SCR:
> > +	case UART_IER:
> > +	case UART_DLL_EM:
> > +	case UART_DLM_EM:
> > +		serial8250_em_serial_out(p, offset, value);
> > +		break;
> > +	case UART_FCR:
> > +	case UART_LCR:
> > +	case UART_MCR:
> > +		serial8250_rzv2m_reg_update(p, offset, value);
> > +	}
> > +}
> > +
> >  static int serial8250_em_serial_dl_read(struct uart_8250_port *up)  {
> >  	return serial_in(up, UART_DLL_EM) | serial_in(up, UART_DLM_EM) << 8;
> > @@ -120,7 +183,7 @@ static int serial8250_em_probe(struct
> > platform_device *pdev)
> >
> >  	up.port.iotype =3D UPIO_MEM32;
> >  	up.port.serial_in =3D serial8250_em_serial_in;
> > -	up.port.serial_out =3D serial8250_em_serial_out;
> > +	up.port.serial_out =3D info->serial_out;
> >  	up.dl_read =3D serial8250_em_serial_dl_read;
> >  	up.dl_write =3D serial8250_em_serial_dl_write;
> >
> > @@ -144,11 +207,13 @@ static int serial8250_em_remove(struct
> > platform_device *pdev)  static const struct serial8250_em_hw_info
> emma_mobile_uart_hw_info =3D {
> >  	.type =3D PORT_UNKNOWN,
> >  	.flags =3D UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP,
> > +	.serial_out =3D serial8250_em_serial_out,
> >  };
> >
> >  static const struct serial8250_em_hw_info rzv2m_uart_hw_info =3D {
> >  	.type =3D PORT_16750,
> >  	.flags =3D UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP |
> > UPF_FIXED_TYPE,
> > +	.serial_out =3D serial8250_em_rzv2m_serial_out,
> >  };
> >
> >  static const struct of_device_id serial8250_em_dt_ids[] =3D {
> >
