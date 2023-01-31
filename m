Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC79D6825DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Jan 2023 08:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjAaHv0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Jan 2023 02:51:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjAaHvZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jan 2023 02:51:25 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2101.outbound.protection.outlook.com [40.107.215.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB9665A3;
        Mon, 30 Jan 2023 23:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lP+m36Usk9OcP+f2h9IVIWUC5Yd3GHqzdM4M0fyHms8rMAdig+pFcA6Z/aW+NIMWtKfgZClGxMIn+q9zywv7XR0ekqXIXPFak/XJh8u1V/VeTpIW2+Zwzdy57hg3h/ZCPFM3OkQoIERiZnTAA/XgxA+U+RnkrE2I1/w7kcOWTnCQ56H5FCD6PoJ+f4cqjktFRNFSzmM5GbnNUAvdaqmwb6jwDl/2UP8q6/eVbtAVkeFIjQAc2S3rE4CqmarKTgXDA15QWG5BJpPwZgLNVxgzHf+MXaBHPC276k689koRt3pTYTsxzifDf+ayn/3PCGdvWlE/IxmD+d9MStlr6dS/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sax+yq24YwADecPznkU7W+cpM7rUviXxtvU9k8OMf10=;
 b=Hliq5TYIGqMV8EmM/oDWNGDmwBUc++x8veDFxKgnttHU5VGlRFQLDzwU53ebXD4B51j1aulnjr8U4rvA6GzMO67gIJvdnsy1u11+HhT3Y9bZ3dCFRKjz7jIAqhLGv7wbzRC3Ql6oF2SEO5bSe0DWr9rRhF9MgWDiMOdCoO9IQvlzU2ZGGAt/6MPZxqcUTQRzbpJveVHvdpq9oxv1KdC5WlX2O9ErMRXYJt2lORxotEJ/c/Euvu2k4cCkIQkAPL7v13nLKsPT+tcn3P0ceXiARoaE1UOaqW2dJhoowQNqKTctfv/KPIDCb1fAPZob51B1N4/r1CJMmPjeWPByCIswEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sax+yq24YwADecPznkU7W+cpM7rUviXxtvU9k8OMf10=;
 b=n7UvIWQNqXaZdm9YUaQsB4XN3eAmQdAjOT/Qiy3Bkn5IShH2f2o2HoLQOAPzF3DARATtSsHIsGEQsNt8w5x5KyR4LNkY5vrW45QOYG8FzWosbmtsLc26CGlmPK7M5Z3njDSR7xn93zacLUDS+DxfjrYu+miS1WkM8jy7u2J9d0g=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5942.jpnprd01.prod.outlook.com (2603:1096:604:c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 07:51:19 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 07:51:18 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Arnd Bergmann <arnd@kernel.org>, kernel test robot <lkp@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependencies
 detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
Thread-Topic: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependencies
 detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
Thread-Index: AQHZNFRzWGTdb9Qh20GbjjeGaxR0fa62s0+wgAClXACAAMyfAIAAAY8g
Date:   Tue, 31 Jan 2023 07:51:18 +0000
Message-ID: <OS0PR01MB5922D9F56C252942BD05EB2D86D09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <202301301054.KVvGA5XO-lkp@intel.com>
 <OS0PR01MB59220EFDE43A39D61FC73E2786D39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <7973405f-3d17-4556-af45-792c8edbc391@app.fastmail.com>
 <10f7154e-abe3-4f24-a693-2997b391147a@app.fastmail.com>
In-Reply-To: <10f7154e-abe3-4f24-a693-2997b391147a@app.fastmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB5942:EE_
x-ms-office365-filtering-correlation-id: 4356a2a3-105a-4f9d-d1aa-08db035fefb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kjzn4nVfGXvHm5/pl9o4lcvl6Iw4HGwYHdf8Uulfc32gkCT8/E/wIuA2N0MOrKD9UL+QVhoTvGVQzOQdw3Znmtc2lPq1f7qWwTgfW1KB3tXcjes5K0hRTmIwVHFvSuiHZc/qV4HgCGcJrLAB/2OBvy7C+MG1nnF9qjIMGUHGvE+9Ldiys0c477CJeFJIqxuktp/QmJkrBK9DVxmm0N4cNRttTf9pJBv5WTfX5UitiDtJ6L8Je5MFF3enkgGvXwliWjxh/uLitT31qHCMEcQ/7ByJDZ7RuysQhP0sFndK/eB5BAzuPh3Rpy+GtvFJyMDvxjxHcfE4tePbYTF3qAc635Vkwn4shejN13c1eSqAOZ4+OBEMleKKnZG0C9y58slZKHSZXq/D2Lenz4HFbWzbeNpTuMq+IU16M2DKLei8fkgjHg0QsyqouOwVnTIcjp3tC5ohntuA7m6QidKu912/i8giM83PRtIbuO3atDOTnNZHHcJePF3Z4M5N+45iKa1hkW4vOY8TyPs4+c586alqs2zJd6kRPVNdw893dEIeDf781OX88vq2oY6p4wqzBf37kbevgy4DD9eJ0DkknqU1FZix01rWVcfyR5gjCWrS37/wXTsDFQyC3OgIN1mBzS3zaEev+3YuUpXphJnM389Vi8IjgkfhF912OKvehXzhct8rX9kveA8U3uRU7x8XILz3ScvOlhY/zBDEt/ZGdPnRmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199018)(186003)(107886003)(478600001)(9686003)(26005)(53546011)(4326008)(66446008)(316002)(66476007)(66556008)(64756008)(7696005)(71200400001)(6506007)(76116006)(66946007)(52536014)(5660300002)(30864003)(8936002)(83380400001)(41300700001)(2906002)(33656002)(122000001)(55016003)(38100700002)(38070700005)(86362001)(54906003)(110136005)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UsFzMxNE3WpWfyF4poLcPTQnVU/APqEIBEZxUpbqz4PStkIldZQKINpx4BKc?=
 =?us-ascii?Q?Xwoi2RpzC9g5+EIhJyBrTPQZ+jXJ/ChRJBMMoFicmPQ2/m8jhvYf4Z5lBENG?=
 =?us-ascii?Q?aHDt1WvZOY3vL/0IL8BYVk8VLstvqUTQVBKgBLFZVZ0VWIbi2uBfWVkj5I4w?=
 =?us-ascii?Q?13HFyq1vXbtEVmNKppP5+bZgwdMsgu7ivzg/2WuryAbGfO2m/3Mlb53dehMW?=
 =?us-ascii?Q?EJvwP738Hiybnf7L8aOY+RM0eR1PoaWjoACwqYO//Q94VRuRbNiH6aGw7i7J?=
 =?us-ascii?Q?kj2Yrg/WadRMILqT3jk7LB66CECfSQRrs8gC7yaIokPNAjJiBo9oAntQquC+?=
 =?us-ascii?Q?LUp2fna4nkQIM4bN20XHWaEMu5mohZNuneE+Bfb298fGnc4Sn423AZXeMOYQ?=
 =?us-ascii?Q?cdvVLoAECAgQ3eqEWItWx6Yeo+9p0FU4N74lRTkyUuWe7P/PSpldKQ0B/hNJ?=
 =?us-ascii?Q?PQi31/BMoTLHjeAFVLy41F2GAZUgM+2ek1x/zAnLUno84B0Tsk4kLZR6+uhf?=
 =?us-ascii?Q?mf9jsu1wW7V3gRMSNXvGagNko/ZkD1RsdXs50wGouWDDECkMGGVABbqSi9Nh?=
 =?us-ascii?Q?J7lusIVu5wDbfY4APsCYxlk3b6IiaHAq6RHiYVugmfjffbAziQ73oCDYDH9Z?=
 =?us-ascii?Q?B/r1m/qoRLz0lW3l1aOr4JlaOJjfbYvGOyLOXxg9B/xiVZ4osAJqEiv00aGn?=
 =?us-ascii?Q?o/iz4U3l+hrop222EF3fs2786d4g70fY9RsO//3fnHNB1v43ygIydXxDIaLp?=
 =?us-ascii?Q?jcTxTKSzgwMR3rYWEfQlsl8f66z12NGjUhj3FU0DEnYpWO5uwkXYkdxsuRtq?=
 =?us-ascii?Q?ZTyiKZ/m/M6xylVzSMh4oY5dygvElcPzUG7+OJiWKbiKtbtFcaSx0/eH/7Vz?=
 =?us-ascii?Q?9mEB+hloy3/64ePcARa2LDPS+V8K7DkjQ4jT8KOG4OPbfdjsvlDcKEfAADPg?=
 =?us-ascii?Q?vKzGLW1mKXzrZZ9sUt8LQSKOu1AgHuQG7z+U4nNlVG9Vgd2pTb/2uCGXOT5O?=
 =?us-ascii?Q?UXVCsKqSYe308kSZTFgzA9ACwO+arh2BgtqUY3URgeTYYjr5XXV7LP1RVALH?=
 =?us-ascii?Q?1/XAwi9M9FynRPX7cB1aShVTsKfSUY+jHoouo0x2fJDsHUPzzVKQGXcgis7u?=
 =?us-ascii?Q?tQTmwcOJA6+UH1MX5u8ULB2JfkT2G0W0TGKkdazn+JxxwbdwPkPUtz4IXy3q?=
 =?us-ascii?Q?bKXWGDBeA0Sxm/YlWe5+M9OVuOyI3X6xrKAiKRraeuXqcp6dXUYGTOwJd8QJ?=
 =?us-ascii?Q?+9uDRldllIx2QfCZ6S3mlgIdfRNWR+sr9nQ9wKm2ArSZqQcQFUc6pLZ/9wRf?=
 =?us-ascii?Q?ykrDcnvwBBP7N+bTg1WTNkbDOEdQ7KZ698MrcV89Q685r8pBh5yrNCLQtKOX?=
 =?us-ascii?Q?ubUnd0wnbnf7w/mz3jsTYw/INS34dgPbMxrrm5uKYSIpSr/j0HdKz+By6y98?=
 =?us-ascii?Q?8XzpuThSdc4LhxuAlCaKXPJF03/QLcIZyYV75QKH5OUFFKJV0gM6CwE2NRty?=
 =?us-ascii?Q?WDRrhlo88Cw7QFJacCMk4HqV8xxX3DFtWMALN67cS1BzxH+N0KtQ0Eg7ATdW?=
 =?us-ascii?Q?kqWu/dVKYsXVWfsxJ+ESCGiZxrIbG9my6csNCPy3Wn+OCZ6qNXOShoeaBuZC?=
 =?us-ascii?Q?JA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4356a2a3-105a-4f9d-d1aa-08db035fefb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 07:51:18.1086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HRi/QcodvDAnd6I6LV/YtKK8Ul69KUYRebf6E0WtqjmuE9FThJuUqAPi8CZEOVsZRTmgmKpqnG7BBuodx4fgbOW55o19eZoiEMY+HPNAKVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5942
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Arnd,

+ Shimoda-San,

> Subject: Re: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependenc=
ies
> detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
>=20
> On Mon, Jan 30, 2023, at 20:25, Arnd Bergmann wrote:
> > On Mon, Jan 30, 2023, at 19:54, Biju Das wrote:
> >> Hi all,
> >>
> >>> Subject: [usb:usb-next 35/35] kismet: WARNING: unmet direct
> >>> dependencies detected for USB_RZV2M_USB3DRD when selected by
> >>> USB_XHCI_RZV2M
> >>>
> >> Just for testing, I have reverted Arnd's patch[1] and then done the
> >> below changes which is fixing unmet dependencies reported by the bot.
> >>
> >> Looks like USB_RZV2M_USB3DRD should depend upon both USB and
> >> USB_GADGET. Previously It depends only on USB_GADGET.
> >>
> >> Also the USB3DRD driver should be in "driver/usb/renesas_usb3drd"
> >> directory instead
> >> of "driver/usb/gadget/udc" as both HOST and device ctrlr need this
> >> driver.
> >>
> > I found yet another regression, and I don't think any of the above
> > fully address this. Let me try to come up with a better fix that also
> > addresses this one:
>=20
> I've experimented with this a little more and got to a version that survi=
ved
> a few hundred randconfig kernel builds overnight and converts the driver =
to
> a much more regular hierarchy.
>=20
> Can you try the patch below to make sure this still works on your chip?

OK, I will test and provide you feedback.

Cheers,
Biju

>=20
> 8<---
> From 6d42357a59a832acea9530eb8531e9ff908eeca4 Mon Sep 17 00:00:00 2001
> From: Arnd Bergmann <arnd@arndb.de>
> Date: Mon, 30 Jan 2023 12:15:13 +0100
> Subject: [PATCH] usb: xhci: split out rcar support from xhci-plat.c
>=20
> The USB_XHCI_RZV2M and USB_RENESAS_USB3 select other drivers based on the
> enabled SoC types, which leads to build failures when the dependencies ar=
e
> not met:
>=20
> WARNING: unmet direct dependencies detected for USB_RZV2M_USB3DRD
>   Depends on [n]: USB_SUPPORT [=3Dy] && USB_GADGET [=3Dn] && (ARCH_R9A09G=
011
> [=3Dn] || COMPILE_TEST [=3Dy])
>   Selected by [m]:
>   - USB_XHCI_RZV2M [=3Dm] && USB_SUPPORT [=3Dy] && USB [=3Dy] && USB_XHCI=
_HCD [=3Dm]
> && USB_XHCI_PLATFORM [=3Dm] && (ARCH_R9A09G011 [=3Dn] || COMPILE_TEST [=
=3Dy])
> ERROR: modpost: "rzv2m_usb3drd_reset" [drivers/usb/host/xhci-plat-hcd.ko]
> undefined!
>=20
> The xhci-rcar driver has a reverse dependency with the xhci core, and it
> depends on the UDC driver in turn. To untangle this, make the xhci-rcar.k=
o
> driver a standalone module that just calls into the xhci-plat.ko module l=
ike
> other drivers do.
>=20
> This allows handling the dependency on the USB_RZV2M_USB3DRD driver to on=
ly
> affect the xhci-rcar module and simplify the xhci-plat module.
>=20
> It also allows leaving out the hacks for broken dma mask and nested devic=
es
> from the rcar side and keep that only in the generic xhci driver.
>=20
> Fixes: c52c9acc415e ("xhci: host: Add Renesas RZ/V2M SoC support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20
> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kcon=
fig
> index 9b7a1681550f..20b477b2a080 100644
> --- a/drivers/usb/gadget/udc/Kconfig
> +++ b/drivers/usb/gadget/udc/Kconfig
> @@ -182,8 +182,6 @@ config USB_RENESAS_USBHS_UDC  config USB_RZV2M_USB3DR=
D
>  	tristate 'Renesas USB3.1 DRD controller'
>  	depends on ARCH_R9A09G011 || COMPILE_TEST
> -	default USB_XHCI_RZV2M
> -	default USB_RENESAS_USB3
>  	help
>  	   Renesas USB3.1 DRD controller is a USB DRD controller
>  	   that supports both host and device switching.
> @@ -194,8 +192,8 @@ config USB_RZV2M_USB3DRD  config USB_RENESAS_USB3
>  	tristate 'Renesas USB3.0 Peripheral controller'
>  	depends on ARCH_RENESAS || COMPILE_TEST
> +	depends on USB_RZV2M_USB3DRD || !USB_RZV2M_USB3DRD
>  	depends on EXTCON
> -	select USB_RZV2M_USB3DRD if ARCH_R9A09G011
>  	select USB_ROLE_SWITCH
>  	help
>  	   Renesas USB3.0 Peripheral controller is a USB peripheral controller
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig index
> 4b5c5b1feb40..c0b98d789553 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -53,8 +53,6 @@ config USB_XHCI_PCI_RENESAS
>=20
>  config USB_XHCI_PLATFORM
>  	tristate "Generic xHCI driver for a platform device"
> -	select USB_XHCI_RCAR if ARCH_RENESAS
> -	select USB_XHCI_RZV2M if ARCH_R9A09G011
>  	help
>  	  Adds an xHCI host driver for a generic platform device, which
>  	  provides a memory space and an irq.
> @@ -97,10 +95,10 @@ config USB_XHCI_RCAR
>  	  found in Renesas R-Car ARM SoCs.
>=20
>  config USB_XHCI_RZV2M
> -	tristate "xHCI support for Renesas RZ/V2M SoC"
> -	depends on USB_XHCI_PLATFORM
> +	bool "xHCI support for Renesas RZ/V2M SoC"
> +	depends on USB_XHCI_RCAR
>  	depends on ARCH_R9A09G011 || COMPILE_TEST
> -	select USB_RZV2M_USB3DRD
> +	depends on USB_RZV2M_USB3DRD=3Dy || (USB_RZV2M_USB3DRD=3DUSB_XHCI_RCAR)
>  	help
>  	  Say 'Y' to enable the support for the xHCI host controller
>  	  found in Renesas RZ/V2M SoC.
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile index
> 6b1f9317f116..00ba09378fc2 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -25,17 +25,15 @@ xhci-plat-hcd-y :=3D xhci-plat.o  ifneq
> ($(CONFIG_USB_XHCI_MVEBU), )
>  	xhci-plat-hcd-y		+=3D xhci-mvebu.o
>  endif
> -ifneq ($(CONFIG_USB_XHCI_RCAR), )
> -	xhci-plat-hcd-y		+=3D xhci-rcar.o
> -endif
> -ifneq ($(CONFIG_USB_XHCI_RZV2M), )
> -	xhci-plat-hcd-y		+=3D xhci-rzv2m.o
> -endif
> -
>  ifneq ($(CONFIG_DEBUG_FS),)
>  	xhci-hcd-y		+=3D xhci-debugfs.o
>  endif
>=20
> +obj-$(CONFIG_USB_XHCI_RCAR)		+=3D xhci-rcar-hcd.o
> +xhci-rcar-hcd-y				+=3D xhci-rcar.o
> +xhci-rcar-hcd-$(CONFIG_USB_XHCI_RZV2M)	+=3D xhci-rzv2m.o
> +
> +
>  obj-$(CONFIG_USB_PCI)	+=3D pci-quirks.o
>=20
>  obj-$(CONFIG_USB_EHCI_HCD)	+=3D ehci-hcd.o
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 57269f1f318e..cd17ccab6e00 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -24,8 +24,6 @@
>  #include "xhci.h"
>  #include "xhci-plat.h"
>  #include "xhci-mvebu.h"
> -#include "xhci-rcar.h"
> -#include "xhci-rzv2m.h"
>=20
>  static struct hc_driver __read_mostly xhci_plat_hc_driver;
>=20
> @@ -116,21 +114,6 @@ static const struct xhci_plat_priv
> xhci_plat_marvell_armada3700 =3D {
>  	.init_quirk =3D xhci_mvebu_a3700_init_quirk,  };
>=20
> -static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen2 =3D {
> -	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V1)
> -};
> -
> -static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 =3D {
> -	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V3)
> -};
> -
> -static const struct xhci_plat_priv xhci_plat_renesas_rzv2m =3D {
> -	.quirks =3D XHCI_NO_64BIT_SUPPORT | XHCI_TRUST_TX_LENGTH |
> -		  XHCI_SLOW_SUSPEND,
> -	.init_quirk =3D xhci_rzv2m_init_quirk,
> -	.plat_start =3D xhci_rzv2m_start,
> -};
> -
>  static const struct xhci_plat_priv xhci_plat_brcm =3D {
>  	.quirks =3D XHCI_RESET_ON_RESUME | XHCI_SUSPEND_RESUME_CLKS,  }; @@ -
> 149,30 +132,6 @@ static const struct of_device_id usb_xhci_of_match[] =3D=
 {
>  	}, {
>  		.compatible =3D "marvell,armada3700-xhci",
>  		.data =3D &xhci_plat_marvell_armada3700,
> -	}, {
> -		.compatible =3D "renesas,xhci-r8a7790",
> -		.data =3D &xhci_plat_renesas_rcar_gen2,
> -	}, {
> -		.compatible =3D "renesas,xhci-r8a7791",
> -		.data =3D &xhci_plat_renesas_rcar_gen2,
> -	}, {
> -		.compatible =3D "renesas,xhci-r8a7793",
> -		.data =3D &xhci_plat_renesas_rcar_gen2,
> -	}, {
> -		.compatible =3D "renesas,xhci-r8a7795",
> -		.data =3D &xhci_plat_renesas_rcar_gen3,
> -	}, {
> -		.compatible =3D "renesas,xhci-r8a7796",
> -		.data =3D &xhci_plat_renesas_rcar_gen3,
> -	}, {
> -		.compatible =3D "renesas,rcar-gen2-xhci",
> -		.data =3D &xhci_plat_renesas_rcar_gen2,
> -	}, {
> -		.compatible =3D "renesas,rcar-gen3-xhci",
> -		.data =3D &xhci_plat_renesas_rcar_gen3,
> -	}, {
> -		.compatible =3D "renesas,rzv2m-xhci",
> -		.data =3D &xhci_plat_renesas_rzv2m,
>  	}, {
>  		.compatible =3D "brcm,xhci-brcm-v2",
>  		.data =3D &xhci_plat_brcm,
> @@ -185,11 +144,10 @@ static const struct of_device_id usb_xhci_of_match[=
] =3D
> {  MODULE_DEVICE_TABLE(of, usb_xhci_of_match);  #endif
>=20
> -static int xhci_plat_probe(struct platform_device *pdev)
> +int xhci_plat_probe(struct platform_device *pdev, struct device
> +*sysdev, const struct xhci_plat_priv *priv_match)
>  {
> -	const struct xhci_plat_priv *priv_match;
>  	const struct hc_driver	*driver;
> -	struct device		*sysdev, *tmpdev;
> +	struct device		*tmpdev;
>  	struct xhci_hcd		*xhci;
>  	struct resource         *res;
>  	struct usb_hcd		*hcd, *usb3_hcd;
> @@ -207,31 +165,10 @@ static int xhci_plat_probe(struct platform_device
> *pdev)
>  	if (irq < 0)
>  		return irq;
>=20
> -	/*
> -	 * sysdev must point to a device that is known to the system firmware
> -	 * or PCI hardware. We handle these three cases here:
> -	 * 1. xhci_plat comes from firmware
> -	 * 2. xhci_plat is child of a device from firmware (dwc3-plat)
> -	 * 3. xhci_plat is grandchild of a pci device (dwc3-pci)
> -	 */
> -	for (sysdev =3D &pdev->dev; sysdev; sysdev =3D sysdev->parent) {
> -		if (is_of_node(sysdev->fwnode) ||
> -			is_acpi_device_node(sysdev->fwnode))
> -			break;
> -#ifdef CONFIG_PCI
> -		else if (sysdev->bus =3D=3D &pci_bus_type)
> -			break;
> -#endif
> -	}
> -
>  	if (!sysdev)
>  		sysdev =3D &pdev->dev;
>=20
> -	if (WARN_ON(!sysdev->dma_mask))
> -		/* Platform did not initialize dma_mask */
> -		ret =3D dma_coerce_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
> -	else
> -		ret =3D dma_set_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
> +	ret =3D dma_set_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
>  	if (ret)
>  		return ret;
>=20
> @@ -293,11 +230,6 @@ static int xhci_plat_probe(struct platform_device
> *pdev)
>  	if (ret)
>  		goto disable_reg_clk;
>=20
> -	if (pdev->dev.of_node)
> -		priv_match =3D of_device_get_match_data(&pdev->dev);
> -	else
> -		priv_match =3D dev_get_platdata(&pdev->dev);
> -
>  	if (priv_match) {
>  		priv =3D hcd_to_xhci_priv(hcd);
>  		/* Just copy data for now */
> @@ -411,8 +343,47 @@ static int xhci_plat_probe(struct platform_device
> *pdev)
>=20
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(xhci_plat_probe);
> +
> +static int xhci_generic_plat_probe(struct platform_device *pdev) {
> +	const struct xhci_plat_priv *priv_match;
> +	struct device *sysdev;
> +	int ret;
> +
> +	/*
> +	 * sysdev must point to a device that is known to the system firmware
> +	 * or PCI hardware. We handle these three cases here:
> +	 * 1. xhci_plat comes from firmware
> +	 * 2. xhci_plat is child of a device from firmware (dwc3-plat)
> +	 * 3. xhci_plat is grandchild of a pci device (dwc3-pci)
> +	 */
> +	for (sysdev =3D &pdev->dev; sysdev; sysdev =3D sysdev->parent) {
> +		if (is_of_node(sysdev->fwnode) ||
> +			is_acpi_device_node(sysdev->fwnode))
> +			break;
> +#ifdef CONFIG_PCI
> +		else if (sysdev->bus =3D=3D &pci_bus_type)
> +			break;
> +#endif
> +	}
> +
> +	if (WARN_ON(!sysdev->dma_mask)) {
> +		/* Platform did not initialize dma_mask */
> +		ret =3D dma_coerce_mask_and_coherent(sysdev, DMA_BIT_MASK(64));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (pdev->dev.of_node)
> +		priv_match =3D of_device_get_match_data(&pdev->dev);
> +	else
> +		priv_match =3D dev_get_platdata(&pdev->dev);
> +
> +	return xhci_plat_probe(pdev, sysdev, priv_match); }
>=20
> -static int xhci_plat_remove(struct platform_device *dev)
> +int xhci_plat_remove(struct platform_device *dev)
>  {
>  	struct usb_hcd	*hcd =3D platform_get_drvdata(dev);
>  	struct xhci_hcd	*xhci =3D hcd_to_xhci(hcd);
> @@ -446,6 +417,7 @@ static int xhci_plat_remove(struct platform_device *d=
ev)
>=20
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(xhci_plat_remove);
>=20
>  static int __maybe_unused xhci_plat_suspend(struct device *dev)  { @@ -
> 522,13 +494,14 @@ static int __maybe_unused xhci_plat_runtime_resume(stru=
ct
> device *dev)
>  	return xhci_resume(xhci, 0);
>  }
>=20
> -static const struct dev_pm_ops xhci_plat_pm_ops =3D {
> +const struct dev_pm_ops xhci_plat_pm_ops =3D {
>  	SET_SYSTEM_SLEEP_PM_OPS(xhci_plat_suspend, xhci_plat_resume)
>=20
>  	SET_RUNTIME_PM_OPS(xhci_plat_runtime_suspend,
>  			   xhci_plat_runtime_resume,
>  			   NULL)
>  };
> +EXPORT_SYMBOL_GPL(xhci_plat_pm_ops);
>=20
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id usb_xhci_acpi_match[] =3D { @@ -539,8
> +512,8 @@ static const struct acpi_device_id usb_xhci_acpi_match[] =3D {
> MODULE_DEVICE_TABLE(acpi, usb_xhci_acpi_match);  #endif
>=20
> -static struct platform_driver usb_xhci_driver =3D {
> -	.probe	=3D xhci_plat_probe,
> +static struct platform_driver usb_generic_xhci_driver =3D {
> +	.probe	=3D xhci_generic_plat_probe,
>  	.remove	=3D xhci_plat_remove,
>  	.shutdown =3D usb_hcd_platform_shutdown,
>  	.driver	=3D {
> @@ -555,13 +528,13 @@ MODULE_ALIAS("platform:xhci-hcd");
>  static int __init xhci_plat_init(void)
>  {
>  	xhci_init_driver(&xhci_plat_hc_driver, &xhci_plat_overrides);
> -	return platform_driver_register(&usb_xhci_driver);
> +	return platform_driver_register(&usb_generic_xhci_driver);
>  }
>  module_init(xhci_plat_init);
>=20
>  static void __exit xhci_plat_exit(void)  {
> -	platform_driver_unregister(&usb_xhci_driver);
> +	platform_driver_unregister(&usb_generic_xhci_driver);
>  }
>  module_exit(xhci_plat_exit);
>=20
> diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
> index 1fb149d1fbce..83b5b5aa9f8e 100644
> --- a/drivers/usb/host/xhci-plat.h
> +++ b/drivers/usb/host/xhci-plat.h
> @@ -21,4 +21,11 @@ struct xhci_plat_priv {
>=20
>  #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->pr=
iv)
> #define xhci_to_priv(x) ((struct xhci_plat_priv *)(x)->priv)
> +
> +int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev,
> +		    const struct xhci_plat_priv *priv_match);
> +
> +int xhci_plat_remove(struct platform_device *dev); extern const struct
> +dev_pm_ops xhci_plat_pm_ops;
> +
>  #endif	/* _XHCI_PLAT_H */
> diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> index aef0258a7160..f0960966deb9 100644
> --- a/drivers/usb/host/xhci-rcar.c
> +++ b/drivers/usb/host/xhci-rcar.c
> @@ -10,12 +10,14 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/usb/phy.h>
>  #include <linux/sys_soc.h>
>=20
>  #include "xhci.h"
>  #include "xhci-plat.h"
>  #include "xhci-rcar.h"
> +#include "xhci-rzv2m.h"
>=20
>  /*
>  * - The V3 firmware is for almost all R-Car Gen3 (except r8a7795 ES1.x) =
@@
> -225,3 +227,72 @@ int xhci_rcar_resume_quirk(struct usb_hcd *hcd)
>=20
>  	return ret;
>  }
> +
> +static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen2 =3D {
> +	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V1)
> +};
> +
> +static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 =3D {
> +	SET_XHCI_PLAT_PRIV_FOR_RCAR(XHCI_RCAR_FIRMWARE_NAME_V3)
> +};
> +
> +static const struct xhci_plat_priv xhci_plat_renesas_rzv2m =3D {
> +	.quirks =3D XHCI_NO_64BIT_SUPPORT | XHCI_TRUST_TX_LENGTH |
> +		  XHCI_SLOW_SUSPEND,
> +	.init_quirk =3D xhci_rzv2m_init_quirk,
> +	.plat_start =3D xhci_rzv2m_start,
> +};
> +
> +static const struct of_device_id usb_xhci_of_match[] =3D {
> +	{
> +		.compatible =3D "renesas,xhci-r8a7790",
> +		.data =3D &xhci_plat_renesas_rcar_gen2,
> +	}, {
> +		.compatible =3D "renesas,xhci-r8a7791",
> +		.data =3D &xhci_plat_renesas_rcar_gen2,
> +	}, {
> +		.compatible =3D "renesas,xhci-r8a7793",
> +		.data =3D &xhci_plat_renesas_rcar_gen2,
> +	}, {
> +		.compatible =3D "renesas,xhci-r8a7795",
> +		.data =3D &xhci_plat_renesas_rcar_gen3,
> +	}, {
> +		.compatible =3D "renesas,xhci-r8a7796",
> +		.data =3D &xhci_plat_renesas_rcar_gen3,
> +	}, {
> +		.compatible =3D "renesas,rcar-gen2-xhci",
> +		.data =3D &xhci_plat_renesas_rcar_gen2,
> +	}, {
> +		.compatible =3D "renesas,rcar-gen3-xhci",
> +		.data =3D &xhci_plat_renesas_rcar_gen3,
> +	}, {
> +		.compatible =3D "renesas,rzv2m-xhci",
> +		.data =3D &xhci_plat_renesas_rzv2m,
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, usb_xhci_of_match);
> +
> +static int xhci_renesas_probe(struct platform_device *pdev) {
> +	const struct xhci_plat_priv *priv_match;
> +
> +	priv_match =3D of_device_get_match_data(&pdev->dev);
> +
> +	return xhci_plat_probe(pdev, NULL, priv_match); }
> +
> +static struct platform_driver usb_xhci_renesas_driver =3D {
> +	.probe	=3D xhci_renesas_probe,
> +	.remove	=3D xhci_plat_remove,
> +	.shutdown =3D usb_hcd_platform_shutdown,
> +	.driver	=3D {
> +		.name =3D "xhci-renesas-hcd",
> +		.pm =3D &xhci_plat_pm_ops,
> +		.of_match_table =3D of_match_ptr(usb_xhci_of_match),
> +	},
> +};
> +module_platform_driver(usb_xhci_renesas_driver);
> +
> +MODULE_DESCRIPTION("xHCI Platform Host Controller Driver for Renesas
> +R-Car and RZ"); MODULE_LICENSE("GPL");
