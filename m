Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76B33A2578
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 09:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhFJHa6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 03:30:58 -0400
Received: from mail-eopbgr1400092.outbound.protection.outlook.com ([40.107.140.92]:64114
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229715AbhFJHa5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 03:30:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vp0norxfPmoRs+n+CtjY+URDNUvcI6DY3otoImGnRF4ne6U4l35dtgCjwjAz5EP4HEvE7/X4ru48ZGpyvhPw4sBtpPEFqnJ8EIacgP98NOC2k3gaxRlPs2qRL22aGRr1X6hSdOTjlOAanEWaWtuzzomWLAjr6n59St+JTP+zzhl6w4KQdm9rEn5bSpxG1WbZf+PZ17P1VralbWh4KHBwqstn2wNBc9WsEiLpicu3a0V8AmBA7pfyqUWWLIHX1/1/Bt1xC9DbICllNmRavNPmP4iYeG1PJK+TvlQGs5cV/Urz538vSfJhUgA77XKgf1tIJqVLX+aK9f4M6nQCAQbp7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9adbuC/1Iw7kkK1nKa8FzginVIQ2p1Hod4W9QgxVzs=;
 b=JDTgFZtGqFZ13D92MqtYMAFXW3O1rOY9BfmvVZFcwjW5rxBvJso4fkf+q+eyWkw/fE3oJOJ/+T6j3VksMwSHr87XRBgeYDaV3Fc1f23QKNSGH6EvWUNK1hpeYoe8kHkTBPlOKDaoeM6IibEBQRIUNkbMwyohEBjHKWPyr2iZwblvaelPOE97Otzdcx0r7QUjE8F+3ouF1AymDp+cdXgZAyeZnlGAeciNgYiD+uTOGfArxWlHJy65pM/8kmx9cg+cIa+kvoMy6ktLi2dsvj+P3QkaN8LFaj1YwaV/KazvAqWw6+fpzE/+W1tLK9yoz0a0/4SH9dYyYcm3T0TRfHlzaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9adbuC/1Iw7kkK1nKa8FzginVIQ2p1Hod4W9QgxVzs=;
 b=otNH72AFJP9E6Dbc64xDuu8uBWs8jQHZEQXNeo07HxaCfWKLFcJTzlUjGwSBGCSaUn4oYo83bdH33GY5N6LaRTB8BuSmO3RCpkwkVAipdbDATTXd1tyA0z3T6AQkXGEIkpfq5GTyaNg8gyd2GPgCGAwEZ3V5/09L0zw9lsjHkaY=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB1901.jpnprd01.prod.outlook.com (2603:1096:404:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 07:28:59 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 07:28:59 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
Thread-Topic: [PATCH v3] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
Thread-Index: AQHXXNGkj5DIm2K88kqd+niZLV/ShasLnJ0AgAAyfICAAJtEUIAAZ+oAgAABEACAAAW4sA==
Date:   Thu, 10 Jun 2021 07:28:59 +0000
Message-ID: <TY2PR01MB3692C3C92800493C5434E752D8359@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210609014902.271237-1-yoshihiro.shimoda.uh@renesas.com>
 <ac930164-6150-4358-8fe9-ab87654f68ce@gmail.com>
 <CAMuHMdW9oV80QdZmgwJBF99jnw56XuTSkanjHCdBY+h4jAVGew@mail.gmail.com>
 <TY2PR01MB369260DF38C0FC6E58D65362D8359@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdU23gB8Bap3qoypXkJhu=jwS-MQ=mu-CdzqijoWzc4rOg@mail.gmail.com>
 <YMG44NgJVTB5tbfI@kroah.com>
In-Reply-To: <YMG44NgJVTB5tbfI@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:788d:25a8:6b90:faf3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7ac1208-bcc9-4de3-6582-08d92be16a2b
x-ms-traffictypediagnostic: TYAPR01MB1901:
x-microsoft-antispam-prvs: <TYAPR01MB19010B9FE66D1E54B88FDF53D8359@TYAPR01MB1901.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XE2Mn4/X82VNmER+nrgI2PS0dbkG54/KCNolg+ic6Hfgr+SC/SqeLLKzrFMMtG3C8YXKeSRwyAVDzHrVjs9OV0tYHermiEEGO5bzw9lb7RtwTl5/Oe2OlEv2J6IHKHsK18lTCqEQk8YS+WtD8sIdzxAPJgoIdS006PHixMVDkVb59/LLP9CeRHE3fE+1X+I0BqmE4A3K8ojvG0ACxTMh1A0FtGfkEfulvDpQuYBEhIOuyb1flsKpCHCxOt3yvVL1Maa8ZQ/oqKJCXCEXqGMEP5a/r8iMGiMAvFfwLyq5PxJwcq6k+C0PWCkjX0+lcH8coCw/0s2nbZUJp4uBaOEYFtROl88jfG5MrZM0mtGjWV9CJpm0sRDZN9aw/F+ftb1xbZADeZMNqJoq9+KwVH+YEOiZkpsZN6WbMtQkqJqIIuG5XZSSbDrYHu7/hcgmdQe14CHu1Dmx4gEmGV9dhj/vKLKd8k/HRmZvrsvIhg/H0Tip/82Nhqq4PofCGcCxwhNbcm5vzj5baAOvfHrcaAEVUi4OekKhKpAXU5+TESdYxyP8GobAifMeI214cxBcG5VkR7irUE0zzzYXtDe4MJ+QxvZl0QKy8vgv4385LoOb0mE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(7696005)(5660300002)(86362001)(66476007)(66946007)(71200400001)(8936002)(76116006)(2906002)(186003)(83380400001)(478600001)(52536014)(6506007)(54906003)(55016002)(316002)(8676002)(110136005)(66446008)(64756008)(66556008)(9686003)(53546011)(4326008)(38100700002)(122000001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?6CyvDLTFJjSEx130bxBx78WCkbALf3Ex5jBMuUKUdYtS5Wo6j6DZgV7KbYzm?=
 =?us-ascii?Q?a6eZFkixtI96p4/G4AfrbKOFssORpLOnYnVB3t7AXFxmTYy3e5xG4VaqTX0y?=
 =?us-ascii?Q?TJ5zKfCfWctkt9hUxXoEimW2k66yID7cK3qRmkhXH5OkTAOZjJazsxc3OzFr?=
 =?us-ascii?Q?2M5PtHTwdz4sfxa/nTTHWETgfWqtDZmcL3EwA7rZrZ2d370HRnxNhtC3Or/0?=
 =?us-ascii?Q?PrVb3265IB2Wwgzav3TmETuVPoF5ww4Fks3n77xTgaHdYYPF9a+tCW8anUbn?=
 =?us-ascii?Q?6TSnRHBGcDNGJjaClcS4J1WdroibsjcrFSPsYW1Izv/gJpMOdc3AaP1u/fjD?=
 =?us-ascii?Q?kYikuSlyZOFkJ0hfDmB3X3kvHkca8IVrTQlL3Ab1guKNcJmp4OrCT4bIkmmD?=
 =?us-ascii?Q?cQyyHM3UMK/iNHdwp2n7XTLcWhU/mNmFAqawWSeKgn5Y8IwelQyf9DIX55r7?=
 =?us-ascii?Q?Es2ElFB7fG0DaRq+9gq8zfDZSUA0Fje7ITgRBFTRtD8x/MmhNnLthoOlBcei?=
 =?us-ascii?Q?A5wxaRTBeXLiMOY/6x9vGDKVQ1r3hjR3rBuCi214P6aoI5cgySNYG5u/ykJn?=
 =?us-ascii?Q?/BUuk7g7AmsNPnl8q8jPx0n8Wp3HYXqiwvdnEmtlmfJ5ZpVCG6dGMFvZzb9a?=
 =?us-ascii?Q?32XKCbb/ht/zFr1udGBRZSUyccg8LmtS7mm2Ogeu4ja+68NdOAerQQucivGE?=
 =?us-ascii?Q?Y3oRTONip1UiHSgzyVedRCZSTqeqPrbsUJY7jDmGvz1A90qjdcKOFNWx6Om5?=
 =?us-ascii?Q?e/sr7/L6vE++vllXa+7enDPLSfKwGdaFk0rXitWaoN77RAvdQODvLibYcJAp?=
 =?us-ascii?Q?TsTFSET7gIUyYZ0gZkDslXPOurboHUjsdEkDc6Da8QVokmUXqq+LdJmN9cbM?=
 =?us-ascii?Q?80qsY5aPfH5tVwXUfq78je4Q8QyYLT0xAsuzehudIKmIHJCKzWpTuxC2Q+bU?=
 =?us-ascii?Q?eTTJqKeQNcigGMDj8OKJ+pkcCRZ7LG36JPYtFCUMJBCKBVYyWPER0ybNn97W?=
 =?us-ascii?Q?d0T8+yeMAJ27RSikoPNsTA0q9itEcJY9D5J0hEIEaH5scfYQi7C0/86elQPi?=
 =?us-ascii?Q?1N9tLz7//c9TEkWC7jG49QaQPSFKKZg4YRbfZ/mIxr4tu4xLeu8LN3jnZ2V5?=
 =?us-ascii?Q?XRQLORCkIAejYgRX/aNNZQsSX0dAx2p1R88SOEKun4FkONqhYvVx3bHRxkuS?=
 =?us-ascii?Q?OqEEvLewiGUI5P9KxFb+7/P82U9HrcKkruGRFtu3lqS6VyJs4ZuNWdCspsyS?=
 =?us-ascii?Q?k9jqGK0pXLGRQh/ilrQL2aC5y6dFmuLe7cnGIrELOklHAB8YXASlfs9p0yD5?=
 =?us-ascii?Q?APAlx0dkR2oe5dI57dXQsXvJLeyrBZMvFMTymHtgFNxFv9y1/7XjQZoOgIuh?=
 =?us-ascii?Q?EC5CjGM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ac1208-bcc9-4de3-6582-08d92be16a2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 07:28:59.6761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: voUOTu8zYnL0ybA0Ep78zkNVegVcxc8QalYdk/bBuo4U3zUTQVgCtPDYyJnriwdRJd/yg6yDw73Rxjm0k0F7Lha/n2b8ST68kKOLRKfdVVIHkKFlMTB7RcrISrVG+dCN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB1901
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg, Geert,

> From: Greg KH, Sent: Thursday, June 10, 2021 4:02 PM
>=20
> On Thu, Jun 10, 2021 at 08:58:04AM +0200, Geert Uytterhoeven wrote:
> > Hi Shimoda-san,
> >
> > On Thu, Jun 10, 2021 at 2:50 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > From: Geert Uytterhoeven, Sent: Thursday, June 10, 2021 12:30 AM
> > > > On Wed, Jun 9, 2021 at 5:09 PM Sergei Shtylyov
> > > > <sergei.shtylyov@gmail.com> wrote:
> > > > > On 6/9/21 4:49 AM, Yoshihiro Shimoda wrote:
> > > > > > Stop dmaengine transfer in sci_stop_tx(). Otherwise, the follow=
ing
> > > > > > message is possible output when system enters suspend and while
> > > > > > transferring data, because clearing TIE bit in SCSCR is not abl=
e to
> > > > > > stop any dmaengine transfer.
> > > > > >
> > > > > >     sh-sci e6550000.serial: ttySC1: Unable to drain transmitter
> > > > > >
> > > > > > Note that this patch uses dmaengine_terminate_async() so that
> > > > > > we can apply this patch into longterm kernel v4.9.x or later.
> > > > > >
> > > > > > Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> > > > > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.=
com>
> > > > > > ---
> > > > > >
> > > > > >  drivers/tty/serial/sh-sci.c | 8 ++++++++
> > > > > >  1 file changed, 8 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/s=
h-sci.c
> > > > > > index 4baf1316ea72..2d5487bf6855 100644
> > > > > > --- a/drivers/tty/serial/sh-sci.c
> > > > > > +++ b/drivers/tty/serial/sh-sci.c
> > > > > > @@ -610,6 +610,14 @@ static void sci_stop_tx(struct uart_port *=
port)
> > > > > >       ctrl &=3D ~SCSCR_TIE;
> > > > > >
> > > > > >       serial_port_out(port, SCSCR, ctrl);
> > > > > > +
> > > > > > +#ifdef CONFIG_SERIAL_SH_SCI_DMA
> > > > >
> > > > >    Why not use IS_ENABLED() instead? Gets rid of #ifdef. :-)
> > > > >
> > > > > > +     if (to_sci_port(port)->chan_tx &&
> > > > > > +         !dma_submit_error(to_sci_port(port)->cookie_tx)) {
> > > > > > +             dmaengine_terminate_async(to_sci_port(port)->chan=
_tx);
> > > > > > +             to_sci_port(port)->cookie_tx =3D -EINVAL;
> > > >
> > > > Because chan_tx and cookie_tx do not exist if CONFIG_SERIAL_SH_SCI_=
DMA
> > > > is disabled.
> > >
> > > This is a nit though, chan_tx always exists.
> >
> > I stand corrected, only cookie_tx depends on CONFIG_SERIAL_SH_SCI_DMA.
> >
> > > > Yes, that's why all the DMA code in this driver (.c file) is protec=
ted by
> > > > #ifdef CONFIG_SERIAL_SH_SCI_DMA.
> > >
> > > I'm thinking we have to remove #ifdef from sh-sci.c file at first...
> >
> > While I don't disagree that would be worthwhile, do we really need
> > to refactor a driver first, before a fix that follows the existing
> > driver style can be applied (and backported)?
>=20
> No we do not.  Sorry if this usage is already in the driver, might as
> well keep it there, I thought this was an exception and was being added
> for the first time here.

Thank you for your comments. I understood we should keep this driver
and fix it at first. So, I'll add a description why we need #ifdef in
.c file on v4 patch.

Best regards,
Yoshihiro Shimoda

