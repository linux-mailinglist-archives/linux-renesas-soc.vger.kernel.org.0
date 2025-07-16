Return-Path: <linux-renesas-soc+bounces-19566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC5CB07E10
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 21:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 540DE189A6C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jul 2025 19:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2824129DB95;
	Wed, 16 Jul 2025 19:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fgTD6Vah"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546D328F51E;
	Wed, 16 Jul 2025 19:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694572; cv=fail; b=bOC5djstjpo1lgO4MaNL9aY+ubhy3CBdFYKtpJiXCueVy0UdA9BultH2hwCyId2xeZcc7qpYE8XYB1+yBhS73v7n2QIjRINkRYEvbQrpW+hlYa3zrNmf1Z3eOmPuGIoTr/GQ0aScJjM9CAWvIajULyx0xHAZ5KCf5yAsQ+V7B+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694572; c=relaxed/simple;
	bh=O46a9wy5qWMgq0BfUFVnRYD9Zu1q2ofTMjIZfQ89qt4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BaGYXZs0XXGA++N9d6VvaqF8gABil7tNSdsLKh9d+z9/rSpAr+gee+GV7De+83Ua1Lqbd+a8HUR+BoJj8lH7P1TnMU6nOgfT6gi9yTufpK+fEIFovh6xRWERC2xbRuZmw9bzBKTBwoHyQ/FPYeCwNIL7mah9CVasxQYomEpi6v8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fgTD6Vah; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2ZROCi22lUcNBk7oE5L0v1DdCGzK56YlFUwpCjLCOwLKuHgeezyhp2o3x+KblN/r4qW+Wzt0KFnrpwYTy5q5TuJEFbfAmzycrPmVdx5vpD0+KVxCSZq31AHPy8MVP5vliGTuqGVMjiMPkXg7MOSl5TEoxA6BbGkW3OC6MOCZVWELswWNOx5lYsjKrEwfzA8n673FO03cXnc+2tFgUVnuQXFWwvNS86tXZqTyM1OJyoCjONc/wiboscwH3HV6KDTN8zngy0u6fpm6jqaZOF921XfA0yeHwwSmxGlXwO8cyACfezuvRNaWSnQqoZHSZJC0Ag7tkNPf2vEqCOr1My9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njrCuuOEQKkC1734G7drRPsq15zVRP9LqXDyg7ATCEg=;
 b=RmG9u4q5e1J/FWoLi7pNiLlE3M4CPUvOeBUB3Wz8+/rJGI3BKbjgpt0d/JRxhPTYrCmNAjjY+gkns3bb4a/A/JMJvva5ilm5/eNX33ViA7yq6h9vAPEsnSjUicSBEDCyVFygkf2FC76befIDC7JD+Sj3TjhEeO2kNfbnZ1b9rhBbDH+6lv6EsrgXamc0JEuf/FOKIFmUD3heFHnqwceUs954VroXBYGsHa9arxAheU3w+jP54pNvOdOlOphXaTvnTTksjsIYOqh88rdTiIU+L7uYqA/lGNbMgwNCT9WGiqXumdgHAijx73933MjvYrDECPBd7rP0W3BVcy9+Sc//Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njrCuuOEQKkC1734G7drRPsq15zVRP9LqXDyg7ATCEg=;
 b=fgTD6VahU+BWsxU8cKR7upCsFo6wtWsSGoGQgnnMJQ4JlP5UgS/SCKldPLh5yoU9uNWEAQmaFsKhmG23IUvDWEEIOxRhh78T3P00lYWMqsTcDIxivsfTQpGcj/jxSOqdpbTMYY8MVxcXfPh68gJwPasSx9v8CDTcx9d5ALNXjGA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB15815.jpnprd01.prod.outlook.com (2603:1096:604:3f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 19:36:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 19:36:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Thread-Topic: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Thread-Index: AQHb7c6+F2cIzXpCE0eHQabSLpoq6LQ1IIJwgAAUpMA=
Date: Wed, 16 Jul 2025 19:36:05 +0000
Message-ID:
 <TY3PR01MB11346BB1E39667EF627270C718656A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346F9BF41DA974F52CD4CB88656A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346F9BF41DA974F52CD4CB88656A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB15815:EE_
x-ms-office365-filtering-correlation-id: 5503a6a3-4170-4989-ed21-08ddc4a0016a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?aFZYcgvRhGeOm0j5xO+w3/yENYL8txd5M0SUk20Fk5MK8lT/pUFpASNNfT1X?=
 =?us-ascii?Q?4Vf6kDQTVgSXJbhLzGbhctpQVAh/LRF8OQnpqCFIRapxYPZREj5IYR2YkRZO?=
 =?us-ascii?Q?p7W/9RqiVBI/9y/M+cXC40eVXYp3c4OWkVCDFELumBZVHz2KIphHLxlpKXCP?=
 =?us-ascii?Q?myCkbD6RcH20csegPcWU9GxB8rsA+FKCsZVG3EPj3ZiC9llgs3hYhhYTJafr?=
 =?us-ascii?Q?n8P0u+XLtDbAMmTxrSK5cLLu85MZQsM24q27UYedPFaXZg17nwUgaNyWRsKr?=
 =?us-ascii?Q?WQxhePUKqepwDRgTIGpqjD1izJvyxCCmsyh/PaOoKxT53x9cFQGFBXUq9GrW?=
 =?us-ascii?Q?PhS5jcZOb2cWU1YF0lQnwOHb0NwEd72utBO3cEg1UKpcC1xDk9TfObmwodDG?=
 =?us-ascii?Q?kTGb5VhAn50R0iRk36KHZZ8yQm1/cxPB9t36Vj6M9Tn3dEzh8NKYJiejOl+2?=
 =?us-ascii?Q?b80A2PETv9KNFSrboqP3XceGsU90sSzJ20P1VY03LmeX3kYgC1NzNBox1VAW?=
 =?us-ascii?Q?7h1kX4UfkoMK1T6HdG7HO5JRiUeoZ1GZUuPba0DernOqnJo//EXwQ0zu6ZpG?=
 =?us-ascii?Q?CvBfzuUDXVf+t4QXFKxR0SeSotTF0K5l6cSPU8+e+aN28G/xqdxG2x28kSq/?=
 =?us-ascii?Q?92P83QLQlO/HHZ7IsFuifRkL5wXPBEF7t6pxVDO+px4r3C4EXwKPIxaRc6G6?=
 =?us-ascii?Q?EjRmSl073enuXboiRYoCamu0Aeyp5JMfg6iPmrpGjGD8JGeqKyM67I8yxR/l?=
 =?us-ascii?Q?l01Pc6UD7q19D+4BRqwN0/MCCvTum2mvYmtwMNPgeV7egaTtMfjlSpyttlod?=
 =?us-ascii?Q?N6QFkFs9juS+h0tQ9oGqDhEmljbTdGnp8er8jc63Yn5mP76HJjbTDKUCROTq?=
 =?us-ascii?Q?6PvxNiDLduxer9ssFofH5dS5acbMA+ga+hBqNChx8PkcHyeyrqpChg0rUlT5?=
 =?us-ascii?Q?yei/rTHTFi2hmsPaVMYMABCqWDPI82/vShXTsWJslkxPR4HyIyNnlSUJUiwR?=
 =?us-ascii?Q?dbx0HvbtV7ljDLADPFLHK+0SfahFlRe0RtsNQIO6PJbylIMXriSvORUoO66F?=
 =?us-ascii?Q?JvwH6UhftqNkpDmVlaDYsCbH7tqookFQYkQxFsbW3M/oSumdxH3Qlcyw0yRm?=
 =?us-ascii?Q?FnYTqlJw4+oWi4rOC0U322Lo/yBFrgQqrWrX8zXZuJuLoDUoBiyXb+hq/3Jw?=
 =?us-ascii?Q?Vyt9HYgEXFqdG5QPIogg83ny2zIVY6I0Lo5uUVlC3eyAqMp3QF/enuc4Wb8E?=
 =?us-ascii?Q?pNoxPiWeiDZNGjExRzuPnmW3b/7W0jBYSGAWIxqbIUMYqcKfq035SEax0vsH?=
 =?us-ascii?Q?NrIjKVkM1eRtPC3gTkAuf63wHY0dzT9Ml1SZnGydhu0G8wa+gml3uLMKfQzB?=
 =?us-ascii?Q?5E7u66djXoKzMeKpbga5MD26lkyXUJ3ax5LdJ9KbYIcT0tsMNw/iiI0NJb0G?=
 =?us-ascii?Q?EyiguxyIenSP+T1StoiwdmYN1fsNjtaIDJA4UM+usH2BgL9HN082f29VA1Lt?=
 =?us-ascii?Q?RWST+5eMeP2rrqY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xQtj9Sl5Wy4WovL0SDwud8eFtxDrjWgprzatMk1brD2yxQi/XICuWS1FhQvu?=
 =?us-ascii?Q?wmZ0Fffq119I6boyXQtX2lKnJ95/FPQ8GzQcMlvyqv86ZnhIIVbXQWGaL25l?=
 =?us-ascii?Q?WhtTmN2iNUxR/2HShrwRpEgWt5rtgEpD3fodxkb7DWjdg53bbtSnQ3KOqMiO?=
 =?us-ascii?Q?tpYmJOY/4Xb8xbwua5ObzZBeliXCdNg4MPid6QYh/vZIj82c45mloRbLSTFc?=
 =?us-ascii?Q?TDsxf9xE2Xwn+7Yf+6XbsvAc9X9DcKjq/ruO+2wmXfp24EOVgjKiseNDV0MW?=
 =?us-ascii?Q?TTas+STvUC3/ufLTGiN23zrhbGmJ/Gzkn7K3WP93YIRx+ARsMMVHC7hq1uWb?=
 =?us-ascii?Q?9w3zLdq0AmwF5+QCij5Bq2XaTKex44zxMBcD4eV3GusTi5NG4h3hIAZBlVkj?=
 =?us-ascii?Q?5qtfoVW25E+gP9YQ9xI+0jeP+DWwLTgjpsIVa2iNwXgJZ/kSjkYoJpDZ8/Bq?=
 =?us-ascii?Q?TAicFzdak/TWXomyQAey/zeOfNDlzQKZFWof3daoWJvzFtM3zyDZgyq86vnR?=
 =?us-ascii?Q?BFZtYH8jKI9rCOu1S8B2hRUpc0hLNiAopwsfSx7/4SUmUBcpUUEgqUHJPPok?=
 =?us-ascii?Q?eglMhVHCaVxCeflrItlj7MoFjZMLNq7J4gMiTE9IbScXD99JRAsrfn00Zkar?=
 =?us-ascii?Q?mtl4USmXbFBSKxYEF+ACazdpMMXmDy+utt1i9mXg57j6m2QMK5CTj+Xh/PFX?=
 =?us-ascii?Q?fTan/BHO+6zb82k9PCBM309hlxrOhkU86ckeL+Lr+GwUPY8kFWiFfEKGqXYr?=
 =?us-ascii?Q?Av9Zs7kwd6031hJNdmCEwbDnlqkw6KgWtYazced54brvYY/Eo6Q4H/wtm+QI?=
 =?us-ascii?Q?oLtiEHfwTw/oY1hAHGR7NlY+/2z872ysl4x1jxs7bFHn9hQfS2qKNfVoEedn?=
 =?us-ascii?Q?oUFTG0W4ZBl+m3HyZzN++Zso9rwfgCChlbSnCvKKpkf8x4b8RFtdXm2s7DUH?=
 =?us-ascii?Q?99+w2ih5iCRKhzasKJtjgrYkOnpcVbgkA7YE7WngjqiusowHSmIUtgBqfj0Y?=
 =?us-ascii?Q?gJKpCfDk8PZIP8+sl0vA3h2aG2Rij6JVsipypXUV/t2OdDTaGcBM1jCZl3ZU?=
 =?us-ascii?Q?ygUcfVhpDf+q0YE2e7fJVq4JdHcgo1cBzBorKFif9l+WxHz7zt1TQg9BAuQ4?=
 =?us-ascii?Q?KKbiQAMV9wsXijN+H1d3EcEGvloCA7esdXQzHI7nN3G+kK7CpRO/GaimI4Tx?=
 =?us-ascii?Q?Owj2MFOqxRqk/+Qe5TiPOuOkRdyWR5plWL5jbDjEYRVDABzLLh2LNoFHPBWb?=
 =?us-ascii?Q?foha/Z6HzbyjK9t9/s9WdMw7XwZMWMjqtFJe99XpMizrudbhgADEMJjGBUGV?=
 =?us-ascii?Q?kTFJmzu5QF5prbOOjjDn5g5MuYjss8kBp28lxUdyRA8cZS2dcUoAI23aMmEr?=
 =?us-ascii?Q?P11pNOjgVV+3sxJHCCa+1Zf5k/vITrGWDNLcA6V66yawFKpTl/MrTRstrK4P?=
 =?us-ascii?Q?trKNW2GTAnY8QXvrWDaZjvhJoyaevU9B7UHEqzHZZC0OL/rRMEQvvXHdUM8E?=
 =?us-ascii?Q?gpZsKP2xphAdx02WTojPSNRFY6Slgi6lxMa2cIbjd6Yrxuvyzeo/d7EmdFwd?=
 =?us-ascii?Q?lh6UA91mhjCsk1dQkfsDING6fAZKc+ktk792H13YvR3r2Z4Ayosj71SB54UP?=
 =?us-ascii?Q?dQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5503a6a3-4170-4989-ed21-08ddc4a0016a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 19:36:05.4038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EmpjU/B83SvyvvClL1tKoCMDrXLJiB+5/Rw9pLGW5TZ6AY2wm8bcjRd686QJ8bT2QHfBu/sBCvggeL0YPbnb9G9zHCTihNRrbej738aZkOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15815



> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 16 July 2025 19:20
> Subject: RE: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM su=
spend/resume callbacks
>=20
> Hi all,
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: 05 July 2025 18:03
> > Subject: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
> > suspend/resume callbacks
> >
> > Add PM suspend/resume callbacks for RZ/G3E SMARC EVK.
> >
> > The PM deep entry is executed by pressing the SLEEP button and exit
> > from entry is by pressing the power button.
> >
> > Logs:
> > root@smarc-rzg3e:~# PM: suspend entry (deep) Filesystems sync: 0.115
> > seconds Freezing user space processes Freezing user space processes com=
pleted (elapsed 0.002
> seconds) OOM killer disabled.
> > Freezing remaining freezable tasks
> > Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> > printk: Suspending console(s) (use no_console_suspend to debug)
> > NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
> > NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
> > NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
> > NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
> > NOTICE:  BL2: SYS_LSI_PRR: 0x0
> > NOTICE:  BL2: Booting BL31
> > renesas-gbeth 15c30000.ethernet end0: Link is Down Disabling non-boot C=
PUs ...
> > psci: CPU3 killed (polled 0 ms)
> > psci: CPU2 killed (polled 0 ms)
> > psci: CPU1 killed (polled 0 ms)
> > Enabling non-boot CPUs ...
> > Detected VIPT I-cache on CPU1
> > GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
> > CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
> > CPU1 is up
> > Detected VIPT I-cache on CPU2
> > GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
> > CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
> > CPU2 is up
> > Detected VIPT I-cache on CPU3
> > GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
> > CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
> > CPU3 is up
> > dwmac4: Master AXI performs fixed burst length 15c30000.ethernet end0:
> > No Safety Features support found 15c30000.ethernet end0: IEEE 1588-2008=
 Advanced Timestamp supported
> 15c30000.ethernet end0:
> > configuring for phy/rgmii-id link mode
> > dwmac4: Master AXI performs fixed burst length 15c40000.ethernet end1:
> > No Safety Features support found 15c40000.ethernet end1: IEEE 1588-2008=
 Advanced Timestamp supported
> 15c40000.ethernet end1:
> > configuring for phy/rgmii-id link mode OOM killer enabled.
> > Restarting tasks: Starting
> > Restarting tasks: Done
> > random: crng reseeded on system resumption
> > PM: suspend exit
> >
> > 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
> > root@smarc-rzg3e:~# ifconfig end0
> > 192.168.10.7 up root@smarc-rzg3e:~# ping 192.168.10.1 PING
> > 192.168.10.1 (192.168.10.1) 56(84) bytes of data.
> > 64 bytes from 192.168.10.1: icmp_seq=3D1 ttl=3D64 time=3D2.05 ms
> > 64 bytes from 192.168.10.1: icmp_seq=3D2 ttl=3D64 time=3D0.928 ms
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > This patch is tested with out-of tree patch for save/restore ethernet
> > OEN registers in the pinctrl block.
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > index 9a774046455b..df4ca897a60c 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > @@ -136,6 +136,7 @@ static struct platform_driver renesas_gbeth_driver =
=3D {
> >  	.probe  =3D renesas_gbeth_probe,
> >  	.driver =3D {
> >  		.name		=3D "renesas-gbeth",
> > +		.pm		=3D &stmmac_pltfr_pm_ops,
> >  		.of_match_table	=3D renesas_gbeth_match,
> >  	},
> >  };
>=20
>=20
> Gentle ping.

On the patchwork[1], I see this patch is marked as change requested.

The change is in PHY driver[2].

I will send V2 with collected logs.

[1] https://patchwork.kernel.org/project/netdevbpf/patch/20250705170326.106=
073-1-biju.das.jz@bp.renesas.com/

[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?h=3Dnext-20250716&id=3Df25a7eaa897f21396e99f90809af82ca553c9d14

Cheers,
Biju

