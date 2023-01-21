Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECDD86765C5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jan 2023 11:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjAUKy1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 21 Jan 2023 05:54:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjAUKy0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jan 2023 05:54:26 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2132.outbound.protection.outlook.com [40.107.114.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E804DBCC;
        Sat, 21 Jan 2023 02:54:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlSRdqORbVVLjY3PlLPlVdA2ws9EvON+sHIMORvjuOd0L48MyhG65b8t1FINNCKSXghrvAECGwwmEVCmooiq4vtVM30DB4QJyzzuALCfjYeLdH6x3SVNaudFve/EGbj5uGyYySRTKi4O9rgTmm1ZdipAySJksVUB9t8UU/o6i4K7bbUlLcd2F+U9IFlf443PGVoC0jcZpwhBWewC4ZRsb6RvKANG2Tg14bc7zW3jWr6F75Gjk+gqpJlaTxvxMFWujccHQJlMv9hv8xvHwRra57BRXsUjH7U1RgEbB39H01gBpT1eWZLtmqUYyY3rRf/dLfrQ0EdOFsWZrjynpHQyGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZaB0obAkt8/GJRbT+buEn2j8WNCHl0008ME4FIdgo8=;
 b=e9BvDFLkBRzqrf8eyuz1vPmS/hZEAAbh6RiiQ60TqPzv7ZaXOpIuyWDC/QTdduFX088Tq6u3fbpD1is12W7Jl+mpk42YqJmUmp1iArTmUZ1iABWkuya7kqdfPksH8Shinm+YwHg9XquDG9hO1xEUCL+Rl9sI1Ifab0Alf9Uw23yQ92gW69u/DdPH9qZsMcgTr0UHJV2sfej7yHLHnh+H9y9yxJUxVH0XIB4868wbFHidPde4wGQKT2Sh2CX7vFnbbK9o96Shx0bDBKA6YAwxORwXv3dLG8RHi9yLWGNPUgOwi4IuMHZ0yPjMH7I5nHSuqK2KYyM7+pIPZxPocKrUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZaB0obAkt8/GJRbT+buEn2j8WNCHl0008ME4FIdgo8=;
 b=LY8oPgXfTbl8xXEizYoeVVjFAuyDvqD6PnxpCf4aKmsSGf7ugE56km9oRyrlEUplCSIXsOCvvb7lx8Q77dj8HWGKS6FLjUcejGtyx9MWJijobuAgVTddqE1yZXs0zddGoDt/HdrokjFh0JlBE/EelttBjYdw0hQsWoE8hWWS50Y=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8138.jpnprd01.prod.outlook.com (2603:1096:604:1a7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Sat, 21 Jan
 2023 10:54:21 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%5]) with mapi id 15.20.6002.027; Sat, 21 Jan 2023
 10:54:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 00/12] ADD USB3.1 HOST, Peri and DRD support
Thread-Topic: [PATCH v2 00/12] ADD USB3.1 HOST, Peri and DRD support
Thread-Index: AQHZJtEcTRod+bKVFE6v1GvnSXhjTK6lwQkAgALtIWCAAAQiAIAADR2g
Date:   Sat, 21 Jan 2023 10:54:20 +0000
Message-ID: <OS0PR01MB592298005E07B9702B546A9286CA9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
 <Y8lBKKPjci7+goiV@kroah.com>
 <OS0PR01MB59221827031B393F6FB693E786CA9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y8u5Cpl2B5b2mzPp@kroah.com>
In-Reply-To: <Y8u5Cpl2B5b2mzPp@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8138:EE_
x-ms-office365-filtering-correlation-id: 33baa107-805f-444a-4aff-08dafb9dd9d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s/g5+BQOyMBaNvCRzanxzucmYAD43PXI/2VVcdMYTaVtRiW5dR+2FqWQImPWkov7VagIypefjZKWQg4vM6TcKRtE/Ifnz6Kvs2DhiHyJKur7o4HMl4qoMz9asZ4uM+9v08Cvxhp6njAQQ2f321FOV7RXxRGAoVhRKCPtHV+L/hcFBWRkLtv3NRBbbSCoWe12BgHpAlstMhGxqMkWe67LNffOKzsXDBEYKhQWrkhZo2dN+hxjaBt3DuQkU5sHcv4W72obQEo9PKir4qd17ms/10rhwEEFPYQisXucxb6da3ke4s9El8BK75kkyz5ss7xcTM3VsCZ7k+YEVGClzUS3CgBs4/Dvokres/++SZRKMrwG55SXIqtiRWJ8UGr4LB29iOEnPA+FfDrxOXrE0dVQDZpP87z47NMxMeqo6gef15hSXKitki7LBDgFnNJdKs+tm26WMTyZb8XRLRmd9MLjq59pqI2R7ifg4k59ak6RGMvlqZKUzIbGpxbrZ32/1LyC50xstLzhLtwUUe8NyqQ0LMeJN9NgCDYeKVJStS6GagWFiTGx0+0EhSMK0fj7p7iLqt9Oe4CyFIAUztuIkoo/JduokXHRClo+HlVVlOTpUR3Bp1RLFMN1wyVy12+blyalWYHj6XuDuZIXped2+Enj+h5a851LweG1N2x0AxvwLrwNf34GYY0Hc7Di0y0CBpraZ+7SrNF8dGm2+N86JJEihg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199015)(86362001)(2906002)(55016003)(33656002)(76116006)(66946007)(9686003)(66476007)(186003)(26005)(41300700001)(4326008)(6916009)(64756008)(66446008)(66556008)(8676002)(478600001)(7696005)(71200400001)(316002)(6506007)(54906003)(122000001)(5660300002)(38100700002)(8936002)(38070700005)(52536014)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IcvRIcV12VbF84AoWOylDVE6Kk/I5PiRFGUeJD7+VSUuL7BRTw70GstNWZKW?=
 =?us-ascii?Q?9ekCpMQoUhcqxVEv+S+u5NMSFjyt0954VAe65MrzMY/PF/8wyFF9wuQuBuAl?=
 =?us-ascii?Q?HBXMrAky5lADdPqf5OpcpvUkLlSxmPNBBqN9ndt8CJ0p9v363G1uJn3CGqKz?=
 =?us-ascii?Q?6j/3fSplaoiNY3i8T8592TJRNf6KbbiQEqDGUbLMWA+kBzinNWpcAV5Ldkgw?=
 =?us-ascii?Q?qf6txcLZw+iOgeavxhmyIF3Q0tWa/hy4FkRpemsClFbRR8oySwFWO0lFTnN0?=
 =?us-ascii?Q?iPf2c0+YGfC6LyH9V+QBeFJ2514590X3XRCfbn05nXrxkKvAo4/P4aL2lF2k?=
 =?us-ascii?Q?KlajgqasE4zUqTFfjFgWmNDfKzriCQTyAtj3iHfclYmDKLDQDW5S6P8x95Oa?=
 =?us-ascii?Q?Ocij2qVK3Vhby6z6clD1hdlbMqOFmvng0V/FO7dEAu9dF6oQSrkoEBX+JHht?=
 =?us-ascii?Q?YxNfIwB9OyECbNhdBmLwPwT5walUHjO4RBL4ncSMZsIVlePFh8+5MXi0YVeA?=
 =?us-ascii?Q?9MkzpQcW45ffzj55/IIZWCuiLm2NHgTguqQEJe7x6AJ4dLri6BcBqiuxKdEY?=
 =?us-ascii?Q?0GzyO/+5ezeReEr7v2789VxqvNJieV5/KYiYerauew+0Z+tJLP8r8atbtv4N?=
 =?us-ascii?Q?/Eib5de62mKPGXaGXvFi0wl7qi+FxHK9C/PHVuSx7lzRxhH5U3itC87dN7p3?=
 =?us-ascii?Q?rTDGpl/XtevQbBQwyCDU5io5Lwh3sdAQLdPMMjT7sNdh0RuRz5ofN1lPIdXG?=
 =?us-ascii?Q?1L/lXU7iU8cESt3SUKTuwTbgo/DkJ9O9dtbhgqGucKfvycCuE6M5H8S3Imec?=
 =?us-ascii?Q?yr1y4fCYBldvzPgFnVZPKbtguHfAqFyq1zuUbysa0s++HsgzXFFn9I2SyLAi?=
 =?us-ascii?Q?csW0m6nDctL55a3oW8ijvEeAoIC9hlf1ytmEgnm4EDsG89ViPIlPgy5tMEXZ?=
 =?us-ascii?Q?blRZ5Ij+AFx6j2DKgt+edqveBqP/2QPqcJgpmJk4k2ZHH/WzchCUqY6B0VjM?=
 =?us-ascii?Q?UW0Fa/Y3iPyW5+RPh984ouSVOA45fT9N7VsrJm3bkv6Mrh1uvfiL6mulFin2?=
 =?us-ascii?Q?nWYZQ6itjUH/gwR3NCWBSYpao6DoFTYJBO6mwdXph8L5DH9yoXzKgDrIr1CN?=
 =?us-ascii?Q?Vqu/l0SkMNhk5YwNvaTyexE6484moSZiNaCHpua/u4D8OCSsd7vDLEdkFhsf?=
 =?us-ascii?Q?voQT7F+Gh3Q+ASGh35lruic8I4acbLU4X2yysiQIo3mam7ql8wjeHioCqdKw?=
 =?us-ascii?Q?1JStm76NyuASNliCeGHLv9xVhF8h3Dc1UgUlYEH/k2ZgBQYJ4CB4IVs5zWrh?=
 =?us-ascii?Q?bo7iEFpMUAsolfsLj68/6hoJWgNmw5Q7+rxdofzqROHbCkLfyizDXJmmttrc?=
 =?us-ascii?Q?Tdna8b75rTgv0PXV2MkFEZf3CewBn0OjkJTPXwv3Ig5SiFCUAyrRWH5Ycbz/?=
 =?us-ascii?Q?/vkt6K2/DxnPXT7Sa1LOMyXQBss8eX+Pu++JkGD92DXIZuuwUKQTbsuuqlaX?=
 =?us-ascii?Q?Wx1Bip+d55Trms7wNEMHoLVpO/bHgEA0M62hOwYYyux15+ZkDB7deJL48CEm?=
 =?us-ascii?Q?MkFdDc7yvtAptLbahZx77Oa9Y4l/M5B7zRT5hiGCi5hL0NjrNm1TR4y6AkW1?=
 =?us-ascii?Q?LQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33baa107-805f-444a-4aff-08dafb9dd9d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2023 10:54:20.8924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NVGeB2iJyOONGK7KLUSkAoO25ysHQuGf3KWuFBEYKxQINsttYRUIGCASuXZ4BAkrq/5U0iHH9Lz/e57MDccL6lRY5moxC1Tevy9Ti2p1Kkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8138
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

Thanks for the feedback.

> Subject: Re: [PATCH v2 00/12] ADD USB3.1 HOST, Peri and DRD support
>=20
> On Sat, Jan 21, 2023 at 09:59:53AM +0000, Biju Das wrote:
> > Hi Greg,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH v2 00/12] ADD USB3.1 HOST, Peri and DRD support
> > >
> > > On Thu, Jan 12, 2023 at 09:58:54PM +0000, Biju Das wrote:
> > > > This patch series aims to add USB3.1 HOST, Peri and DRD support on
> > > > RZ/V2M EVK platform.
> > > >
> > > > The reset for both host and peri are located in USB3DRD block. The
> > > > USB3DRD registers are mapped in the AXI address space of the
> > > > Peripheral module.
> > > >
> > > > RZ/V2M XHCI is similar to R-Car XHCI but it doesn't require any
> > > > firmware.
> > > >
> > > > Host/device needs to do reset release and set the host/device
> > > > function on DRD module, before accessing any registers.
> > >
> > > After applying this series and building it on x86_64 I get the
> > > following build errors:
> > >
> > > ERROR: modpost: "rzv2m_usb3drd_reset"
> > > [drivers/usb/host/xhci-plat-hcd.ko]
> > > undefined!
> > > ERROR: modpost: "rzv2m_usb3drd_reset"
> > > [drivers/usb/gadget/udc/renesas_usb3.ko] undefined!
> >
> > The file drivers/usb/gadget/udc/rzv2m_usb3drd.c is not getting
> > compiled,
> >
> > If USB_RZV2M_USB3DRD=3Dy, USB_XHCI_RZV2M=3Dm and USB_RENESAS_USB3=3Dm a=
nd
> > Because of that modpost is giving undefined error.
> >
> > So I have updated the KCONFIG like below and now it builds OK now. I
> > will send next version based on this, if there are no comments.
> >
> > -- a/drivers/usb/gadget/udc/Kconfig
> > +++ b/drivers/usb/gadget/udc/Kconfig
> > @@ -180,10 +180,17 @@ config USB_RENESAS_USBHS_UDC
> >            gadget drivers to also be dynamically linked.
> >
> >  config USB_RZV2M_USB3DRD
> > +       tristate 'Renesas USB3.1 DRD controller'
> >         depends on ARCH_R9A09G011 || COMPILE_TEST
> > -       bool
> > -       default y if USB_XHCI_RZV2M
> > -       default y if USB_RENESAS_USB3
> > +       default y if USB_XHCI_RZV2M=3Dy
> > +       default y if USB_RENESAS_USB3=3Dy
>=20
>=20
> These should just be:
> 	default USB_XHCI_RZV2M
> 	default USB_RENESAS_USB3
> right?

Yes, you are correct. Will send next version based on this.

Cheers,
Biju
