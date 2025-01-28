Return-Path: <linux-renesas-soc+bounces-12614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F636A20698
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 09:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99D74163176
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 08:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA841DF726;
	Tue, 28 Jan 2025 08:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KLLebun6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CF84A1D;
	Tue, 28 Jan 2025 08:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738054577; cv=fail; b=o0n4jP7RcCPlQXA3qDQ9PfdfFpZ/9xxMMl0B7uD1BBDRIwgMMklM9G99TYTProJoe9EqlAEPzJwHcstKgeLbPeDqYL1hfSfNZvdIEjwXh3DrGJ8/EZqj08+1Z9ZlqDzwg9J5ZtHB3Ms6GGPUEz1dpkyLN/Oc8B4PO/cuLvqGY6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738054577; c=relaxed/simple;
	bh=QeRZHxmB9Mz0fYotnEJ8m1v7iWB+Qnr/e/eINJWTPk0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JLgmgEUqRaE09nbpszGukDuGSDQ/l6XGUS2ia0s5upaUMfhlUc9vhGQTwYggONRRtU4Y/3UCW2DIcTSwvM+WyTNL7jfKVerdc/K6nGthMjXmwSxdQ+8FGzGCIP+1DCiFmQJONCRN+DKNnpPnEcB2EcF9+63AffkV10aD0POE/iM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KLLebun6; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBqWO8TpNAjC62QSwt6/FT4B2uWa7CH3Y9TqsmSyTG3pX9v4hfIrBqN5nV5PFx2Ht98JscNEDA/1mYXQZo2QRdUWsONcEoHbKJZIExua2G/KdBDXJosnRjcOnQzQHQqhBchWa5cum1FeObOSZ10zW/mpzXYAZfVIjG+GFYa7+Iwz/G7tr1kg/8GCOrZK29faBmFn9Ps/ijJ2X8IRj6E/uyoPtrPbfEH77K2zNSoJy0erHZwtWpbryQsuykx460W3RWP5crQTlxyb9PKH3McNqsrxd8sNA/YJK5X0QbAN6i4LOtyF/JU/4Xa/SbPxe9yFp8wnpnROCBfXcfysVn1o3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBzsEhZNMQTCnUlu253sYbwnUF3CQ0NjntUtx2zLjug=;
 b=yQhShbuRU+d+P8h+fdoTkAtymTU20kk232m5nKQFmihEhxwzdl7ERnEww1yZ11GhGqAm9qfjkLjEONpzfy038tfy7cmTdeWwIb1epEiZ2fCWSJJtdY6fiTsL4Q6fYal/L3gCqRrTm7jlV3xU+1JvGOyE0xZodkShrJXYJrpR3h1HZ1RzcE1eyn7k/94EOdvIfOrFkMUO9y9I5HauoIvqcrzyrVtZ3ES+Pvx9UcIPtsoQZKnBKbxsx+PSEjboD0oOKA2TE9gr12vDQ4hJnz5DhhQdMKM2WIsNM0gVT/N87c1Wjw9fsLIczCces06b7zG0YRIlLW4D2YZLoJ23FbIHrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBzsEhZNMQTCnUlu253sYbwnUF3CQ0NjntUtx2zLjug=;
 b=KLLebun6cW73zCdzpe8XV4akjF09EQMW7MQaKlvzP9rC3CsvVkIcoJ+G6icyIktlrHyHhFqcqp9lJmkfAE5C/uWDodSIfh4osEZ0UB3IZlmeBe6AW6/Qor7HhbkQ2jfe0OZT98f0uBZ1a+c0CS1pwQCMN8smUlRmxahISekC0WA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB9377.jpnprd01.prod.outlook.com (2603:1096:604:1d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 08:56:07 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 08:56:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 1/7] dt-bindings: mmc: renesas,sdhi: Document RZ/G3E
 support
Thread-Topic: [PATCH 1/7] dt-bindings: mmc: renesas,sdhi: Document RZ/G3E
 support
Thread-Index: AQHbb/i6FkLt8ccLmkOXuf2Zcpd28bMq/+OAgADkv+A=
Date: Tue, 28 Jan 2025 08:56:07 +0000
Message-ID:
 <TY3PR01MB11346C3D39E9D7B311F37B2DF86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-2-biju.das.jz@bp.renesas.com>
 <20250127191607.GA698483-robh@kernel.org>
In-Reply-To: <20250127191607.GA698483-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB9377:EE_
x-ms-office365-filtering-correlation-id: b982d962-7648-42d8-e168-08dd3f799ab1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vwCNjWnLz/kmUCoSKad64bgQEPr7IDuK6roBoTNJcnLvli/Fb6ckO3aM7+Yu?=
 =?us-ascii?Q?5ohLHdD446N07N8sbW7yHj4EZzxO8K6Wyjkg9U+li/Wau3vzm1TWSlVWrZBg?=
 =?us-ascii?Q?/fZOb+eJsX6zGfnSPjnLQmBE8NEPqb2vmF5JugD//5j9QABu9iqPbxXb59T5?=
 =?us-ascii?Q?ROcYB/B3lotHQ1+NoJ7V0vsuSvoe7fyzVaMRZp95Mt5RgIp9dyZI/lFYYHQA?=
 =?us-ascii?Q?Xhwa3Xpuh48jpYZg1EOitd8rg2vsRSG64DLNB9wsIWPf2jF08X1rIm3gFaf4?=
 =?us-ascii?Q?mvJ6q1dt/T9N8TsukdHHrRdTxqcvlU+/0wIw5pUYJNntacYaq4qwn7HQ5x9Q?=
 =?us-ascii?Q?VUrphsE8FWMO8A/8V9TLT333iXFWg0xTe0ahK1iCqpcnzZuHRl8w1zohsugS?=
 =?us-ascii?Q?W6PPgUMirAFrLA3qu1x/qrihYbbnCvQJ0C1cPbHbDVQL/wsdeyDgHx/GviZp?=
 =?us-ascii?Q?1lurXOckmSTWYaf7EOy52GjUpFs+IFA6e16NhgPRXni6zI3GX0UcMP6e6k83?=
 =?us-ascii?Q?i/4GiNZ4vBG2T3zRAQF55pGCZLKlwpHtN/ktDhyUN8KsVIfI/OFrWS7lOPT7?=
 =?us-ascii?Q?JbKiTdcqO+eKgiTc0zrpA4W1VLg6sIegiCA2shA6swA+TaCJkuJptDljuj9I?=
 =?us-ascii?Q?rLBzRg9SP55VvMdcO+IXxDDGy0aMJnS9MyjX4LnM8GquLuzFYqgnhVbyeSr9?=
 =?us-ascii?Q?1cMRDUChSIMKnzanRdnMjedA1hfAqxnOAKKRv08ueb8zPzTHPgwffOU5UG8r?=
 =?us-ascii?Q?Y6MGDA4IPqcSTQxGP/Xs7n3qLPaqhwhIfGOhSbw+sEa4GqnpL8GTZvE7KmEy?=
 =?us-ascii?Q?ZzMFF5qt+T/Od/+fKszwTjzSqhplGMOEs0P2WLAZ+yOw0+udxExPJRMMX/e7?=
 =?us-ascii?Q?TLKumaONUq8WXLOjdIK5TODhRQyx4Tjw845mvT6j3wTxK1GhdWwFJMMb4teJ?=
 =?us-ascii?Q?Wu7McMWRcp356xxDn8fIXXg083DlLmdPWwaL1LF25dVbZo4BRCCd30ADMnxa?=
 =?us-ascii?Q?cpXwgl8qyszIztqSMofKsfAbk+ikUa6+m9wPyfM7LlMAVFjxVllvbR1zSE8U?=
 =?us-ascii?Q?/dM7x/9UiUmHh/IVxzVFAkSXGWoexHGz9YrZWswIyY2ok5y83R2gWG7uNjLS?=
 =?us-ascii?Q?meCgCARQfjgth9/epeODN3/S+kWtOQmA9KwZvsyfKe6pMXPeMCr+3dj1zAJL?=
 =?us-ascii?Q?iWLTyioplkxFBHEjovkQavrgNq1gtRYiTXF4RC3nLxDfTsqGhnRKAp1x4D1D?=
 =?us-ascii?Q?RmxwBBEKBM0orQTvjCszv0TuEFigIE2kxC8TWYIq5Dp2FGmRotBxeWDKaF2u?=
 =?us-ascii?Q?Og+9wrS0voIcsLSYTn6JfE6i/lkNo5aNxjZu8stzzeRfxNTxIsvjGyiNeiBD?=
 =?us-ascii?Q?TJgojpZnSpnbsaS19JBmmuLP/YJLSvjFr4f3DM4/xmwOz8D+VhjWB4L8SB+V?=
 =?us-ascii?Q?4bV2fxBtRb4/VcIULnXd+PdxcPUSqUfe?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ewDrgFefcfw1FJ4p1GABioZiYYet3HOfE4ScznjHkZGvaGCn5Y/d+zzie1KD?=
 =?us-ascii?Q?Mbe6RY1wdVKGERziLiJ8ix8Tx3ciozEWGXN02vxO/oicyW+5/kvWTmVdsBFo?=
 =?us-ascii?Q?6yE0ndeEr0uiuaDyfpMRqLrrc5JYCejLwdsrOui5laNd3j38ZOF9ex0mW7Ch?=
 =?us-ascii?Q?OFSkichfxZrbEP624WteyE2Wd4MGdOmCgXLXISVCrvxYJY3pBtl0eXX3+lX/?=
 =?us-ascii?Q?39SEL/mXozA7IuP9kHeNx6woPGB1MZfsaOSxm12mRNCSsXG1CIIy+Bra27Yi?=
 =?us-ascii?Q?sJ+elraVIP3xtxMLbTSGwD7MewkMlNYiRgsp90IXatya3but79n5MmRzYVga?=
 =?us-ascii?Q?1bMPvA/qshZxAj0aFl/n//dx6DcK3TIOO+qHk7IgVC1lXamhLCVhrcH2FU3N?=
 =?us-ascii?Q?Ndh4jQ+0i/SqTwKMgsiealk18szEAd3QcxIkJK01tHxPTzC63MvVwBs2rjxI?=
 =?us-ascii?Q?sEu0DezlA1I68LCJ/WskbNdgBWkDLWl2JV2JOh9X1hhoCZtdmvrqsyLiNlPH?=
 =?us-ascii?Q?q5ugEi+cSn8t6HVcprpX8gZXU8U9pS7szpgFr7Ufx6XeduSgtJlgmuYm5Ff5?=
 =?us-ascii?Q?U+XpaDQzSC3j8XIJOlGRR3nhTFGiPW+WUnKFUH3UZXcJr+IZooSZcnnO1Bqu?=
 =?us-ascii?Q?lTCxJEztbgMYMmNulr3Im4Kebt8NDN6ShSRLtTC2NpPD+Q/wnpOkloWS48gW?=
 =?us-ascii?Q?Bp/+QHjdlniX0z3gQsNWbvrFmTS8OY57hIjavX3gbqm8x0asf4JkAWpACju/?=
 =?us-ascii?Q?gWrN8Kv6fV0SNHJ0rwOwzgncfPGT46JHG6pjcAI3TWck6fYaM7n1G2u6JOKT?=
 =?us-ascii?Q?OH0rr1aZmtHnRS8Y62TH53s6p6lVBhokHy8kfdJCKn/X/i6CmImSuytjx6gz?=
 =?us-ascii?Q?wjN3izv++2h5mxTCUI4Xs/8yL5A6fp7Fx8MVR0/pDMJoqsK3n8VCa8c4YnBA?=
 =?us-ascii?Q?lz/zG0rrZRtT6Cy+IUN5oVgyqXPhRNk5vA4aJZh/8frLGjXd1XHxLSY7dQiw?=
 =?us-ascii?Q?fFFGXlbQU8j+Kdasrdda0Jy+F20WFsCDJEWYevX/9cnSFJed8TsT0doTWSnz?=
 =?us-ascii?Q?i1otmSjg9q2H/lwOsCg6BqkSUV8xEykZ5v8zuvGSZtDPdtlVWJWUm4xA1fsa?=
 =?us-ascii?Q?kYtstyOuxVqOje85bbgo1dFJkodhHNm6SNyrRQrBubCUc357XXFngZIPKV/F?=
 =?us-ascii?Q?Nb8OE1DviDWWATmrsGeaLlxeWmLkpHRlWR267dVRX38LOvi0ebRtOTwzyfvK?=
 =?us-ascii?Q?w176GQi/Elhw341eOlbHMijDLw0cXqTUYuB1Ho2xSL4PfBrGkMYMwhwHTTZS?=
 =?us-ascii?Q?ePzlxmJOWz68kRauTzNvtz+FrgsSuDZ1wXn6eFtlJKVyed7ZasFgaNKJXfwe?=
 =?us-ascii?Q?t+3SqZxZQhEsaNIqTmIDaazBsfW1bac6L9GB/6k9sBvJoiVX6M7Vl/gtQcDK?=
 =?us-ascii?Q?1XbTLI9xDH5HfTKlkQFsWqQ0cnYl698UdZ+FTnnIgvsVLJq7ws2WyJd24AZL?=
 =?us-ascii?Q?IYlMyho4UUu6uDxhptv2+wEWGQ7j+WuRjSAK5E0okmuBTNR1RbRyHrI7gCjj?=
 =?us-ascii?Q?3G6ioIqM2PKUxLnDP7j25096hETR3qznXYeNwlQIPTp7paAt0as6g6TzsraK?=
 =?us-ascii?Q?8g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b982d962-7648-42d8-e168-08dd3f799ab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 08:56:07.4975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PKnmYp7GVOUSVBNrGh0KHxkvLPzk79Lfbb0ZTSlolfdfyPW9PhhXr7NeLC22jRivhh+sJVBN9OuYkc20WRJoFxwzjri+KGaOJytokk0sjrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9377

Hi Rob,

Thanks for the feedback.

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: 27 January 2025 19:16
> Subject: Re: [PATCH 1/7] dt-bindings: mmc: renesas,sdhi: Document RZ/G3E =
support
>=20
> On Sun, Jan 26, 2025 at 01:46:03PM +0000, Biju Das wrote:
> > The SD/MMC block on the RZ/G3E ("R9A09G047") SoC is similar to that of
> > the RZ/V2H, but the SD0 channel has only dedicated pins, so we must
> > use SD_STATUS register to control voltage and power enable (internal
> > regulator).
> >
> > For SD1 and SD2 channel we can either use gpio regulator or internal
> > regulator (using SD_STATUS register) for voltage switching.
> >
> > Document RZ/G3E SDHI IP support.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 20
> > +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > index af378b9ff3f4..ef3acf0f58e0 100644
> > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > @@ -68,6 +68,9 @@ properties:
> >                - renesas,sdhi-r9a08g045 # RZ/G3S
> >                - renesas,sdhi-r9a09g011 # RZ/V2M
> >            - const: renesas,rzg2l-sdhi
> > +      - items:
> > +          - const: renesas,sdhi-r9a09g047 # RZ/G3E
> > +          - const: renesas,sdhi-r9a09g057 # RZ/V2H(P)
> >
> >    reg:
> >      maxItems: 1
> > @@ -124,6 +127,7 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > +              - renesas,sdhi-r9a09g047
> >                - renesas,sdhi-r9a09g057
> >                - renesas,rzg2l-sdhi
> >      then:
> > @@ -211,6 +215,22 @@ allOf:
> >          sectioned off to be run by a separate second clock source to a=
llow
> >          the main core clock to be turned off to save power.
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,sdhi-r9a09g047
> > +    then:
> > +      properties:
> > +        vqmmc-regulator:
> > +          type: object
> > +          description: VQMMC SD regulator
> > +          $ref: /schemas/regulator/regulator.yaml#
> > +          unevaluatedProperties: false
> > +
> > +      required:
> > +        - vqmmc-regulator
>=20
> The driver treats this as optional. If this is required, then is
> renesas,sdhi-r9a09g047 really compatible with renesas,sdhi-r9a09g057?

Ok, I will make it optional for both renesas,sdhi-r9a09g057 and renesas,sdh=
i-r9a09g047
in the next version.

Cheers,
Biju

