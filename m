Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C573A219D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 02:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhFJAwI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 20:52:08 -0400
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:37792
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229507AbhFJAwI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 20:52:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+s5CYNdOEAyIG1RrbRzLF8Q601xF5JecS7R6SCAUUqoOgJmokh84WUSZZwBG6wlux4qtxRTi5J8QUB+5bnT/kfLJ38/+1T8HVd2iUzibwdVR7diO3ByTSJPJIbb1vowyt3QlryAcJtUAcxCfOXBvpMM3C+U7D4oLUQUXI+soP/WIZbDOLTNbr6pc1gYBvSvKaSjrlmhNHTLAufnkD5qvdbTRmlxRuGb82WzTt9PDAR4FdYnMeLxwv48WGI93ZYIzNTETzzAUaqF6OC7C1UZgFCX3nNWY6Z3kKuuWg1M2XuA4QpUkeAhpmrYRKVhKi2zNnkYWsY1vn7rBLVVgi+uaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYhmcoxAsbr8SUaOSq5+DVypXOoY6Nb9LqHwW/vYNN8=;
 b=JRwP06JgRHBk8pQvkuR4HdLzZ4m9sBm4iLshHbne4GMfBPveQ1vKU9pAL8cV1s1ncKibl4htyG+V1DBtMvbxHK5sTovJEIsoPdkGbPloquv1Bfz5vxxFdyn9JSpNPcWtEAz770yTsHYpiDQWgpFnO+3jx+ilRAIkandUbga4vgIBWAcICleixVrMQci3+MgUhA734qTm8pvKxW7b+W1B7E0xc2wuVP+lCyKBBbk37ArA5o5XDvIhl27otZFz06TunTXeCKuGBeQZF0Qfkx9UOk8UcFtRbFBsUlSiMYAVEb94FjUCzvm9K6HXNJ9vdZXilEvTBNbdxLmBVFi1Y9cQmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYhmcoxAsbr8SUaOSq5+DVypXOoY6Nb9LqHwW/vYNN8=;
 b=dITvZ/jfZ63q2Lm52cZRK4rrHKROuWDiejC7ONpdS/kqw0qhG3Vn7Ylr6/pqO2T3Fxjta8GB4CkDHPHDRvZNEtVtpAs8v8+Jh/ZP/ElkzKfUBs+tGErvlxv5NafXyvTI4AdomSO8MGvfqiAg1QSrpkHPQZ/ijp1DGiIhMQAeRbo=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB6363.jpnprd01.prod.outlook.com (2603:1096:400:a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 10 Jun
 2021 00:50:06 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 00:50:06 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
Thread-Topic: [PATCH v3] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
Thread-Index: AQHXXNGkj5DIm2K88kqd+niZLV/ShasLnJ0AgAAyfICAAJtEUA==
Date:   Thu, 10 Jun 2021 00:50:06 +0000
Message-ID: <TY2PR01MB369260DF38C0FC6E58D65362D8359@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210609014902.271237-1-yoshihiro.shimoda.uh@renesas.com>
 <ac930164-6150-4358-8fe9-ab87654f68ce@gmail.com>
 <CAMuHMdW9oV80QdZmgwJBF99jnw56XuTSkanjHCdBY+h4jAVGew@mail.gmail.com>
In-Reply-To: <CAMuHMdW9oV80QdZmgwJBF99jnw56XuTSkanjHCdBY+h4jAVGew@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:788d:25a8:6b90:faf3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac04afd3-4f50-4d2b-6365-08d92ba9b0cf
x-ms-traffictypediagnostic: TYAPR01MB6363:
x-microsoft-antispam-prvs: <TYAPR01MB636312A85642A767DC5037DCD8359@TYAPR01MB6363.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sPZJgxREEg3l/RKAO7YOC8N4qu06afUNdy54oVAntB/SrRlr6XOj5LM+EQ2sx3RC+WAzYmrMBuiSHCkXXRQn382JakARdg0heH9BLYKzSD/Xe9zI9kbq/ymUdph+M8LOSCxFCiu6/SgypTtkEtwpnlg6Fkoxj2GIATgRHb+OuoOAYLeFrCCAIDvGGi7lGhw/xqCRyVPrJBezfXAf1RMm6KdivRR/1E6sOX/2zsxF5svE9Xyx0mO9PQliYteVznAf2QUkTCc9w2tqJMbCtXfaeLZUpBQHxd0YC9rXeWjhDMzodxgCzL+tpRXJh7hg1kPxaJj8V3tonbl7HGxyLqm4vw7GbRDbsnMvTCSYHFTMP8LvQ2GPWNfZxtTvuMzy/cdbdyTrROU6g6kDVt7weiG9JaWAFpfxrKSiH2YzkATWDclRR8yBAUKLq61NOtHcQnXc+UpRx5aP5c/sGuMZW0pWj1KvVa8UQVwfgzPx4g7BQ/gZlNpEhEEMpCEHxRVFdsyqbWCf8QWwMm7gGmww6uMo5HGWGYbPjdNvW1Ok/UZtOtEb+0LE5lOpUP8j/Vdsbk3uFtMrs2g009lKbD4x7m2XEWgWWOdhm5YlJHAAhTn4fnk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(39850400004)(136003)(376002)(316002)(110136005)(54906003)(86362001)(55016002)(33656002)(52536014)(53546011)(7696005)(6506007)(8676002)(5660300002)(83380400001)(64756008)(76116006)(9686003)(66556008)(66446008)(8936002)(66946007)(186003)(38100700002)(478600001)(122000001)(4326008)(71200400001)(66476007)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0ObHqa7qIE8xSYEOKxfiIE3Jrpar4cZ2sCdklIJ7ciy97XWb0X64uAvM9zIr?=
 =?us-ascii?Q?l3kanioM8KMW07qwmxRgdNcTivER0tR99bPZD4THRKxYylz47wVXBCpjY9Xk?=
 =?us-ascii?Q?kKy6X3oi8eQc8Aw0+SFntSSjvDu87Il7QqzwVMejPgd+4ltaulvVF+TTbOGi?=
 =?us-ascii?Q?We+zFicOe1jbg4cUuTAhmt4BUdtbSKt1S8dpMQ471NHaLtDw3O5DyHCNXYKZ?=
 =?us-ascii?Q?3lgElxUkWnxXK+5BFtcbN6PKo8joWiD0Uvvu62MTZJNKJ8aKawdTDgmmlOC8?=
 =?us-ascii?Q?7A4/QKcqGZg4eZeZVYGdqWJ5GvCLbG3rxvHXsMS5goBF9qqdZuFMlD2Nybuq?=
 =?us-ascii?Q?66/5hjGZXurQVHYEn5Ckxs3MP6WBPQu6tUImvYY6SOtzG/rAs0oxsYYeOVck?=
 =?us-ascii?Q?sFrnXlNuiwMQynn21nJiQ8jpLkYdzSZLAmsyYRSwhYlzS+/pf9b4qDanUAaj?=
 =?us-ascii?Q?5lu95w836pHaubKT541A6MbrVZb1EHVQM/yGblm7F8qYqyTgBLWBA+Eh9MXu?=
 =?us-ascii?Q?FxctoxJV/FeRItJxLrliKd8jzpxpf332BlySoAu5mV7V13l2J4tJmpV8b4fW?=
 =?us-ascii?Q?x4GnjE7DO5O9e7QS/8H1SHO8+kJMya4cp/FpEfjB8wU8qjvk1s/urlHpO57n?=
 =?us-ascii?Q?IXiGBSqwo4CoxVQN2xq62D5u1UDkaufnRZ3U65VJqSJwp0TPjb3J2r1yb54F?=
 =?us-ascii?Q?d3i09+LPefqtZpZ0g2RBpMOLgKS3fCcQQ+IuZRt7uyzxxp8V0UzeuK4UIPVO?=
 =?us-ascii?Q?B9Pz8apO4xjYkQoMq9vXLJBCaCZJDSciZ568E1qQkhkFAVH5/33GmNF4yfOs?=
 =?us-ascii?Q?rUOM8+ECxIwX9E+gKVFLWsyt+KFIWgLwb+ynjcGxzCBRRBVVfHgPPi9ol35T?=
 =?us-ascii?Q?TQ4s1dFHy0/Q7KmvMw3rTqoXRw28Z56mfiNnN7X7XinjX+OkGZQ4bhZoMpVs?=
 =?us-ascii?Q?nMOm1g//EdPWe8oezIRYL/2Qfq0/argUg0ouLxI7hohWlgvRg2I9+XKpv71s?=
 =?us-ascii?Q?85aqmbxl1t1FsppTX7EkOQMlIp/fqvDJJ0e+JTAZ2KVTW0pqJdQzPhaCG9Qh?=
 =?us-ascii?Q?4BTEOz7zn/zKAPUzQB2KRzp6h2WWjzN/JE2Wk8m2TiCYL4iKfwb9i/br6Nub?=
 =?us-ascii?Q?dHLGQdY4ZvgCqBF9sDVxdcmKOliP+qZ2I+leuqKWgKhpj56L6ky2kwMW9J8i?=
 =?us-ascii?Q?aMkMRrzm/Wxg4+80oPX6hwisDo7pEclMbg1B3Y+50IIKomQkTaBpks2ENhR/?=
 =?us-ascii?Q?Jusd3zQZTAiK00HrIXW0lGM0asVGqoZ1EQdF2yKpRDyHDUtMnM+7bdOuoSGH?=
 =?us-ascii?Q?jIpIfM9XRaMKu2EmIx9QJa6dDYgMHk5VwsNjWYD+5fFLZ0esUE1OMrAAXyHU?=
 =?us-ascii?Q?d20ujFQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac04afd3-4f50-4d2b-6365-08d92ba9b0cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 00:50:06.3625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Np7RjtvVIibfOLIAbUJdUaRIIe+TTfYvx1WSpt1+OhWwwehzoesai1w0VDWeWzTG5FAgZTx3Esr6hgEpU2REDDxaRN2sFoiiefnzdFAS+zm49Vbb1AF7h9VhdmYHb+WR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6363
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san, Sergei-san,

> From: Geert Uytterhoeven, Sent: Thursday, June 10, 2021 12:30 AM
> On Wed, Jun 9, 2021 at 5:09 PM Sergei Shtylyov
> <sergei.shtylyov@gmail.com> wrote:
> > On 6/9/21 4:49 AM, Yoshihiro Shimoda wrote:
> > > Stop dmaengine transfer in sci_stop_tx(). Otherwise, the following
> > > message is possible output when system enters suspend and while
> > > transferring data, because clearing TIE bit in SCSCR is not able to
> > > stop any dmaengine transfer.
> > >
> > >     sh-sci e6550000.serial: ttySC1: Unable to drain transmitter
> > >
> > > Note that this patch uses dmaengine_terminate_async() so that
> > > we can apply this patch into longterm kernel v4.9.x or later.
> > >
> > > Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > ---
> > >
> > >  drivers/tty/serial/sh-sci.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.=
c
> > > index 4baf1316ea72..2d5487bf6855 100644
> > > --- a/drivers/tty/serial/sh-sci.c
> > > +++ b/drivers/tty/serial/sh-sci.c
> > > @@ -610,6 +610,14 @@ static void sci_stop_tx(struct uart_port *port)
> > >       ctrl &=3D ~SCSCR_TIE;
> > >
> > >       serial_port_out(port, SCSCR, ctrl);
> > > +
> > > +#ifdef CONFIG_SERIAL_SH_SCI_DMA
> >
> >    Why not use IS_ENABLED() instead? Gets rid of #ifdef. :-)
> >
> > > +     if (to_sci_port(port)->chan_tx &&
> > > +         !dma_submit_error(to_sci_port(port)->cookie_tx)) {
> > > +             dmaengine_terminate_async(to_sci_port(port)->chan_tx);
> > > +             to_sci_port(port)->cookie_tx =3D -EINVAL;
>=20
> Because chan_tx and cookie_tx do not exist if CONFIG_SERIAL_SH_SCI_DMA
> is disabled.

This is a nit though, chan_tx always exists.

> Yes, that's why all the DMA code in this driver (.c file) is protected by
> #ifdef CONFIG_SERIAL_SH_SCI_DMA.

I'm thinking we have to remove #ifdef from sh-sci.c file at first...

Best regards,
Yoshihiro Shimoda

