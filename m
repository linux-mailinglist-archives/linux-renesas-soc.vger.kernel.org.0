Return-Path: <linux-renesas-soc+bounces-30886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCyvMmYt0Glm4QYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 23:13:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A0C3985FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 23:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D11A330058D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 21:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302A737B3FD;
	Fri,  3 Apr 2026 21:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TrzFj1O2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5FE2765D7;
	Fri,  3 Apr 2026 21:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775250788; cv=fail; b=YmPWZYpSYcfJH6fr33mrQh8RkDiuBTJC5pRW6N9B4AD/9NdftbMH6CKm7V5VINVJrgHI346HU1JK1bS4cIkaJYpg6ceFhy4zB1MYMPNKAgkgAYNellS+ORv4OWxghN6mKmyRUp18lBK4l7WKNyudIrRIq48lfROn8/cdt87p0TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775250788; c=relaxed/simple;
	bh=opdz0V9mJL4WibWZrrcdrq0WCb1Xzrs+Zf2ieULTbBM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZnKZF0xkhTx96lpshaDuDAYwf7OpaZkLHODaqeBf2bjfgZbpMMcGtohj9xdRxC0L0UW8ippeCr7ydKXibNvUYH9QTtNRxIvSitKKlkV52CIc0pC0yMAhunYJ9xc1bsI9F9BsUlxQ1fpubfNYjiD9bMQ82IoDGYP5HfstSEgCM84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TrzFj1O2; arc=fail smtp.client-ip=52.101.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaCoHe/aNbl+sPX0ZUsIUYL+FCDi2ZE/2lDaJyf79uWV0BuzgogyCG12Ng8csf5ExMg47OFY1bTDrFMiLKw9uI0d9kqk0LqcoytE39M09MUIzpB0MC5w+yuNN4k96lFL8h1kTzYY5STYhO0DIsx04OpZkT0iR581B5qhaGnfNsblrQufV/7eJBYwp+QuYCbnlKy+jVcDbXtDwluT1thmCj/tus8J0IpL/foIWFxPliJD0U6J2tz8/CaUAc9ktKv1XsThqsUFdoRFOZNjr9SitS05M/HagsRMxDwXQ1dPkta4BlMEeQUnsSR8pHHc3U7xQPLT4ac5hN0zw20SnThZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaVoRT3+QjlaLViVJ5psgvBT5yi1yEK4PI5LMuc0hrU=;
 b=PL9br+htlz0/hpHgfxp6zKf7GFeg5m47M1AtjHVO5lPAw2Wuisz32QKeUpWoMMtWXVCrQFxAWlvWbScWK89CBlkc8S63cpJgIYQEdE56S5lJMY+pbBekqqHaUEGLRHa4BawkN1n0GBDVURnTvNRZGkvybT84hpZLQC62wT4RcUAdueocI81E3TNrO6mMoxQJVGqVm1zuQLiCHNzJI/jXq+eWiHdc7XIl4HCap0g30p5c/aQhiw7ErSqICOQ7DEQeqFJ3hjK3b8FjIKuZ9AQmlNTJfzc/2Ki0BuOpHBP3ciBSj9a82S+6EUYVpM4zB46ISp417kz3PKfUKcDCjQtGkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaVoRT3+QjlaLViVJ5psgvBT5yi1yEK4PI5LMuc0hrU=;
 b=TrzFj1O217lp+8bhlYWCaoDAphCHBjV/bjMWUV4J9B2w4Id8T6HZSgFu1c9Z49CMzA8UvNC5WDIAnKWD74YE8kaHnR9v1iz3lOrx8AIOrKqmulKppMPNiWYQ5QDN5d6r6Xq1wxZ69qp4r+d07GBZZvb0BPGlu0VJio8mUOoJdmY=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS9PR01MB12231.jpnprd01.prod.outlook.com (2603:1096:604:2e8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Fri, 3 Apr
 2026 21:13:03 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 21:13:03 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, magnus.damm <magnus.damm@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCh v3 11/14] ASoC: rsnd: src: Add SRC reset and clock support
 for RZ/G3E
Thread-Topic: [PATCh v3 11/14] ASoC: rsnd: src: Add SRC reset and clock
 support for RZ/G3E
Thread-Index: AQHcwr1sDLpsPp+pPkewtIY4PdshBrXMEOgAgAHFQmA=
Date: Fri, 3 Apr 2026 21:13:03 +0000
Message-ID:
 <TY6PR01MB1737799644B87DC92660A0265FF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-12-john.madieu.xa@bp.renesas.com>
 <5098f90c-bdb6-4922-b5d5-3794ebc56ee6@sirena.org.uk>
In-Reply-To: <5098f90c-bdb6-4922-b5d5-3794ebc56ee6@sirena.org.uk>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS9PR01MB12231:EE_
x-ms-office365-filtering-correlation-id: 2b5d343d-c01e-4cc2-e33c-08de91c5cb37
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 ut3HTD9kGXRKt7LRQNmhSjcKLDCvg1qNEb3CeOQWwXyDzenHDoWWWn5EgVZclqSy4xgH6b5f7GFdPawjn/CRwfj0MVgATDxDu6ha3wtbgXY33Yy2p09aqjS6mxOkVE8imLtDwBMuxrU0OeBRG6WXCxzoWCeg/uvNdMqjeKO0qS8HH8LglSgwi4PfeWKWdiXyNKJ+o3ezKuxeoNT5LNwcZbZbnVtFsGSGoFGfu86SrR8kc9tgdkrgKeEOuLaoCmYLaV+5wtEOIyFWS3JFGamxyR6cgwA5HMFYdeCz0TXfugMSRaT6kMfF+yZ57TsEXq4glaAJJWsYet/iHVDrvTRQ+KFVt/3YlAHDad96wyd4SbZxue8P+/lKBuLaSmWYGcjca52mYBhk1K++hUY3pCHtO6Mvosjt3HXqQ75Pk3HHh3lARO5tNZXcVGrQxjD4yhUyhreRMyAQQl2/9u8r9tyUgiAEEOqTz4jgT3NAFLMC/xbp9gAm4p9S7ooyPCiXeDUhDd8vfqD4BUZORnQRNlvWPZDu6B51FQhdEAQUvsnNMIoTz7iFXGHrx6Ej0BBJZJlzZ80AB5z3Nv4JKpj78c1v94ENfkoccR+MCG+OGVUfLjORB4KmzF+Rg74GVD9Ena/8T8w1nvpCGusfQxrfno3OqFLR3sEKy2xbvbndh9K6k8Y9uysnM9CAKGkEkTLKm3z+1fyVMO8BOQSouMI9gXZNCbFEHFgSMnHBn0VM/gmV0P6Grj293E81pyRu6b8u39XecZHwRjzGtFnmcV/RgVBc1ohUG9uBpb3a9p3+ZHdoCvc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cro+acpUJfsxrx3oqwB7NrQfRDeSAftT1Lj3Jy1OE/2WBtak73r7PhDU5BSW?=
 =?us-ascii?Q?wVgEsnOGfbQu/I82dWUdWCEpwfOhS7YXmoRu1+7uMwTDQEy9RbFAcylTgSiL?=
 =?us-ascii?Q?q2hGSbIvVBQrHEAgkFEo70eQLBYGPW+/K1yO8hG4MCST0ya5IWFW4I7Sw3Mj?=
 =?us-ascii?Q?XCvp7h6d/BJD7h1/z8YiRhBBmiXoFGtzn7fKvB006AXh5pSyTwKKEn9r6XRE?=
 =?us-ascii?Q?Qq6RcpTvdIZSxpa+eLVU/yUJDIpPzdBWwV7XhbMEvC5iYX5WQ6oWu2RprWS2?=
 =?us-ascii?Q?Mvw3vOETVuPQNmdKx1wz9+5nWDmlxLnlXhzsfkQ0TawdMdORwi4niM+RQshn?=
 =?us-ascii?Q?V613AdcZ/6Rl3A1128AwiBblTl5ejzgENQ2p1v6GglAGl1vDzmr9R28pRX50?=
 =?us-ascii?Q?VXcUjUKg0e+mSDhJTfRvP8hgkmm16p2pFOZ/qa9jkz5YfVZvbMm2Hd+vDE6i?=
 =?us-ascii?Q?jm8flJ3OZcypbSFjWJ7Eq9wYNt0IAom0etH7s5/irsmLgoS40/+3IjUtd5GA?=
 =?us-ascii?Q?Pmsc/lrH+iY1O56ygSnv+5ZPy9EY/9qaDLo2ZHQ3xQJ2RuEkHIhd08teZCF0?=
 =?us-ascii?Q?sRI0SuJfXWSLU4GDqOQkjBi9RG0Z5zBb2Jhw5qIFR0oRR3du1sZhNCxyu4VA?=
 =?us-ascii?Q?aa0eLiOHeYR3GMuTaE9yzAj+j0UGoRFgdAEAD/DtJPhn+mI+DxBIXPK3Fipt?=
 =?us-ascii?Q?SPGRgZQkxEpbn5X4rsR45yBIyWEKNFD+y9w/wSYygRjiWmkQipI4MhmhvGXw?=
 =?us-ascii?Q?5k+jjKaTyLR9VVNyNlClm3eomlavjxjoQvgChZkVuvuGBX2L+5ofeoGPLvPW?=
 =?us-ascii?Q?aAgMBQxKaLN+MCXPuosx0f/cQyZrsWevlb4hNevxTdY+LS3JwV7IMne86sdF?=
 =?us-ascii?Q?zKXBU4OkThOa8suanGiDFTll+dDDxQfnMMRORkxzjbvIZk048bIeRuSbUmFV?=
 =?us-ascii?Q?SPFAPDl7j/XgBsWL7IGC6pPoyf6DHkUjjglv618gaoVaNrZjV0SWJX+RoXIf?=
 =?us-ascii?Q?VZcM9xEXyth5ioW9K/++Ofq96yGn+i8uR6Gg3LwrT8qe/B+EswuM1v3Gr/lC?=
 =?us-ascii?Q?Iprfgxf9f3uwIhG10Itbht3HdbirHfwFAV4VZwwpVYQW1X44evanWOgI2ZLm?=
 =?us-ascii?Q?F/7LUgxIn5vCW/4gym1RFTNEmwgc5r7Oko6noJ5xfJzszTbqK91h/mq9sjnm?=
 =?us-ascii?Q?4X/VPB/yyEzA3wDmlaJCR3uPJjLZ+DGaPJCPfPeF+2x80vUiEFskNs81Bv8G?=
 =?us-ascii?Q?AkSuincb3TkfYUY6f0aOE7jzA12xxtVx5+hke+ZrnX9IHOSb+wYHLsulJdM7?=
 =?us-ascii?Q?s7dPycBVG8L0sHArofJ/KJZqMtAXnCxvssNFxGJm7ciMQGK5R5fAUcucnNvf?=
 =?us-ascii?Q?XYWhfyS2l1PWyss55lDq/aQX42q+OSeaFSDfqtPp9hsH/g5U0ilpX7X8NdqY?=
 =?us-ascii?Q?kEmD3E43INMf+WMM1awpbncYpIbKWsuXV7Mc3CPShYtadDj+pqRGfCPB8cmg?=
 =?us-ascii?Q?nB2LJFdimPciTACpNUwHTgb6/H/i+S18S3fQs39dgRNFzvpzpY9+qI9iqjYe?=
 =?us-ascii?Q?3dPjc5ciavX1q2W4XCSQvsWo2oHntz7CVc+aHEclEfr63SysPliQ5OUe7LUW?=
 =?us-ascii?Q?UXqU4g76iEIBkML4fuYEK6VFi7KlZCNuEVofIhifsFCL8H80a3aEiirpXAAR?=
 =?us-ascii?Q?oHR2aJ4obRVXzuTdeUr6dZdwT85gUcbs7acAWOgc5EjJDbxunAqkasQb0YiL?=
 =?us-ascii?Q?nFPxV/fUkRwGWCKjj26ao57sY+eFWbE=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5d343d-c01e-4cc2-e33c-08de91c5cb37
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 21:13:03.7151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+oQThG4zXmXLjccQQlSPz8FtWIR+10OQmckrMyxtsJvnsoMGsFST1ZK6vOFZ6JShdwdCGa0vCnBJQjhywbPHCzXih1jPYB/gPWH6jAZylo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12231
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30886-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,gmail.com,glider.be,kernel.org,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: 70A0C3985FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark,

Thanks for your review.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Thursday, April 2, 2026 8:05 PM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCh v3 11/14] ASoC: rsnd: src: Add SRC reset and clock
> support for RZ/G3E
>=20
> On Thu, Apr 02, 2026 at 06:24:33PM +0200, John Madieu wrote:
>=20
> > @@ -526,6 +527,12 @@ static int rsnd_src_init(struct rsnd_mod *mod,
> >  	if (ret < 0)
> >  		return ret;
> >
> > +	ret =3D clk_prepare_enable(priv->clk_scu_supply);
> > +	if (ret) {
> > +		dev_err(dev, "Cannot enable scu_supply_clk\n");
> > +		return ret;
> > +	}
> > +
> >  	rsnd_src_activation(mod);
> >
> >  	rsnd_src_init_convert_rate(io, mod);
>=20
> Shouldn't this have some handling like the adg does for splitting prepare
> and enable for the same reasons?

Looking at the call chain, rsnd_src_init/quit are called from the PCM
open/close path, which is a non-atomic context, unlike the ADG case where
rsnd_adg_ssi_clk_try_start() is called from the trigger path (atomic).
So I thought prepare_enable/disable_unprepare were safe here.

I'll add a comment in the code to document this. If you'd prefer the split
anyway, for consistency, I'm happy to do so. Please let me know.

Regards,
John

