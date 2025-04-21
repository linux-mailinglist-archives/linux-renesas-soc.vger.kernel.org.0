Return-Path: <linux-renesas-soc+bounces-16195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 616FEA952C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 16:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B3423B3314
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 14:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE619126C1E;
	Mon, 21 Apr 2025 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ef7CMLD2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7061D647;
	Mon, 21 Apr 2025 14:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245830; cv=fail; b=utiOXM1yruAyYwPhb8n9bwK/jdTW/ICUikmV9OYMsRwdIYpRpRiYfjoTerDK9RS7qvS5oXG/jIlcCjrrko4yT8jkLjfMOFBVMToYv6xDQUOjAhgRSdwkPnAdyiiOy5tu40iSBqW3vEYsWG4TmrmHwambsGFql2Uebd1zQh7IC+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245830; c=relaxed/simple;
	bh=bMfQmIu4BJtmmZ2orqBz0cpraT3mI3qlPnGRhhHcHC8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y/DDcw5J8DrnDNTwtkIrmCiWQ/EJ7j4IqI1hS1GbD2EPXmdgZxncIUCphJtub1N5KvxP5n7iDYzpiDnb3Icm7YG6dnrdys7Xw0nyJ4Poz+Suk3tsnPBd6mc7aTLiUBTn4p+/FXYE8pAiCuzDFgerw6aDmqGcc+MGjFch8g1WFfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ef7CMLD2; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOruU2AIMM8Vjql3rYcUAL2hBwMIZUsuOYxoyPBhLjCgWl4UIDytRGx2j18z5dBNv7sqWe1QiKhikApL4QgPyHlz+6I1IGuADnbbG+QLiLHqu+sy17PxP+ClZrNl49QETtAzuV8Kl8O0x51Z0SYjVXpUwF+NbtBkYOB5JbPgowcymwDgnBM2mjErVvbyjtX7jzGNYWT/TXANtz9xVD7ZZXunAqW/ea08qiy6Wl72nijXpqlJl95I7dPQkD5cd5jqXdNCi1pMkAjmALO3hwk5K2NLr9ViqD4f7m34gUDQ2ABK/wsud0avaViMZtovwji/l6s5+f8TGIJXnbBWfmDPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMfQmIu4BJtmmZ2orqBz0cpraT3mI3qlPnGRhhHcHC8=;
 b=N8AvLOaWxkt6HT3u8tgIEj8gNYuKLOih4sbHddYxg16gvVGXynk7h3lqN9yflqgnFp2HHdwknrXcypVDdeGWh1+QVBbP/aOBAR9Rg8r/GX2o20/SNDQxslqK+eSTrm9FmatNIETDIlEZTdKeo3F3Ejn9+8T+nQenknis+iv4kZ8ZdFnvJqcHvuCiN58FK7udfG3aKNvYYD7um3pqWJYl2rhStHwgvIXYLS5BOMZPiaiZU08JqimeEQHREMGCRKbufANf5z1mjseDDhjRB0KtNE1kKFFjByL+vKTwF51PM6L+xWOaXan1XBLfFnRlwd0d/mHUG+1fQYPljoszlqb70g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMfQmIu4BJtmmZ2orqBz0cpraT3mI3qlPnGRhhHcHC8=;
 b=ef7CMLD2VaPo1iWjzZPPz3L5SadmbW8EAFMmeAadPGcgHGSG62QTzx95y0ygxFtVnMgjNGoH0KV9hpOZwJxJDcVvw9odIeFlMfbwnGNs6s1w0gBHR+h7EQglCFpZu1xLSMJ37an2/6hXaznC07hzN570BNfBVJAlWWUn4wg4YbY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9771.jpnprd01.prod.outlook.com (2603:1096:604:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 14:30:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 14:30:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Andrew Lunn <andrew@lunn.ch>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, "Russell King (Oracle)"
	<linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
	<richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu
	<joabreu@synopsys.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Topic: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Index:
 AQHbp7UXRdTsn2oCYUWD5qYhUQGHu7OjbUQAgAAVgQCAATLSgIAJgP8QgAAGBICAAAEN4IAABoxg
Date: Mon, 21 Apr 2025 14:30:19 +0000
Message-ID:
 <TY3PR01MB11346DD203DEE8A30F1963DC886B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
 <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f27b0531-11dd-4074-9c79-172953d28292@lunn.ch>
 <TY3PR01MB11346FA4767B74B2CBB2CAFB786B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346FA4767B74B2CBB2CAFB786B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9771:EE_
x-ms-office365-filtering-correlation-id: da74ded4-e385-496f-815c-08dd80e10b2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZmcnMk0WeJbo1FsF8C1j0JqQ0jHzYhoZYnRevKI407eiC2BnMb2cagWBt9IS?=
 =?us-ascii?Q?QXCUYfFNkpViJ3Fuxawk94JxuEGN2rpytP4jxDy6Ls/qe4h9/tLlS8C+sF1h?=
 =?us-ascii?Q?lxh/E09iA43xV/vIIQ1oaeQ1HV4fwUYDJOTbRwRNFZntbIuS0bVI3CLplFYA?=
 =?us-ascii?Q?Yl0h462L8rIPGIHWIRKdVNj4lO3idRhrY3R53FNkTWdGX0udRPzmWaVgZwAv?=
 =?us-ascii?Q?MMe3Rvg7l7j3nPrJoqcZZ8kiteU1NMqLTeR950rUwKNBMPTlKMpY6lBs0on/?=
 =?us-ascii?Q?x2Jbc8WyMT2rxOLUmCpnOVkVJfRrkCgmLpYcFOt5RRnXrrlcs/oFRxXnZGsW?=
 =?us-ascii?Q?hvH14w8NFiHyclbKL4zr9bhIZ9HsreVRP/Gjp2H0Ul25mQvhFvLm8N3096i/?=
 =?us-ascii?Q?gVHHdwRJcZ78h3vm4QBbmQGvP+hc+V1glXv6w+6vmgCUqrQioX0qak901poN?=
 =?us-ascii?Q?01oiJXgW3tUj+DmtnX77kGOxI+UQ25X6elq8WdFfsr1NtasKRXYASZp1p5Uu?=
 =?us-ascii?Q?fdteJQ7j97U84gPbbgnzUDnSZgdvhdV0uoVZ5X5rJHjhruTCb7gJ7rDGzuRX?=
 =?us-ascii?Q?CWU4YNOLuHmTSdsDzBCmYX/zvoArLEi9DAX5YcNDRtrngkoObUEWcuWtLgs5?=
 =?us-ascii?Q?MGV8Dv6D8datIRwnRziv+hwIl04jNiUWl+2kUVm0hpFvQx6riFkFYgTYMqqP?=
 =?us-ascii?Q?nr3yHJe77QDm92ThNWxv9Fu4SopVMdpwOoPJg7b7f+AM1TKFtzqT/DA4x/Ra?=
 =?us-ascii?Q?VzxCBYTtjC7n+0/SDIwwPF9/e+WdFVnvRpDbNkaEcKn5z8NgSD8bHWd3R+zy?=
 =?us-ascii?Q?ZgJ9YjGgPbEHxuCqBXVjAFP87b3QDYSqKqLvHTQ/pC743KZ3Qr+GeqbAFCaW?=
 =?us-ascii?Q?KAmRWlzO9hhmiMHeVLhclM83DMuEPAbDuxFqjImZ/ZBotPmW0d/kvxDuirFo?=
 =?us-ascii?Q?QIkztObhoYTVDph8A+ZFhsFLiNkzHCdzu4b2GB5FyXY+N0RoR7ETpcuiGBU1?=
 =?us-ascii?Q?k70iP8wKt/+pEDwnQvWyMxSF4EKwSTr7MzjXIGJE6jSnEOWODLtwnTMX2qHY?=
 =?us-ascii?Q?ydmfz7c4rPtyvrR+sgwvq8MtzHdm3cNAvOgMxn7lkm+ArXw3EqwGEymQr5jy?=
 =?us-ascii?Q?vZrlWFUqO1HnQh0EdpHUkKRs21Z8LYFvTqCFeZLgCfivL2nUMjufYI5Atemg?=
 =?us-ascii?Q?kSfD6XUsxZOxVPqiSSh+9S2cGG2XRbw+45zM94sbnYVjjT09H1psq5q7PMvX?=
 =?us-ascii?Q?UQ90i6liAr7aOx7qQBZ0EBj4M8DT0LMJvGIhAxte6irDvvOnWMrsSCwABAeo?=
 =?us-ascii?Q?yqrDAqqFTY7OxQaBmym/8R9B1tg/fXZFLXLILd8dtkzDgJgipjn43zZewolj?=
 =?us-ascii?Q?gxaRmvAv2cmviSFUzn/bHjcNUSl3+V1PwrTcpcrK9x02f4Isot1apZcJ1ANY?=
 =?us-ascii?Q?Wyln479Cl/iojRvkgnW6Ahdv3iI+RH4z25/3+n1nEEtMFeqL51mfeQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?71LcgRzd+w1FmcR6MhC22aC08B9qOv7lnRXHSXLg1WSv5g8I3iUWDYNzBBTn?=
 =?us-ascii?Q?BSRbPIDEsjjgjNGacgeyuOwRXn4cGl+taZXvQIenmKKfgvo9UiFNpbMDVLKZ?=
 =?us-ascii?Q?z9/JvauiMqbu2Er0yrd23fPvfi5+8DGArE/MQwhdL/zNddW97x7tZPLzrXeS?=
 =?us-ascii?Q?2S6cwaKYDT9ZSoJTNoaS0G7fwNyInkIjvzznaczZvLrDa/0QqwdAy66UMKpX?=
 =?us-ascii?Q?COpTmfs/edBU+5D6ADyTODUM/eZcXnfPgGhZnTWV0+Z/ZJ/4MUDAB16hjXVL?=
 =?us-ascii?Q?UvQmAUxypoI4oevRPvbaStx2QA0EftkLEI3Z9UWRG8xuXBo+TOGxp9T3jPWR?=
 =?us-ascii?Q?RDP8dhSDsbSBlet3NJq7sOI62T3zkJoNqKadivNJ70MCHcYVDyr1A5/qPQx/?=
 =?us-ascii?Q?YrzmNLfecS0+GzaPKzi2dB9geSQi15L6Taf4CkXI+tgSHBivPGEtdqjm2aiT?=
 =?us-ascii?Q?9EgoO2nDxlWyQyLZ0qxwUmDuQrw3C0/mgR5dW8HiUwzaNW+0tbsnkiDdOFgt?=
 =?us-ascii?Q?NA25kaoV/hZbapkn83ZZSXAkQJozzhAr4AHd7gIbPmHlCRXZOcQv7aAVNuKn?=
 =?us-ascii?Q?cPhFv5G+bzrKgoXbb8pCYX5Gicikz0DmWDL018wW5y2wTbSTUUGRG5CmaXWi?=
 =?us-ascii?Q?ekmN+56Rr7p/QbNHwyAjcGH9PXfWSxTKHuV2orEG2qFVOc0l4QFidCl1i+SY?=
 =?us-ascii?Q?VF9GDqCndNTyo0w8Rff8KfFRJv+yOsxvpBKmqHLMcWovoeUirauSf6/nkf/V?=
 =?us-ascii?Q?8jZWLHkeeCJgQXyYRjmvCaDAzFvkgO3UVgReY/MFVv694ViwZj7HaveHFePs?=
 =?us-ascii?Q?e4pM2RF/sPpj83p3uuQA3Osib8AIt50f6Ezkmuv2cSNevoI6Vx8KXmya6m5K?=
 =?us-ascii?Q?ioCGxwlGo7RnhI+J9AwiO1pMisvSN7x5p8f4hiCtaeGSPH7zE69Z5fpI7NX8?=
 =?us-ascii?Q?Z8aDqYwAj5vf1yHgF4qhD7+UXwn9htvibgqxhNzDMSXh0Xl/F0Nd4ULrTMff?=
 =?us-ascii?Q?7Zwl9cys+iTFr/tiqSP7egj+Doq4r9ZN4hRgqdd8tbnwmWW4WtrZePKu6WLy?=
 =?us-ascii?Q?TPF6jWNH8bS5UZH6FTQEZhIFxJFYh0Jl3FQ9pzUfReAePzHNcMzjoxv8uwa2?=
 =?us-ascii?Q?0KmhgXDBzDxBkTEQ04KRRQ+slyXOXGD5CcgkJ2GQaXyFOQulLj6h+9gBqHvO?=
 =?us-ascii?Q?Fhv1nZbrWubabScxhyemXxOwsmLdrvRUzzc10WOrv/nrXsALLz/zfMwj3bk/?=
 =?us-ascii?Q?9FtI4vVz3PHooEV2LlwjfS5744Wopv6nSxvz8GD4+nxkPo6r6enMvdm8hY9t?=
 =?us-ascii?Q?WGVHYKOS+3NOFAssMJrBU8YWU3ygEQtYTKiqBuP22nUvN45p5JDUy4ZomSwk?=
 =?us-ascii?Q?2j2TLwgPeEKnsM7Eje4j5DLrq/31IOIsyt5UQLKLmDNIKRjTkEoeRR63nr6o?=
 =?us-ascii?Q?WTGNlN9nzTQ/JyTHe4rYjqzQ2R19FvjJPO21mTfMPT2lwtmGYviTV1Xwzot9?=
 =?us-ascii?Q?QcMknAz8DPt3LeYY6HQ1Z8i5NQ8Pp0auKQT0FxHGFsDE396GNa7SboWX/tFv?=
 =?us-ascii?Q?BHqOxk9hMs2CB60LUZlnMuGwuwT6MelCDW7XLO8QmoPOZfhoTNrY819BD2tb?=
 =?us-ascii?Q?Yg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: da74ded4-e385-496f-815c-08dd80e10b2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 14:30:19.9632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sCPSJjYo13nVGFsqWs2PEVIPb5kbbwUgeOQkBRVqglflf49HG/i4p2GzU128fKIt7qbseTqV/LHajTY9yN0m4mP5VraAx4a27/QWXUZhmVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9771

Hi Andrew,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 21 April 2025 15:22
> Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer fo=
r Renesas GBETH
>=20
> Hi Andrew,
>=20
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: 21 April 2025 15:02
> > Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer
> > for Renesas GBETH
> >
> > > > On the RZ/G3E, the upstream support for testing S2R is not yet in
> > > > a usable state. So for now, I'll switch to using init/exit callback=
s and drop the PM callback.
> > >
> > > FYI, On RZ/G3E, for STR to work with mainline, we need to reinitializ=
e the PHY.
> > > I have done below changes on top of [1] to make STR working.
> >
> > Can you explain why you need to reinitialise the PHY? The MAC driver
> > should not need to do this, so something is wrong somewhere. If we
> > understand the 'Why?' we can probably tell you a better way to do this.
>=20
> Without this change bind/unbind works. But for the STR case, without rein=
itializing the PHY, even
> though the IP link is UP, I am not able to talk the NFS server or ping th=
e host properly.
>=20
> I checked clock/reset before and after reset everything set as expected.

Typo 'after reset'->'after STR'

>=20
> Only change during STR is, on wakeup we need to restore direction (MII/RG=
MII) of IO block for
> ET0/1_TXC_TXCLK (IO attribute) in the pin control driver. After that look=
s like PHY init is required
> to talk to server.
>=20
> Cheers,
> Biju


