Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53ED669AC05
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 13:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjBQM66 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 07:58:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjBQM65 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 07:58:57 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2115.outbound.protection.outlook.com [40.107.113.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C1510C8;
        Fri, 17 Feb 2023 04:58:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caXOVLT5jNVICKc06uy3aQA0pqOleSJIvjSXFarN5DeJ6732Icw9mB3J7680JP1EoH3+alyoWovbRSN5AoOwYsisLDaC7XHFS/1Q0W2zvbr3DvzNvqwxlF5qbxwww1zU7EhjMQkwAbOb2Vb6uILdUcDJ5xVKZUcCltuf3L+dwKrRvFXe1AXYoObVy6jL+rIfoIg8GFfFvpwGElqMDRFxnHvyPbHnqOlRukiqYlLsMi35UpFhY303yoadItqHrfga5p7RMWDnyGBMHd2vKtVOe4UV1RpCp7e1a2OYMLY8DSAKEGtLT0EksTh9dmp3ZlsQFlwrkNL3Uex8iSCDk3UUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNdri58VuH2v0KLQRY7HLeID1eGePxBTpuehwiN97eM=;
 b=FEuF22Mg3Mlq4m7e5W4WEEKzq+gPsezKNEJi3qCXUAE381mWEoCqT4Jp7HQmTHyyhLdclDWChybN3mySmfLy9qRZSIDPHTpnYoMSBxIulAMkOnC4olnIj9HFkxEp/qjPolmeeAt97tN0wl1mMJXJwd4lS1oD3tP5UT8PGbKRmRb9l7uk8WSxDsvKDa5VrQOmkiUjAEOGaRkqmwALKn0E8fCOjc5uzeuu9hGbdIHWrMTO1aEhUAjDC0N7WkPP4rK/TGkyTbC4pP8KUiizpTjYGyDFPqPC5buNEZe/kQFLgjiStJzdfGWv0nrw05jTrY2mBoIv0A4hXH+4ToHppgPCFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNdri58VuH2v0KLQRY7HLeID1eGePxBTpuehwiN97eM=;
 b=Wksj54ryq4vfw1jgZveJ0plrd7IkBcdh2Sz09t2RiOAdAgIdZkHmrvvWi5FlXGCJQC+cVc/myNMnxgk1phEgtmUcaafpV2yjAZjIQmY7VU5Boewt1ZWV7AgM7JpwISNFjX7jnsr912whjdiMxDW3pkUKHk21GN5sEk3pVulu+hw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB9762.jpnprd01.prod.outlook.com (2603:1096:400:22f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 12:58:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 12:58:52 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset for UART_FCR
Thread-Topic: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset for UART_FCR
Thread-Index: AQHZQsUI4w2Y27F7KECGzFHdmm5uz67TBUiAgAABfXCAAAKCgIAAAoqggAAJT4CAAACb8A==
Date:   Fri, 17 Feb 2023 12:58:52 +0000
Message-ID: <OS0PR01MB59224C91EE2092455083317886A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-6-biju.das.jz@bp.renesas.com>
 <a893f031-b08a-638a-70e0-3e6e37e9954c@linux.intel.com>
 <OS0PR01MB5922EA33B354EB2B31680AB686A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <1e8b1e7-5f3e-61be-dd65-8d5da7ca14d2@linux.intel.com>
 <OS0PR01MB5922B4904BB49D53968AE42D86A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <b75da8c8-6f91-c227-6fdb-6b4fdbe6d3c@linux.intel.com>
In-Reply-To: <b75da8c8-6f91-c227-6fdb-6b4fdbe6d3c@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB9762:EE_
x-ms-office365-filtering-correlation-id: 25c02b06-eec1-4660-6fd1-08db10e6b834
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: os/LdQOenzAyNmSuSg6L4OhqVGpmKqMpS//fWefaAcgu2Qgx1I2s+TsJ0XfMpWRJ1XLQoPnYDQ6AP27Vvvc1Vvl2Wna6xLOAJbQP1u2E069ynfWROZTYPvn5RaqZx8A/iyDYR+4ES2IwJdz8Xz28Mk4Lebl5jAcIBy3yE/GG862ZBw+RhXdSvw81JOI4Hcra9JGFWdOe24qfe8TcCUV7ihqs2aqemazyj5Ff9VVi95IF52lm0iFX3cmMapCy3IfSpvAmhQqS5nT0SUbzUkzDjxDPfNpxq0ubedmRvi6JheExCqOpcHcZiwWKeNivenHqez1H9Hw8c0LCADlTlVkFpzP5Yd6JEBoB5LzSLy2AzkfCSSzRjthXF4pf/A0aS94GbG6Es/Bi13k8xycR4zdQ3DYWLs9KWYP3q0OWKjHDgyQECwD8j+sLi7zMhEYWyqgihVOLl349dxYbfV4xXvSByF4g4y2bCg/V8uzzjYtCkhq6dlDADDEC/d+1aZU8nDZYUZ10lmK3kvH7MZHqlcN6lTsWH55kEqvn1nvLi7DO1n2CrTSZkH2yNx72foDd5iiO6V4nDFN7e/+1MRN06tM1HXN+bdYiWOgiTsCGKlDhD5ZqudcGmLUtdvK56z0fo4/BOfkCFjO6rn33kd8gbT3oN/G7OxkxixbccpZg96LFrN4TFelcxya2z9qAPpDQHb6+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199018)(54906003)(316002)(186003)(71200400001)(26005)(122000001)(66574015)(52536014)(5660300002)(8936002)(86362001)(41300700001)(6506007)(66946007)(76116006)(66446008)(66556008)(2906002)(8676002)(66476007)(4326008)(64756008)(6916009)(478600001)(7696005)(38100700002)(55016003)(38070700005)(9686003)(966005)(33656002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CZ0u7F/iDxJ47UcAYHvr0dG2DjiX1OYYcf/T5Bs1NhEP10Wz6A8IjhfZ1Z?=
 =?iso-8859-1?Q?dQLJSVAd209U1k8oJ/c13XJ7R8xExO6H6uzPNoIGxSWOu6sWP9KR87w/b6?=
 =?iso-8859-1?Q?gwaIv650oN7B9rI5x0rYkbbv1bhVN4CslD6IsFfqJc9c6ZQ1y2x8utb+0s?=
 =?iso-8859-1?Q?DvcDkaWbuMq6J9DhkKQgvp8NqKter6QlrsapV2cqbXiai55n2Y4Sdwe0fT?=
 =?iso-8859-1?Q?u+F9V2+fsBZdw8qNXJAoNroAVaJp8g4Bzr9A0JoexJO04BEIULMSzlJXrm?=
 =?iso-8859-1?Q?Y7SwmLT/vetcDDySAD/e4V1dBWrRtXAFFZwyzZOq3dhzDaQ1lbmOYc1zr/?=
 =?iso-8859-1?Q?NHKIuvT/RQYoKF3iJdcS3Uje/59PlDtcIoXyDm6aPTE7nvKgjVpVJMjvWm?=
 =?iso-8859-1?Q?nkQsR6DA3vXTqNZC9GNYIwFozNV5C1XygeIUbwFZ54aYKk/TXrcsCtY+kX?=
 =?iso-8859-1?Q?pRWsb5LYA1nzXtn7AdjjhWgo9JuH9nxtIPepNHrb5UNEq6aoI78FgNdjBL?=
 =?iso-8859-1?Q?6taMAcQ3Oa9U6KiQwOIJYhp/MOZNFa1R1BnmpIgQAyzfKAjEZYEavzz64Z?=
 =?iso-8859-1?Q?6qI8/4Sxrxvq48B1tl6r90HcSWa+WxJxRJ2TpdJ8rsWomrBcy8I0BBT6Bw?=
 =?iso-8859-1?Q?QIYIDtt9eSEzh1UAd0gBkt0hEX26xdIx3s/VyGtTu+2JYG1QbRSUHifAjA?=
 =?iso-8859-1?Q?hMlt8MQkTxVcxVyMQk4xeaZr1rAUnZkOUWgwxyZKa5Dp5HpauK15mVUBQ8?=
 =?iso-8859-1?Q?2/mtqDf0qZ0IOSlBbY0NxYYINczYWWk8kXi10ud37A6/VWf/J1ozG84+Ed?=
 =?iso-8859-1?Q?Tv86xrF7wwY2A3CkJmXsK6A6MVofaL5Hd2ljLRSwWhlf+rGyGXec1oDxzV?=
 =?iso-8859-1?Q?lI1yYD9KNwiYG42PzIB4ifLIDZlZ4h8gA7p63vPUFQ+eOx/C8XOgroH+Bi?=
 =?iso-8859-1?Q?biPIhVQX7v3RTrTquKBCkbFTVJwg8BnCGlvhrrMws3LfezYrgW0z055nFc?=
 =?iso-8859-1?Q?yV7NHc8Xn9To2TWraY5jqNzkLgf7FnbgSDUyZYOXL0LhTgk4FW3/zf5L65?=
 =?iso-8859-1?Q?1MUUYmwPJbw9aAqA/UgaUBQCTT0o81/h+dlr0gv8xJMPmEfu3qkgoOkngm?=
 =?iso-8859-1?Q?iH2P15n/W2Wc5Zi0qarqzqfk2o3lw8rgQf1KNkoDrzi0Wje1pvHRG2xws9?=
 =?iso-8859-1?Q?CrNwWusN4FlQvc81mNHzvs0Q02Kn5Kp9eY0yWO79wppF0DfKKSmIUZMA4+?=
 =?iso-8859-1?Q?lyJ3vfZqCM7M37nRxLDt9ca5Or/rGRgU3w7v6YdLL8EO0szheXuD2zsJ0v?=
 =?iso-8859-1?Q?XGAriOGdziEwCck5j24KcG0nZYAdNSbKq/DTu3EdTcQtU7NE57Wv8+xxoe?=
 =?iso-8859-1?Q?xcUWLzesEIunrQoUr/Igllxn82M7RgLlSwzBNT7S63+iCbsCURYnfJ6BHk?=
 =?iso-8859-1?Q?fCacPaB4LWzJeHcKCs0ZB0KvoDYTs0/chmTCMAgYSjnbO/nirCAfsdBHQ6?=
 =?iso-8859-1?Q?Tu9Xy3RSAOpapErS6vod9hLgzHnc0fZCpf8ENQrqMvird9i7Uh6MunqXV4?=
 =?iso-8859-1?Q?90gQDvbNBi4yCler5lD5Jz9iyr4wJu1cLnKwOO1vwur511URqpl8RhUQ2H?=
 =?iso-8859-1?Q?NILxB1k41fW4DfHvc+b4SaflZO+0wCZWKxSzTxYxL1f0RjKg4d4KnkCQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c02b06-eec1-4660-6fd1-08db10e6b834
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 12:58:52.1555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HUUQO5lrQ7xTa0Yn1SZCvH2oy7noofssqzpN+JzDcZ7l9vbwbhCDRK+Q8Gh3WIcmnQ1pKmdo6ISWCN4rKtzCOIB66EGgexh/kgTBw9DNEL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9762
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ilpo,

Thanks for the feedback.

> Subject: RE: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset for UART_F=
CR
>=20
> On Fri, 17 Feb 2023, Biju Das wrote:
>=20
> > HI Ilpo,
> >
> > > Subject: RE: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset for
> > > UART_FCR
> > >
> > > On Fri, 17 Feb 2023, Biju Das wrote:
> > >
> > > > Hi Ilpo,
> > > >
> > > > Thanks for the feedback.
> > > >
> > > > > Subject: Re: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset
> > > > > for UART_FCR
> > > > >
> > > > > On Fri, 17 Feb 2023, Biju Das wrote:
> > > > >
> > > > > > UART_FCR shares the same offset with UART_IIR. We cannot use
> > > > > > UART_FCR in serial8250_em_serial_in() as it overlaps with
> UART_IIR.
> > > > > >
> > > > > > This patch introduces a macro UART_FCR_EM with a high value to
> > > > > > avoid overlapping with existing UART_* register defines.
> > > > > >
> > > > > > This will help us to use UART_FCR_EM consistently in
> > > > > > serial8250_em_ serial{_in/_out} function to read/write FCR
> register.
> > > > > >
> > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > Suggested-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > > > > > ---
> > > > > > v4:
> > > > > >  * New patch. Used UART_FCR_EM for read/write of FCR register.
> > > > > > ---
> > > > > >  drivers/tty/serial/8250/8250_em.c | 13 ++++++++++++-
> > > > > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/tty/serial/8250/8250_em.c
> > > > > > b/drivers/tty/serial/8250/8250_em.c
> > > > > > index 499d7a8847ec..4165fd3bb17a 100644
> > > > > > --- a/drivers/tty/serial/8250/8250_em.c
> > > > > > +++ b/drivers/tty/serial/8250/8250_em.c
> > > > > > @@ -19,6 +19,13 @@
> > > > > >  #define UART_DLL_EM 9
> > > > > >  #define UART_DLM_EM 10
> > > > > >
> > > > > > +/*
> > > > > > + * A high value for UART_FCR_EM avoids overlapping with
> > > > > > +existing
> > > > > > +UART_*
> > > > > > + * register defines. UART_FCR_EM_HW is the real HW register
> offset.
> > > > > > + */
> > > > > > +#define UART_FCR_EM 0x10003
> > > > > > +#define UART_FCR_EM_HW 3
> > > > > > +
> > > > > >  struct serial8250_em_priv {
> > > > > >  	int line;
> > > > > >  };
> > > > > > @@ -29,12 +36,14 @@ static void
> > > > > > serial8250_em_serial_out(struct uart_port
> > > > > *p, int offset, int value)
> > > > > >  	case UART_TX: /* TX @ 0x00 */
> > > > > >  		writeb(value, p->membase);
> > > > > >  		break;
> > > > > > -	case UART_FCR: /* FCR @ 0x0c (+1) */
> > > > >
> > > > > 8250_port wants this to remain in place, I think. Otherwise it's
> > > > > attempts to set UART_FCR will end up into wrong destination.
> > > >
> > > > Oops, next patch has this change.
> > > >
> > > > +	case UART_FCR:
> > > > +		serial8250_em_reg_update(p, UART_FCR_EM, value);
> > > >
> > > > I just need to keep UART_FCR for this patch and remove it from
> > > > "serial8250_em_serial_out_helper" on the next patch
> > >
> > > IMHO, the extra layer + _helper seems pretty unnecessary. I don't
> > > see any useful thing it achieves over just having to serial_out
> functions.
> >
> > Without helper, it will become cyclic right??
> >
> > serial8250_em_serial_out() needs to call serial8250_em_reg_update()
> >
> > serial8250_em_reg_update() will call serial8250_em_serial_out() for
> writes??
>=20
> With your most recent code, yes it seems to happen. But why did you remov=
e
> the separate serial_out for RZ. There wasn't any cyclicness when it calle=
d
> serial8250_em_serial_out().
>=20
> I'm a bit lost now, are you saying that this change is needed for all
> devices 8250_em supports (which is different from what you initially
> presented in the early versions of this patchset)?

Yes, That is correct. Please see the discussion thread related to this[1].

Geert pointed out that UART register sets between RZ/V2M and
EMMA mobile SoC are almost identical.

"According to R19UH0040EJ0400 Rev.4.00 it is available on EMEV2, and the
layout looks identical to RZ/V2M."

Niklas tested previous patch series on EMEV2 board and=20
It detected port type as 16750 and done read/write test
with 64-bytes fifo enabled.

EMMA mobile SoC is very old and hardware manual
is not updated for long time related.

So we guess it is safe to apply this restriction for this SoC
aswell, since there is no regression.

[1]
https://lore.kernel.org/linux-renesas-soc/8585f736-cf3b-b63c-753f-892d4051a=
da3@linux.intel.com/T/#mf5e3059e792ab1a5dd96a769b9c69ae6befb25c5

Cheers,
Biju
