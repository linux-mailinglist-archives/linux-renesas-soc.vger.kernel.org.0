Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73FD679E0C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Sep 2023 09:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238579AbjIMHWk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Sep 2023 03:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238572AbjIMHWj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2023 03:22:39 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798F81728;
        Wed, 13 Sep 2023 00:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MytzIrJMyVOE3y5WFeBrIaCpOGXoGguMaAvScV3fNjWhxEDK3HM7S+JV+7rF/7JIvxQoAv1uxQwqZDb/GeADuifR9qKFW8m2t4274/FdNCjkW6lCb3aM5iqbnAeidnUrowbL5yLigDoduLguiqam0IeP73oH/YHgsZGHS8QQV7wNoq6JpVktJ8VviuLV75AKoYEyKgGXjxUK+u20vP2ttZDgZX06Se+7e2yzdA5KRKIpDIz2X/LR85lZsonQbMcoI1YTR0wjsHIrvRz4i+1sciC53T03UKQviXDiLcgJF1bXMS79gAhQkQZtwoaVunMjRey7ObE2dmeYn1IEbP/RRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQqprXVlJyw2yvES/8n8WIwiPBXgBrLHETbZFN8tG7A=;
 b=iUuGwEVc76u43dsl+HwqX+KPaezXZrfyuz+NWWXgTgVM01xa1X0lRZvwGCypH9medXs0gS3c++Xcjm98aIpbhOmQruZnJbnpiu0GqAY9XXYtjmdhVZ309dc8BiYVeeltcKu6gV59KTngvMmngfYhqHJXU1btCNHf+UNPGXon/Y8P7hku1lhn9K9w+YQi+Hz1Yr+0/ricI9lZedJCRSz3dZSGaqeqnm4q18JLVDi+A42c7AShuCtO0unx6tq52yHvULK/46yhvYoMYjuXX5pdG5cqDGbrHLvs4hBPxPTJdk3Y7C9TmYfqTlzd49czo1UTOZHnddGpdsbLOgh9AOte7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQqprXVlJyw2yvES/8n8WIwiPBXgBrLHETbZFN8tG7A=;
 b=LNV8bpV7UrH7+pwQ0Mh0L4wAaKnJznWS/R4i/wLiRhULhNGwJ8vGpZdXo/exdi1LG8hLFhBSbAxMgG22vOmKHS6q6ixNA/74A/bxbqNXkKKU0Bgx52pAp6yE6CQFtGoLGV2KnQtEF0nfcti2mkBviMjn4uNyp3olNvLGo/bAq38=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB9519.jpnprd01.prod.outlook.com (2603:1096:604:1d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 07:22:32 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 07:22:32 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andy@black.fi.intel.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Julia Lawall <julia.lawall@inria.fr>
Subject: RE: [PATCH v5 2/4] clk: vc3: Fix 64 by 64 division
Thread-Topic: [PATCH v5 2/4] clk: vc3: Fix 64 by 64 division
Thread-Index: AQHZ1niDxjEDZ+zrfEe1AlDKqrrSF7AXzlEAgACZDBA=
Date:   Wed, 13 Sep 2023 07:22:31 +0000
Message-ID: <OS0PR01MB592245448E336F51F66B5C1286F0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230824104812.147775-1-biju.das.jz@bp.renesas.com>
 <20230824104812.147775-3-biju.das.jz@bp.renesas.com>
 <ZQDT5Indg/md+KXt@black.fi.intel.com>
In-Reply-To: <ZQDT5Indg/md+KXt@black.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB9519:EE_
x-ms-office365-filtering-correlation-id: e45747ba-27c4-4002-54b1-08dbb42a31cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W5wWhBhPsv74WZRlhc0Zo6mKhqfbZtvAK0Tovjm4EOtLVAkGu4Z0ah5Yl6L5YPl+3l5S0BtlNNdi64b+mgcwFTjSZTQXnqxmG7CuBNdJuW5GQK3X/VJI8E2Xuc3eBgDEhBLils8cP/2oRz6SkDM9OY1ipHI49wtEJD5eh1hfZOtTTtnnIYidOM+RVDVppJZIoW074D3txTSuGssVFgZds6UTIUs0OSekKmwXJs56Y/LNksJGEqfkLDHriJ81UNvBdEKJiSxbzv/C1lyuLDere5mDjZm3bg+xEGD+fHUIfZ4QXx5W8q4YzMUSDtBg/tUqSe8TWjFKi8oaJb4xARVfT6jdTj2ecQO/DWiGJRj79hL9FrG3SR66uXp+Y2/vCDGhj1fkfXwmbE0TXbPcy/mCyHLKJrD3wWf3MxuJOUmTe2bL9mR5S/2Z2cP8XBDDKspHyaaoYGpfeKR0XGo2CRPiBQlrA4xMs33dJEhZ0RziTdSg8yKdVSRm9hiu3nAolxMOwWlTRpF8SQ1Cgic8+cG5srOHkYUMYH0pBPHydgXSqT/jJbTVXWD7rckLutnXseKmz3Zurub9PUdDsTSh/lFEHL04SBUW/3hGp+cFpAuQm9OZCuLFhVcMivvDZo+HxB4w
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199024)(1800799009)(186009)(5660300002)(38070700005)(38100700002)(122000001)(478600001)(7696005)(6506007)(52536014)(71200400001)(55016003)(6916009)(66476007)(66946007)(76116006)(66556008)(64756008)(54906003)(41300700001)(66446008)(316002)(4326008)(8676002)(8936002)(83380400001)(2906002)(86362001)(33656002)(26005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4adj0K31ruaU40GtrpvilT8gRj0KMzPen7lGXJX25eVlQb5DuMiJmHP5MpUG?=
 =?us-ascii?Q?ch91d/x5CoQCRxPoHLgh8y8Ykf4bGghObdr1397O85LsE2pNugRighi5G3xC?=
 =?us-ascii?Q?dHR2coRAyTJEGujsoC0niwB+uDJm7ExF2ku/VfSikZrSVEBaCKrMlAf5p0em?=
 =?us-ascii?Q?rqmUJA/ztPJM2HgAIYVddQDREZerXE+oXUSkwAbQOAIOkBCZgcXSOZvApyI8?=
 =?us-ascii?Q?65pQchrU8RHpqdAxMBzPHaz/xmQocaGClf4H59wbkW1ShZLrYjkRlbzBzrB6?=
 =?us-ascii?Q?ydOapvVQLPfAs3qAbsWwPXE0ua4sOgAvfUAKruzgBN+qHsHEP/9SIavXwsGX?=
 =?us-ascii?Q?ZTy/wo0CHUj1dFx4w/ml3lYuyqJCv1V8bY9a/aCFYJFrtcRbQ9A1/EyP7tqN?=
 =?us-ascii?Q?0tU9QJiR2WxXoIDtG4ixUBc0q8X461ebkbPli3MmR8Mrx4oaSwJdKe2N2G6X?=
 =?us-ascii?Q?C1Rr53DSHazTkJHJX8wS/aWc0XB/3F3s1pDpWKB0bRt50xczPi3EaErejt1q?=
 =?us-ascii?Q?bg2daOZUazHxIMuj4Su3ntwLHkK/n4SnYeFCXMdXbFtoMT6CylizhtxEjMrN?=
 =?us-ascii?Q?lYSdXBvtLSTHvrxjY4etzfotiU05p1HR2ygVH4LFl+4qyoZo8BHWpkSBDFVN?=
 =?us-ascii?Q?Ns/Wk1sI3WYTsF0cfMDTK7M3orovM5UTUgxo+QCdTD4HgAaa7thcfcZWFPFa?=
 =?us-ascii?Q?a8EF4j0chd8J7Xz98pNMIFnWxQagDn0Vli7tp36CFuxh0hocZbiyJQ+USw6y?=
 =?us-ascii?Q?2OAPKuqhwejEduO0K8LDb+FT6mQcGgUXnqmtIw9GThEwjsQmdZvzx8aRTMJy?=
 =?us-ascii?Q?D5O1qxX5Q3A+9Beh87s26TfwrMsvTB4l0EQDX1lAfErauIRgxaHMi1pwgr9W?=
 =?us-ascii?Q?AKWSLzYcNvIzd0CKOL1NVUEdN/mf9QJzwpbecxd6Vr3YkE9m9LItmzKl/Gua?=
 =?us-ascii?Q?OuOKc2pE1dpQRIj6mP3uPRgJDxVKNCio/SApY3DqPStIQxZ3dhAQ84nXiNSq?=
 =?us-ascii?Q?aPaajBVOR3GS7a+oZfPAqzyEAFnVhldD0fNuTpalQJDUvrlXEbMyc7pSW0KK?=
 =?us-ascii?Q?nPr0njloMwO4HzWJX0rn3EoSZfFQDUSi6Ihi9A1s/APOu4Z9esU8GGTlU5cq?=
 =?us-ascii?Q?icoYrSNLn9PeBFcQGw2QyualQYfugKwatnxiPQBuPiY6DLrTkDexwIosi0Qs?=
 =?us-ascii?Q?Cmsdiwmo8VcbnA6kNO6+jBLXLHKtytRYa1afBNflWUTG/gzjY3VhOPZ9Y3gX?=
 =?us-ascii?Q?u1RmQoBZt9Sc0AtXCVbFEbVwq7iJPzBQgqHOFN4jojRPQxaIukwiyVXkU7NM?=
 =?us-ascii?Q?MVm5bkWMVTGW8Fy0SU+H4gtAisPErzpLsv0TlLEYa0eIkXbcdYdyMPcqcGLM?=
 =?us-ascii?Q?awdUVKOP/uoNCEzYvkvjjpgfU8kg7RcA6c/2prbAm/Dp8dI16OurFhDhQlkZ?=
 =?us-ascii?Q?pAvDaymzUEhE/H7A6Y3UJUA0n47GK16yc/KcAlz64dLfHi6rsAfq1GqBGXoO?=
 =?us-ascii?Q?1hpSwK0/1JRi7ptX0PZwAbP+1RFkMpUfXdp8ulEltN7D/JK4Q/8coVTp+6I6?=
 =?us-ascii?Q?3kiexEPSImSHcP/Nbvp1JegCMojPFA1LN1re05SDThNSlZLp2REctkvLvv8M?=
 =?us-ascii?Q?QQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45747ba-27c4-4002-54b1-08dbb42a31cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 07:22:31.9723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hBWSsy0yaL/w2nrQyRg1uda5Z9Rt8ExlsjKCwNQ1VWHDEoiL03kfmJenQpyzlBiUH9ktDDDLNqHiYphM5Q2kt8QtBFBsxtNbVFLcPHPBOeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9519
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH v5 2/4] clk: vc3: Fix 64 by 64 division
>=20
> On Thu, Aug 24, 2023 at 11:48:10AM +0100, Biju Das wrote:
> > Fix the below cocci warnings by replacing do_div()->div64_ul() and
> > bound the result with a max value of U16_MAX.
> >
> > cocci warnings:
> > 	drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a
> > 	64-by-32 division, please consider using div64_ul instead.
>=20
> It's nice, but there is a room for a couple of improvements. See below.

Ok.

>=20
> ...
>=20
> >  		/* Determine best fractional part, which is 16 bit wide */
> >  		div_frc =3D rate % *parent_rate;
> >  		div_frc *=3D BIT(16) - 1;
> > -		do_div(div_frc, *parent_rate);
> >
> > -		vc3->div_frc =3D (u32)div_frc;
> > +		vc3->div_frc =3D min_t(u64, div64_ul(div_frc, *parent_rate),
> > +U16_MAX);

Ok, Will send follow up patch using clamp().

vc3->div_frc =3D clamp(div64_ul(div_frc, *parent_rate), 0, BIT(16) - 1);

Cheers,
Biju

>=20
> First of all, as Linus Torvalds pointed out [1] min_t() is often used as =
a
> shortcut for clamp(). Second one, the BIT(16) - 1 is specifically used as
> the value related to the bits in the hardware and u16 is a software type
> that coincidentially has the same maximum as the above mentioned bitfield=
.
>=20
> That said, here this should be clamped to the [0 .. BIT(16) - 1] range.
>=20
> Since the patch is applied perhaps you can cook a followup.
>=20
> To everyone the message is simple: try to not use typed version of min()
> and clamp() at all.

>=20
> >  		rate =3D (*parent_rate *
> > -			(vc3->div_int * VC3_2_POW_16 + div_frc) / VC3_2_POW_16);
> > +			(vc3->div_int * VC3_2_POW_16 + vc3->div_frc) /
> VC3_2_POW_16);
>=20

