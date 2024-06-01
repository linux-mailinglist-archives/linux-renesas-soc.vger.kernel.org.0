Return-Path: <linux-renesas-soc+bounces-5759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F99C8D6EC8
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Jun 2024 10:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D0E4B26F3B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Jun 2024 08:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE621B5A4;
	Sat,  1 Jun 2024 08:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IJnYwhqd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2051.outbound.protection.outlook.com [40.107.113.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8A5182AE;
	Sat,  1 Jun 2024 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717229655; cv=fail; b=Wx9GCozT/seWSNL5YcnwxEg+Simdu7LoFkrkojE/wdQUV+ZdGPpw63LnciyWECrgwgJ5mopNIJ5KcqYA5kkK21DWEBoBFWu5wx7aLMYucS0j00ejrRUP2hKToVdrxcNh2PgICwmQk7tSwxWExkY/UNiY12eBUBM39iZyC6sm6Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717229655; c=relaxed/simple;
	bh=OP7/eCrbbX2+f8GdLec0p4DNrPx7QLVod2a5v7CfEuE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jE/ri4zNV3Uho0/JrsvYI6HGy30LUBOc4J6H9bopTWxwXedz7DWiwZxmde3YyhLQ8ItkDrDchypQ/Yj0oYAo9SOzXmhy4wuL1FPo4UjrQ+clhnohC4G/2APQNO8qcZncqVqXusd0VFJD/zN3U++RCP8yyZSbBAeNbPClZril7zI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IJnYwhqd; arc=fail smtp.client-ip=40.107.113.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kP8/DOJKeNy+gRy56fYBkYzAZg74838OVcEqxmUTGIuMtHq/1r8v++Tuy7KVLitZwpTsZkjcg9r3WXeUMClKAfpt6U+FfPmdeb/YEOGLvq/dT01HCrg7xI8S1888AihrKUm/uyxG2H+amqlGRD5wtlmsaiYgbVS3iGLJPTrJa8Yzuc9fclc/dzam/FIuRNUCb3Edbvvih2yDcypE+FUqPfpDesdi+z+8uBaNbTYDyaIx8dMCkIOtCY8TnFSCxwgeLHNGqpNRV4JrYz10sxa5rTKjr8MJtsQ+bpcqNVFNEBNGPfhJGpj6dI/ocLI1PTSBAYsxZJTQNL2IDt9FH/Aajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWTOUQCkxmkU5QXElMWeDKQHuQfzfqP2CBfALUGBeAY=;
 b=iMwfB5VIsq4bdZrZCCzpwmFpnH3p5ArGakpduDntyMgkNRRdS5K3DQlxH1QzwxIWhJNr58/lOTxxPy3+BVUGOiebL9VMDwzDs8g+J0z2PiJ/bHTXW0xfGhm5h961d+GOeq/S++R0YBZSxBbdOEc+T1pjOkgBUNcuUD632HinmCVa/x4eSu7be5j4FkTZipYoaKbZfV90xqZDu33JveCMNT6qKga13f5Th8sqphe0LQUmR0N5vaX+oCNk/eKafrifhBtn1UEB20MwtFDnDFJ1e0RVCJnC1lgvg7FQzTFG6F+XcfOX4ATvMht1zHUFkggomLLtdB1/lqTv//n7ePLU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWTOUQCkxmkU5QXElMWeDKQHuQfzfqP2CBfALUGBeAY=;
 b=IJnYwhqdQGySvKmRlNYCJlEKoozilgBvjTyuU7MQovR3G/W0QDfo1NyD4a4nCyAmL0PFD1quFh5BMrDri2zuo9x4MtkvlzzZ9DlVluPGxih5VeGIxaXVvNOMknUp5hxrOUkRdZt0tNC3XdBCcKBvXvJuwsFfFfDK09c1Kh34SVw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7435.jpnprd01.prod.outlook.com (2603:1096:400:f4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Sat, 1 Jun
 2024 08:14:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7633.017; Sat, 1 Jun 2024
 08:14:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Russell King <linux@armlinux.org.uk>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 1/3] clk: Update API documentation related to clock
 disable
Thread-Topic: [PATCH v3 1/3] clk: Update API documentation related to clock
 disable
Thread-Index: AQHaeSSqDRAVqq/5eEyHFotaY0RL47E90hkAgHUwr5A=
Date: Sat, 1 Jun 2024 08:14:08 +0000
Message-ID:
 <TY3PR01MB113464496AECE93AF01605B2986FD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
 <20240318110842.41956-2-biju.das.jz@bp.renesas.com>
 <ZfiIAMxR6QmFZmi1@kekkonen.localdomain>
In-Reply-To: <ZfiIAMxR6QmFZmi1@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7435:EE_
x-ms-office365-filtering-correlation-id: f3018888-99cf-4ce9-c25c-08dc8212cf7f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?z+45cB1jS4SNIEtfDzxjyFVMcEvBToH5VAo6MWNcYuaQZiwlYhXUtUG5AkPD?=
 =?us-ascii?Q?sC9WyazPToyFutVhYd9h87Exkp9F7qlPcj1bwfzbg6HpsfaBKrPANMlBI0mc?=
 =?us-ascii?Q?OeikycPUZ2FZNLABw/4e3jWDAS0Rz4rOnz0fvVUK1dj7ulDjmKsZRfw2jj4p?=
 =?us-ascii?Q?UkwQ0Oif4pJ7jr6AlXoT+SyIzm//vRaZr9Uw75nkd4WKz0Tr5muz/mChDqdd?=
 =?us-ascii?Q?O9qozN7SFYWOuPuaPvlh2EFOdnb8EhqQ47iU7SVXH58/dpBApOS5eVumWehy?=
 =?us-ascii?Q?FWg5ak5mDeZv6lcOhwhLkPMLH53J9tpCLn93cV+htbQGWVxpV7SODwKsAEYx?=
 =?us-ascii?Q?2hbqcgoEapjbLDWahddlM6xRgFyTdP6bvJ8pAHxUgKFlMCF18ykLP0+mDozX?=
 =?us-ascii?Q?0jUq9oKEjqIiL5X/mKc44dm4e6ZmhttzUUIXzHHnSUblpw2+q5PEp5wuZpu0?=
 =?us-ascii?Q?e/2hBkTxhOgbYOKLoyzPWgidRzJtIOrleSYVMdUYUg632NriCx/OUEk+9+Nz?=
 =?us-ascii?Q?1kxs0RjFlpqj8Naz5fxQowWnZYo+pRblw8Od3iJUKMnWFnazloH7IfQkKBpE?=
 =?us-ascii?Q?9ExncUSzUQm0gItbDA/opKq4HIYs8X74bk2o4FRK2xJI+HNrm1QwyjHxeuc9?=
 =?us-ascii?Q?n4BrTV7P1NPRAzYGe+U28DFnO7smr9ru60k6Ezf0f2b3HNhuEsnH6Aelg8w5?=
 =?us-ascii?Q?DZjdOMEQ6krGQ73hBMYULLHYMZE3o+S8aFJ+hjtCxAY4TQ/3akevWLJRiCog?=
 =?us-ascii?Q?ll2zbC12qpYf8BP4NkbpaMYguNl4AuojLyi9w/82oxiAe4JEdGkvuCfEOTVo?=
 =?us-ascii?Q?mZhgzl2C6DfOHB8sIGCPeA1fVvK+b35PJ7opAmoowjgvfkbiuDGBgWGSW6EN?=
 =?us-ascii?Q?A0eU6zYtc+vmKJ0Slmmpz7QMM1DroHDjz3DSxFgigBHeFU4PDt5c/kmqvSAS?=
 =?us-ascii?Q?VfVSkZWDwhRZ4/MYurqzF7bdYocwZdlfGToedcC8qOzYil2JiuENQqUjuBcT?=
 =?us-ascii?Q?eG+qyBZ65kD91FDfTxsX6mHUyAuea20qxAadIUiYoBRRusCMSaroWP5o9H9r?=
 =?us-ascii?Q?HXYsRSdCv9Wwk9espI3fL6Wt+ipa8gVD5F6aKKdjxuH7zyBTLRxgs0cE0YU9?=
 =?us-ascii?Q?1UkuML/2+s50rzrIOGbtmobgPpq8e4jzq4siIqinCEhk78YUYqOtwu/bVJPt?=
 =?us-ascii?Q?EVrkJwo4GAOnt5sNmQlV9tNpuc6Dp1iHNW6vjcfl+uPac+xHic8zPynUrRCU?=
 =?us-ascii?Q?uBkctrviy0U0c+wWivoo3kFyvIF5w+hisle4vMJbCSFp8kNkBBu8Zj0OcSHX?=
 =?us-ascii?Q?IlGn7GnzIumwU3n8+u80tKXLfJ5obC7HZ3Zg9NSQI/1Sqw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fc8pMJKpcc5Gw9ytAX6toHhM++3dNyr0wktHffP76XgVZcw7zddBfMHJTHdk?=
 =?us-ascii?Q?IFT5DODDLtwfjyp/Dy2uSrFdzwiaiG5bbt+/eSUrtqywjQB1F4cDWsEFK8HP?=
 =?us-ascii?Q?4PQMwTyhUUbLinAoWWmxy2rPuK4kG1yZDXyk0XLxqnEygsjUrxWFzFhtGPVu?=
 =?us-ascii?Q?3Trv0yMuKpqFWbXvi+EUD2LUViWDQKVCrRjS4SNnWD9w8ZRoQxZcDkeWHTDI?=
 =?us-ascii?Q?Pn8IkwbrRCdUPi43SAjCg4PbUiBTI3b50Md8H6TZNfNil/35nyxpMe7TDgCx?=
 =?us-ascii?Q?BNyPnK/M1e4yhJstDhRvTWjE73MVUci6GtRDmxIC79XwyjvW2zsSia0rN2KQ?=
 =?us-ascii?Q?1i5y6NDVIbu4+6jjgqNDfEDTSdw1Eu9HsGL4SPASGTOBreYQPjuxcFpueIl8?=
 =?us-ascii?Q?YGGrWz1YXJU8q7AoMbsWbue1C0d1Uf9EiK0qm/KLPPmTDMRGp6auJZ99+PdU?=
 =?us-ascii?Q?LBVWKkZQkH9akC8sC/VGf4QoTnAaHuT9WwjA50dn2XGTaVegu8oVsAf5DbWT?=
 =?us-ascii?Q?P3AZ2ot3fP2KPwp3gb713kwOB2g65beK4V9r0NLFOjMANA53izQWtg2NkzhW?=
 =?us-ascii?Q?wXaNOeDfDlA3hmqDz4XokVh18/FwVE/WJnYoqPSvX0CpnxABj/qqO6y8KNEU?=
 =?us-ascii?Q?/lzgZGwDp0cQunpJ+ztd3tHZlBRFyry5w/1DZU6uh+RT+zcsBZhetdJxKM7n?=
 =?us-ascii?Q?qvHZiVMW77lSEZydiP8ZVsloLafUbnXdPkWKiuLcYVnie54NykC6C0eEFu78?=
 =?us-ascii?Q?o5+6UYRv+BXZGhBpjgAv+QQSlZTj7fEPtulSGVRMr6e1LnDsy40HSxZ6hw72?=
 =?us-ascii?Q?00YMa6Gs6k0Enajv3nCW3ZEAYsmpwN9h9ufGVIUqn0qBhoN+1enNi5so+QMy?=
 =?us-ascii?Q?GD2enDey96QhcDP41ZetYmLRL0zSCqWUr2sW61vKNHJCsnxQIRHYSy9cBEfc?=
 =?us-ascii?Q?AwsOv5rn768cXTARfsG1L3n7h2MZoe0Fg9eEGcBO3Ka2U/74SEKRtmwJGAv4?=
 =?us-ascii?Q?s2OpI2b+LKNqYkyBLup3ezd6Nxu6R6akjS0i4lExkzZ/gPQtKFKQ88wVG2XM?=
 =?us-ascii?Q?0aIZobRPB7AyyuCTiSGiaemWrwX7llb9M9Hu7cHXRvIY9jST5liBsxBEIGNC?=
 =?us-ascii?Q?ZPwM2BfsIVofLsatWqRQv91y0dbmcX60pNIJPuFLRaaIV5Mi4NXgBCyGV0el?=
 =?us-ascii?Q?gxe0ZblMOCMtNoK0uAHohUa37jDxaHdautCBZFg+Tn2KgRls0hTKPAwAniTq?=
 =?us-ascii?Q?oMqlcWOG69sQhobjCMDiIZIj0FcBEg9V7Cg9LGdx3r8SPHHhiztsvjwQgxg8?=
 =?us-ascii?Q?lI+1EOcKA0woFy1cxk2XMFTpy5LFszoLHZQeWZsOzIGRio5gezPVnKUqwkzx?=
 =?us-ascii?Q?xs0aJiC2CDZTXmY3SLjrNYZ9zi4N0nIml3AsjrySRrLN3XVbv4cz/me7iJd/?=
 =?us-ascii?Q?R9dP0Mml/iqsE8FgZPytotOu8ppTn3Uf87jl916y2zK/D9yAsvrV+mbLyNP6?=
 =?us-ascii?Q?gxSorMzJPcKhej690SMzE+8hyEsQ5h3ow1zKBJkIoqj/xAkWnzrCLIck8rRl?=
 =?us-ascii?Q?M6XHjctAv1e0SN6P4/Mm0lVKV7TqwFybKrKXFzMBhP3a9wBN8zMqyIt54LAd?=
 =?us-ascii?Q?gw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3018888-99cf-4ce9-c25c-08dc8212cf7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2024 08:14:08.2020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OOzoKRXfU3pNl+53I620e7IFNWJsle1392KvTFAJF36EpiajW7XogijYxwyVGoyCFiALlnDhPhkMxUmCpgzaenDKrrQFN6C7cqj+DcxbMfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7435

Hi Sakari Ailus,

Thanks for the feedback.

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Monday, March 18, 2024 6:29 PM
> Subject: Re: [PATCH v3 1/3] clk: Update API documentation related to cloc=
k disable
>=20
> Hi Biju,
>=20
> On Mon, Mar 18, 2024 at 11:08:40AM +0000, Biju Das wrote:
> >
> > The API's related to clk disable operation does not explicitly states
> > the synchoronous or asynchrous behaviour as it is driver dependent. So
> > make this part clear in API documentation.
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * No change.
> > v2:
> >  * New patch.
> > ---
> >  drivers/clk/clk.c            | 3 ++-
> >  include/linux/clk-provider.h | 3 ++-
> >  include/linux/clk.h          | 3 ++-
> >  3 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c index
> > 25371c91a58f..f5fa91a339d7 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1010,7 +1010,8 @@ static void clk_core_unprepare_lock(struct clk_co=
re *core)
> >   * if the operation may sleep.  One example is a clk which is accessed=
 over
> >   * I2c.  In the complex case a clk gate operation may require a fast a=
nd a slow
> >   * part.  It is this reason that clk_unprepare and clk_disable are
> > not mutually
> > - * exclusive.  In fact clk_disable must be called before clk_unprepare=
.
> > + * exclusive.  In fact clk_disable must be called before
> > + clk_unprepare.  The
> > + * synchronous or asynchronous clock gating operation is driver depend=
ent.
> >   */
> >  void clk_unprepare(struct clk *clk)
> >  {
> > diff --git a/include/linux/clk-provider.h
> > b/include/linux/clk-provider.h index 4a537260f655..5b493024e1ec 100644
> > --- a/include/linux/clk-provider.h
> > +++ b/include/linux/clk-provider.h
> > @@ -113,7 +113,8 @@ struct clk_duty {
> >   *		sleep.
> >   *
> >   * @disable:	Disable the clock atomically. Called with enable_lock hel=
d.
> > - *		This function must not sleep.
> > + *		This function must not sleep. The synchronous or asynchronous
> > + *		disabling of the clock is driver dependent.
>=20
> s/driver\K/ and hardware/
>=20
> Same in the first chunk actually.

Driver abstract hardware. But a driver supports different hardware's.
One hardware may doesn't care about the sync/async disabling of the clock
while another one does.

Not sure how other people's thoughts on this change??

>=20
> >   *
> >   * @is_enabled:	Queries the hardware to determine if the clock is enab=
led.
> >   *		This function must not sleep. Optional, if this op is not
> > diff --git a/include/linux/clk.h b/include/linux/clk.h index
> > 00623f4de5e1..84b02518791f 100644
> > --- a/include/linux/clk.h
> > +++ b/include/linux/clk.h
> > @@ -681,7 +681,8 @@ int __must_check clk_bulk_enable(int num_clks,
> >   * @clk: clock source
> >   *
> >   * Inform the system that a clock source is no longer required by
> > - * a driver and may be shut down.
> > + * a driver and may be shut down. It is not guaranteed to ever
> > + actually
> > + * be stopped, that will be driver dependent.
>=20
> I'd rephrase this, taking other users into account:
>=20
> 	There's no guarantee that the clock stops within a particular time
> 	window or at all, depending on other users of the clock as well as
> 	the driver and hardware implementation.

If we elaborate " driver dependent", it matches with your explanation.

Not sure we should elaborate it or it is understood from "driver " dependen=
t??

Cheers,
Biju


>=20
> >   *
> >   * May be called from atomic contexts.
> >   *
>=20
> --
> Kind regards,
>=20
> Sakari Ailus

