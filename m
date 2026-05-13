Return-Path: <linux-renesas-soc+bounces-32556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA8sAnoJBGqKCgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 07:17:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 590BD52D7D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 07:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DEBC3011854
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 05:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A091C39E9D4;
	Wed, 13 May 2026 05:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oqAFUD3D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011006.outbound.protection.outlook.com [40.107.74.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0998F12D1F1;
	Wed, 13 May 2026 05:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778649463; cv=fail; b=Hq8/akinBSS5Dwai2cZDTnTjMx/+L5s3hUWdDV0MTdVdO6bVD66zjNHo3VY3TlqrzRAztfwRFvgLVEbaaN0fmChi4cEcfxe5vafC5WLTCSpRpP6D7NDkmOBUCz2ufFPRmr6ma1affTctLKlY+RpgdgOK2m7MpkxEBE5Bywvt9ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778649463; c=relaxed/simple;
	bh=JQhDt5aeKf/BmDpntwEcnPJzhdMVsJ0JmkuDYUzF8WA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d1BCzPi8LEQYXl8bpbIPHzmFCVueK29Y6yqiodr218AOmMLSfWg7c89++M8tsGsSe3QtelYcUqVbB0Iiv5jpwJNv83nbNyyU02idFhbvDGl62+si3YdeHx+2HDGLnf3U3mmeFtr5jiYYDhIjVUx+Qryp4tuKat3TyWma2zrtOdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oqAFUD3D; arc=fail smtp.client-ip=40.107.74.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgtigmeYZoNUa96AvZvkyec1oPdzdxr9UFVZGxh5J4INNbtwycg25Pyys+UMToC2v65c7PXOtCvdEnFcSZKmY/tYO0q6LqDZKqp8D3tBAEi9Ec/HYRptYQXPfekkZg1jO8qQO+RLz0E4CWuUD/eyUD0Y3Zr5pdGTWt2VkOpo/dbdLmPp/CTCUAW7TrBrw3XcPmLWIuce6lgQmQ3wRHg8y8E0n3cENutZP0ztUGDUeFvcXtRVPRVyb3luX92efnuBgwEbaK6yDCmyi2qqER7cBS5gjzhc2S+jsXD67g2tictc+iL2qf4vL+qtQRev8Wr3k232noC+1GzwFc9R0pgL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhoCUPJh3kjqXSPr9wrhSl4beUEhpjvQRGT9tCi72ww=;
 b=a4rixGvwg+KSWiFpbVbFozo7gcIUfAt8tfsIiZ9t7K56VFZMnjFi7ReuzpNJXHUtk11jTV4J9l6uslQ9CbobrXSonr8nk7cJN2DTX7255jMdLDIIQ1Gvu6P+8qrXmjczQJblTS5VswEIYTIhJK9H/BoFJ7s6oHm6T4BxHHKYIHUHEEmW7JbtKuxZGv9Yd3kOUEu0JpzpA54utvjpCBmR4Dl1a7ghSdmXsXr5FTn+rjtnXMz0GA0c+OqflahOJgVmMOBh2YYXRPLvmy6HtaEca0cQPdxvGjYs6wp15hqWsACC24GfReAy3g+kPtGSPECxE1+bRwQRiKnHl8xOfKwwDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhoCUPJh3kjqXSPr9wrhSl4beUEhpjvQRGT9tCi72ww=;
 b=oqAFUD3D8kJkZbomdVBiIehcQkVANQQldY9IGPdlu7D4tmSAlEjK2yyqjprDs6pPzk7UCP5Pua7CNW4tXr0RwtshkfVUuKb+Hfvpkho5zKvV4Z0yHQAvSH63cqh80uvTq5txywupkYlwGpWvqGarlyN+mG1oYU3wZhBslOmiG3k=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYWPR01MB10933.jpnprd01.prod.outlook.com (2603:1096:400:38f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 05:17:37 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 05:17:37 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 14/16] ASoC: rsnd: src: Add SRC reset and clock support
 for RZ/G3E
Thread-Topic: [PATCH v6 14/16] ASoC: rsnd: src: Add SRC reset and clock
 support for RZ/G3E
Thread-Index: AQHc4j08eobqidsIDEiVEE4+07blV7YLHtyAgABItoA=
Date: Wed, 13 May 2026 05:17:37 +0000
Message-ID:
 <TY6PR01MB173774BCC299A07D4A7AC5C2FFF062@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
	<20260512182631.3842065-15-john.madieu.xa@bp.renesas.com>
 <8733zw6suk.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8733zw6suk.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYWPR01MB10933:EE_
x-ms-office365-filtering-correlation-id: 6845d04f-8ff6-4232-4a89-08deb0aef285
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|22082099003|56012099003|18002099003|11063799003|38070700021;
x-microsoft-antispam-message-info:
 PpgGgNMWyKnSVam8XmtoBnoo9ADKw9uo/KLjDQK0MmeggaRQ4rZOXPpo81FtzpFyS1PZeGn4613uaTZOCT20c9RFbeQBQtzfDN+kR9kyV+lSuatJeLcsKZP3l4t+BBl+pe+l/YmuvB4qFdB/Pem58eSkyBPIpmhpTQfUY0LPth6pRzVpEMZDQgJoCpN9jPIZcB0JPYgF9mDYIGTbln2tT86jtgdO+kSeyBb/x07sFU9PA2MjG7FAHIS6XnSpHGXaeAMTDrD0uG9fpoNqTyTn0HEtHhqSpBNaJ/j6x4UNIOpVBc816oNTgcDDLmFNzpeVnXkGmPi6i6SO2LYCq1xeTH3igM4+ft6a2HJ8IsTmgCaG1xO3zVtBevMyboQAY8onYKdYiAGAloFegFeJxaYCEo5mEEtCOY67DAflwv89/yu2JywZ3td+6Q8c5+WERt7Ho7TmWGIUPB6WmlmoKPaAgTEyVNai+/upfw9nW1PA2kMDDi/CkaLjvLCP7BMn2uZS04rqaAKhJr9pAFIeCQpc0d2s7mJlCPTXvWSdlB7W2yzqK/y981bNZHYgWNns+y0dPkYuFT8G5o3JwrWUSTzrfDokxk9s+w0JYTXrm7FJl9LNphiuR9D+/koV5h3cPn1VKgPL8g+W3PEQurkkD4Hp8rkd1YHSmO/e2hbdzXLA+7AfnxKuPTtqrXQFUPEsrzUICotyf4uTnXuPEbHZstbJ/9Ha2oEYADk0oocNo2TMgMD4pdOsbWv5sHIl295fdDqi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(22082099003)(56012099003)(18002099003)(11063799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Lv3fuw4JQwNcnGKNkZ6m5SL5riLHeQEFYde/qXwZAsp2/YZgEVDawEbZCOMt?=
 =?us-ascii?Q?qYY1weUJojglQoJw2hnUuFUWVuHaGM3aAr4y/7hcisnp0fQikGOBm3wMdRDa?=
 =?us-ascii?Q?xSgdLqAfkEl4veBSp4Y5bG0g9Ef6ymJFoT5rcF/54dEjFfmCu78DDGQdgthx?=
 =?us-ascii?Q?0xvsidSTNQirti61OxZBKJuRoqs/qPoN2ADCrjpV9k4Q/8ejPNXhHgHyVdO9?=
 =?us-ascii?Q?Hh7wfpd5HaMr7tQ3CIf1pQkZAk+Cm0svdYiDHjrKfG1L7WBOOkH+bKHPfaRP?=
 =?us-ascii?Q?8tnqrARJHEJ0QyiH8K7eQyk/jLxdkcBgoYUwkdlUq2KRohGUHqZSKvR9Mu6r?=
 =?us-ascii?Q?eOpItaKCTb4Ud7VlH3BMYQFBwHz1x6yV/Xe9rzgn/ZxsFKoXq1WPMbP63GNz?=
 =?us-ascii?Q?NgpFdB8Tft6blOIcnh/qb+mIevVpgVMPomwAw2oV5chJcpGSju6f+uaKlhec?=
 =?us-ascii?Q?oqwaf3rfaUKcldSDr7TDVQvO7CvBc/7WncyhCz5YJPlPJcX1yQzHUEb/AQE4?=
 =?us-ascii?Q?BpvMC6LMBgFGmK6HNWHGG6hignnBy5gKU0RwSmh1i6Ks0GpCjbgT5Q0BTOTe?=
 =?us-ascii?Q?NLEcRY850rV/du0Rlp0UWGbshihun0Zzr7va2U7QSBaSm6lQfgRypWZ4DjJN?=
 =?us-ascii?Q?HZlfp+O3C+DiOqN35uyu6XhqSJEnsVjpUX8AwJZeoVMbeyp0cdf6l2bdH4CH?=
 =?us-ascii?Q?0+97FxE57/uOjXHFlTMhAL6MztwRbfHmE5wgo+2kdN5kM9/dN713knmA4fqb?=
 =?us-ascii?Q?ORpMcLLIoCFsFQGrQOMInFHyHoQ/v6rQwkKZcXq2Fl7ex7zBFG3G3EtC5VCw?=
 =?us-ascii?Q?tqGg361jdpJ9CGgKomSFEKM1kAcPaySLJQ4H/TGHXJpgoZtTQUrLfK9uoEid?=
 =?us-ascii?Q?/zZCpepxoBCtNm1Egfboj00yq2GC1gMdUW8lyI2e6rIQgTKsAqaLfU1HN1Jb?=
 =?us-ascii?Q?wxIoffw/DXzjPYraimvFPnYXdnUoJTDnqJwvNWD+wd/pf6100TnNk597ft0E?=
 =?us-ascii?Q?SpXfxM0P3uul2m7ZuwJvqDe3gBuY0XbXSau5Kl7zXMeHb9gOG73TBVDufrja?=
 =?us-ascii?Q?2bdrUjh/UeWnvi2A1yhJvpLwmVdbEjOmZrh7RXQ6DqqY3un6XQnuwpL/s3Za?=
 =?us-ascii?Q?s+JnOLAEcPpxrQp+C0pqd97GVHHhxGmg2DYVuYkHnYgqGJXo+JhCXJRNDs0F?=
 =?us-ascii?Q?njMxMlhzKYIHlE3pPwzIna8+zkh5SLCy3RSDwWWkqgP56jfXib3Ku0Uai3Nt?=
 =?us-ascii?Q?R5OXfmkCfTSnYvPZWDOnCkZ2anAiIsKAeuPjxf1yU2FrSGNkDWHZtCcuA4Ql?=
 =?us-ascii?Q?v/F6CBbMqPhakqAxjBxs6AHQh9QjKV67eLfEy699TdxjoGkmcEnRpXus3Zq9?=
 =?us-ascii?Q?B9daueN0M4Cri1jxUmdHNoBoBsPAHOmNAXN7qcS8Ng+nRNdtUbjDPWKNpwPR?=
 =?us-ascii?Q?TWCmaYSSntL42rAdkpVTsR8QwB6AeTZD3iUBc2vvOoryhfI4BZy93A/SXRGk?=
 =?us-ascii?Q?g+uxt3BPZFWqX92bqLzuGFOoa+iTdL7j1nXMcEvEf5ye9940qR6LPvIaCrtE?=
 =?us-ascii?Q?SyH1Xh//nc7/olU45s0urQidDB1LIJYORilqoKXAdKzuyiKqgR3E9VjoD8qG?=
 =?us-ascii?Q?jNvzUsCoC2jdfBZZNRvLfdWMY1v8RI20BR/YUURA6+xh0zQnn0h9ZT3PYINy?=
 =?us-ascii?Q?a/W06rQudO3zV4LiZBYRAEmKf0TsBOjE2mypS80cusS2ENwdJPOvDOYI2y5l?=
 =?us-ascii?Q?F0ukhGbLUVftCihrHCX/BwgPBNkFCM4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6845d04f-8ff6-4232-4a89-08deb0aef285
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 05:17:37.2188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aHErvG2ivtBGs1nrPS/24908YzfS6xEhxiyL+KLYnJzHZQwtE9So7o+2VO7c1AXoKJutUoTG+7e1zr7+YqVbFNN+eoYZ1FOyzr9kNZmsGdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10933
X-Rspamd-Queue-Id: 590BD52D7D4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32556-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Kuninori,

Thanks fort he review.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: Mittwoch, 13. Mai 2026 02:45
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCH v6 14/16] ASoC: rsnd: src: Add SRC reset and clock
> support for RZ/G3E
>=20
>=20
> Hi John
>=20
> Thank you for the patch
>=20
> > The RZ/G3E SoC requires explicit SCU (Sampling Rate Converter Unit)
> > reset and clock management unlike previous R-Car generations:
> >
> >  - scu: SCU top-level module clock (CPG_CLKON_15.CLK6_ON)
> >  - scu_x2: SCU top-level double-rate clock (CPG_CLKON_15.CLK7_ON)
> >  - scu_supply: SCU register-access / housekeeping clock
> >    (CPG_CLKON_23.CLK14_ON, described by the HW manual as the system
> >    clock for "function modules excluding SRC0-9, DVC0-1, CTU0-1 and
> >    MIX0-1 (including the setting registers, etc.)")
> >
> > Without every one of them enabled, no SCU register is reachable.
> > Add support for the shared SCU reset controller used by all SRC
> > modules on the RZ/G3E SoC and manage scu_supply with the same lifetime
> > as scu and scu_x2. This matches the hardware description and avoids
> > unnecessary clock toggling.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
>=20
> I guess this patch has 2 features.
>=20
> 	(A) add rsnd_src_ctrl
> 	(B) add rstc
>=20
> These are independent ?

Yes, fully independent. I will split:

  14a/N: ASoC: rsnd: src: Acquire shared SCU clocks for RZ/G3E
         - introduces struct rsnd_src_ctrl with scu/scu_x2/scu_supply.
         - uses devm_clk_get_optional_enabled(), so non-RZ/G3E DTs are
           unaffected.

  14b/N: ASoC: rsnd: src: Add SRC reset support for RZ/G3E
         - per-SRC devm_reset_control_get_optional_shared("scu") and
           rsnd_mod_init() plumbing only.

>=20
> And in (A), I guess no one is using scu_supply ?
> If it is just for lifetime, and is necessary, could you please add such
> comment ?

Correct, scu_supply is only acquired for its devm-managed enabled
lifetime; nothing reads src_ctrl->scu_supply after probe. Per the HW
manual scu_supply is the SCU register-access / housekeeping clock, so it
must stay enabled while the device is bound, including across system
suspend, otherwise no SCU register is reachable. The suspend path
deliberately gates only scu and scu_x2 for the same reason. I will add
this comment next to the acquisition in 14a/N.

>=20
> (A) can be merged into [16/16] ? or be as "prepare patch".

I will make (A) a preparation patch (14a/N above). Folding it into 16/16
would mix clock acquisition into the PM patch, and the SCU clocks need
to be enabled at probe so SCU registers are reachable before any
suspend/resume cycle.

Regards,
John

