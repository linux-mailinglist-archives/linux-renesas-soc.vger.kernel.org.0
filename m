Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEBB39B704
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 12:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhFDKaJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 06:30:09 -0400
Received: from mail-eopbgr1400107.outbound.protection.outlook.com ([40.107.140.107]:31970
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229625AbhFDKaJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 06:30:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpP/sEP9d9GgceDNCEuEfMFKd2TqK/EgOUWFo/lqVfNjkrpFDUNIECockwk8QdTenadImch4ShlS70rLhvP5u5nNT5dQ0HIruCr48KHW9u718iuq16/2fiA5IMHyBk+o3ROaTSKSAVJtTLxN3KPwVjtABWiT1WS3PS6QQ6mj4DNN3A0XMratyXhBG3DJ4D2cXT/KrfTiik8P6gpMuyFTHlT8OJpeUk46PAn3pce2AdeJT4MbTo827XqzFx0iNRigg0ZfcQjcfPOC8iQgqQEKNlEJ459pPF1J4AqE0kpp+4FXvLTY3RvDrtMJGuhG98CWWNDkW/LKQHYT/ZtRaS2uuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6rvyus23wUYVOX9jtCSgzuV0699Vb5FhSsFx5b09tY=;
 b=GThE3I6rQsZOODiQc+JO25yB1CYeLNSrZY3ADmS4jWF+xicRPcF6XLSDz8o5LBnsdtR54Cwfanb4tO/HJ6e+q+J4h6O7jiHSPLXsv1YhfbA99f1Hnyq5ylor8iHYRKfyCTp7Qq3khVlhO2uPL/QuM0AaGxybN0la0QkBojCCImGbAtKhK0wUURUSN2XXDwSojlaGl9jHJi2WJwy0yQNIhK/hinGYqUXCVWpYTzosXnjl4jwIy4VVl0dI6fbrUI2nIfTHoDD+8R4+1WEVoRARdBsdS6/xzStDy4oW+3o2VWuIYR8/ARIOQbrC25Qqj95kVNHJYqMPch4BmLUjnt/KXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6rvyus23wUYVOX9jtCSgzuV0699Vb5FhSsFx5b09tY=;
 b=GEFLjf99DtMjqbyWVMef6jkrnnaWoEq7RqsgiDiOTCFtgsTeP9nvXlaEoJVkuJwSO5ehAVNNGDGJIA/U0UcPzn21nsQPqov/kN8US2HQ+UNM2bwNgMJgxCQMeTiJEyzAJW95Torx1wpOiI4uRHh8qDi0wJ1/4wXcbFjKMRtPmj0=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB6010.jpnprd01.prod.outlook.com (2603:1096:402:31::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 10:28:21 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349%4]) with mapi id 15.20.4173.030; Fri, 4 Jun 2021
 10:28:20 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Jiri Slaby <jirislaby@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
Thread-Topic: [PATCH v2] serial: sh-sci: Stop dmaengine transfer in
 sci_stop_tx()
Thread-Index: AQHXWSgArOEyL2IeK0uSHSDD/w5CDqsDpIcAgAAAd1A=
Date:   Fri, 4 Jun 2021 10:28:19 +0000
Message-ID: <TY2PR01MB3692BB5BFDA1C8C305992330D83B9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210604095704.756190-1-yoshihiro.shimoda.uh@renesas.com>
 <19b2a786-0b32-f26c-efd9-2f5dbd9894aa@kernel.org>
In-Reply-To: <19b2a786-0b32-f26c-efd9-2f5dbd9894aa@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 346ae113-a180-4868-e1a5-08d927437950
x-ms-traffictypediagnostic: TYAPR01MB6010:
x-microsoft-antispam-prvs: <TYAPR01MB60101BE521893332F5A84FFBD83B9@TYAPR01MB6010.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EMGdmysWPNzPoSkb/DMuJ6nfP0JP1BcjXCHQuPFJDiH0xFp/0lY9cj9PUg6c/pAzdnqjIwjV38eQUqfeOiY73c9gRXnMpRWyo8U313xO9xwLSsauNpxkgs96A6ddVaRDDuiSScbhUsxhbsINZ0R5z5shXfMM6FfyGtG3VIANvvRoQAKLpLHewioJWs6WlS15W2h/MmzbBL0L/1x/2dVAYa+52RjPKUotsBiTll1VVzS/r2elv0B8s5m1s2gO/1qWrw8QqCj2VRm2JAiRRVdByjQ/IXJSTYlsOTvntIhSL5ChdN8J5Mstb181OCSmNpv5Ok3fp1/77VZV+0lvKdFU8INNA7vsUhBSzbHqzH+tXD5VJyZwTnIemAXGqUZwtTF6gCv4vvwogdl2zfV+hhPFZr+Fb9q7GADQaxvuU2u2RhZdVfRE7XKzIH3NzcgZ9hGDECFmUjPeHgDIuvxiYmA3UJVeaqcoxR5lA5W5eyBVcTEmRdSv+yMdPxrfboUrTFMnSTgxQ/nk9b7Q6Acf7f9AxqWMRzSntCdjRg62ZgZjZRg+eZf4MCl2hwXS4LDz4l0hdCNtD2aWz3Q6kh1mf8HTrkSGcVeilc19bLFdVEQfHdAsH5iYw49B+droZxxhXijxu3pRZgaVdpgjti0Tm8hoFVhNSaDnj5TepFeugCtSk1OgnwMvtKMQyD/V/uxEnFaw5TNrpzVoWMnbO1cUeJJG3LG/liSt06gUiYDFHViB9bE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(9686003)(122000001)(71200400001)(55016002)(478600001)(38100700002)(110136005)(4326008)(54906003)(76116006)(66476007)(64756008)(66446008)(66946007)(52536014)(66556008)(5660300002)(86362001)(2906002)(33656002)(316002)(26005)(6506007)(83380400001)(186003)(7696005)(966005)(45080400002)(8676002)(8936002)(55236004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?YLrOhhSokcgvqRS0Y7HTa6N/i4+BN/g4JVYD7lCy9N6l9tC3K9sa8Mm6IGGS?=
 =?us-ascii?Q?IoB8Mh3u6myusTNLVlK9EbjKLNf+JQTa9dnl8jth/26MeCK9kZbRq+N14YOF?=
 =?us-ascii?Q?FvlIOt/WHae1HfQa20EBEPtYYihMKQyB+IpRepqrNcjsLF7xLv/oKrOWFr2T?=
 =?us-ascii?Q?hPN0Uwdh1Du5Hy1j0ZgFp/0iO3Q1EGeHy0H+X5ra3gsIeYieVcFDFaQIhns7?=
 =?us-ascii?Q?InLye1sXGxb2PcZY7IA1wXS111ZP35vEpqS38W8yPole3KN5U167NXx1N20M?=
 =?us-ascii?Q?SmGJirNMqu2KYq7RqsQnRJoQYFl+9d8tO/hCPuLjCLMpVQ6f/790yRLk3fNr?=
 =?us-ascii?Q?pFjONmwlQGf22rskZxsBH3fdlNXQbE1O3sRYdXpy1Zi9TDVL90EzmykTsLbg?=
 =?us-ascii?Q?OGud2fvZKlBrVuWF00qLClWmT5vhEKtvvXjMLZycXD1Ml2BIkhSVKUonFuHx?=
 =?us-ascii?Q?3UHMlMBLyaDr7DEwzY2j4puWSAVLqUbSbCR+SOzGQGgL1HEStWzpzJSLZi+A?=
 =?us-ascii?Q?2Hizdp+3lp/3i9apz/wZneBFsCFQlqv+q9Momg9K+WYnjJEQThqzVipkWnI9?=
 =?us-ascii?Q?MsCsOCU9mFtTbM7KaSwpL7IfXgAZJe6mhvPz3mfUGBwVqE82zLaJHCD7immB?=
 =?us-ascii?Q?svefZGm5f2ZdMjFCMaec9YpT5C/ylkQXWqCgiEkC4IgpjbOaQGFt2aiLProC?=
 =?us-ascii?Q?qrWtrhQ11AYfSjfz9m5mSatcFHWySrQ9pVcIWwjaqZ4YE7njDvk4Y6EMSBJR?=
 =?us-ascii?Q?hp3q6uhD36Hn3LhxPH/fbfzUtV6lkEpmbaRFX3T1PZEC/aVfFuqqEZ/5VZmU?=
 =?us-ascii?Q?nP4m2E/7dSbq/IxTV96bmgWAaCNG08Rm85cr/A90H0clNgg5JhYvEwNKqUhW?=
 =?us-ascii?Q?nGzs5v3bvRLt7qIsGkeSOb2Y7Fpo8oIkqvZDUOiIoNeVHLs6JRvi1dCHAK/4?=
 =?us-ascii?Q?YWmYsnYl/lVU3hw27JOJqZaWuSLWq8EZFoy8vPXN0xruyULuR2t6ZL4SXPHl?=
 =?us-ascii?Q?m48XRTQOJvK2mz3uBOPudfb3c+46eCom+bz0D/qqDBXEA4yV3kGe+5B73oAt?=
 =?us-ascii?Q?z1Et67vjpocAqu2jrW1snWU2ZLJzmiQqGZkPk4jntrjTCkw0ACpLldGbpoJb?=
 =?us-ascii?Q?9Nr2KhiBgXYteJfQI5JUZJZU4ahdLXJmLLhjQnXLhC5a14W7bYgOjcPy1f27?=
 =?us-ascii?Q?oC0KUqqL46YH+GvjPbMALSVtQEYDHkbl5NI0wBa67ey7ThysUYO1uB6A7a8f?=
 =?us-ascii?Q?76JT5qYauAlIw8WPPhBAquOhLKMp0I7rTq81ObHe5Q64uMmcv+LEoylmPWwj?=
 =?us-ascii?Q?+05znwszWcZQALuhG7jfbuHU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346ae113-a180-4868-e1a5-08d927437950
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 10:28:19.9912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xOI+aPm2KIma8eDUAaXGr7FpjTaZaRHCy1ButK81gJguJ1aIcBFU2+A9yldxNEMMQj4LbHmwVZgGklRi9N160cZi6eaN31NhCrM9/xrYtHL4DVIAeruJ16uobYatX2io
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6010
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jiri,

Thank you for your review!

> From: Jiri Slaby, Sent: Friday, June 4, 2021 7:22 PM
>=20
> On 04. 06. 21, 11:57, Yoshihiro Shimoda wrote:
> > Stop dmaengine transfer in sci_stop_tx(). Otherwise, the following
> > message is possible output when system enters suspend and while
> > transferring data, because clearing TIE bit in SCSCR is not able to
> > stop any dmaengine transfer.
> >
> >      sh-sci e6550000.serial: ttySC1: Unable to drain transmitter
> >
> > Notes:
> >   - sci_dma_stop_tx() is a macro in the .h file because struct sci_port
> >     is declared in the .c file and #ifdef should be in the .h file.
> >   - This patch uses dmaengine_terminate_async() so that we can apply
> >     this into longterm kernel v4.9.x or later.
> >
> > Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
<snip>
> > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > index 4baf1316ea72..3793cf9f352c 100644
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -610,6 +610,8 @@ static void sci_stop_tx(struct uart_port *port)
> >   	ctrl &=3D ~SCSCR_TIE;
> >
> >   	serial_port_out(port, SCSCR, ctrl);
> > +
> > +	sci_dma_stop_tx(port);
> >   }
> >
> >   static void sci_start_rx(struct uart_port *port)
> > diff --git a/drivers/tty/serial/sh-sci.h b/drivers/tty/serial/sh-sci.h
> > index c0dfe4382898..435c674af1ce 100644
> > --- a/drivers/tty/serial/sh-sci.h
> > +++ b/drivers/tty/serial/sh-sci.h
> > @@ -174,3 +174,19 @@ enum {
> >   	(((port)->type =3D=3D PORT_SCI) ? SCI_TDxE_CLEAR : SCIF_TDxE_CLEAR)
> >   #define SCxSR_BREAK_CLEAR(port) \
> >   	(((port)->type =3D=3D PORT_SCI) ? SCI_BREAK_CLEAR : SCIF_BREAK_CLEAR=
)
> > +
> > +#ifdef CONFIG_SERIAL_SH_SCI_DMA
> > +#define sci_dma_stop_tx(port)					\
>=20
> Ouch. First, why this needs to be in a header?

The v1 patch [1] putted #ifdef in .c file, so that I got feedback from Greg=
 like below:
"Please do not put #ifdef in .c files, this should be possible without that=
."

[1]
https://lore.kernel.org/linux-renesas-soc/TY2PR01MB3692C545672195370487FA60=
D83C9@TY2PR01MB3692.jpnprd01.prod.outlook.com/T/#md5b58540e26a28ef1acddfc32=
6c62bfde73e8e8a

> Second, please don't do this by a macro.

I got it. I'll try to fix this issue somehow...

Best regards,
Yoshihiro Shimoda

