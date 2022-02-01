Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B774A61EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 18:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240001AbiBARKC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 12:10:02 -0500
Received: from mail-tycjpn01on2127.outbound.protection.outlook.com ([40.107.114.127]:5414
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230490AbiBARKB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 12:10:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAsq7fONi+Tk23CPyDji4/P2KhK2gaPMBOoIA1VOybavzVYvoLhfAAW9N0OTiqOjTBKB5QN5A76XunLVqXueDjeALTYcbdmGLUe1sUVHOnbchQqkuRIDRRir63FcFrvANKOZajeftJy9I2gl1KIw4zJ6LHAbZtUFSVEXXvL9CyXa5dMMsn3RHJ5CDK3V67RWeW65AsIfNlqVi0FcFE1VdvmLVBs0bJDdqp2s3DZbMmQKik5fmtsRt1gnLqeIOC8VF/X8ZPQAsRrV5lhaymzKIh66F27k9hT+68ab3ENpjJsBANPGyIBoXLKyiSCcv5aglqr8S1T4UfZMiVDqFF3K8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0yFOoi2oHsN14beDPaG7OvC/aCvLMJkC11uwhpRngg=;
 b=n5uFtMKB49I+O8wj9a2fLoFGdp1R6x8PFJ2SSRzJmVcfyI1lWyLrZRu33KARlAdWqw5qu6J8q02kGiK/pCEY+unrM8uf7pGQIRhM29xwLPyat0UWNghM0b18ajuQ1MHh6ip9c+1aDpKb22OFplGcen+HjpSjbsxHPuqIea+bxgV+kO24xsn/zQsToJqIhRRjUVCc9CJrJftAyYWwCHXSgAlWH9EOPDwSm9StKw5cvpVdxyippF9K9nvLHA6dzzcBzcldNf0gFzW2jkGedvtr88NUbqbqxZyPAMbDXepcUq7cN1zLavbHX6ifaI2cXbaBR8Q6vCBusNeJXHRggsF1WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0yFOoi2oHsN14beDPaG7OvC/aCvLMJkC11uwhpRngg=;
 b=A2xmZn8cSdltzj+YP+JGln2hTx0HAP9I632tIXwFEKM9YxEnEXIgpY1Gwx2cyu4+MHt6wqADNls6zzMQYHr9ecG+MYoaOWVyu1WDq+1wICVk8m8bRQa8Ul3Gaini5v1J+m6Ht7I6HNq9hFumWzzN/U/5I5xHfUaKoPs75hNmuxY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB6518.jpnprd01.prod.outlook.com (2603:1096:604:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Tue, 1 Feb
 2022 17:09:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%8]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 17:09:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi
 file
Thread-Topic: [PATCH 1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi
 file
Thread-Index: AQHYDRpSlFIp4AdAR0uRKoUk+NJD3ax+/GsAgAAFilA=
Date:   Tue, 1 Feb 2022 17:09:59 +0000
Message-ID: <OS0PR01MB59220FC4B38C5C66CE6876EF86269@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220119095245.5611-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVJD8FFy2aXRpsfvhHL4zTGG8nyGp==q2VzT5k-eNh2pw@mail.gmail.com>
In-Reply-To: <CAMuHMdVJD8FFy2aXRpsfvhHL4zTGG8nyGp==q2VzT5k-eNh2pw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87ac8085-6c2b-479e-e9a0-08d9e5a5ad7f
x-ms-traffictypediagnostic: OS3PR01MB6518:EE_
x-microsoft-antispam-prvs: <OS3PR01MB651821FF2DABD79277245C1A86269@OS3PR01MB6518.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 56FhJi8MAjKuwKkoe4ZqafZ79XXRwu3/7yj110aGnMI0V4C4PmKOGfHnERjOJz1Wx3FMF7mQPNofAg7jQsJvnjO9vSzlb48WJtqiyKBHd9gQiI5LppO6URazuUH0qBWEGQ9PYIu0b9bhq5G6FV2DJiL/gcoBPAGBfBE9UH/Rn2rBn9x0pI1hAe9HApVecBaEZrxTTWGhclxH/oLS6QmnvHRfH9Ow0HaPhwiy8v5zzsJ30F8u6RF9zO0CWZ4SVWPLFYIJLmp4TA7qOw1jBLaXUrb0EyLlS6sZ/1B9e/w7Gqmvp46mUCF6ZZBKLE4A7AVbwaqTeb5mHZUJ7sIp5RYjZ9AMVH1SNz13phKLMI9+Br1DkTpF5K2Ce8skQlf92Asw0TRofTEdpvYebiZA2+RaPE5Y1JyTPVpUq/vaCOIW5yAFT9a4rejMYDqfqU99PTOIV0HbCNFpZomB7H/sqFnOPntuMRWgHr+ptHjthNbvRT86JhEeTRr23BV1cTFolw0xnBJeJwlL7PNiDhI3Bi7O7f6FQ9Td+ikFV0TaoQWttd+u+wFDSa9aRCDuRO7ePVe0ST87mc1piWrEpdss92jKc0shJ2+kATryVNQdshoSmmweiFg5KFWuPPmd0N9KhH0YC7HFAqx/9Gw9Z9vdnDas/L9fxe2iWSHk2ojFK6WpZuCJvOcef5rKHAdkEi4NBM8yHvkDSNgyuPuLkZb2takty5dwD5vOutT1fKEOV4eZLWB+WJ1kiC2ynkf+/TqNlnKqmkc+UIuIov5adVe3LQ385qbQEdtYr7w+20dXrLgbZWA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(64756008)(4326008)(66946007)(6506007)(66556008)(66476007)(66446008)(76116006)(53546011)(508600001)(45080400002)(52536014)(122000001)(55016003)(5660300002)(83380400001)(33656002)(86362001)(38070700005)(9686003)(107886003)(26005)(54906003)(2906002)(186003)(110136005)(6636002)(966005)(316002)(8936002)(8676002)(71200400001)(38100700002)(20210929001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dajMIJgO300aDyBvR8A1/eZYXOVXs7g4tNWyH+fumkORUcXDwFgu4NYzVLUX?=
 =?us-ascii?Q?slashYaaTCSVJ6QKN58m+dz4Qvd8Hcwqw7YnOSR5HhJMjQSC4zQ2yGl0lqlX?=
 =?us-ascii?Q?dbKkele5YD+2P07c3SkSb62qEbhSxu/VG0M/S1LPSLgnlC5hiVJlXfCaaUWu?=
 =?us-ascii?Q?LrJlNE+HS+O3BIQNNzRSjYr58h/soeyWlIZnHGKxNgSnMavFU6TpiHxJxk5+?=
 =?us-ascii?Q?db/f41rMlU6iFBt+mtONJEjugAT8u9Dv9PAul426rDuqOqRtGsw47K0/dP2t?=
 =?us-ascii?Q?/JMJaMKij7ustw93OqehcNOJREqrgBnYi9S0r9/M5jOEUPJ7KrMqqIkLjr01?=
 =?us-ascii?Q?Wc1VWwX0S1VvRcgJiR0uuITcpg7aUtw4SsbXcP2jJxbHxvUkh0G/JSBkHBuG?=
 =?us-ascii?Q?QbLU+P6J2UjsZv7QGLzdfKxOguIhC5r2JgLmaWMY/qmIWhDZ3X6xCgjZecGZ?=
 =?us-ascii?Q?sjqb3OGEoLh3IXyQRmayJ7/WqguGmxQZndj6Vxx0UUOvJzSuDZnU1zfpTP+M?=
 =?us-ascii?Q?H/19dhiyc2gMXpkWht9MitX9w6IVixJ3yFDq98jCtcp3rasHDW1GtKgZz0hb?=
 =?us-ascii?Q?rnXOUnuojMhElaXkNzLZWcOijzaeAcAk+WkkybOiJr6U6MpgB89n8eY9ic15?=
 =?us-ascii?Q?6LxfXcZw5HF13hZmhm+UhkfYC9tfeBTP8zvC+yE9rwVw4oJiZt3EZJ1Krf1u?=
 =?us-ascii?Q?0puqyhJXAo9Ypl2hrBfPULxP/0POyqBR5CFThhZgFalqvWgVyFHtlBTuJcTZ?=
 =?us-ascii?Q?Dz8VKUAZwgC+EwqNfbeLv97CFv9qx8+rrwaSyzF44koSr/Xt3OqlxWCtzTCz?=
 =?us-ascii?Q?AjlpYn4LvmX7HutW7ZDDso/sWIaJcCLzYXlnZlJEMPIayy2XvH0BXQe283Zq?=
 =?us-ascii?Q?Pen18X61pMdIPXNvulro3nXMCULcvThy7M42XsV/FOqb9anq963KF9c1JWfE?=
 =?us-ascii?Q?eDs958mKfFHxOhepuUIzRdm1uRB052c0QiFBTDU4OFQSB0ODB+th/0THGy8O?=
 =?us-ascii?Q?ZLKdXKzmaKMDOcKIhJFfKEMhksV77SV8JBQFqGLUpwurdYtQeR1uHLuwlfD0?=
 =?us-ascii?Q?I2YxWK139es1L+PG4MEcsoPv31/O6JfjJ7tfQvJA2SxM+3X/Cot7VqOHGBvm?=
 =?us-ascii?Q?YlcOHJO1/fjVwbZWcOtjnnTM8q8Q28hl2RITr4sLuzQNxnt7bfrpljUfma03?=
 =?us-ascii?Q?PhutgNbW1mw6NfgO+b97q9nycgEWRMCy5eZpqatMCxvSxXuosHOn46q/oHYV?=
 =?us-ascii?Q?2UE4ERoKrXWq85AYzEfYmU4Ak2eijmRxPw88kSNWJNTh+4rwmcRogk7NYmvm?=
 =?us-ascii?Q?qp0GFet+sxOIIseiEDkRKqC+i9TDKbGvDzK52puTGJRLwzaIcheuU9j1QXdZ?=
 =?us-ascii?Q?rCFaO/kvs64GfJwKxsYjVPADaQEauIl8IbN1GHY/4PXwzhAoy7LsdtvZWNba?=
 =?us-ascii?Q?hLm4qahR5pxYhsJw9TOzT5/6RyjylwU5scUfvzSIWJxE2w8x71+oDoXukYSP?=
 =?us-ascii?Q?gKOPRrvs86T58YInBbhsM65jXYgOXhAvMBwIk1+DeM6vNFlJImbv5WA8Czz6?=
 =?us-ascii?Q?dspF+EjJjuIP5qNJUBNiWMrPu7O56OlWLrM9xxy4eqgHMfDK4s+TXvA/5hFH?=
 =?us-ascii?Q?+eWUE7R/4Zmu6pl2b0Wbqt1qUWc39gr5JVGRY2RTNlVKBeLVWRIQwkccvUdD?=
 =?us-ascii?Q?tSsdAQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ac8085-6c2b-479e-e9a0-08d9e5a5ad7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 17:09:59.1903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ushT20am7e4G1Pp5YkCVdwGbE9BxLMi4RtyUhvC7P2xRlekBgMuz08iYbK7mkG6RCnrNNPdBirp9C4AnvfV9y8wkz6VItvtZt2GvkdigLXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6518
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for the feedback.

> Subject: Re: [PATCH 1/4] arm64: dts: renesas: rzg2l-smarc: Add common dts=
i
> file
>=20
> Hi Biju, Prabhakar,
>=20
> On Wed, Jan 19, 2022 at 10:52 AM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> > RZ/G2L and RZ/G2LC SoC use the same carrier board, but the SoM is
> > different.
> >
> > Different pin mapping is possible on SoM. For eg:- RZ/G2L SMARC EVK
> > uses SCIF2, whereas RZ/G2LC uses SCIF1 for the serial interface
> > available on PMOD1.
> >
> > This patch adds support for handling the pin mapping differences by
> > moving definitions common to RZ/G2L and RZ/G2LC to a common dtsi file.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Thanks for your patch!
>=20
> > --- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
>=20
> > @@ -66,11 +65,6 @@
> >         status =3D "disabled";
> >  };
> >
> > -&scif2 {
> > -       /delete-property/ pinctrl-0;
>=20
> In the meantime, one more line for pinctrl-names should be deleted.
>=20
> > -       status =3D "disabled";
> > -};
> > -
> >  &spi1 {
> >         /delete-property/ pinctrl-0;
> >         status =3D "disabled";
>=20
> The rest LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >  /*
> > - * Device Tree Source for the RZ/G2L SMARC EVK common parts
> > + * Device Tree Source for the RZ/G2L SMARC EVK parts
> >   *
> >   * Copyright (C) 2021 Renesas Electronics Corp.
> >   */
>=20
> Note that the above conflicts with "[PATCH v2 11/12] arm64: dts:
> renesas: Add initial device tree for RZ/V2L SMARC EVK"[1], which I had
> queued in renesas-devel, but dropped again due to a missing dependency on
> the clock bindings include file.  In the meantime, the updated clock
> bindings include file is ready.
>=20
> So, which one has the highest priority: this series, or RZ/V2L?

V2L is higher priority. I will rebase and send V2.

Cheers,
Biju

>=20
> [1]
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
ker
> nel.org%2Fall%2F20220110134659.30424-12-prabhakar.mahadev-
> lad.rj%40bp.renesas.com%2F&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.renesas.=
com
> %7Cf50386cff0f44f8bd06a08d9e5a27b0b%7C53d82571da1947e49cb4625a166a4a2a%7C=
0
> %7C0%7C637793308284273842%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
Q
> IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DlGdj6Cp4XNN=
QbY
> scJPxGcaw6u1v34Bp0P6cTY7WxUN8%3D&amp;reserved=3D0
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-
> m68k.org
>=20
> In personal conversations with technical people, I call myself a hacker.
> But when I'm talking to journalists I just say "programmer" or something
> like that.
>                                 -- Linus Torvalds
