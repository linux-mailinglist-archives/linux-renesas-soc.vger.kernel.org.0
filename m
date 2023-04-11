Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40E5D6DDFC6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Apr 2023 17:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjDKPgL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Apr 2023 11:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjDKPgK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Apr 2023 11:36:10 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2112.outbound.protection.outlook.com [40.107.113.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 841311997;
        Tue, 11 Apr 2023 08:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ecf/c4smFR+HbMXUrgMGKHVDWkhZP+R8ykDIgB2WaYjw8TFbGpWgGz/kM11+yUMFpMvs5pILVSKtp5PnQvhKLDAF39MC8R6V586QNvTLRFQZi5seFrBMYT+YgSSqA9PoSDrs/Vr5LCse2BpsLAMshazNrAIwiSI6V45yeQOcvjNWsT/30OryTHH4jb53yQStBdsAzc5e4Y5hhJdjhFWSFG+9K0w4RXQrKZ1iwlLwYSuvBsjSRCIm+Zm30rLXP04x0QCSoA4LN30qBcGcFxajrYUU7NXjlr7+FrdSKLnkL39h88JoqujUAMDN8ZisxgiycyFSnIYpB7mUK25kxRjXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vzej3K+gKhPE+KWsWcASPbqtEXGyWVbsVOAHAHi7ND4=;
 b=H4+M71qGf9KIHRMd6h13peU7bVz3BkRo+gVMQasWNOrS2AEp67OIiZniFfCmmd91mE8bZEbMDXv3FA5DDFYoElPbF0OAI0RbYoUu4xHaBgNcRb2Lp4eSYuBvX0bxTDVE+4OFEACpcbgqLwTyxWuL6OArSlUs04hW2mOdl5MsjZPuqxdWSQPF1NZgUFNP60xc+Dt86Tbk0MKos49UsN6uDVULhbhoiNOKg72vgrJsNIvPU2S1/aT2wLZVNORtlJBVGiuCVDNzqgCs5qBsTd2v0RG5J3REcmuqcflXgLfxR7Ivbh1vfvF0hCNiBQx96wUEFgA8yQ0qYsadBK4c7UPX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vzej3K+gKhPE+KWsWcASPbqtEXGyWVbsVOAHAHi7ND4=;
 b=Q9TTEzGvmg2u2SuuyAbLlKU1e1jgCOHIDOhbzOX1doKu7xwHV1ylcnDeOEXvYNmebKVO1r7WNQLSRXlVzzyOfoYPHfpz3xBYy8Y0N/B0gYhTh7En9Retvi353zHZZlOdDY1FPrc2rCclo2AK6lE25A9tQIk+7GLrI3zXqrpdvYo=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYCPR01MB6000.jpnprd01.prod.outlook.com (2603:1096:400:49::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 15:36:04 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::831b:77c4:7538:9f90]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::831b:77c4:7538:9f90%5]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 15:36:04 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Jiri Slaby <jslaby@suse.com>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, stable <stable@kernel.org>
Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Topic: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Index: AQHZbF2mA9ahXV82QUyTHfzm1I9HqK8mJzOAgAABW7CAAAUhkIAABTuAgAAJvXA=
Date:   Tue, 11 Apr 2023 15:36:04 +0000
Message-ID: <TYCPR01MB5933C7188612037F0787A5E3869A9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230411100859.305617-1-biju.das.jz@bp.renesas.com>
 <2023041129-skeleton-nursery-f9b0@gregkh>
 <OS0PR01MB59225DFD2073B3A6C8249104869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220D9E0C52F5413046CAFB869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <2023041158-crisped-obtrusive-2309@gregkh>
In-Reply-To: <2023041158-crisped-obtrusive-2309@gregkh>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYCPR01MB6000:EE_
x-ms-office365-filtering-correlation-id: e56fa3b9-3c6a-4a8b-4a13-08db3aa275f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y4+fMq1a1RYX0EP+UE8+M5IFQ0IFVeFn2z+KL+/0AKnVsunb7LDSo0asayrq0+b8Th1IfOna0FGjj3pk9AyDo4Y0F5S9l7votTr0mRJR/h3rUl6vmkvlb+jf/lzSjMofVtUOVvMkRYuTBCHZh68PANrPQttjyBJ10ILlVO4jTjzdMivvAYO4vdAF/efjFVONvu37wlfD0PXuln1oZdY7cn1xVAwUhHbmSeVG5u5/HU55eerhdKuALQ4xX6zzWNpVA+uTYxMoHIBhhyZxAQRxOgvyiCqBFWt/Q66Ymxpp48H0yZimgV7ywnIPmeBjPKB0X57KDfBuOXCNGneiMW1b/gXYzj26BkOqLyKb5tctEQANm8kQpD5Nt2MMoYr/bftzCYp2WTjD+Lbmc9uzzBiVLjWH91aaeuJRG5BGEectUPK2kgLbLAYIeNoUBqd3gprUySBVdJ57pazPyCAbyQBMLHzvk2p+BrDvqxTEwsUGoiIQ7ZBuo3dDSlF9Ww6XWob/rLSKV/lOXaRVOsMa3/O+qv2ktmpbJ56ag352mtjApF9C7aIXUO7KVdH5GpapCuV45vg0aywvqYWLbgPr7dPKvJUbf1tnioyUSBDYRMVi3xI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199021)(5660300002)(38070700005)(966005)(52536014)(8936002)(6506007)(9686003)(55016003)(83380400001)(2906002)(186003)(33656002)(122000001)(38100700002)(86362001)(76116006)(478600001)(4326008)(41300700001)(6916009)(66946007)(66556008)(64756008)(8676002)(66476007)(7696005)(66446008)(316002)(71200400001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sRXyy7SkWuHTrgLFnYHPsZILGQWdEw6yq+EklEaX9xHqvOZRaxTzX/3vat?=
 =?iso-8859-1?Q?xkxwFYsVveFu8nuqTn+nuRPXNxMEKCvUOqdnfnFRuUMqfd/ppOrWLZIgBO?=
 =?iso-8859-1?Q?9MAhgNEcz4e5ZFrJohi+M60LxFRY1Hg450IwkVAjLYXp3CsyyYxH89cxH9?=
 =?iso-8859-1?Q?Txk7nRgVKTUVyTRtuTNySph6q9gd/6//f0azYvwgnC/d75lzplcveSrb2O?=
 =?iso-8859-1?Q?fiMcOXADYhI2oGlWsHZ+HOd0RbCk9o0qP6cRamchaH9BPfNpoK/QB/xxbx?=
 =?iso-8859-1?Q?ALLWZso7ExPVkWO3grA52JNadtw1M8A9x3CF7fC5Lc1NV1r0gHyEcMkVrd?=
 =?iso-8859-1?Q?A3sXuVbb7Ss9nMOIq386EbApi5GfegeCr0mNedAXSzR9FueO46HHYrp1iC?=
 =?iso-8859-1?Q?NeljEAgSdycGL1NmASmcIcz8jUy8vXxuURt7UngJsmXfDu9SFKhkusDE9z?=
 =?iso-8859-1?Q?qyQZatHNYv2KJWicG+6RmK1DeYZy7sE9KpUNkpg24c3GfuAu37TE6vciWq?=
 =?iso-8859-1?Q?BaZKXYQ2t42v/DC9duSF57FIUzU31TxZPs0wS/dQAj1xZzuT+2u2Zc7fTS?=
 =?iso-8859-1?Q?TkMBrvE+20R/2h8DwIQbEb3G1pnU29dZObd6BGsdLAaoYUU+JT8b76s3GG?=
 =?iso-8859-1?Q?eGiYx6b1uugKvRnLVqX1onYiDL3d0I5q4HljXXpidyafPemJN5zCrHKVJw?=
 =?iso-8859-1?Q?2LgRNJrlSz4AHtzy/Y9vO7460X9DSjIvFAUPbKx0UDRdG+H/rAE3IDY1P0?=
 =?iso-8859-1?Q?dhZ3BqAHxVX6kaT9sydzFvF1xfZjKApdHf1wPsmwCRj3ZBVLOY5XoeXGeQ?=
 =?iso-8859-1?Q?GAEXFkrRnBg1MDa4OSoeT3BqbdYIbPVYlIpr2GIC3POoz8Ugb89Og22b/2?=
 =?iso-8859-1?Q?ULI7Od+Hjl3Hpp1+N/hMCefMc38GDL6SNrcL8m7R4F+DpVH/JN2XXcrBPc?=
 =?iso-8859-1?Q?QQRSEOlZF//65oU3b6KZCD1qE9VxoMh4VCnhLspDgBJhysovP2+6PUy33Q?=
 =?iso-8859-1?Q?HpgPHjn1vX7pndEoZiwvGEbg7vL8kwYpIeRE06IwL68Rdk0824BnzluvQG?=
 =?iso-8859-1?Q?rxu/oM3NTbwILyLVxUa18KZbZSpjqx+ZNqdVh5z7piWbX4pfr4PbzT48Cc?=
 =?iso-8859-1?Q?K3Ip+XCIovEKt5pjhzezyQrYiRzIv7AWFMB+H0WjOXGSlWW6wiEYhgICbh?=
 =?iso-8859-1?Q?ApvZvlEJncxBGGAHTZwBeFDRU3mUScMrulEYaP0jCkzJrQYl5DLWftUb4A?=
 =?iso-8859-1?Q?Ec1x+iCeik3VjCH0sCvtGeUYl/lz/LPqJp+qiOOARUfoXMr32/w2hez8a4?=
 =?iso-8859-1?Q?jra8t0N3hoEgl8ougZU5K35+Ojp//AC9wOfpfc/aUuHDpw7jgJbRPL8UmM?=
 =?iso-8859-1?Q?EgIJQ7PzDhhOfizxQZxyPvGwcY+FeEXKD4+x6au+M8zu9qSTMk1SphPzDt?=
 =?iso-8859-1?Q?DLmFhXdb7p08u1mEx1Rn44IYMm+LmN+1r7ER0+EbkOQoZa+NVVJOHlDBkb?=
 =?iso-8859-1?Q?9M6+hCjTH5HxskZIZ+IqQc2itIjGJTWrMMw+qB/VDiHmyRGXgxPQJMe0fY?=
 =?iso-8859-1?Q?Bqe79B7eUYUd+5mO2sXXa/NYlZhbtOwjmW2CLabydAWjqwlkOLjbgLVin9?=
 =?iso-8859-1?Q?5fvIWH6TAJbrk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e56fa3b9-3c6a-4a8b-4a13-08db3aa275f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 15:36:04.0923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NmDe2qoLrK2rcv8XyBW/E34wqVBx7J2VLggpJi/GQfWVIxpT/kzIAc4MAO+amWJnpXcJtEyfdZSdCrYvsLKjBpF8G/zFFGqbsrOougJfZz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6000
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Greg,

> Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt hand=
ler
>=20
> On Tue, Apr 11, 2023 at 02:40:52PM +0000, Biju Das wrote:
> > Hi Greg,
> >
> > > Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt
> > > handler
> > >
> > > Hi Greg,
> > >
> > > Thanks for the feedback.
> > >
> > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end
> > > > interrupt handler
> > > >
> > > > On Tue, Apr 11, 2023 at 11:08:59AM +0100, Biju Das wrote:
> > > > > commit b43a18647f03c87e77d50d6fe74904b61b96323e upstream.
> > > > >
> > > > > The fourth interrupt on SCI port is transmit end interrupt
> > > > > compared to the break interrupt on other port types. So, shuffle
> > > > > the interrupts to fix the transmit end interrupt handler.
> > > > >
> > > > > Fixes: e1d0be616186 ("sh-sci: Add h8300 SCI")
> > > > > Cc: stable <stable@kernel.org>
> > > > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > Link:
> > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > [biju: manually fixed the conflicts]
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > > Resending to 4.14 with confilcts [1] fixed.
> > > > > [1]
> > > >
> > > > You did not actually build your patch, as it breaks the build :(
> > >
> > > Actually, I build the patch, but did not test it on target as I
> > > don't have the platform to test it.
> > >
> > > I got some issues while building modules which is unrelated to this
> change.
> > >
> > > Anyway, I will double check again and confirm.
> >
> > I confirm, there is an issue with this patch.
> >
> > I disabled building modules from my build script and it showed the belo=
w
> error.
> > So I would like to drop this patch for 4.14 as this header file does no=
t
> exist for 4.14.
> >
> > drivers/tty/serial/sh-sci.c:40:10: fatal error: linux/minmax.h: No such
> file or directory
> >    40 | #include <linux/minmax.h>
> >       |          ^~~~~~~~~~~~~~~~
>=20
> Yes, minmax is not there, but the function needed by that is there (hint,=
 I
> had to remove that include in 4.19).  Remove it and see the next error yo=
u
> get :)
>=20

OK got it, The SCIx_TEI_IRQ  is introduced after 4.18 by patch [1].=20

[1]=20
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/dri=
vers/tty/serial/sh-sci.c?h=3Dlinux-5.4.y&id=3D628c534ae73581fd21a09a27b7a42=
22b01a44d64

So, 4.14 does not require this patch, as it have combined interrupt.

Cheers,
Biju
