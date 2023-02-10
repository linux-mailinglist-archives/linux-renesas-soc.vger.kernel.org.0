Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9014669200D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 14:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbjBJNrK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 08:47:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjBJNrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 08:47:09 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2123.outbound.protection.outlook.com [40.107.117.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE2E234F5D;
        Fri, 10 Feb 2023 05:47:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEywPo+BtukOs6LIqnzjnIJQfKyyyk3viglK1sdBtvGK5qAa1Et+gU4/PREEmFmI+8uWSqWs1YH33kjNPB/V9eC1+/5N3xNkxwQg3SLCq3JH8IOaq1I6m9YT5URzq9uNlMKMVQUF9C0a2VisFgOzBSfb8eUmnUO90LEOmljZDSq3aJxYfX39mQkdav4NGkMXjstWMwSnyjd6uPlr9JsviY2EyZshPkqlQN01+KdQqHgNsO1LsXObtPZomcf5IK+052KDHjph0alHuH5EScYPMbu6+B87h10uV5WAPiy3FaQRp6dz4UbKJ8Kt8J0y9KXLTJ45w/sZu/kEKiOK/hJ7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KUbFyCD+bccV0QS+sE15jiSWS5t1VresLD7rpJZXpc=;
 b=kMCwmSgQGoX94DcReBV9HKUnejMAla1BRpzZe8n3fVJmdYmhAAOT/mkopXdwKABYM/Ffb+2kREFpA5EbGcbxmf8kEC8ItBG93fRZ3AncjToMTQVr0VM1JezCDlW/WswTsszylxGD7p5f45t3IlUbabwQNZjRXDifXY+8U/d+JIm2J5qSg164A74O93XU4MFagVO6mNbGlIPsTzDepRD/B2srBH+q3DtVuNVd5tQb833453GHLTgPdie9x3wNJWH4q+gqwdln7B5fmszookyfmZ1WonS2ZFHE8Jfj0HH5PKiwR4BpxV7Ov7SPljg1zlobi9wS6zbc8F05DAqAkZqFgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KUbFyCD+bccV0QS+sE15jiSWS5t1VresLD7rpJZXpc=;
 b=KePiHZD/GPcQFvjAOZSjJaN/c42p2ps12GUgqxLn5LIabS7t4xbnC9h0RN5HPKFd6Gx15GgfW2RzMSCXeVZdvQadJuDEzWR9js2YhVeAtfPYNXSHghIPpTH4C+NR37Yb5RPBHbi8vaCXWHL0TF/SIo4X78idsqhzrJy/dOEOTcg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB6277.jpnprd01.prod.outlook.com (2603:1096:604:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 13:47:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 13:47:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/3] serial: 8250_em: Add serial8250_rzv2m_reg_update()
Thread-Topic: [PATCH 3/3] serial: 8250_em: Add serial8250_rzv2m_reg_update()
Thread-Index: AQHZPIosskWvaTdkmUGyylzcIx5dHa7GrMUAgAGFTYA=
Date:   Fri, 10 Feb 2023 13:47:02 +0000
Message-ID: <OS0PR01MB592251E7F3254E54A25C8B2D86DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
 <20230209132630.194947-4-biju.das.jz@bp.renesas.com>
 <6feee947-a66-81eb-59b-e882e665af25@linux.intel.com>
In-Reply-To: <6feee947-a66-81eb-59b-e882e665af25@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB6277:EE_
x-ms-office365-filtering-correlation-id: 7f8db28e-10c6-42f2-a82d-08db0b6d49d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N8sTQFtZMnA/ztJXhtD+vpUAEHhxDEmhEwCps3DZtXObL0GRzq5yAZQQdaoYgPB/31M5IzS59SY0Y9Y7DNsxjamHPVQEt1iqyvunIL6dryNxxIihbRW8a31XRqVzKBsi8m36xf1li1L2rskiOXOeAwzxKQgO4QuFrP7zbCxEyo0YCMON6U+YKsMCTxr4uQFJiLd5+u50CeNfICF1vNm0Tnacp+QnBjb5X4WyFTYMpWsO+kB4PQYzOIX+rLANcpjoVG1BYE42KKZZ7GawnG7SZHEPErbeEPxOALH1cRx3PWOEZglN8VGZCMXN4pgEE6OTM0kq77KdbBZLH5mLyXY5kuWQs4P3+IWkM2B1GHg/EqK/y5baQ9iDuvUHutu/ZYW+mZnzFjda0u+Np58tS1vrh0di/ldYv3KpZMV77X+Kev2whwohGKHsbZ04lYqs7IMFDDGRN6V/SeHCWQ9S40HLIUOi1+K37elj4zvQtGaw/ltGqOWKKpF5bz9r8KskseFFGZt5eEjGW1xa29a1IyZhhBp6tfMyFcIYfECjW0ETaZfv3WmplO2fHRshMsjnKrlBXO8DDOhvesH/xUphssPHfCPNt12IKnYGbyIRqf+8iTOu+T2bgkeDb7YXBpOQAYZe1oadYzCMNcNVsNl5QavUDl2oWtDtxodKVWDeLE9pUjN7+iYi/zJsG0KxGEX4432hvAe2YfEwnBxFXeGQnRNx+w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199018)(8676002)(186003)(8936002)(9686003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(6506007)(4326008)(6916009)(26005)(33656002)(86362001)(38070700005)(122000001)(38100700002)(2906002)(7696005)(316002)(55016003)(71200400001)(54906003)(41300700001)(5660300002)(52536014)(478600001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?dYifwkismxKo4V2cpe6nTZCy38ZAW1hEZP/Xh8jZqdRaklwFYw7bUiAZox?=
 =?iso-8859-1?Q?tdvvpQucUJ7t3wlht61t57kHFNwF0J2GIe4CFhgEnHhCFrVFr2QZjL3P4n?=
 =?iso-8859-1?Q?0XVgfBxBoWRqU/XVGbkcXLiW+3AjUvzBL97pCQI4o0UzJkR2XP79y58Uk8?=
 =?iso-8859-1?Q?yJeFKjyMq8FsX00XAkNlKsxH8v95ysgAFmqF+G1MzrXgqQhzmo/8Ckjibl?=
 =?iso-8859-1?Q?SOrpUkSg3QQLJMEIRPlYybflsywIew6AL3YodRfvcTzPhU6+dffbGdYV21?=
 =?iso-8859-1?Q?XbdUsheTyQVGLOvczPCwsIBkhBPFEo3RBO4+n7r4bdURi/kkdaTbWRn2iG?=
 =?iso-8859-1?Q?BbqgBJq+9IOMFtgryKwn6oUt9Cy0Vfo893Ednh6oZlyzUJb/zMxZNJDiIL?=
 =?iso-8859-1?Q?oyYEzPG5SgaRGkVuoDyN3U/eeZ1ksKzWbaEERq3kuCm8WaaDdhp6OeSbWj?=
 =?iso-8859-1?Q?cCHPm3QQ1WDZKhvy9QLr+P8OgxxSi1B0kedQRVH4KYhpTTBA46Y+NsRZ4T?=
 =?iso-8859-1?Q?Y2NB4IGR8L5YNQeKTgfUOElz6bsE3fOkBgTm/Qn4EgLKm7/cG+KsvwTzhR?=
 =?iso-8859-1?Q?IOI7u6Oef5Y2lU6FqboFS1dILMvJaRWBzlZLxUljzjWdCd1kCzyUmvcyDO?=
 =?iso-8859-1?Q?Pcbwa9gSfYxBBxhgZIeODwxVcSBrA76xJlZqs7d6jwX7UbhFYXnp5GPA0r?=
 =?iso-8859-1?Q?9y9BU1NBw780b7NB1TDjDMh2o/ivuK0Cx7wu9GiDky4AB7shPKJ0JhRXOa?=
 =?iso-8859-1?Q?Eaya8wwv40grO7MqxTc6Lw5ZWF3qRfQ9abkAh9ya3K64aQL5IReBZp3yuZ?=
 =?iso-8859-1?Q?ESS8R8SJf0Zzy94CF9iymEGEA4WqHX78GsCbA1bB1LBW/7p9lO5WoGnxof?=
 =?iso-8859-1?Q?QVMxKWS2ZF0j0mmnRSY1Y6bL3dciUEOZEWK8Z5WnP3AeRhtdTPdBMvukPL?=
 =?iso-8859-1?Q?BjHlyATgRCqAobL/m5BUeCf1FnOdfFXlDfIpjThuLIUlE5JbDRcP43tTvk?=
 =?iso-8859-1?Q?FGZm+S7AD+zfHMNTRADjuVRxGR2pAevS8B7tNHaU2zR02aYW1IKaFEvAgB?=
 =?iso-8859-1?Q?hQrcoo3sZBG7zMGjjPnKuGmHUbxEkjr5qb78RCz0ZH/QiPcLb5WQ8jy0zM?=
 =?iso-8859-1?Q?MXfZgGUPtIEbUxgI/4TWaLyIPW6ZnbIjLf55jSvMii51b46MsuKoWj4P+5?=
 =?iso-8859-1?Q?NQho2TyBc8HsODJlCH1Djv/kplcsxMxoJmZX2N3EUmJ4yHIR8u6z/tW7at?=
 =?iso-8859-1?Q?wYE/NZ5jiVM4BjFhBG7uK0PRc1V6dQIptY0+pF/fJYOuKYMSDkFe+6lf//?=
 =?iso-8859-1?Q?9af1ZzZmMSsGGJ6+EH5wT4TFAeh0VMvDHMC95TTX5AheQIo/HklMwrXD+N?=
 =?iso-8859-1?Q?58ekCXT1MZNxdRb9M8WM/RRe6dMhV16bPUjbbzToxXK82p8T0ZyWYv+PLc?=
 =?iso-8859-1?Q?mZDrzzWMxDX+6RK+61DDrNnFGI+0TTtxhK/XUjLVGFo3sqjpvR6ZMCf9gm?=
 =?iso-8859-1?Q?a6HTKCveSOpL04T+n6SoULLFivjzixd+VxDpNRAL78S+5DEfScEi+P7NHh?=
 =?iso-8859-1?Q?DR04fIMRU0rEPkEl/xVAMPO4h1e7n7oOAI51ZTIOgJH9HeOnMfKSfLCgEF?=
 =?iso-8859-1?Q?ctceiuDSLAlGirCFb28s7DvkgnnWwi48FbeFcHTAXoa3uwFLm2nfOZAg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8db28e-10c6-42f2-a82d-08db0b6d49d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 13:47:02.1177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JiqwZ6JAQ61D7lrHoxuLoCY2SsCyLemrSPQNNwuh1yl+WlA+plpvkmqLIT2cOehEO1KmeK/pwQf72RbC3fhn5S9M+pwKtzsPvTCz+Urgrj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6277
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

> Subject: Re: [PATCH 3/3] serial: 8250_em: Add serial8250_rzv2m_reg_update=
()
>=20
> On Thu, 9 Feb 2023, Biju Das wrote:
>=20
> > As per HW manual section 40.6.1, we need to perform FIFO reset + SW
> > reset before updating the below registers
> >
> > FCR[7:5], FCR[3:0], LCR[7][5:0], MCR[6:4], DLL[7:0], DLM[7:0] and
> > HCR0[6:5][3:2].
> >
> > This patch adds serial8250_rzv2m_reg_update() to handle it.
> >
> > DLL/DLM register can be updated only by setting LCR[7]. So the
> > updation of LCR[7] will perform reset for DLL/DLM register changes.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/tty/serial/8250/8250_em.c | 49
> > +++++++++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >
> > diff --git a/drivers/tty/serial/8250/8250_em.c
> > b/drivers/tty/serial/8250/8250_em.c
> > index 3a45aa066d3d..a1e42b8ef99d 100644
> > --- a/drivers/tty/serial/8250/8250_em.c
> > +++ b/drivers/tty/serial/8250/8250_em.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> >  #include <linux/mod_devicetable.h>
> > +#include <linux/of.h>
> >  #include <linux/serial_8250.h>
> >  #include <linux/serial_reg.h>
> >  #include <linux/platform_device.h>
> > @@ -18,14 +19,53 @@
> >
> >  #define UART_DLL_EM 9
> >  #define UART_DLM_EM 10
> > +#define UART_HCR0 11
> > +
> > +#define UART_HCR0_SW_RESET	BIT(7) /* SW Reset */
> >
> >  struct serial8250_em_priv {
> >  	struct clk *sclk;
> >  	int line;
> > +	bool is_rzv2m;
> >  };
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
> > +	writel(fcr | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT, p->membase +
> ((UART_FCR + 1) << 2));
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
> > +	writel(hcr0, p->membase + (UART_HCR0 << 2)); }
> > +
> >  static void serial8250_em_serial_out(struct uart_port *p, int offset,
> > int value)  {
> > +	struct serial8250_em_priv *priv =3D p->private_data;
> > +
> >  	switch (offset) {
> >  	case UART_TX: /* TX @ 0x00 */
> >  		writeb(value, p->membase);
> > @@ -33,6 +73,11 @@ static void serial8250_em_serial_out(struct uart_por=
t
> *p, int offset, int value)
> >  	case UART_FCR: /* FCR @ 0x0c (+1) */
> >  	case UART_LCR: /* LCR @ 0x10 (+1) */
> >  	case UART_MCR: /* MCR @ 0x14 (+1) */
> > +		if (priv->is_rzv2m)
> > +			serial8250_rzv2m_reg_update(p, offset, value);
> > +		else
> > +			writel(value, p->membase + ((offset + 1) << 2));
> > +		break;
>=20
> Create serial8250_em_rzv2m_serial_out() that does the necessary magic and
> calls serial8250_em_serial_out() in other cases.
>=20
> I think you can use .data in of_device_id table to pick the correct
> .serial_out function so you don't need to add that bool at all.

OK, will add .data and will make use a feature flag to handle this
as suggested by Geert.

>=20
> >  	case UART_SCR: /* SCR @ 0x20 (+1) */
> >  		writel(value, p->membase + ((offset + 1) << 2));
> >  		break;
> > @@ -111,6 +156,10 @@ static int serial8250_em_probe(struct platform_dev=
ice
> *pdev)
> >  	up.port.uartclk =3D clk_get_rate(priv->sclk);
> >
> >  	up.port.iotype =3D UPIO_MEM32;
> > +
> > +	if (of_device_is_compatible(dev->of_node, "renesas,r9a09g011-uart"))
> > +		priv->is_rzv2m =3D true;
> > +
> >  	up.port.serial_in =3D serial8250_em_serial_in;
> >  	up.port.serial_out =3D serial8250_em_serial_out;
> >  	up.dl_read =3D serial8250_em_serial_dl_read;
> >
>=20
> I'm bit lost why you need patch 1/3 and cannot set the port type and
> capabilities here?

As per Andy's suggestion I have tried this based on 8250_mid.c and
It works as expected.

So plan is create separate patch for changing port type from 16550A to
16750.

Cheers,
Biju
