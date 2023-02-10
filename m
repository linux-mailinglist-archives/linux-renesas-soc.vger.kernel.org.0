Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDDB66922DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 17:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232398AbjBJQBe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 11:01:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbjBJQBd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 11:01:33 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2109.outbound.protection.outlook.com [40.107.117.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6605895E;
        Fri, 10 Feb 2023 08:01:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAiQVw117QJPZ/9WEHpd8rTD7KoVLroWKFjnyeABLFbZecc4Nf6bGcyxbiI/IVn5cZNfEizUkuIqcEee10ZQURFMsx+HeZRJIrOazlC0G+AUqIp2LEzyjpTT+3ioGRCkSEXyE2g4R+iBlt3jn9ayoinZaFiqV/0QcqsBydb38hdRpNTCcVNJFmKWJPz+bi/JoXIsG1Ae8cwYzjvWaWgQ2SHgmMb5d4lgyGP8fguiLlaCKFmqgUzQc/vREZ1Ym5m5D3NVwJSalHuMAb0ODiImxyQ4Qmg21HUKE/fDhbxP4B54ko9GwWJe8zcvUyVGZI6Wro75+eLb6u+eYiUUTkvMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KboC8VZpF7fx7N/OzexBfDwtinDF4VksoN4KnczkEuk=;
 b=Mw033ffeZLbKaGAow3VLS5zHpVgmd++py48p79GKpkCR+TnxbQHwxoA3tTIXXvHgOLT85UDUHqVMLE9cEWdcWE2Nf0Z19b3ReAAzeYNlvVA4wqquFjm9fn/dEfyyj0nafdGEfyOM72LBn6Lkqt30zLuLfWOemS90BtRFpqRoax4VfO9TTfj0WvxsSlrhcb461AYeb3nAjLSAnvNGMA1kYjJs7lrxMPdA7oRZUT8cjtAlabpF+HRDhmBqLuR6+1kX/NRd+iwtBXCioqVUUR//nChcupddwrWRKJx9eJYzwFij2psZSXuzo9iHQq0v2xgswq0NnvQ7gAOs5mCNZAw79A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KboC8VZpF7fx7N/OzexBfDwtinDF4VksoN4KnczkEuk=;
 b=Up83jQQraoDxs14P8d+SMAXDTvr0KS/9wN7Hlc4bQIeM/wUkn0i5v3ygtmVEQ6yeCbEswR8bcBIR3+1ARx8APbuOgexwOM3jYJ7jjbUdEXr7TuiFoeMucXP7cEb0hEwOCD7DN1b34hx19eSvzjNIrHBAe7PBzBJSFwt1eNqVPa4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8673.jpnprd01.prod.outlook.com (2603:1096:400:13e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18; Fri, 10 Feb
 2023 16:01:28 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 16:01:28 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Topic: [PATCH v2 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Index: AQHZPWY1DPXNGdAFkkCRWvMr19HFFK7IVICAgAAAkkA=
Date:   Fri, 10 Feb 2023 16:01:28 +0000
Message-ID: <OS0PR01MB592222F997B7CB5976B7618186DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230210154140.338352-1-biju.das.jz@bp.renesas.com>
 <20230210154140.338352-4-biju.das.jz@bp.renesas.com>
 <954bb490-b516-6624-5bb9-e82434fc95f0@linux.intel.com>
In-Reply-To: <954bb490-b516-6624-5bb9-e82434fc95f0@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB8673:EE_
x-ms-office365-filtering-correlation-id: dd9990ef-a978-4142-c97d-08db0b801181
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: roDeY7meP5f2kiUHxvzfGHQYLXMbElH6hKYkiuSFbdyaHRyfbCEXJgs5s8HSH/A7na9AE4oMHkZU7fzivvEjvSgNgB9A3IC3DMsoJWc9JDWizbS53HPrdsbLovji/OyXFoBKSoQxrBzpLuMNS1rbcm7ecucPKZzl5qbhsjuDuoyFbti5vSirfXfvBpoLo++Y+q3Mv3fxxcgsrKYSrLnaSMxKu9S/aqZ6hWCJnRh4YdxGzYl5fnZAMsgXsP9oMDYganGlMqDU4vc28LIT0HTWKbbRxEPk/9h/uIwn35jK2muybe/XQhFD64LeiOoqJXAynnb2J/JcqJ5KZBDJFAs4GsQxbJAcyjYV3h4ZOh22+KG5LswToCThkYGgdJBjk3C6m802/ZUFsYxU5slltFYh8COpmEN7vgJ2zIdfjp3BZ1sfxl8mGjniQTnbIqvU3QlwuRLYFLIOCOhSjRRGlEeDn13Q6A9XBe8Ast5BvFe/DOdaLY2yXzW2zyHQI4PQIwKrOE/BRbHDVLegCZiRQ9hBUl23WR3N9Vak8OUpMlspu46KDvf8TpaLd+ZZgzhoeF3uh3UvNgngFlVpLzKi17aCK3ruRF0DlRtbwb6ZoCncecivicYq3aDZlgfE4zZQCUEZs6brvFMxSX7ChYMCvPb0ojGKfaC1ovqJ2VdRZZpvpN1N+SOAxw80rENidsKjVCHajggNGGnaTZgWI9//6jLfhw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199018)(2906002)(186003)(86362001)(122000001)(8936002)(5660300002)(38070700005)(26005)(55016003)(6506007)(7696005)(478600001)(52536014)(71200400001)(33656002)(6916009)(83380400001)(9686003)(38100700002)(64756008)(66476007)(316002)(4326008)(66946007)(66556008)(8676002)(66446008)(41300700001)(54906003)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?D+yu7YnuGvAgws7lnOfrmASZVfPOO/umxrdzdBdS4VyjmoyVeBDOmM6gAY?=
 =?iso-8859-1?Q?ajQPHUcVTmqrp8I8mkz48ya+4xhzdf3/eju9RN08HIeDzPP7zVhug+jCc2?=
 =?iso-8859-1?Q?nsbIWkAjHjOVABheDf0wumcSgTirf264vBjFFEE15QeSkLwi3LY7uMwzSJ?=
 =?iso-8859-1?Q?qmat7zetBf723Afou4X89uqmTdvNiLDWIt5GYsMnNCWR+qfoieGdsrq7K3?=
 =?iso-8859-1?Q?wMAJcvJQ0DqQSJ299z8KBVuyIbrDqIu9SM46AuYf3qKEr4L9R5xwQJFEdD?=
 =?iso-8859-1?Q?0oRGquXAIGL8+0BEUogyEOwSnxbgb4fT6wu1QDryTRXg4TqR2zkcxG0wUk?=
 =?iso-8859-1?Q?ogmFB7Wp6aTOuCbok7QVeEAnPRiOFf4WXXoG4YHvi1WBkGmstb4nI6K81N?=
 =?iso-8859-1?Q?DTE/XSFlZhGzsKkpLk1s5VZlXSEj4U4YzwhnVAOE8iA+BDYo9+eA9RUwEf?=
 =?iso-8859-1?Q?QRS5oVKrvFYUS0BL8kikuxF02+Kt1EB7RJoTJ1TeWYYfC27vFB9O5hypuH?=
 =?iso-8859-1?Q?QVn5rBRFRNTL0dnB9VgegV/kHALVBhtahij++tRL1hrqZwImzix/u6dlaR?=
 =?iso-8859-1?Q?BopAIhl/ogvGY77cg48EuXw5rw8Z5WNbbrWv64ynlL/cUo+I8heaCjEo5b?=
 =?iso-8859-1?Q?EDA1AO0+RvBweyaJg0v5/MocbwpL13xkmqDF65NdvMeWHePawQ677VIJ/S?=
 =?iso-8859-1?Q?NagpYifh1YHmBBklhv2mCyy7ey1cOJco2/rsHx7jHtYRolIyabzNrV7M7O?=
 =?iso-8859-1?Q?TOTnYMDGOXdd+WNwUJljBqsVPuEwwtZzdnx6rYixZ6E50dFfPp65R3I2Kd?=
 =?iso-8859-1?Q?Vx4B82wKOaFMP3rleB+BQPeHe6vsXab6JPmlCUkIJY05x3mh+ESTJrzDbT?=
 =?iso-8859-1?Q?Ha+QDOYFPtaB0f+bxZnHkX00mNKVK0Wdh4jiVE3Uo+23P11dL0n4sW/+CC?=
 =?iso-8859-1?Q?Jys/jbRhKV/5a341jrFNvlIq8TSmKD+h+JtJSWr5s1uxv9jsh/MSzW8+Df?=
 =?iso-8859-1?Q?70+uKAGxEG1VtZBbWxP+gqxgEOc+UI1HC6BKGZMOBnQqhmNS/Kw4Fh+VGe?=
 =?iso-8859-1?Q?4LgGQ3xJlXpSHR/Ad6yjHCP3nJhXy8PJo6/vq2cW2kHxI586fZwxk3HW42?=
 =?iso-8859-1?Q?2KMTMC7/XRrztZ302ih5lqoZj6o9lVaVyk+NjUkhwdY0dsdrniSo2AyAlp?=
 =?iso-8859-1?Q?JU1x3xGBorjzpv1rWDafMKEJSDUNRcWEiNr3nk1fMMwzBBQUTIhtLAZQk2?=
 =?iso-8859-1?Q?FEIa0qbN0BUEir1WmQO9eG0QN3wfjmDtFvmrDYDshzsWGra/jvopRnb6Rh?=
 =?iso-8859-1?Q?iIKSMFxAT47E6yiKP/r+e2++0Kj7D6M64r6EldlZOnC5+BBpJ1WVmOoc09?=
 =?iso-8859-1?Q?NR4m1Wr+2L1hWWLKaERtRIoTwU7QZ5KzID29XWib37is/Dkp5yrGZt7BQH?=
 =?iso-8859-1?Q?zATGT/rTlqKBWcPvQvtvTmOSqVDdSq2/HcfTI7pp+hvHruWFFYfdaHhmZr?=
 =?iso-8859-1?Q?GUND/sTa6+u4GlycSrd/rSqYgclgOTDH9Z0kkTjnDTOh2JsW/eo/SPf+S2?=
 =?iso-8859-1?Q?VRp2SvsUy6RpsGxnum1ioyij+omxOgJT7/hslBHY7lrwvVHlt8vcs8mni3?=
 =?iso-8859-1?Q?Lcyj8Znaz9nLU+mzR5yR4VnKktSt7M9wSTn8663DYnpbTWh3XOF4+rFQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9990ef-a978-4142-c97d-08db0b801181
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 16:01:28.0338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6zx7I/TBBo/WddfWRiC0UjxvTNKvSxbT+GGz36E4P/4lSL/CbiAzGMJXJApNjsdpDeaP+9ct9vgQe0MXvpO9sIBK9EUyFi17DQVphemUqjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8673
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ilpo,

Thanks for the update.

> Subject: Re: [PATCH v2 3/3] serial: 8250_em: Add serial_out() to struct
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
> > v1->v2:
> >  * Added serial_out to struct serial8250_em_hw_info
>=20
> Thanks, this looks much better. One additional comment below.
>=20
> > ---
> >  drivers/tty/serial/8250/8250_em.c | 59
> > ++++++++++++++++++++++++++++++-
> >  1 file changed, 58 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/8250/8250_em.c
> > b/drivers/tty/serial/8250/8250_em.c
> > index 628a6846bfdc..1816362a3a3a 100644
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
> > @@ -31,6 +35,40 @@ struct serial8250_em_priv {
> >  	const struct serial8250_em_hw_info *info;  };
> >
> > +static void serial8250_rzv2m_reg_update(struct uart_port *p, int off,
> > +int value) {
> > +	unsigned int ier, fcr, lcr, mcr, hcr0;
> > +
> > +	ier =3D readl(p->membase + (UART_IER << 2));
> > +	hcr0 =3D readl(p->membase + (UART_HCR0 << 2));
> > +	fcr =3D readl(p->membase + ((UART_FCR + 1) << 2));
> > +	lcr =3D readl(p->membase + ((UART_LCR + 1) << 2));
> > +	mcr =3D readl(p->membase + ((UART_MCR + 1) << 2));
> > +
> > +	writel(fcr | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT,
> > +	       p->membase + ((UART_FCR + 1) << 2));
> > +	writel(hcr0 | UART_HCR0_SW_RESET, p->membase + (UART_HCR0 << 2));
> > +	writel(hcr0 & ~UART_HCR0_SW_RESET, p->membase + (UART_HCR0 << 2));
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
> > +	writel(ier, p->membase + (UART_IER << 2));
> > +	writel(fcr, p->membase + ((UART_FCR + 1) << 2));
> > +	writel(mcr, p->membase + ((UART_MCR + 1) << 2));
> > +	writel(lcr, p->membase + ((UART_LCR + 1) << 2));
> > +	writel(hcr0, p->membase + (UART_HCR0 << 2));
>=20
> Perhaps it would make sense to instead of using readl/writel() directly t=
o
> call serial8250_em_serial_in/out() so all the offset trickery wouldn't ne=
ed
> to be duplicated inside this function?

HCR0 register is not available for emma mobile. Is it ok if I just do readl=
/writel for
that register and rest will use serial8250_em_serial_in/out()??

Cheers,
Biju

>=20
> --
>  i.
>=20
> > +}
> > +
> >  static void serial8250_em_serial_out(struct uart_port *p, int offset,
> > int value)  {
> >  	switch (offset) {
> > @@ -52,6 +90,23 @@ static void serial8250_em_serial_out(struct uart_por=
t
> *p, int offset, int value)
> >  	}
> >  }
> >
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
> >  static unsigned int serial8250_em_serial_in(struct uart_port *p, int
> > offset)  {
> >  	switch (offset) {
> > @@ -119,7 +174,7 @@ static int serial8250_em_probe(struct
> > platform_device *pdev)
> >
> >  	up.port.iotype =3D UPIO_MEM32;
> >  	up.port.serial_in =3D serial8250_em_serial_in;
> > -	up.port.serial_out =3D serial8250_em_serial_out;
> > +	up.port.serial_out =3D priv->info->serial_out;
> >  	up.dl_read =3D serial8250_em_serial_dl_read;
> >  	up.dl_write =3D serial8250_em_serial_dl_write;
> >
> > @@ -144,11 +199,13 @@ static int serial8250_em_remove(struct
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

