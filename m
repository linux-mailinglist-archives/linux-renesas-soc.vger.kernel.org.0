Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C293D566FF9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 15:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbiGENxs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 09:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbiGENxf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 09:53:35 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F7224F32;
        Tue,  5 Jul 2022 06:30:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7q2OHMCwPPuGrHzHIZSz97Skzo/eUe0XBC5h+Y1Gtt+lJ/fxvMZ1j8qhD73gRqT6Cp0g48ug7t3gBeH4B2sKYjoQph3ercDntIBxB7KY6Qudg+56Z9cISvNghRRCvLobDiVPWh6zlNdmff7T2UFKFfTtrXPixosbkPAnZ/5gRXkKKQlUBJonhqdvZ+VxRIygid9spDzyoWB8bERzjx6/9aa+VVSL27IPtkW53NwK6nHfem2XY5bJQ4ROQ9dV+fR5IgxE2djusr65WcPHevFiKd4h0PsIzezbXBziHMG2cf51leHdIIDovcAtWWFTd6UNfIU7cHgdm8/8JWQIJhMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQzkxUDegxGgDJXnmWzbpyMeGlUe/4UGMONEmkwoQqA=;
 b=Z3YBEZFSDkJVthISijU5XGj69oE4CjF5mvSR7BNVambYEYVm6P40tPC/eMxQ6ysd58mISgTHencYj4pNefGI2loUvZdiqTYde5iReNbJ4BukCf+bnd/g+cdFQIUHrnL75HCT4XkmzGM0OkTNUGgd8K530dPA2jspzJ3y/vlFC//+vlk0PxkoUY1Rq9gqm68gJ7eV/A4ACkVdvOyt3WLLjR9ZxcYuzoJWb4YI3J4GcYkRVHFnX0+nmz5NCwvgdGTI9nY4zA0xST1qhywQcYDrXUNpsn1LSQ6P4hSs8era+03NrDJ96WOEAKhv0Mr6+UePAV6vTGEI2LfKyOrri5TDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQzkxUDegxGgDJXnmWzbpyMeGlUe/4UGMONEmkwoQqA=;
 b=kwycVZw6uKe9ZB9kthMTHYFipisOEvNsj5XFVN+y/fohscVhhEVtTbWZaJiYFLyKlPI2IMvZFOFvJ1+J1H5Nqm2+FXT6pMTf2ttwlJR884RzIrrqCvVjAmeeDAx8Wk5v8OIM6LvGpJ/U+an7bfDSgkrXBOe1HVHIoF+6gmlOz+o=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB7648.jpnprd01.prod.outlook.com (2603:1096:604:140::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 13:30:28 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce%9]) with mapi id 15.20.5395.022; Tue, 5 Jul 2022
 13:30:28 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
CC:     Jiri Slaby <jirislaby@kernel.org>,
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
Thread-Index: AQHYjFzicLJAOXueakmTUlp0Tbrj9q1tx+UAgAAIuvCAAYRegIAANeKAgAA+4gA=
Date:   Tue, 5 Jul 2022 13:30:28 +0000
Message-ID: <OS0PR01MB59224C802BFF8C61D616662286819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220630083909.4294-1-biju.das.jz@bp.renesas.com>
 <7431817a-ed5e-1de6-9f69-fda2c1907861@kernel.org>
 <OS0PR01MB5922F80CCAF4DFA9C2970FB686BE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922189B75A4C3A93BFE273B86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75VfBPou1TLk4ygsqF3VSJV84_UQLpwSojELsOt9F42Z_4w@mail.gmail.com>
In-Reply-To: <CAHp75VfBPou1TLk4ygsqF3VSJV84_UQLpwSojELsOt9F42Z_4w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee3b65fe-8985-4395-83a8-08da5e8a86b7
x-ms-traffictypediagnostic: OSAPR01MB7648:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cE96o892Y3Bz4vbbS4tGMiToDokSJMsBMvZuo6GMJOwFlESt2XjvUcei0Gj/3M2bjnnc/ez/bjgIGYbNqJVYZ8OlmRl+kvzdoZwV72Zhxz9MGGzL5n2XRV0y1SiH/8EMosfZ0E6/1qVbZPbwj9ophgR7U/cWf7zhzPV/AIVfTVReJTlH05lhHEfASpQAwoBmlavSoStFf1+SuzeIQVwlmJVsf0F/wZ86J47jwmbyWGdnndIVCkjzgVceUy7wHcCMPXHCOgKzmkMZbnupE0O5HNfyw5KY3bg0dhVt3KTkUECuuEYczSiFvev7GYNgJj6YU1z+FBTM2Trsx9GmL+Sx6kCgLuXyJNoQ+m6lHSUB7HZ3FOXm2C64Sm/9z8kuhmkYCm7EV9xFMhsPBBtFWIhh09RMUD7tpknz3D6jpx0bWr2tcjFQHXwgIeYHjytkJy7BSGVSfMXr/uKctAx5uVUOStN5gjbQkUyo0ATXCWtBU+Q2h5PDax7NJbKDdTGMPDWqAjA2gD2u6KLT/s6ObF8o0cq6FoeWs3zFAhiZjAO91J+pZtoTclZ0P2tQ77a7ScEnfD3fJ+8XnllZ6XOZ+6iK+YLNPB29kDP5Sg7Bm8ZL/RvNLLfwG8vkXUH2dHq8oTDohjKWxEWv1mVNMlQ1vbEvrWQD/hX9H2FPnB6rHkxfcUqNrCdieusInrw51pnVF/qu2fgx3FPbDKh/Y2PVviJCHldkgk5BZccfsYIU9GHgOZAl8Qc9tGBYxriXAVrAs932DTo0tGTSvePnLK5/UKoyhe/UIKGkq7vwSctiuSMurD0vJzMAkiLPLdsSvx7qSjSinTxulsqTzv23Bmmu9Uw2AWOXMms460RPj0lQRwjAkpg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(83380400001)(186003)(66574015)(71200400001)(33656002)(76116006)(66946007)(66556008)(66476007)(64756008)(8676002)(4326008)(66446008)(478600001)(52536014)(86362001)(966005)(7416002)(8936002)(5660300002)(26005)(38070700005)(122000001)(9686003)(38100700002)(41300700001)(55016003)(53546011)(2906002)(7696005)(6506007)(110136005)(54906003)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BrqDO6qtoUbLD2jRmBZeIOfXIGV8GDo+lGh7dY4AbOwBzwuTRrSEfOlWLM?=
 =?iso-8859-1?Q?5BSb7ueE5uWedJrtwDwQSPyQ3U3hwNhOSmqTeLOIRA/Z6hsfmwC0HVmnBy?=
 =?iso-8859-1?Q?Me+cQuxlAJBzNvRPXRrpOMVrzz86MXray0xeWKPIPBSVEnl7ljGgN1oDQj?=
 =?iso-8859-1?Q?b0C9xQVlnarR62V0Hgyk3NSB+vJVkLNr/xdXms9/mRSYUki7RtxBnid/my?=
 =?iso-8859-1?Q?qz1AJ/SivAWt4Dp5oGKpaIKfKnAoe4ydssQH+HwME1rYgJUl7FgQlYn4Jf?=
 =?iso-8859-1?Q?iQW30ar/d/HHcJ5XLmb7BIOe9+Xuk4nnBGpBRDBx/oOrZAHLvKTs54qx2H?=
 =?iso-8859-1?Q?EfOYpXY3XYUsABBwwtuV0/+rBsaBIaC1bCzIKN+wganNUE5U4QkLLRFbhn?=
 =?iso-8859-1?Q?TyfB9na5R6mKcK3ca3M3ESe9g8xZqEPesDMqfL8d9gzgn/6EO0xdBB42P5?=
 =?iso-8859-1?Q?fWcFqlw+GryLKwy84VIPpyLy9CO2lSW7I9uxFIDojhXZE60W8uOyhIgM5j?=
 =?iso-8859-1?Q?R6RJOP2VPljw/BLsbjMmGB8ytuFhytGSje+sHdtfsDLTNHIVMuYwNNPbRz?=
 =?iso-8859-1?Q?v2tHOuNKi9qnabtn58wPcK4jdIUtS3Qa5k67JUQc7of5nNqZQOymuDNdsA?=
 =?iso-8859-1?Q?BulEcuqyT/dWFFYeNE6qMtFT9cNVBi8D2tQZHrJGwGoqcFfVH/jjvKt0dS?=
 =?iso-8859-1?Q?EIWASpHHa2TbzKrVKKUNeE51TCq095KSPjnSGsXF3CfjPArXGjrnMlKQX8?=
 =?iso-8859-1?Q?gUB+E0TPggyqhyfboMdHCWo2SGDfZJZyTSMcaBLijx9r31Tio5l44i0O49?=
 =?iso-8859-1?Q?5PmiEkmoQ/1VltCTEiPXwMiMzDF6LY8mB1HRKE9/VLcW6sPsprnrafZx3u?=
 =?iso-8859-1?Q?o6y7Ythzhq0NyuJIUiBPuxtksRp6r/jXFVnda8qfpRZhxLHJsxnZpHLvM5?=
 =?iso-8859-1?Q?jUT3Fcqma3F/r+aaNuPTOJ1Qm2c0Jok8Glp8/sVU6Bke5l3HkKV1dgXEX1?=
 =?iso-8859-1?Q?0lyWt0WvHPuigMzQnIQDu0NGNrMJ1Ch1PbDtwGRK8rqrEToSU4KkZMIDV3?=
 =?iso-8859-1?Q?vsT+mFI32hJDN5Wye90sLw1uodZRYb1jTQQIJuOba3IdXnRH71L5CBoVsj?=
 =?iso-8859-1?Q?ckI3SS3yLhZbp8ySgZP0/WFDHaaEjzdT6vIAdvLl5giVjziAUgNYqdheIH?=
 =?iso-8859-1?Q?NNPzvgOR0OQeAfm0AvwmyK8CvF0VW957YYkt262WwDgeBuJzNBBGWtISQ4?=
 =?iso-8859-1?Q?AtUquZrI5GAh0hMU+RxCQldrVwI3Z4AWSKFLR8/NX3jdbn2lQKRS2PVeG3?=
 =?iso-8859-1?Q?eU+vdN8Y3FqHQfWgFti1gnxblrxHwJcUYl1/gIG3fZMMbeKq2Q5oOhXnV4?=
 =?iso-8859-1?Q?qAxZyzwEQJ7OWwxpM6qhvN/OqrA7GQrRvAuLE0JqRBFwfTna4Wct9nnrPO?=
 =?iso-8859-1?Q?Gy1hTuRhGILH5yh8l/vQHMcmECb0WIrMSsjdnaJoIPXqV9tlCOEzl+zCwC?=
 =?iso-8859-1?Q?VIPuwO0JvZRgZEBgokKBC945jie0nkWTjnikjRpjny1tJ3fXqgXqmcRV7z?=
 =?iso-8859-1?Q?HmdDa6t3afmx1H7jk+O+3H0blBGdnL+Mpl9iK2RGvENZhP9jvV7pRwetHw?=
 =?iso-8859-1?Q?C8XlL4MgVn9M7l+JHt5+eJ5qJ7JfA/qD/Ja+yCkBFeqe7smbe+TKtgIg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3b65fe-8985-4395-83a8-08da5e8a86b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 13:30:28.4705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/xkcILckK8iK9cCV3MncRDu4HckXSOcTIIxWtcHA73dlrwgz0nxxEgPrqOoPUzmsp3SrZP8hC2pCMwpD9KwoX5KnPbmIkX0JxVZrof0R3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7648
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Thanks Andy.

Please find the Test transfer size and baud rates in which this issue can b=
e=20
seen on RZ/N1 Platform.=20

One thing I noticed is, because of that wrong calculation, the PLL baudrate=
 divisor is set to higher value(128) instead of smaller one(13).

test_one () {
	local LENGTH=3D$1
	#echo "Length $1"
	${DIR}/uart-loopback -o ${TXUART} -i ${RXUART} -s ${LENGTH} -r
	if [ "$?" -ne "0" ]; then ERRORS=3D$((ERRORS+1)); fi
}

# Test transfers of lengths that typically throw problems
test_one_cfg () {
	local SPEED=3D$1
	./uart-baud/uart-baud ${TXUART} $SPEED
	./uart-baud/uart-baud ${RXUART} $SPEED

	for length in `seq 1 33`; do
		test_one ${length}
	done

	for length in `seq 2043 2053`; do
		test_one ${length}
	done

	for length in `seq 4091 4101`; do
		test_one ${length}
	done

	for length in `seq 8187 8297`; do
		test_one ${length}
	done

	for length in `seq 16379 16389`; do
		test_one ${length}
	done
}

# You need hardware flow control at this speed, otherwise you get overflow =
errors
echo "Parity: none Stop: 1 bit, 8 data bits, 'raw' mode, with RTS/CTS hardw=
are flow control"
STTY_SETTING=3D"raw -parenb -cstopb crtscts cs8 -echo -echonl -iexten"
stty -F ${TXUART} 9600 $STTY_SETTING
stty -F ${RXUART} 9600 $STTY_SETTING

for div in `seq 12 20`; do
	clk=3D$((1000000000 / $div))
	# Round up as the clk driver ensures the clock rate is below the requested=
 value
	clk=3D$(( $clk + 1))

	# Max bitrate
	bitrate=3D$(( $clk / 16))
	echo "Bitrate: $bitrate"
	test_one_cfg $bitrate

	# Max bitrate / 2
	bitrate=3D$(( $bitrate / 2))
	echo ""
	echo "Bitrate: $bitrate"
	test_one_cfg $bitrate
done

Cheers,
Biju

> -----Original Message-----
> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> Sent: 05 July 2022 10:30
> To: Biju Das <biju.das.jz@bp.renesas.com>; Ilpo J=E4rvinen
> <ilpo.jarvinen@linux.intel.com>; Serge Semin <fancer.lancer@gmail.com>
> Cc: Jiri Slaby <jirislaby@kernel.org>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>; Miquel Raynal
> <miquel.raynal@bootlin.com>; Emil Renner Berthing <kernel@esmil.dk>; Phil
> Edworthy <phil.edworthy@renesas.com>; Johan Hovold <johan@kernel.org>;
> linux-serial@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; Chris Paterson <Chris.Paterson2@renesas.com>;
> Biju Das <biju.das@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> Subject: Re: [PATCH] serial: 8250: dw: Fix the macro
> RZN1_UART_xDMACR_8_WORD_BURST
>=20
> +Cc: Ilpo, the 8250_dw maintainer
> +Cc: Serge, who I believe is the author of the lines in 8250_port you
> cited, sorry if I'm mistaken.
>=20
> On Tue, Jul 5, 2022 at 8:25 AM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> >
> > Hi Jiri and Miquel,
> >
> > While testing serial driver with RZ/N1 on 5.15 kernel, which is the
> > backport of mainline kernel, I seen performance issue with serial DMA
> for higher baud rates.
> >
> > The test app is taking 25 minutes finish, whereas with the below
> patch[1] it takes only 3 minutes to finish.
> >
> > Not sure has anyone seen this performance issue?
> >
> > [1]
> > diff --git a/drivers/tty/serial/8250/8250_port.c
> > b/drivers/tty/serial/8250/8250_port.c
> > index 468d1aca5968..321430176698 100644
> > --- a/drivers/tty/serial/8250/8250_port.c
> > +++ b/drivers/tty/serial/8250/8250_port.c
> > @@ -2680,7 +2680,7 @@ static unsigned int
> serial8250_get_baud_rate(struct uart_port *port,
> >                 max =3D (port->uartclk + tolerance) / 4;
> >         } else {
> >                 min =3D port->uartclk / 16 / UART_DIV_MAX;
> > -               max =3D (port->uartclk + tolerance) / 16;
> > +               max =3D port->uartclk;
> >         }
> >
> > Note:-
> > I have added below change on 5.15 kernel to test on all possible use
> cases.
> >
> > diff --git a/drivers/tty/serial/8250/8250_dw.c
> > b/drivers/tty/serial/8250/8250_dw.c
> > index 7884fcd66d39..6d352981fb3e 100644
> > --- a/drivers/tty/serial/8250/8250_dw.c
> > +++ b/drivers/tty/serial/8250/8250_dw.c
> > @@ -643,6 +643,26 @@ static int dw8250_probe(struct platform_device
> *pdev)
> >                 up->dma =3D &data->data.dma;
> >         }
> >
> > +       if (data->pdata->quirks & DW_UART_QUIRK_IS_DMA_FC) {
> > +               /*
> > +                * When the 'char timeout' irq fires because no more
> data has
> > +                * been received in some time, the 8250 driver stops
> the DMA.
> > +                * However, if the DMAC has been setup to write more
> data to mem
> > +                * than is read from the UART FIFO, the data will *not*
> be
> > +                * written to memory.
> > +                * Therefore, we limit the width of writes to mem so
> that it is
> > +                * the same amount of data as read from the FIFO. You
> can use
> > +                * anything less than or equal, but same size is
> optimal
> > +                */
> > +               data->data.dma.rxconf.dst_addr_width =3D p->fifosize /
> > + 4;
> > +
> > +               /*
> > +                * Unless you set the maxburst to 1, if you send only 1
> char, it
> > +                * doesn't get transmitted
> > +                */
> > +               data->data.dma.txconf.dst_maxburst =3D 1;
> > +       }
> > +
> >
> > Cheers,
> > Biju
> >
> > > -----Original Message-----
> > > From: Biju Das
> > > Sent: 04 July 2022 08:12
> > > To: Jiri Slaby <jirislaby@kernel.org>; Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>; Miquel
> > > Raynal <miquel.raynal@bootlin.com>; Emil Renner Berthing
> > > <kernel@esmil.dk>; Phil Edworthy <phil.edworthy@renesas.com>; Johan
> > > Hovold <johan@kernel.org>; linux-serial@vger.kernel.org; Geert
> > > Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> > > <Chris.Paterson2@renesas.com>; Biju Das <biju.das@bp.renesas.com>;
> > > linux-renesas-soc@vger.kernel.org
> > > Subject: RE: [PATCH] serial: 8250: dw: Fix the macro
> > > RZN1_UART_xDMACR_8_WORD_BURST
> > >
> > > Hi Jiri,
> > >
> > > Thanks for the feedback.
> > >
> > > > Subject: Re: [PATCH] serial: 8250: dw: Fix the macro
> > > > RZN1_UART_xDMACR_8_WORD_BURST
> > > >
> > > > On 30. 06. 22, 10:39, Biju Das wrote:
> > > > > As per RZ/N1 peripheral user
> > > > > manual(r01uh0752ej0100-rzn1-peripheral.pdf)
> > > > > rev 1.0.0 Mar,2019,
> > > >
> > > > Is this public anywhere?
> > >
> > > Yes, It is available here[1] see page 72 and 73.
> > >
> > > [1]
> > > https://www.renesas.com/us/en/document/mah/rzn1d-group-rzn1s-group-
> > > rzn1l-group-users-manual-peripherals?language=3Den&r=3D1054561
> > >
> > >
> > > >
> > > > > the value for 8_WORD_BURST is 4(b2,b1=3D2'b10).
> > > > >
> > > > > This patch fixes the macro as per the user manual.
> > > >
> > > > I'm curious, is the bottom bit from "3" ignored by the HW or does
> > > > this fix a real problem in behavior? Stating that might help
> > > > backporters to decide if to take the patch or not.
> > >
> > > See page 72 and 73.
> > >
> > > Yes, it fixes a real problem as by using a value of 8 , you are
> > > wrongly configuring DMA_BURST_SIZE of 1 instead of DMA_BURST_SIZE of
> 8.
> > >
> > > b2, b1 bUart_DEST_BURST
> > > _SIZE
> > > DEST_BURST_SIZE
> > > Destination Burst Transaction Size in Transmit FIFO.
> > > UART is the flow controller. Thus, the user must write this field
> > > before or at the same time the DMA mode is enabled. Number of data
> > > byte, to be written to the Transmit FIFO every time a transmit burst
> > > transaction request are made on DMA request.
> > > 2'b00 =3D 1 byte
> > > 2'b01 =3D 4 bytes
> > > 2'b10 =3D 8 bytes
> > > 2'b11 =3D Reserved, not used
> > >
> > > Cheers,
> > > Biju
> > >
> > >
> > > >
> > > > > Fixes: aa63d786cea2 ("serial: 8250: dw: Add support for DMA flow
> > > > > controlling devices")
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > >   drivers/tty/serial/8250/8250_dw.c | 2 +-
> > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/tty/serial/8250/8250_dw.c
> > > > > b/drivers/tty/serial/8250/8250_dw.c
> > > > > index f57bbd32ef11..931490b27d6b 100644
> > > > > --- a/drivers/tty/serial/8250/8250_dw.c
> > > > > +++ b/drivers/tty/serial/8250/8250_dw.c
> > > > > @@ -47,7 +47,7 @@
> > > > >   #define RZN1_UART_xDMACR_DMA_EN         BIT(0)
> > > > >   #define RZN1_UART_xDMACR_1_WORD_BURST   (0 << 1)
> > > > >   #define RZN1_UART_xDMACR_4_WORD_BURST   (1 << 1)
> > > > > -#define RZN1_UART_xDMACR_8_WORD_BURST    (3 << 1)
> > > > > +#define RZN1_UART_xDMACR_8_WORD_BURST    (2 << 1)
> > > > >   #define RZN1_UART_xDMACR_BLK_SZ(x)      ((x) << 3)
> > > > >
> > > > >   /* Quirks */
> > > >
> > > > thanks,
> > > > --
> > > > js
>=20
>=20
>=20
> --
> With Best Regards,
> Andy Shevchenko
