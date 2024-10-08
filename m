Return-Path: <linux-renesas-soc+bounces-9606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8279955B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 19:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1D7FB236C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 17:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC8420A5EB;
	Tue,  8 Oct 2024 17:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="P0BWbHy3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010014.outbound.protection.outlook.com [52.101.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144621E0B84;
	Tue,  8 Oct 2024 17:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728408842; cv=fail; b=EvptGz5ldkgYGdHLVFJEISnVsntqyI2G2qX5rRdGO8Z3JGR1AYGblgD4P+xWjOtVb2YQM3ZWbO6fsUbH+0Xw4fKwVb2mk5NBH9vcFXrnkVg5FrNlQoW2JsDE4WMb8iRu+puv64TX4U6XV6KjRiqtxu1aOa6YAQhwTTiZ8UpUhcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728408842; c=relaxed/simple;
	bh=n11tfYvYz4xTMuM5j6M6S0kXOvt1Ix7+NbIMhkIBHjs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HapacnjHFCirPof9iN2upQzo6J6r1lbDhCl/pvHD3m6YjUOopQoRsEY4D0Q+wDZWo1I65haF+Pkiqd/RfBQ0Wqke7LS9pd7nN27OUBjyytLcoiaX2OI8QSqm2J2W90epDbosMXlazKiGQFjsJWog2c+PhKih0bbMSOxns0EtekM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=P0BWbHy3; arc=fail smtp.client-ip=52.101.228.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=af+j0IUVQJf29gl5OthGvZrC9eztJADoLrjOJ6mC7SuRVw5FL8S4rQA214pdzihJo09vvHZ9DJn4Ud4sYYy09V519SYu3mIX1dgxc3FTxoUX9XpaLT1snRwASaFB/Iwc+SxPojlhWDGfgpAq7Q7GhuBWj3xE02bJHmnHQhXX3P/20IW6/bKD/MjDKLEHOag3vDpR3x0rWMaWinaGnrejGWZ00RzZ16g2qXZm2ni+o767pJO+StRQGabF5iXSllTBhymdIlFMuGu45owir86mrGPVCBRvV1kCQScj8aalAhk2svshNoKqUGoHHFukeFXX2NS1j57KBG9C++wRlyHDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IR5WQwjp2beAK2UhSqUYh0j+iZCQjXMQ3ngbPfeFay4=;
 b=W4tC5G0/x52O0AlW3b9sbPAHAAv6xhqhb7+SK+p0e9LlMkot4BdiJu8OF+xxkhQIb9mn+ITuDtOyuPNQJ5MbOtY2f4uEsabOEuzBEYPYR7nxS5YvlFYIMwjuvSCBVn6Dh2CcP0NaxVNmM1iQDPHtQ0vYrZIuYyvdUd3Y9i7yvKDFRnRo9QhNYUAJVdQR17xOmJUT1Ake5q2uja5nhbv2nYeh0Oc3qpMqI8WXwCvWYeSiY0T58S81OB241ZhqC2Vg1VL8MJRY+GK82JHYNPEh2FWRDMkQtRmxRhEiEgkgs5MIydbX/rwV/rI7I00xsgTvyvmKiA6k6C8akseRRMEz2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IR5WQwjp2beAK2UhSqUYh0j+iZCQjXMQ3ngbPfeFay4=;
 b=P0BWbHy35lH1PW6xiTvhcz0Yqaha+IOhNDGF5Qq00yCgVkeAz6CB5Sx/OlqPI7bl6w31Cdqe7HR/WJaKJXvGIXhQmRX8M5t0aa7p+9dNdA2R3sdJxrlRVjDrOOF1SgnTuLh5TBfg6ug88eKJJ7qOQXYAbb1BlcjNR7afVfQZl9c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10763.jpnprd01.prod.outlook.com (2603:1096:400:297::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 17:33:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 17:33:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Prabhakar
	<prabhakar.csengg@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
Thread-Topic: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
Thread-Index: AQHbGaIZmx0KhA/2XUiyPZAzZz+L/7J9FRWwgAAGadA=
Date: Tue, 8 Oct 2024 17:33:56 +0000
Message-ID:
 <TY3PR01MB113469ABB6393E0A6451034A4867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241008164935.335043-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346A1726BCE1687C6AFF519867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346A1726BCE1687C6AFF519867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10763:EE_
x-ms-office365-filtering-correlation-id: 40fb2af0-3916-4169-deae-08dce7bf62be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SBGW6zpWg6bY4zt1pUcfnhLt9Qv+pnyrhzzW7rLUjGn9nEV3ZiRVsTKk0/bJ?=
 =?us-ascii?Q?Xc539YjNQI3DeU0H3b+npHJ8trqw2GbzgZsgiJUS+AdaN7FejFtjJ2QztQSp?=
 =?us-ascii?Q?JZc0VnDd/2z5U7ReJB0QY5t7740zdSeaFeOy7brdv6UK5I5/Jmduk25TOzXO?=
 =?us-ascii?Q?B2IDce/DmwWO8MyXb1IUElhfQz/ybSRrUvu57cbpwZeRHAEdc/8ZJ6PMLH8w?=
 =?us-ascii?Q?0f85qrx90QFzQ2zSrQQLBqZwidh+GKc2lksusBAJ5eS8g5IkkK2Q7bNx55Gj?=
 =?us-ascii?Q?iPmN7JR9nz3xjUDGi2o0zTtuvR7yQzcd6z8J6mbowpbL7BY8Y3JYh1IKcis3?=
 =?us-ascii?Q?zFjDAg+oyI0L5lsOgajojuDn1ZS01wxzyyAZAUjI3DJ/fJpFtKkBYCtZ+mkH?=
 =?us-ascii?Q?hbdOJzOgkv/Aaq+RiJFwiXdiF6g1HbZCBgfXLajYpOSx3C9+cc+5ljUiwpqv?=
 =?us-ascii?Q?P1H+IdtsfjelGpdHb3NM/XWN2Qf2zo68MPcQie6dKnt3UOhniO/XydNenYCm?=
 =?us-ascii?Q?eeSkV1rGrVeiBzOH56iwzzqCfk6UaqchiVPI62vaNJkMz5tgiaXD6l8m0oWX?=
 =?us-ascii?Q?ibCDvCnb2jvPGkDljIiX8/81pgrvPbAauBT8r9D4RzgIrxJ8Xf9deFfIRIbh?=
 =?us-ascii?Q?lzStziITlfgOd76pEqNnfmt+q7OX8vIoDC8EZC0UVhv00HU1dKSt22MpqtjG?=
 =?us-ascii?Q?DzEaFR7SYzEtdEdxaxV2JWFbI7wDWmu5zDfZ51U8POLGyOrPBASCSWNU0qeU?=
 =?us-ascii?Q?P6SF+YrqGaJeohexqFaHosE+9wJkAohkY8hqWQ4QHyvF2lwg+CeEnKSqkW6n?=
 =?us-ascii?Q?GrRAJxxVANRp1b8+AdJ3Xz/H/6DePUB6IlOTX52caDhMKAifjJahNnhBwoVn?=
 =?us-ascii?Q?9exG6Mky1OTkTZ1OIL72EcQOuEQu4iaiLCKP2eAEHnUDmq+C6iPDAz7IVkGA?=
 =?us-ascii?Q?zVHyaWHaUiIAaVXZRLUvL7h3Py3hpc/FsnkOLE1rYogOofh5Sh7ZgFU6ZAtf?=
 =?us-ascii?Q?ERJNY7VETAMtuYVhjBHqrZ5e1/mzW9p/mpbML55bF65VTCRpd3dYZzo4/kZ3?=
 =?us-ascii?Q?CJDNTGng5dckMejqQl43iunuqh2vASYPVaoybf3oavCwRnnHWNpgzhqnBpaN?=
 =?us-ascii?Q?pqD45XD7+QgXDledS4hEVXqXiY1hUDElZgSzS2CafKz7TUVRtzN2cPIoi6OK?=
 =?us-ascii?Q?W8z7/pWBNJgraSZHhzP+sxpvCcHhTraKNAAcNvSRcqwle1T1xc485XVx3w6g?=
 =?us-ascii?Q?FX3i94MWKrRISThDghvJdUVlXehWcnGxNhxRYjs2L2TJgJzAWHe0taZiDJZZ?=
 =?us-ascii?Q?jBfSBXdz2GfQdS0gJlGIGh6Ac8K9Mq2YFJOhGnecbw75EQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mKsYMUYQGSHJBHoEzXtIhha7gA04KC4qPzdbLk3hBH0JzSElhEFD8d1Py/Wi?=
 =?us-ascii?Q?MqErwfqbdvQC7mWfaORnmH5HEPUiX6T+N6DGuLCM3dAIVlotSJ6KxGIptBox?=
 =?us-ascii?Q?ze4/iN0s1YgGvVSNY3z7ZUzx2wRypEDCl5QJxsCoQvZAIfzv+uwYmhs01EWj?=
 =?us-ascii?Q?M6kIdMCykmEKtC2yQRDSR8Rne0CeZsCcQGB6p3Iah2+OTa+DGvCBdh5sRhXx?=
 =?us-ascii?Q?ALURdlsPM6rbFtp3Or94SB3u/aVr+S7KWVLeyViZ7rNcwhnn4gE24pa8z9tn?=
 =?us-ascii?Q?sk5omO/mNBMCmoNArMcPQnsxlAB2yH4YOT/L0xHGpkmg/yoS1JR27g4GTsBn?=
 =?us-ascii?Q?WelyLe6jaPAVawh7BIEZQqbAOoatjH9T1gPkL0KA5nxZ2JuJHLyqYPCYuaF7?=
 =?us-ascii?Q?13FIXdS6N1XIP8KfEZ1b/ceBVjk4TPoppe/SWa2fxTZQX+GV3xUy3ivIMv/y?=
 =?us-ascii?Q?+m5dLz7WIfDaIFUaBzw+B26LRUb9zM00Saxca9ykXVOfxaxYkOHmS/w3R172?=
 =?us-ascii?Q?yuOdT2r5w0In1vmvz+81Vpsw8nAkGK45Tp9F6igzDEIopEtD5GSt5v37w41I?=
 =?us-ascii?Q?lcySn0kre0ySMc4DkEcB48+TN5FjjpFzaMBGKE8aEZ6iRsPQyMBdeNivTV/P?=
 =?us-ascii?Q?xXyAQ51y4mgQjGdth3AP4zC7dzCmfhwOZQQy+WMyKQhSZrBwN5oO6I6cFrX+?=
 =?us-ascii?Q?OkkaY2ttUPGvaP9qTcBlRM7MY+naHMh/rbFGLcuy1SQxChnJT5sxmfSJhWRC?=
 =?us-ascii?Q?ahykDmQLrNeLJlUXPOA5zGo/6TkjQLMT1cxzemjZiSruZbtK7yVuKIxouwhX?=
 =?us-ascii?Q?qG/UrP0+ewHTwfF3Eql3xv5j1Ejtuair2wBlp7TjIkouYZpjgQ9Cmm/qeqXy?=
 =?us-ascii?Q?LVpethC2SEupt1s/T4XU6OXHhh54KUN4y/IHektfRxNkCwgWsLj7jWI/5ynU?=
 =?us-ascii?Q?jsQGUxavVob8zwYr/ZZEfqChbt2zz951RUMeqoc5etD21lnubKGiOdmGsDl4?=
 =?us-ascii?Q?eO5neGLQTsUp0Yj4PrPmqxj4svGCMm2pSt7dfYUbYGMLroRDKoCSKIvUyirU?=
 =?us-ascii?Q?emVfI/gdiqT0PJxfCT3C7XjomNesORG5RbHRK20DNyxjjo7K313nC1DXJmxw?=
 =?us-ascii?Q?93S+2Etmg75r25PEcHEhR0vfQLSuCpFoEagmfeHjSyyVRJEQUM6qD1zqrl8H?=
 =?us-ascii?Q?A1vMq9qb8cYsyiaD9jVzU3CkJi/luaPnHgMqbmYmCld8qk5kQBkts27wxAUO?=
 =?us-ascii?Q?TgZ1pTjXt6vI41LaBaRzqMh+PAD7r1Nwgn+4Ki7m/YEF3cJmLh4p7NzOeAZC?=
 =?us-ascii?Q?eRxRK5U6EHSENYPSBjr3obcUMPJZVn91uXgvmy6lZMouTXkpSMSmwszwl52v?=
 =?us-ascii?Q?iVApRnCkz0Axch3YCkwyQTMqphaQQ3n9JtBGJK9YhUFNtoDK41mWiMg6tPZH?=
 =?us-ascii?Q?XcM5ihFPD5VY3h+cWmTlHUI/bUMnKVhLqidFWuAEpYZh7dyTJB3wtg/6g6ym?=
 =?us-ascii?Q?lybEPSIt/9WFIhKJSZQOnUvAfXmwjU9OX4xMzNFjDgJuY8QUaxKcg/MbXMeW?=
 =?us-ascii?Q?LpLHSMW5RtRYKSulIbhu5pd7OLFe4BAgN2J3fFBJJqaXCZXBY1pVlUrSQqSd?=
 =?us-ascii?Q?QA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fb2af0-3916-4169-deae-08dce7bf62be
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 17:33:56.0941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a6XzGG6pqqg1WS3Svv9WUwek1WJ0SD9IMOyUbhlhbcBhZTXldqhEhf1AMsxnsk4DzRbLJeHGv96qvGkfzNLDjeWTx01KmFndjisDER8f758=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10763



> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Tuesday, October 8, 2024 6:19 PM
> Subject: RE: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
>=20
> Hi Prabhakar,
>=20
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: Tuesday, October 8, 2024 5:50 PM
> > Subject: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add OPP table for RZ/V2H(P) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Set opp-microvolt to 800000 for frequencies below 1.1GHz
> > ---
> >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 41 ++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a09g057.dtsi
> > index 1ad5a1b6917f..4bbe75b81f54 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -20,6 +20,39 @@ audio_extal_clk: audio-clk {
> >  		clock-frequency =3D <0>;
> >  	};
> >
> > +	/*
> > +	 * The default cluster table is based on the assumption that the PLLC=
A55 clock
> > +	 * frequency is set to 1.7GHz. The PLLCA55 clock frequency can be set=
 to
> > +	 * 1.7/1.6/1.5/1.1 GHz based on the BOOTPLLCA_0/1 pins (and additiona=
lly can be
> > +	 * clocked to 1.8GHz as well). The table below should be overridden i=
n the board
> > +	 * DTS based on the PLLCA55 clock frequency.
> > +	 */
> > +	cluster0_opp: opp-table-0 {
> > +		compatible =3D "operating-points-v2";
> > +
> > +		opp-1700000000 {
> > +			opp-hz =3D /bits/ 64 <1700000000>;
> > +			opp-microvolt =3D <900000>;
>=20
> Not sure CA-55 can change voltage from 800mV to 900mV??
> Based on Power Domain Control, it needs to be in AWO mode for changing th=
e PD_CA55 voltage.
>=20
> The manual says OD voltage is 0.9V and ND voltage is 0.8V.
>=20
> Is 1.7GHZ is ND or OD?

{1.7,1.6,1.5 GHz} is enabled when VDD09_CA55 is at 0.9 V
and for 1.1 GHz it is 0.8V.

Maybe when you do /2, /4, /8 using dividers, the voltage may be still
the same??

Cheers,
Biju

>=20
>=20
> > +			clock-latency-ns =3D <300000>;
> > +		};
> > +		opp-850000000 {
> > +			opp-hz =3D /bits/ 64 <850000000>;
> > +			opp-microvolt =3D <800000>;
> > +			clock-latency-ns =3D <300000>;
> > +		};
> > +		opp-425000000 {
> > +			opp-hz =3D /bits/ 64 <425000000>;
> > +			opp-microvolt =3D <800000>;
> > +			clock-latency-ns =3D <300000>;
> > +		};
> > +		opp-212500000 {
> > +			opp-hz =3D /bits/ 64 <212500000>;
> > +			opp-microvolt =3D <800000>;
> > +			clock-latency-ns =3D <300000>;
> > +			opp-suspend;
> > +		};
> > +	};
> > +
> >  	cpus {
> >  		#address-cells =3D <1>;
> >  		#size-cells =3D <0>;
> > @@ -30,6 +63,8 @@ cpu0: cpu@0 {
> >  			device_type =3D "cpu";
> >  			next-level-cache =3D <&L3_CA55>;
> >  			enable-method =3D "psci";
> > +			clocks =3D <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK0>;
> > +			operating-points-v2 =3D <&cluster0_opp>;
> >  		};
> >
> >  		cpu1: cpu@100 {
> > @@ -38,6 +73,8 @@ cpu1: cpu@100 {
> >  			device_type =3D "cpu";
> >  			next-level-cache =3D <&L3_CA55>;
> >  			enable-method =3D "psci";
> > +			clocks =3D <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK1>;
> > +			operating-points-v2 =3D <&cluster0_opp>;
> >  		};
> >
> >  		cpu2: cpu@200 {
> > @@ -46,6 +83,8 @@ cpu2: cpu@200 {
> >  			device_type =3D "cpu";
> >  			next-level-cache =3D <&L3_CA55>;
> >  			enable-method =3D "psci";
> > +			clocks =3D <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK2>;
> > +			operating-points-v2 =3D <&cluster0_opp>;
> >  		};
> >
> >  		cpu3: cpu@300 {
> > @@ -54,6 +93,8 @@ cpu3: cpu@300 {
> >  			device_type =3D "cpu";
> >  			next-level-cache =3D <&L3_CA55>;
> >  			enable-method =3D "psci";
> > +			clocks =3D <&cpg CPG_CORE R9A09G057_CA55_0_CORE_CLK3>;
> > +			operating-points-v2 =3D <&cluster0_opp>;
> >  		};
> >
> >  		L3_CA55: cache-controller-0 {
> > --
> > 2.43.0
>=20


