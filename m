Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66378730F39
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jun 2023 08:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237594AbjFOGXA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Jun 2023 02:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243516AbjFOGWx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2023 02:22:53 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2122.outbound.protection.outlook.com [40.107.113.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699572684
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jun 2023 23:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgUhQRYE3eqjN/lwzbKFZSOV3+JfeKvXF4f72fFm3X7uwCWLOAlGtl1BEoZSVMqGROF/dyA8jkZa/iOzVd3OCRpuooTIgBnalq1F0/Zc3FUKApV7X/LcoQVXTOM1vOjdmNwabdOgANW3HHfgL5SRCEbH6WE5IzMreNmN1ImC4DGBBNJs1GnIqZYXjbFZF3s+Hc1AMpuVnn9NbN7m6mhbyg9lxYs+ioUuMqTCEI8s9JL+jKfW3pnuQ0aGfgacLxxzO0DT7UxCREBBeGzab5iGJHYln4P3ukm5O0hZo5tyk7aTkgOYU0M4q7ggGu+J8fL4TEUoaXrWlaBbi79fgolGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4xC4hJUX1nSvMLBjWTy7UDykBJDtFGRvTjVxU6RCqM=;
 b=TTehOKhG9der1NMF2ZmDAu2fqQydiuyV7YNJPT8huNOkottqnk01vxyFFqv2UKXO/uRd+uR3E2PVKzEHbDzcD6aIKq1MRTZYtVMefhHVWyXbWIL6g371a/RBcxHJvHH6R/TJogReMbDOIGaXY++j/caNaet6wdGlIVsBzvk7CkEw07MfwV1BSUBKPo2HEBJSkNbmIDDfQLLmKJuhUsHSNUuD+R9aCTspqb6U5/vZVdCn+bn0B3sCHkGWgTsHBSxlPpAmlrVtDVLHucYyanba28wPIh+BxYghXYLTHAY6+wfYIevLW0gSZvjWaz8lBP4/Dwvi3z+osE3uSTus90S/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4xC4hJUX1nSvMLBjWTy7UDykBJDtFGRvTjVxU6RCqM=;
 b=rXjVOlYDTqvjzGomqmgFlFjmrY8Mhur7i0dReuJxMf+IRry+FPzwW1EGsYo0BeUcDG+aPwWTEGPrkt0PrbyxRVzQJumUwRrK8uevwGsETeyATic2flAQmVcqukEDtZ9YKBN7DisxI+tuNHI2Xgps/KCMMVjzG1H944Kqo/3TR4E=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB6210.jpnprd01.prod.outlook.com (2603:1096:604:f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 06:22:47 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b%4]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 06:22:45 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [bug report] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Topic: [bug report] drm: rcar-du: Add RZ/G2L DSI driver
Thread-Index: AQHZn1CaZhhBrDNxkUOmzEt7aeo086+LZALQ
Date:   Thu, 15 Jun 2023 06:22:45 +0000
Message-ID: <OS0PR01MB59229EB7C14790662AA225F1865BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <05ac5099-b1f6-4f83-950a-ae02fc47eda1@moroto.mountain>
In-Reply-To: <05ac5099-b1f6-4f83-950a-ae02fc47eda1@moroto.mountain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB6210:EE_
x-ms-office365-filtering-correlation-id: 96b00227-030c-42d1-bb7c-08db6d68ef01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VQHVh+oiVoCoTJti/DDLCV01HIKy5AluiMUHoUumhrs+52iujUu4nuxEW6pa1mTSlC2FJZBl3eJ6kd0VzBQTtYSHbBYKXdRr069IpZlaNikFjgs9MTCogyN+sIBAUcKbQuruSGY6D75DtvfLEy8Cumb9aXrOCDzYnBBnsnBK/WpsJJWb5+25zK6ztZYP3/Mhg/Y9OU+EcLsN7QbiA1DtBXj/v5kqfy2htzX764+NCCTMk5pcsvHZjflydxTzMUOM8oPMCfymkzTJOl6DpclH+uJLzL7ZN/mKyZ947mFrVncAOGlQ/HGzqppsN/zCh251szgXfXM++S+1xgI4IIC6xuU2QgxCCIRtutLaXhMQe5aSpkIqqVZvJUTZJPYC/eUV6q5YJNT7Nbqaz1Bno8uul2i0Kx7BCwvdVsqjN8GO0VzBNM4CVO8qEEbt5q7wTjv1SJ3A7BOdNgSeNsPJBR31Xv4cQsFB3GAv71ENOCUT08FP4naNwpKndyUXXKVee1CuyY+B/CH89R02vW/52+uk0eQLP2NqzjsSdZXy7Jmiq8CijAt822N6LNZkJGdWCttlFWV/15dHyOndNuZwIstCJ6l2Tjs/KLUPnt2q5j7Bycg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(38070700005)(2906002)(86362001)(33656002)(52536014)(55016003)(966005)(7696005)(186003)(83380400001)(26005)(6506007)(53546011)(9686003)(478600001)(71200400001)(122000001)(5660300002)(54906003)(76116006)(66946007)(64756008)(66556008)(4326008)(66476007)(316002)(38100700002)(66446008)(6916009)(8676002)(8936002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3uqHGytw6y0LN//4+Kmf+yGYc/bZcdE6SNSlw7Xk46jBEgXlY76bPFo0Eu9F?=
 =?us-ascii?Q?D7wjdagADIcjs2ARpA8t/4of0DmNjUtW9vElspJFH4AuaxUaYjra1vDdLn3w?=
 =?us-ascii?Q?OPHpT6eUJOdJ46h8sDRYKDkhM7d1HNjVl1Cdynq4FFWh/1kbbBAQHAOr4pNF?=
 =?us-ascii?Q?ojaELILYg3mIh45qs2PA6aUxyJBKOg6khEIHQq6rbR34Fj7e6nnAAdJJ/e7u?=
 =?us-ascii?Q?cTs/giw58HjD275UMbVrcDp8qW2OvZ97BZMPV7coiJ/q89IL+GLy2WmvtL03?=
 =?us-ascii?Q?oetvdjBwgXX7ltNFlRg3TSB6NpFM1sn1NNuzPEZp7A4+hrmYMbwXrGE5fA+x?=
 =?us-ascii?Q?jLtWP1n/VAmETWn6Qce+dbUWDdH2ySv8lRKHopIWwaYStz36JmoGlyUqhCxh?=
 =?us-ascii?Q?5d20K+EkAisdv4N+w2Mbs/MY5LtDN2XUKoWWPMp6GJNhx/6pGEBo9nDaIdbE?=
 =?us-ascii?Q?ITWUQuhl2JWPH2IYnKLlakHODNtD/nBe8YLJQUjFH4drWjuiO4vNIFw/QR5r?=
 =?us-ascii?Q?jEGvKw7S/TGF6wj/cQBr2hpBq09o4VzE/WhGhw/1seNKqnAq4k32zLVK/pf9?=
 =?us-ascii?Q?rjc8RV9Op82OaQCJxLuP/WKb6GVma7tslHSqNTRRXixl8yMEv4W0ALIN96XM?=
 =?us-ascii?Q?0n2rCL2TV0lMksIWnQyOz0O2sxjVGBHNg2j0gGtlyB9sFQYrtJayPQYw3sPI?=
 =?us-ascii?Q?bxKcpT1vxyQo4xxr0nRElaikB4CVAMYh6Ln8g6xymEGRTgRHsUdEFQnp/Wxs?=
 =?us-ascii?Q?8uD1ISFiyaHvD6cUC8UAm2lSGv4f4vnxD/UWiMCOpZhc15eZYZvJQg6d7VjZ?=
 =?us-ascii?Q?AfWv9bqBEBsyRowNQkAcWQyacF8P1SyVf+hyyOwfIeGEiQIO2xrRX9CCn7kt?=
 =?us-ascii?Q?1luX9GJH7TjURnAyEeEY+P3+5H2yU9mIJRPkkJgHyaKU5j5SWhVnTuruEUd7?=
 =?us-ascii?Q?Lf8l5FSO4BrjMOKcVdEjqrTBDusaOjbRSiIAj7nv8K4KPGR4+Sfs/LAKUZUF?=
 =?us-ascii?Q?IWGRLpzlB7Jl3al63AFRd7qk+92l3wq+8PiEFTnjAeQCYIJoBTYd1tykyJDC?=
 =?us-ascii?Q?4KAOXsSfgaai511nZW2gEvsi/h/iaUDnwwqLAWluQqebHglJFK52uV7I3xzE?=
 =?us-ascii?Q?WvGDJlXwuJxX9/Eo0XwQRLSqiAIf9WyoDSS98WiZRlrsMtOQrkojx+xWZeMQ?=
 =?us-ascii?Q?PFFP+1n1K4Gvbf7crZcayaIgrLUJDWHsuex/plItaGOplLwv9e7hwC5bPntg?=
 =?us-ascii?Q?NpgQLGwc6b/kD4OZmWAm+pkvKykihLWmjoOdH/DKC8vgYpkYcrlWoKyd6vEA?=
 =?us-ascii?Q?3WS9xE4rp3/t1j8/qImVapYuQ0MVC1pZi5wFiqpzSJ1Ao3r5+35/YB3pHjro?=
 =?us-ascii?Q?2DwjdlcUw2RgdU3bxE18xqsplgcDZ0MYeWyZmqOVTv8AYr+gFhF1bgDv8d+S?=
 =?us-ascii?Q?BoDB7ioPEutvI8s3VsZ7pMMCa8T0krBZvaicwncbC/TQZ7vjnHm6SPO6VjIL?=
 =?us-ascii?Q?qe7c2wKGHy8RDs+3Q0CFKEfq1fpaFOwBEVbkU5WGq1ZaEOxSko/O4DMWMU3z?=
 =?us-ascii?Q?zyYcEyVDpGAn3Mx8NopuYayd61Tx2Z9j/5ZlD5+zRCOm6Bcz/WxhQ0gt9/Ea?=
 =?us-ascii?Q?bg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b00227-030c-42d1-bb7c-08db6d68ef01
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 06:22:45.6688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uJ9z2iPpe5na332MNt5tkTT7upcJHK8Q3gMoXeOzcAZrGjzLzWFlA7ZonTVGNFndbbh6aVLkwv3LVYS21eYQiANSAK1c5WVr347dBvMNYNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6210
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dan Carpenter,

Thanks for the feedback.

+ Laurent.

It is already validated in [1]

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/rcar-du/=
rzg2l_mipi_dsi.c#L619

So we won't get wrong formats in rzg2l_mipi_dsi_set_display_timing().

Laurent, Please correct me if I am wrong.

Cheers,
Biju

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Thursday, June 15, 2023 7:14 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Subject: [bug report] drm: rcar-du: Add RZ/G2L DSI driver
>=20
> Hello Biju Das,
>=20
> The patch 7a043f978ed1: "drm: rcar-du: Add RZ/G2L DSI driver" from Sep 20=
,
> 2022, leads to the following Smatch static checker warning:
>=20
> 	drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c:374
> rzg2l_mipi_dsi_set_display_timing()
> 	error: uninitialized symbol 'vich1ppsetr'.
>=20
> drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
>     347 static void rzg2l_mipi_dsi_set_display_timing(struct
> rzg2l_mipi_dsi *dsi,
>     348                                               const struct
> drm_display_mode *mode)
>     349 {
>     350         u32 vich1ppsetr;
>     351         u32 vich1vssetr;
>     352         u32 vich1vpsetr;
>     353         u32 vich1hssetr;
>     354         u32 vich1hpsetr;
>     355         int dsi_format;
>     356         u32 delay[2];
>     357         u8 index;
>     358
>     359         /* Configuration for Pixel Packet */
>     360         dsi_format =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
>     361         switch (dsi_format) {
>     362         case 24:
>     363                 vich1ppsetr =3D VICH1PPSETR_DT_RGB24;
>     364                 break;
>     365         case 18:
>     366                 vich1ppsetr =3D VICH1PPSETR_DT_RGB18;
>     367                 break;
>=20
> mipi_dsi_pixel_format_to_bpp() also returns 16 and -EIVNAL.
>=20
>     368         }
>     369
>     370         if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) &&
>     371             !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST))
>     372                 vich1ppsetr |=3D VICH1PPSETR_TXESYNC_PULSE;
>     373
> --> 374         rzg2l_mipi_dsi_link_write(dsi, VICH1PPSETR, vich1ppsetr);
>                                                             ^^^^^^^^^^^
> Static checker uninitialized variable warning.
>=20
>     375
>     376         /* Configuration for Video Parameters */
>     377         vich1vssetr =3D VICH1VSSETR_VACTIVE(mode->vdisplay) |
>     378                       VICH1VSSETR_VSA(mode->vsync_end - mode-
> >vsync_start);
>     379         vich1vssetr |=3D (mode->flags & DRM_MODE_FLAG_PVSYNC) ?
>=20
> regards,
> dan carpenter
