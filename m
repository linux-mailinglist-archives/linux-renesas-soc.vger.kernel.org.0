Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4CB8691EA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 12:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbjBJLxy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 06:53:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbjBJLxw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 06:53:52 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2139.outbound.protection.outlook.com [40.107.215.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741AC2111;
        Fri, 10 Feb 2023 03:53:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULBaCaMuSuRQMrNQv48crJbef6xcqvmu6TFpNVN+NfWQMTTE3G8eoKxl/ZBOhYkz4OyKZHo29ujcp6i7sNc3ICJ8TldQUl0NgvUPiOl1eFkGy4gX7jXGjlySIwhLpBQdpnozL65mkC+DF/j576WXLwA0/zPLiyW559S7IhBGxlX+FCFBqOKE2L4j5gEJMm1SuOotaWTdU8HMCnDgUd13WeRi1ClHvMO3pNxO4cqwHj0iExt0tFN6vdjj0K78JwEZGzGLKIaEJTKpXTUtBrzsqh7ajA2txQgMEsCRn22cOdR7HzENXm2IZYAc7wPeW5LJJKyVINptR/alhEl7W2GfKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUfLIVgb9VKygxaS/ZbbZlDNysX4uAHJtBZE4qImhKw=;
 b=QW84Anz4vQ1vXEshgj7H9K1xfv6EO6sp2hxj8xHQLLWy8mww5o8FKwdGHn/QpVL/TVxYDMlENNUaFL2+cPmN8lnyxezJiPoRBGr99z/eeIW7diYQ9558rRP0HQY6kx5m1CEKkN6vfa70M+XZSrI+uX4CqqLnpAnM0gOwdaYVh9hOyuBrk9ITFbFx9TN9Q6JZey4oe7RWP3DFKN6Re+Khc4R9+gR7AHN70uowWq/Ol2XH0CT65+cOQMuCEB0GhXN9TAyTkzbhnYtM87wq/TsVbtIWKRTQRMv96xr68Q2BfPHHPevCnmmydgwCNz/JNY0MxqfrmFGxhsUK+JdwE/ym5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUfLIVgb9VKygxaS/ZbbZlDNysX4uAHJtBZE4qImhKw=;
 b=ArTGx+dOlWlMl8+WVVWSELA1E4LJ03hzCbSeDlvBFx4M3FxbfzJfdlJYh3PDYfLGSiFyPEFX0u2hFB/aA8UQSO6htHM96z5GbuAqd+5Uqx5UzWAf2OsBJlGsSEu3QE7hQEw+0BFU+YLU16LIyGG1tusF0H8AvBoccKj3qR1cMuY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB11184.jpnprd01.prod.outlook.com (2603:1096:400:3f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 11:53:46 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 11:53:43 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
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
Thread-Index: AQHZPIoo27lI1/ND9EOlwJCIJRVMQa7GpwWAgAAEK7CAAH13AIAAljxwgABFZgCAAA46IA==
Date:   Fri, 10 Feb 2023 11:53:43 +0000
Message-ID: <OS0PR01MB5922760B8431C526369EED7986DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
 <20230209132630.194947-2-biju.das.jz@bp.renesas.com>
 <4470e054-ebe6-b3ca-ffd7-1c7c3ae09f1a@linux.intel.com>
 <OS0PR01MB5922AC5FF10FFF5F8590B8AA86D99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y+VrOGR+7LbBMahz@smile.fi.intel.com>
 <OS0PR01MB5922C55E79014C84C742AE0886DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y+YjdghwT2msRriZ@smile.fi.intel.com>
In-Reply-To: <Y+YjdghwT2msRriZ@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB11184:EE_
x-ms-office365-filtering-correlation-id: ddfe8332-8d9c-47a7-e2f0-08db0b5d7558
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3J2av7iSanZmUd3qGf00cQGSsodCDYgmWYSiJjLz/EaNzl0XggnDz+Cwy+UczRGm3/n4Ygbf9Sfksw/j67ze7w25zLYfP0kqNM6MGx64QjQzx3kSpUvexyPwk56wIPWbLfjk48BjXEmVLMsQl2taWYgBADKB7jH2i5I384JSHgS1Li9wY49NCf4d7vmCSqDRUwZKrKdIHFHHdLtRSIvCtx4J7/iQ31MmZLxgntWS7Pg+H76eqFDJd4FIlitscGayBZv/9vGjEY4NQ6au1e72SLksbypTTLKMQTgNsSe+BBlP7S+5HbIgPyozAxhAL10A/hxxRgpkRxkmsC6SDBuxDiVof+yQJpbAcgh2IjQhdVgW8UgPJLXeYHYZ3EcHEWd1+HFD+fWF6/5QZFJuIjQOa9CXjDZE8mM+sP2B8uW0rsgkiwqNVzxF1PvvBKmeH6cAEAgd8ceDqChWDJz4lh5+Uon760zBt1W9qGi5cme5yNZFAkvLHa5xjVHXKURLzRG4BRVBCyS1Q3QzuqxNZo4a0ZAAa5ZkdFRJB4ajtoQoWw6YGCjJRF9P1Da9c4YbBvMLVs4II35f7LrdFWVxj4eepm/EhXye/I4qaGAgyMtVJvrtNqGe/6dXA4iiRio4dxYWIhqzVk8zF7b/PEiDX62tN0m0QiJ0FsvsTcEE7TkpkG6zPjZBXa1ivstwUvmkDDkh+AClTIFmV7rw/ghmO8AnsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199018)(38070700005)(66556008)(66946007)(38100700002)(33656002)(86362001)(64756008)(55016003)(76116006)(66446008)(6916009)(66476007)(66574015)(122000001)(83380400001)(6506007)(478600001)(186003)(9686003)(26005)(7696005)(71200400001)(8676002)(54906003)(2906002)(52536014)(5660300002)(316002)(7416002)(4326008)(8936002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NDOoWB2YC7D/0QwlN1T7RWHitnEpiFDC9Crm2bchcJBVp2yx5kKrxeUN7k?=
 =?iso-8859-1?Q?JJY37G3eM0VMn5O/DOrzYJTU0NGg2B/Qay7BkGu1VRDPOQB1mfITPbDqmy?=
 =?iso-8859-1?Q?xgoAikQCBMEBoQmpOelaI+M8mV7o9vA8mq+fH2hV0+QKgz3oyMQiN+lG1+?=
 =?iso-8859-1?Q?yrJfWcQysNOcBR6QaiS2S3RVwnsg9vve2pGVK+xff1pPcXUB0hjEg+55Sb?=
 =?iso-8859-1?Q?McXr+HJTx5ei8uhzQUlXxWCOQWi6Bi0dM1mZoPiNY5Crfco9CjXZ3ScHNC?=
 =?iso-8859-1?Q?9PGBdGjdCMftLIHxTFn2rrcyx1J4G2RD2qlDFe4ObmPnfGDhEcggS5o1X2?=
 =?iso-8859-1?Q?zM+OSkFE8KcevY8yu7MeULsMk2cnX1Il6nzrTT2zu4GR6HntDfui/kgteT?=
 =?iso-8859-1?Q?L1jqJBqocW62tXFbza6ppmjdZTpKxVsrrzrYjJAlqZCz+Sqm4qLnGlY8XQ?=
 =?iso-8859-1?Q?Gu4dbZUPLqFhfsXg0EwbezIuTtqKD2sD3+SmIGY/QTPb77w7hAIbwaQOZy?=
 =?iso-8859-1?Q?kJj84vmxzpTr46zua10rygASB8BHFrBOwvWSQbRcB5kk7+eUuFbahrkc+H?=
 =?iso-8859-1?Q?3ESn0pQfkzX74h/5F5wpbPFCdRTGVv6hkMUUExEmyjMX1IYO5Hr21Cy7b4?=
 =?iso-8859-1?Q?XXAKygAhjtjf5oXqzP7+mIDE8v38pDtbUgJaYO2LsqHnxoasCxLfsDcZfC?=
 =?iso-8859-1?Q?3ofMj1exZoFemk72qB04YRr8j7A0Qa8kMwc+Tvbntk3v7G87+62Xx+DXl0?=
 =?iso-8859-1?Q?1zcTkgPqQoRou4kA2APYpqvCzjePmyegg7ITjHKsF6BEuSZLc6XFxCeybx?=
 =?iso-8859-1?Q?z82UgmwGMLFQcZn2fQO9bHDhCPJ28gYbJvzbcP++UhTFu4NtnsbVl9cFKO?=
 =?iso-8859-1?Q?GGFURROZw4+7Xy8qR3hDFsQXkUWBPLT28uBnZNeKFCL0c/E2zC5TNtdL81?=
 =?iso-8859-1?Q?HCvZRxsKPrfwiWBV6lAmpxlaWTrYsEFP3fzoC0PTFvGTJwkeaJ5B+novHK?=
 =?iso-8859-1?Q?H0GsHZtft6PQhobCLdiQ6oD9iNBtVltUnKLAC5pBi/LXkCdoXOqkbXWFIs?=
 =?iso-8859-1?Q?tjdceJ7XbxSBsmieqrYe9WZS7K8jen4B1UIYM00+XhVXudLHCmLIDNz9si?=
 =?iso-8859-1?Q?7sHYNEPi11usO3HIE1XaUQ2lLHfGxSBHqupEO8GSUNdeH6waax6UsEPHFq?=
 =?iso-8859-1?Q?/XZelOWpBT9tUtPnreZMLHJkADAKdDSuSr7p1hPMv4xioFHR4NA/CLDVuj?=
 =?iso-8859-1?Q?ZL5fYQAivjiKR3ObIcnqIXp4Tve8i1/1Q3LPR996osgi7ro8pCiAytXwFu?=
 =?iso-8859-1?Q?zrtnhyNVobSXelfGwXQB2MYtySZFvCxV5QFjHQj515mIUxFP1hicKIOzQq?=
 =?iso-8859-1?Q?PAXG7dwancKsFe+dNMHPLGYRW2s0Ia4IXr5McjcrH/XuJ0lrBELW3UdyPy?=
 =?iso-8859-1?Q?S9tDDUxGfxf5O+Fk3sKQoEv/IvRyyvkS1XmKNdXwnpd/m7N7++Niv2zM9J?=
 =?iso-8859-1?Q?6MJ6EeqYbqz92PG9rnpKfiKYj7rEGj1sEFVO9iMw1s1v4LLOl4ruJKCdCH?=
 =?iso-8859-1?Q?9qhdoMiZu59m9mILW/htVACahev4i5Lk9cADMMU2cYnEi7P00BXxmnZR8R?=
 =?iso-8859-1?Q?MkcTUyj7d+yfEyph5YKqN/+DzQrEoL57BMjjylP1O2rWgDfLXz62rVtw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfe8332-8d9c-47a7-e2f0-08db0b5d7558
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 11:53:43.1212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4D5qf2lVAmDnlM+lKV9ifksTbjWOYlm3U2DNpDFYLcMNTjcVr3HN3iuyRXPIHeReiA67SvZck20Iw76CHk7XisVqzo0eaa4MX4TwwxyZ6LQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11184
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH 1/3] serial: 8250: Identify Renesas RZ/V2M 16750 UART
>=20
> On Fri, Feb 10, 2023 at 07:14:54AM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH 1/3] serial: 8250: Identify Renesas RZ/V2M 16750
> > > UART On Thu, Feb 09, 2023 at 02:28:55PM +0000, Biju Das wrote:
> > > > > From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > > > > Sent: Thursday, February 9, 2023 2:09 PM On Thu, 9 Feb 2023,
> > > > > Biju Das wrote:
>=20
> ...
>=20
> > > > > > +	[PORT_16750] =3D {
> > > > > > +		.name		=3D "Renesas RZ/V2M 16750",
> > > > > > +		.fifo_size	=3D 64,
> > > > > > +		.tx_loadsz	=3D 64,
> > > > > > +		.fcr		=3D UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10 |
> > > > > > +				  UART_FCR7_64BYTE,
> > > > > > +		.rxtrig_bytes	=3D {1, 16, 32, 56},
> > > > > > +		.flags		=3D UART_CAP_FIFO | UART_CAP_AFE,
> > > > > > +	},
> > > > >
> > > > > Eh, how can you reuse [PORT_16750] again in the initializer like
> that?
> > > >
> > > > Oops. Missed it. Is it ok to introduce PORT_RENESAS_16750_F64
> > > > instead as PORT_16750 is used by TI16750?
> > >
> > > What the difference to the 16750 from TI that prevents you from using
> it?
> >
> > Mostly it is identical.
> >
> > The main difference is detection method, and we don't have UART_IERX_SL=
EEP
> bit in IER.
> >
> > On TI, it sets bit 5 of the IIR when 64-byte FIFO mode is enabled when
> DLAB is set.
> >
> > Whereas in our case DLAB does n't have any role for Identification,
> >
> > It set bit 5 of the IIR when 64 byte FIFO mode is enabled.
> > and it clears bit 5 of the IIR when 64 byte FIFO mode is disabled.
>=20
> So the question here is do these minor deviations affect the actual
> functionality?

OK.

>=20
> Note, on Intel hardware we use directly TI16750 while we have no sleep
> functionality available IIRC. Ilpo may correct me if I'm wrong.
>=20
> > Other than that, when I use PORT_16750 type and capabilities in
> > 8250_em driver and add identification method for Renesas UART in
> > 8250_port driver,
> >
> > It detected as PORT_16750 UART, but I get below prints during autoconf
> > which is confusing for the end user
> >
> > [    0.214926] serial8250-em a4040000.serial: detected caps 00000900
> should be 00000d00
> > [    0.214975] a4040000.serial: ttyS0 at MMIO 0xa4040000 (irq =3D 24,
> base_baud =3D 3000000) is a TI16750
> >
> >
> > Modification in 8250_em driver
> >
> > +		    up.port.type =3D PORT_16750;
> > +               up.port.name            =3D "Renesas RZ/V2M 16750";
> > +               up.port.fifosize        =3D 64;
> > +               up.tx_loadsz =3D 64;
> > +               up.capabilities =3D UART_CAP_FIFO | UART_CAP_AFE;
> >
> > Identification method in 8250_port.c driver
> >
> > +       /*
> > +        * No EFR.  Try to detect a Renesas RZ/V2M 16750, which only se=
ts
> bit 5
> > +        * of the IIR when 64 byte FIFO mode is enabled.
> > +        * Try setting/clear bit5 of FCR.
> > +        */
> > +       serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO);
> > +       status1 =3D serial_in(up, UART_IIR) & (UART_IIR_64BYTE_FIFO |
> > + UART_IIR_FIFO_ENABLED);
> > +
> > +       serial_out(up, UART_FCR, UART_FCR_ENABLE_FIFO | UART_FCR7_64BYT=
E);
> > +       status2 =3D serial_in(up, UART_IIR) & (UART_IIR_64BYTE_FIFO |
> > + UART_IIR_FIFO_ENABLED);
> > +
> > +       if (status1 =3D=3D UART_IIR_FIFO_ENABLED_16550A &&
> > +           status2 =3D=3D (UART_IIR_64BYTE_FIFO |
> UART_IIR_FIFO_ENABLED_16550A)) {
> > +               up->port.type =3D PORT_16750;
> > +               up->capabilities |=3D UART_CAP_AFE;
> > +               return;
> > +       }
>=20
> What I don't like is increasing quirks in the 8250_port. Can't you simply
> use FIXED_PORT facility?
> Again, look how 8250_mid is written.

Coll. I have referred 8250_mid and added below changes and it is working as=
 expected.
I will sent next version after incorporating comments from Geert and ilpo.


+               up.port.type =3D PORT_16750;
+               up.port.flags |=3D  UPF_FIXED_TYPE;

a4040000.serial: ttyS0 at MMIO 0xa4040000 (irq =3D 24, base_baud =3D 300000=
0) is a TI16750

root@rzv2m:~# /uart_dump.sh
Read at address  0xA4040000 (0xffff933ec000): 0x00000000
Read at address  0xA4040004 (0xffffb4994004): 0x00000005
Read at address  0xA4040008 (0xffff8041c008): 0x000000E1
Read at address  0xA404000C (0xffffbb62100c): 0x000000A1
Read at address  0xA4040010 (0xffff94158010): 0x00000013
Read at address  0xA4040014 (0xffff8018c014): 0x0000000B
Read at address  0xA4040018 (0xffff971af018): 0x00000060
Read at address  0xA404001C (0xffffb057d01c): 0x00000010
Read at address  0xA4040020 (0xffff8e8b6020): 0x00000000
Read at address  0xA4040024 (0xffff8094a024): 0x0000001A
Read at address  0xA4040028 (0xffffb6e81028): 0x00000000
Read at address  0xA404002C (0xffffa663902c): 0x00000000
root@rzv2m:~# stty -F /dev/ttyS0 115200 crtscts
root@rzv2m:~# /uart_dump.sh
Read at address  0xA4040000 (0xffff9672f000): 0x00000000
Read at address  0xA4040004 (0xffffb4d63004): 0x0000000D
Read at address  0xA4040008 (0xffffbdd07008): 0x000000E1
Read at address  0xA404000C (0xffff9573a00c): 0x000000A1
Read at address  0xA4040010 (0xffffbd5be010): 0x00000013
Read at address  0xA4040014 (0xffff9451c014): 0x0000002B
Read at address  0xA4040018 (0xffffb47cb018): 0x00000060
Read at address  0xA404001C (0xffffa680901c): 0x00000010
Read at address  0xA4040020 (0xffffb76d1020): 0x00000000
Read at address  0xA4040024 (0xffffb8667024): 0x0000001A
Read at address  0xA4040028 (0xffffad9c8028): 0x00000000
Read at address  0xA404002C (0xffff8f46702c): 0x00000000

Cheers,
Biju
