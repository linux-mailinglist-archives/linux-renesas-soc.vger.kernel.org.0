Return-Path: <linux-renesas-soc+bounces-23728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B6CC13BD7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 10:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0611D188FAC4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 09:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F952D8782;
	Tue, 28 Oct 2025 09:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="H60wvBkn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B241E51EB;
	Tue, 28 Oct 2025 09:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642751; cv=fail; b=Dj0KLeqYAOPxxJ9GsmYA8t+GR/MhPpHwxO45uim8gXi8WwntU3jPCZMzyxzrtCqm0DudiwPZsyBsp+14jR7YftZZ4tv3Y7MMTRj+ixbUGHmy3+UgYTuvV1To3Ky9h2f2shkoxNmEtFvwHbEnbJBxSDAdyI+2Lh3uDnHqth82sVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642751; c=relaxed/simple;
	bh=Dhz5tRq4roxToGdS7oU/HrG4AbHqtguKtT/Dh3UGrY8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nh/b4rXE2dsGSHTKru+Rnwr4d6VevgotCniMPJ06sA8oTP7cibwOmnWxQcsPNoM0tSt9N8IePj2wyz23EGtH3/DzuGHIKpC3/awCRVQZhyLhIJ5Gv/3uMGrVzypi3bLMoQWQD5ccDgj0+2iq1siZccx4ZzNvDRRQv0wyFRTmNk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=H60wvBkn; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSYavBiG5kynvmflTgdXwobrg9IzD6j8pZ6V0J5JOJFQqEFxRgUwFzKzwVIhliTf7YGYeYZTp0KHNugGga4/qBzN7CHDb04LzyAHF5DdA9Y/jCpknW+rjBjMEbFEMkzjd1orcrQ8/6lXTlF4vBtx9nS2oH0ptu+5p6ERpHOjT9nX7EF6HkS5haTuI0Bwhb0Ogmio0c95VoKUsf0mlTd8XPCq6shvXbmzQHUsxDah48JAjy2VSHMXzAE5KwZOzML9jEm/JOECedYMsRGCyhejOr3TOzAxJFOhnYNfLSQb647dZ3yPClBB7M5UduH5NE8zLvJVXndL2FMOKWUulDz4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1SXY/cDwa4UvmWqc+BuFj2XGPny49hC39rHYs0m4gQ=;
 b=Rk0RdC6XmbNs4glfLPRvfjkj8+rZhiX1qW+XYfmI/e7GhlRfJCKoCMiVa3YjCL13kpb5Orh90E/lQxNM/29aZhm3DhaoCAifkL+m2wfQCqhXOVKk7gnBOIIrN0tlWMP7PhyihnaGhEBXzFIKdsqFijj1chT8KlzyH8r38IyJcgCvBM57y0vxe9OHreK3iKRLpWwj+EZx3CzxBTesDatw+xHXU2/0cLWeK6n9RinV0mEj/OKqqc1du51qenWOY/zHFQ8be9y5vp6R+9C4dQii9OTHn8lyQMeYrLlPl+oSwSu/lhtgoHLw+2o5ewyAWArxVtVH6i4LBsVs04z9/hbwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1SXY/cDwa4UvmWqc+BuFj2XGPny49hC39rHYs0m4gQ=;
 b=H60wvBknnJcqfMA5DSX5Ecr3CUJNrFh+fEaQCY/SjrNyXLj0IOvd+3hsTjWnMRGfMzeBrSnN/McAXedq29lduhKQ8As4LfHdtnrzZ+9Bp6e5fG5abrhlw1HVFQ77c4HSwrGc6UiQ72ytsTQM6uOfD7tSrw0HBGLUmsKapyHL8IY=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY4PR01MB14072.jpnprd01.prod.outlook.com (2603:1096:405:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 09:12:24 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 09:12:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Nam Cao <namcao@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 00/19] Add RZ/G3E RSCI support
Thread-Topic: [PATCH 00/19] Add RZ/G3E RSCI support
Thread-Index: AQHcR1jZ03XPUtJM7k++apHZaE8I1rTXPp+AgAAHrWA=
Date: Tue, 28 Oct 2025 09:12:24 +0000
Message-ID:
 <TYCPR01MB113320C083F52CBF7B8CD8CA586FDA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <2025102802-clay-turbine-9562@gregkh>
In-Reply-To: <2025102802-clay-turbine-9562@gregkh>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY4PR01MB14072:EE_
x-ms-office365-filtering-correlation-id: 8adcd3a1-a63b-41bb-6917-08de16021bc4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?q9h2BuxYzmG3DoHZGcUw1OVzACGF6Qiq0SNTEmb1XvjT0fiaiof7Y7+q9zWP?=
 =?us-ascii?Q?7AtZlFxwCBfspkDej8KxYewhD8WYFaD/804TQYVChqEAQBW98Mj/+D0E/qAx?=
 =?us-ascii?Q?ftJou5xe4uksc42ebikhu/DkcxHmjqJ6sPZ65Or0SuQmLZIPan79Sb+Odpn3?=
 =?us-ascii?Q?EPhiKCsZfKBawAStuH8cOjIJ+atMnYnNh3/zsT0a/kPyCFRAWYJOV14MxI1B?=
 =?us-ascii?Q?a8JYM+RW6SvkLE0TDhZbjExhILWrHJ6uEu9jk8BI6bWaezuXsD7QnmfqP23y?=
 =?us-ascii?Q?LgJxeIe8LPGDrAwEC7ZxUpczjYuRbKFf0nDLJ+1lB0D5XcEPlET1qj429m6U?=
 =?us-ascii?Q?Ibq9MtTl36CO1y34bj624zk54Vjhp++5/2jSGEONk8fvDlM7RsgR5glD9VJb?=
 =?us-ascii?Q?KSmFfj5hCpXvcT1Dde8B4zlahjpLpyjYK8RgiJagi64ttaOblQ6S3g5ea3V9?=
 =?us-ascii?Q?IQtt1Nt0Jwd34MAQfFZrXcPnL6E/Ob1VicT0FpwNbjYGXT+2qtaOz9Pv0ruA?=
 =?us-ascii?Q?VKQXSZThjSNU12j7KOaBij4CkBrcopcbo2e3zdMoH7rq582rLB4RgdOZmko+?=
 =?us-ascii?Q?fNaCiPbjRjupUpdbSWwZiE26QqNLEnNkkr+xBrRF3flhLmDBmoZJXCGM+oi+?=
 =?us-ascii?Q?5KQG3fZFMciZkFbthU5L8AFkAbu6ulI6+d0XnwpAJ66LF/Xo1akF9dhaQyAd?=
 =?us-ascii?Q?0M2xNjH52dNuTCBzo26BFVXY/ilh37SL4CLLWFIogXz6ObON+JO1E8KitMxz?=
 =?us-ascii?Q?0wo0sQjAztZwZZnyPXOayCtJaHc9EGcBqXMoDOA6151/TmYl9M/EPqd/UXsv?=
 =?us-ascii?Q?2TIzwhvUmoe/tTeSzr/F3jWlHtyTe5SzVhFcjw6pTcFws74QSEHzKSxhJM6R?=
 =?us-ascii?Q?W3/hvlyO39+NDTOTuPM/HzDNs1oKnkYeZMVE6jEMzT8pf4rYhapbnWYkEySK?=
 =?us-ascii?Q?vLVCFuJUgaaZkdwyq1iM4HAQSua54TMinLXAxmDXNYtTo+GrgER2H1t6biFn?=
 =?us-ascii?Q?mx4T7aGyCSjjzJvIvO4awXB/fF1hhZBe3ckRnWsxM34ILrW3L5L3FmJXMDHt?=
 =?us-ascii?Q?fQbLUkpV0Itx7O0GqFp+CGPHmc0cnt3RvgXbu6IyYbpqj1kGLZLoylMfG4/v?=
 =?us-ascii?Q?QzxUaTGtBioO2hqiWEa19rmSzNEBvgdM97mt4rki6ICVD2pVJrnoiH/Zv6Mq?=
 =?us-ascii?Q?Nj35A49cicMDxwzn+z82cniOE3kP/VDvfu51080AOX7rxNQJK6p+bhUAft+W?=
 =?us-ascii?Q?lW2IlfJk8zeuHe618clAjCFWaBTq3azGQjLFrLjQdxiOMFJFwkaIiV7DC9TJ?=
 =?us-ascii?Q?sVVuWDkTYWtyGcIgP0H2Q2DbqlO3j2BRyukegKi8sPwO7I2n8/0q9b0wTlZI?=
 =?us-ascii?Q?L5u39LqRQUNmRiUeyTR74XCNteMANpDbb7qPVpbLD7cCDTLqK/77l5BNP9iC?=
 =?us-ascii?Q?bAXRPimpt8Dg8fCLdk/sPda1xM1IqrmRnrw01UC+NRmAf4S2OcXRI3iVT/1H?=
 =?us-ascii?Q?W5Wi4DOqxhe6sKhWaS1Njlz/RZnm82F2OB1E?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?N+NsAGh7q5VSlGwdhW86/30T4MUPps3UVuNE5cCwSBHtKtuBudA36JxXM5sQ?=
 =?us-ascii?Q?pGh0bJw5AxRWBGmXyrE7mstDdeLsGjEBV6So958KfosIvR/TGXSNOmH9nw0J?=
 =?us-ascii?Q?Pzrn9QD0Px8ZiwNEM9zJP3f7RJ9REaSHoEehlum4USQ8/lubirutwH9dlKTh?=
 =?us-ascii?Q?ZJ+/xs/WMUvaSx8qgk+S8UbKbnit+k3LnDoqfYW1vEakepQaK6t4KsvRbjq2?=
 =?us-ascii?Q?ULmjvY8Su1EpItZZaF9eRmRSwgR8f4d+NlmfcOdDYcluMtb3fn7cD3jisGxd?=
 =?us-ascii?Q?KIVZBBdBNRB4bEqHtDXTnnI4bLDrZEKDhiHb+4O01VdKd9sewHou2Z+4+K0S?=
 =?us-ascii?Q?ZgRG/JQQGcHWRG3DNA8MjhkiTw3pUPjLNJM11Muok+aeqGwF1nc+AK2oAO9P?=
 =?us-ascii?Q?G7qe0DLSz35Qj3Wn0HX5PXl9k4GJJwmixsStw+mAiJU+aGabT6AYt54xmRl3?=
 =?us-ascii?Q?9HT+U8pdqBhfuXBOCjFaKt3dsEMEbq23LXKfqQvCjvNr36m/GoymKZ+HX6yP?=
 =?us-ascii?Q?s5+H38DHn0pg0w5Oy/mvzjFNaSVxcf6oQGIuC6hwKn9RleNmuiWv2R95nXdj?=
 =?us-ascii?Q?56MtYesS8V0BJSbRYVVVLJSaHY6zyFGJvLAamMmY3GXSrZLprl2ufayEqBy2?=
 =?us-ascii?Q?mJE7nlNPJLQV3FVJbCBUbj+7yyFAqKM9/b6llTEFJcpfMotTSfba5InnyqIL?=
 =?us-ascii?Q?49A6X3Y99FwLFZnOq9HNyGZx22t3gOKzYkp4URARQA8NF+L37BciV7qvNxO2?=
 =?us-ascii?Q?C4XW5+TTdYWHOdOPIf/EPhcpNAsAuIsCdEs5iaPUs7X1iQP9Y0Nw7hcIttIP?=
 =?us-ascii?Q?IyFvB0DHnrlteSmRTaW7O20e60oboTGXSnKBiGHDa0KbKz8tsvM0R0sddkvq?=
 =?us-ascii?Q?xdCXQ69/iJiZQcV0ecFiYbrsD0IIvj05LSJlO7rNFTLNj6XOF8CDdMSZTKI0?=
 =?us-ascii?Q?2j3ADrv99oBvHl6ahBmUn3hfdbxd4+967ktQJm6JvuLbmhPycXtydQ25bSqP?=
 =?us-ascii?Q?Mqqm2b3vwk6Ahnu7YOYA47wrix+dqDOflZPYQlXPp0wIRbKkoaXpapSIXVaQ?=
 =?us-ascii?Q?XfiWwiuEYwDPwr++vr+bN+1NDi1P2aec8cAHF+sUQWD+OcnOl/xVA3lTyD+N?=
 =?us-ascii?Q?dshEdfHyNJub0u2bi1QBibnwxdiS2v+VLMsh6X3UD4ef6uQ+slIiFWT881kv?=
 =?us-ascii?Q?iv7PlF46UAxiL9+4GC4ctAfi+Kygqy6NW+Te4eoZoveqite8Yoy+G388HBJe?=
 =?us-ascii?Q?3HcBeGhBdT1s/njS/XKnYBxn/6RXxThTmVtfCfIMgzI09WOl1dQV/yHe39Fh?=
 =?us-ascii?Q?+eY8ImEL/+DgYJ4YyYR5kX9CYhedCpmN0Ds5Jv7VaabzNW0QA0pMwgrurwvi?=
 =?us-ascii?Q?0f8yPC0axckj2HZzLFfHjYsi1J34oGh9KnaOEC5ziEwHzVSDrXsh+6cHIrB6?=
 =?us-ascii?Q?XMbQshwVG8v5NI7hGXn84STuoZbxKsZ293IZIkLI8VFOOO/r1jeWKJmRM0VH?=
 =?us-ascii?Q?5YjbFJ1P1IAH1JZsFQfYZLI7XWZbUZxsJ1z7iqKNdk+RV5hR9i5BO9CsFWlk?=
 =?us-ascii?Q?QepZI58WiX5Lq19oiDN4lcqlrAWK0fCD1lU2uaE5JAryWLzVRgtDCXUSdzIY?=
 =?us-ascii?Q?pg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adcd3a1-a63b-41bb-6917-08de16021bc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 09:12:24.4548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WpxN6Ptv1w+1jobK9dcd1rf7st2+mS3Emuyn9DvvuUR11a/UoIxo1Thth+jFZAB3Tosv8xPtzValOp6GrrueNKn14QNqe/wvzsXLiPFovVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14072

Hi Greg,

Thanks for the feedback.

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: 28 October 2025 08:42
> Subject: Re: [PATCH 00/19] Add RZ/G3E RSCI support
>=20
> On Mon, Oct 27, 2025 at 03:45:47PM +0000, Biju Das wrote:
> > Add RZ/G3E RSCI support for FIFO and non-FIFO mode. RSCI IP found on
> > RZ/G3E SoC is similar to one on RZ/T2H, but has 32-stage fifo. RZ/G3E
> > has
> > 5 module clocks compared to 2 on RZ/T2H, and it has multiple resets.
> > Add support for hardware flow control.
> >
> > Biju Das (19):
> >   clk: renesas: r9a09g047: Add RSCI clocks/resets
>=20
> Why is a clk patch part of a serial series?  How are we supposed to merge=
 this thing?

OK, will split the series into clock, driver fix, dt-binding fix ,=20
dt-binding + driver patches for the next and dts patches.

Cheers,
Biju

