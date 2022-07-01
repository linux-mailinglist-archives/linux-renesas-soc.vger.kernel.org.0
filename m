Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A05C1563045
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jul 2022 11:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235686AbiGAJfv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jul 2022 05:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234917AbiGAJfv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jul 2022 05:35:51 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2133.outbound.protection.outlook.com [40.107.114.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6E0747B9
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Jul 2022 02:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKeuyrpw0BnUkjmUZLoVacOhEaeFmYglIXcLLr+UsTRxZHvUErkXEkiahvWBmBgJFurxKl4GeIFrfRJPUl0apM1W9Efo55R+keYaVPOspk34f1M1OlvIlXWG3DkqGogfQyoCWsPtzb5duOemx9/NAo0RECKbwDtfzIuCMDTYps/ghUlLeZqC/jZtcqZIa8/InGo3XYdPHbjkOvoZm3u7iJtksZmml9ymTyiNyxU+fOIcqkknsGk12o8B8kfhJr+YaXaKiTpHLEZN+fUxiOQ/Szo3UQq6fBznjcnY+kaQOLKuXJpib8JbdsCllw6oWJ2sCZOMgIHbfBg78jbT4u02ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIA5WR/VuzWLTrBW207spFLoTwgPmvtLez6c6ghQLmA=;
 b=fF2wMdzKvL7+m1mzB+T7k9qTlfrp6foi1HSL0ayNGt6AVk2t7BNsEVeHSjchG6eLXPef369TDRyO/ObrUNJIcLqVgknamwaR29m7Oo8mgRTq7P/9wJ22EtLvBE/nuAz3ZHWO4FFXXcRLrwvoGt4qyZGyVqPk61mx+NBkGwNa5dQ5cxi5/tQZ5qoYdMgh8qwNIjQArSnJRzXTlXWCkt3r5/3xfIDLHO41cJ/96aXAo9ddMUt/Jyn7BGHazYYUO2DukxAnXu1bgmfVYRrXZygHajc6I3YcSqiDJn1YhQHRGhojCY81VSavOIfcIV7lM35QP+YtEMx651yhmrfqtqrp2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIA5WR/VuzWLTrBW207spFLoTwgPmvtLez6c6ghQLmA=;
 b=JdGgd6UmWK0SoBJ8qrrEHUOYvTgBEBDMav3QH9drJuctnvdOc4PkPwX+V7s+NU8IB+dk1Xt2LfkyRAL1b2Y05AiVzlGIMMdiqnu4fSGuSiLCabH34WebtaswMH4/KZc87qi0wFSQg/UO0mPmbIQB7nCJpQsY6/7ogDUX0R5x4DU=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYCPR01MB8582.jpnprd01.prod.outlook.com (2603:1096:400:153::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 09:35:46 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 09:35:46 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC] soc: renesas: Add RZ/V2M SYS driver
Thread-Topic: [RFC] soc: renesas: Add RZ/V2M SYS driver
Thread-Index: AQHYixYUV652ffOByUKtglOD3IhflK1pNTyAgAABLRCAAAw/gIAAAS7A
Date:   Fri, 1 Jul 2022 09:35:46 +0000
Message-ID: <TYYPR01MB7086D3BBA5C47D9531F2ED1EF5BD9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220628173947.91519-1-phil.edworthy@renesas.com>
 <CAMuHMdV=f5OxQQdYYusfSVfW71+USqw3bEQ3BMOtxac6=GRCvw@mail.gmail.com>
 <TYYPR01MB70866C84A8007E329741B9A5F5BD9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <CAMuHMdVab5N1hH_mz4txZomHkMb_naaWB5_Lf2TZnmS5kvk_QA@mail.gmail.com>
In-Reply-To: <CAMuHMdVab5N1hH_mz4txZomHkMb_naaWB5_Lf2TZnmS5kvk_QA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bf6d4ab-9c5b-4637-67a2-08da5b45137a
x-ms-traffictypediagnostic: TYCPR01MB8582:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rqw63qY6BxAEDIZQEm1hua2aSBe1t/Kb+5UxKNxJQycvffVBB/CdpQNv9C5A9pjiNkaRbn7uzIKJwueywhWXHxkAd/yZIy1dSugMlXNp5SJsStpanq5aeBhaWlZXWgN7qnvOx34T9AZYBsb9bCxH1iKenYczSiyrt3bHkKRzS8s7eUzTSq/UJbZQyfOOxDlOdOWfQuGz+AC1iFaHbi1jfDSVjIn1UK6PYOZv6EwNPaQlUioBa0OtoN2lmpf0A2/fC66f9OpiX2zm+5I05tiruhdqAfQXPfu/KYWat1L6iSbU2c5odSGqrAE7epzerBOoYQshvhzxICLrMY4gXKme/XA0S0KWY2024iyr7Hd7iW/7tZSC0GYU8rV81fogKba3ztGJKRhIXejNJH+j2FYUMoUIRhjax36QTyQnsvix0Xr4EL466LXrcVYrYXaZj/nCGz9pQLWeDRwtb3283BWvEOeIFBr3KTGhhF92pzt43YdKvuXc4y3yBVDQBAaCPSemwRAeOGpEhJrzA1Jc4p2wQqoFoPyg4zHsSUA11k70ekREOUnHnKJju5+9PzFL69E96pEguyj+m08H9ID/Z8UEyHL8eOmIQFQOdqH19/QNlsUGknZ8F/712IxnDAGDXJGGV991TBVTAGn3YNomoXgab01DtxJwHNUfFd0I5DqnPfeeU2yJd/QfLSJ17ti37U5Jw15jRQEv4PuFPV22BIP76AdVWGrUU8g06eCnNIuLESjdtySAFO9bE5iOosuDWMXYjE512Qrv79QGCwl5xTw998Uo67tbnGxROgLmZSgF4R2pdPRhRpAtLGxGR9Qh3TdQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(122000001)(4326008)(316002)(38070700005)(55016003)(8676002)(76116006)(66446008)(66476007)(66556008)(66946007)(64756008)(83380400001)(38100700002)(6916009)(26005)(71200400001)(9686003)(86362001)(41300700001)(33656002)(2906002)(5660300002)(53546011)(478600001)(44832011)(7696005)(8936002)(52536014)(186003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K8rQLnfhgefQVAYQEebK6YCPAfbH4ucdMCiS+nV8pmkwFBmAzd+AmW5Du5Rg?=
 =?us-ascii?Q?RL0NIB0D9JuAQCOQmHOZsWC9/h7jL3DNo2bGxL9GLKq7wNGo6mfV84shHqtl?=
 =?us-ascii?Q?ZwHZSgGoKgb7ocgc4zXsgsCeBoTIllZa4NyqHZFL/iRQmhOiOyoEvG/bKSNY?=
 =?us-ascii?Q?3LpCkT3US1zG8w12TZFZU70TsZGum0+QFIDxi82sB8CAnTJRGEpGr9fqye87?=
 =?us-ascii?Q?lWwbgfSe6JFa3GNAYpYZeqajiUKzzJ1lFFQIC91rpplprK/HF5UAORv6hB32?=
 =?us-ascii?Q?oPotvRXVEKuLyVbfXbqzGt4SZW2hC86RqqR5r4vgU+Nx18Ero4Xdc2rzlGze?=
 =?us-ascii?Q?GD9bganiXyPAoGIYSK4ZDUfYN7gziN15blnv+4nencgzh+KEi30SUzk4w9Wq?=
 =?us-ascii?Q?aLVEJWgRcw8cykQCdE3xN2UnUU8uCck/xH4evdrTOW3Ajqv+2x3ZtVqVm+mu?=
 =?us-ascii?Q?Vx/J1esVQsAHUse93T6y2aB1iuPvfkFsvukKdyooV5Zb4E2Oef9luiCkZN4P?=
 =?us-ascii?Q?XQHTWylAOGLgK0Wt4lXNaVsE9eHR+BaixBakBQBB6/wo6JhA+gnqple/lQ3r?=
 =?us-ascii?Q?CiOL9FqAtM+WCXkd9RDsvUZfpThuv2yICNwyzp4Itd1/3xSkf9uXU7CbjxCt?=
 =?us-ascii?Q?TvQs+hSwD4ujWjktm1RNoSlFPMEyuYGakNmLfHwtFOOW6d1vJezWqXd9L6ZM?=
 =?us-ascii?Q?JliFQDJUxbdvLhlbes/eq2HoFMxudzQy4k02iBMN13A7c6Ob4lTiP7x9ZYqE?=
 =?us-ascii?Q?6aMFt5N965eYiXqXKFxI+ddvYIC/13toupMJKDIFdFZsiI371pAjxbdS+vmz?=
 =?us-ascii?Q?MFp2rG/uz5xdhdAkqwrMViNcVOVUyGlQqwK/nhdkW1s+Rz8Jz/kcoCW6dQcP?=
 =?us-ascii?Q?tY+5ruMITg6piXfybB3b9Q625hTOg3TW0xJ2NWbdfOxV6ph9E1DG/wFjpqWV?=
 =?us-ascii?Q?js8yPh7IvOV02vzzkPcZXhLkmkv8gvzXn0xXl5qs3KoOFAXfR+88e6ZK+vcX?=
 =?us-ascii?Q?VInRKa73IcUUz2RFp4Qhf8sOB0N1FUA8VzD7AciT0+xslPmvdMlXxkijwRwE?=
 =?us-ascii?Q?rT89QVCVJfkdpyKR2TTNsTeBK5bUsrlpJHLul/P56CoegoGRp2p7udToPDqQ?=
 =?us-ascii?Q?FJHAzLLZ2JwU6HJstkF2WzHVLAV5g8ndPg6MHmdw7zCdYDJjePTa1qqMkxQD?=
 =?us-ascii?Q?AE17IysoOErlm8I/obzyvl6sKncf1vZ5S4o32s1marUO9ghzThKjkJcNeJZF?=
 =?us-ascii?Q?kqOM63lBgH+9ttGZOjST2lj+cT5ppNsrVoj6Ra5T1vCuRgwg23b943mgenPL?=
 =?us-ascii?Q?wpD6hQ3O0PNhYdl3LKt6Ku9bxSzhejy0QiF6nHDnSM9XNL6HIrxbPJKc8Loz?=
 =?us-ascii?Q?waOJVGo+82CvF087phYbeYPzBOFWFowy9Jow88ZHQUV+ajdqTJjXg+Ro99cL?=
 =?us-ascii?Q?oSAXjRfK6CQz99SDKDdz2rUuVG+jqPQXSCt+ZskjgFDcEV0lhVwNRtBaAOJ1?=
 =?us-ascii?Q?F4mgIsAhT8t/Gze/aByIX62biXE0eyyU9Te7GhVb53g/Ebr/7cYPG1cJnhfH?=
 =?us-ascii?Q?1gpOKoPBfSRXRIG2c9qhQ/hOBGhvyvLNqs++asJJHErMrq5Dosv9+6Qkp3Vg?=
 =?us-ascii?Q?pg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf6d4ab-9c5b-4637-67a2-08da5b45137a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 09:35:46.3850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qE3oSQqdyGT20dcLREgwu3xy+yi3n+aBEHTEGBu5DboSduMFZuowYp9DUYkzCmr1xVMybpwCblGPZz4qnY8ANr2ir5nOsDPR6+osZ/pOk9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8582
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 01 July 2022 10:25 Geert Uytterhoeven wrote:
> On Fri, Jul 1, 2022 at 11:15 AM Phil Edworthy wrote:
> > On 01 July 2022 09:37 Geert Uytterhoeven wrote:
> > > On Tue, Jun 28, 2022 at 7:40 PM Phil Edworthy wrote:
> > > > The System Configuration (SYS) module on the Renesas RZ/V2M
> > > > (r9a09g011) contains registers for many different aspects of the
> SoC.
> > > >
> > > > Some of the peripherals on the SoC are only 32-bit address capable
> > > > bus masters. To select the lower 4GiB or upper 4GiB of memory, the
> > > > SYS PERI0_BANK and SYS_PERI1_BANK registers can be programmed to
> > > > set the 33rd address bit.
> > > > Due to the use of firmware with the SoC, uboot is often set up
> > > > such that these peripherals can only access the upper 4GiB. In
> > > > order to allow Linux to use bounce buffers for drivers, we set
> > > > aside some memory in the lower 4GiB for Linux.
> > > > Thus this requires the SYS PERIx_BANK registers to be reprogrammed.
> > >
> > > Does this interfere with the firmware?
> > > If yes, why is this not bad?
> > > If not, why can't U-Boot set this up correctly for Linux?
> > Yes, there is potentially a problem with the firmware trying to write
> > to the registers at the same time. It's unlikely, but possible.
>=20
> I'm mainly worried about the firmware relying on the u-boot settings, and
> using the devices?  But I guess that won't happen, if they're assigned to
> Linux?
That's right. The firmware doesn't handle anything related to SD, USB, PCIe
or Eth. I don't know about VCD (multimedia codec) or GRP (graphics engine),
but I am reasonable sure they will be assigned to one of firmware or Linux.


> > You make a very good point about U-Boot setting it correctly.
>=20
> Typically things like this are supposed to be handled by U-Boot, in a
> correct way.
>=20
> > > As most RAM available to Linux is in the upper 4 GiB, wouldn't it be
> > > better to use the upper 4 GiB, so bounce buffer can be avoided for
> > > most transfers? Or is it impossible to set up bounce buffers in the
> > > upper 4 GiB?
> >
> > Avoiding bounce buffers would be best. I guess I have been guilty of
> > trying to ease my work as some drivers need non-trivial changes. In
> > particular, the usb xhci driver.
> >
> > Perhaps we can continue development for the time being with U-Boot
> > setting the bank addr registers so the peripherals access the lower
> > 4GiB and give Linux some mem in the lower 4GiB for bounce buffers.
> >
> > Can we look at making the drivers use the higher 4GiB later on?
>=20
> Sure.
Ok, great.

=20
> > > > --- /dev/null
> > > > +++ b/drivers/soc/renesas/r9a09g011-sys.c
> > > > @@ -0,0 +1,67 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Renesas RZ/V2M SYS driver
> > > > + *
> > > > + * Copyright (C) 2022  Renesas Electronics Corporation  */
> > > > +
> > > > +#include <linux/io.h>
> > > > +#include <linux/of_address.h>
> > > > +
> > > > +#define SYS_PERI0_BANK         0x30
> > > > +#define SDI0_SHIFT             0
> > > > +#define SDI1_SHIFT             2
> > > > +#define EMMC_SHIFT             4
> > > > +#define USB_HOST_SHIFT         8
> > > > +#define USB_PERI_SHIFT         10
> > > > +#define PCIE_SHIFT             12
> > > > +
> > > > +#define SYS_PERI1_BANK         0x34
> > > > +#define ETH_SHIFT              0
> > >
> > > These fields look like perfect users of GENMASK() and FIELD_PREP().
> >
> > Another macro I am not familiar with! Thanks for pointing it out.
>=20
> > > > +static void write_peri_bank(void __iomem *addr, uint32_t val, int
> > > shift)
> > > > +{
> > > > +       /* Set the write enable bits */
> > > > +       writel(((3 << 16) | val) << shift, addr);
> > >
> > > writel((field << 16) | FIELD_PREP(field, addr_high), addr)?
>=20
> Oops, this won't work, as FIELD_PREP() needs a compile-time constant.
> Of course you can still pass the result of FIELD_PREP() as a parameter to
> the function instead.
>=20
> Or push for "[PATCH 01/17] bitfield: Add non-constant field_{prep,get}()
> helpers"[1] ;-)  Or open code the proposed field_prep().

Thanks!
Phil
