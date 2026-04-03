Return-Path: <linux-renesas-soc+bounces-30882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGuoNX8d0GnN3QYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 22:05:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 746EF3980C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 22:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34FDE303B97E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 20:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397083D524E;
	Fri,  3 Apr 2026 20:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="B7CfySpB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010051.outbound.protection.outlook.com [52.101.229.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DF93537FA;
	Fri,  3 Apr 2026 20:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246717; cv=fail; b=Y0aSYTM8t19rmiYLwEu8m5smnnYSy4Wp8Qp20lTy3xGMutjXdJrVSN/I+s9ZSr961MN5+xLYm0uzWegfSpYROAbtbEZnD6iue9c3yCtF92SQFXliRISCjtx+Q8tywWfXnV5L6OdPlgS1N4RwrmLSi75KiEMEmPXjE3F3n+HQ3vE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246717; c=relaxed/simple;
	bh=Rx15/rxQaNm6k9xfSTax1xchcAdt9WkUVTxMMWUVExA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j+/zbLEgOer0q4Kk3PDjFiSyil1t9YXOqGbf0oGCTP3UIZaRHeQeaYMhub9W84qV2KpdI0wGppNwSBRxilBOwC+bCjtoVHK4B2RoUj2f0jTsY6xoF1vr3vbsTkD9pZmzKyBTPPIBUVfh9CQiahlywB0XcGrH6OV7iioq53WrB/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=B7CfySpB; arc=fail smtp.client-ip=52.101.229.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Th1iR5LQPKr1qHmNzwC9fNeYNZHFKGtVwSu2m1hDEzQjlbg7joSa/pFS5VWXMd1+Ba1cf8KmntLdEbo4UVY45DL/BD3uv56IyESVN+nTEgqwlpN31BoVDkzxhBzsAo1Y5W2L6QXVNa9q9KPsuXNyIICA+4fDs4igrdJnaYPjVPldoNIKsay3tB2za5A4TSl46Od5GV5vynxulCQSbn+YIeZeVRLAn4jPD3SmMQK769Psc/grUQgk3DOaNjga24Z4I07+c4UkfdIRyQ8GnCeJbO2Kja2PSpqjG9VwX3W4ML5xBUZufaZPftHrhHjgtQT6Dw6KbzRm7D0vYQDyHcpiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hkGTqYB1eqJnCWCn0EzKjbOFAvg9uuLUJHNkS5Loxs=;
 b=GEuUZ6nc5JyK64RaVUYfc5X2SqbT7so5V0e1Ds0OKaJmbXgNvDxgXSb4Tnr98b5XlX7JZjRAE9rcUPcUVrFld1wUvQ1APBAXt2dXssyUmsK2jzrVgXqvVU3uGEUt7lTQTkt9jdxuiO6o/ssCmwebOKu1eX8d9ljMzcwLiBq12z73YG5mIOgaktQYxmZFBopLUnbSnjr2Qutaqq28xduiAPN5Jgn+/m0r+70j50kEp+TSDHK4BYIaZ3EXzKNOD5l0fJkKQkcxP5Wq50zRPUiN2VgaosX06zHNDI+Ymd8co/aXzF5UDEy16J2ZA1ubw42mByxKtUcttvBCXEviKLrR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hkGTqYB1eqJnCWCn0EzKjbOFAvg9uuLUJHNkS5Loxs=;
 b=B7CfySpBp3M1YRgc22KULJGGsMkzm2Swb2B74mgaNKGGoqb5YhdXXJHAJoKbJnQbrcaeiNUh+oFktTWHP5rwe/5Tt5JJ6hyUYczEqBuPb2Umc3DzR103N97jXEiQURI3zR+MzpHa5S4N7l4bH30mFBFlP/2Q5K1YWAqRy8utdPs=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB10008.jpnprd01.prod.outlook.com (2603:1096:604:1df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 20:05:12 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 20:05:12 +0000
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
Subject: RE: [PATCh v3 10/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply
 clock management
Thread-Topic: [PATCh v3 10/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF
 supply clock management
Thread-Index: AQHcwr1pAzAyXF5bLEakh+bcszcXI7XMETyAgAGzEmA=
Date: Fri, 3 Apr 2026 20:05:12 +0000
Message-ID:
 <TY6PR01MB17377EE048CDB2FD89D60D387FF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-11-john.madieu.xa@bp.renesas.com>
 <812b7823-7891-4f99-a4e9-07f52849b1db@sirena.org.uk>
In-Reply-To: <812b7823-7891-4f99-a4e9-07f52849b1db@sirena.org.uk>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS3PR01MB10008:EE_
x-ms-office365-filtering-correlation-id: 39bb990a-471e-47f7-a4bc-08de91bc5088
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 tRPv/6P4J+Lp5D5mqFcHrtxwBia4UNSjpsNNg+5arxK128NzWwVPXUNh/gLTRWZYNmR/yChQy+zE2IRYYLkn4kAEjWsJ5HfbH+QPQPfUsBPivr49X8q8HdFJpmx/otICUGjqvgB0Eb3wwhM5ujnN3u4VWoW4946lfxdQgQW5FNqTGIAmMpABBCSKF7iNCHJSzmBYeMI1V3cUM8jMNHwB4geR+PyVWrWPqTEpNhAxXyA67/bt1Mm/KHfKKlQmYHmBFoSsxlYpDQVCCJKgmn+z373D6/gUOpV44likHGSROeZcQ1n4miCJ0rsWyvZl1sAJmjM9o4CgTDxGG7ofXMNzxyzQqoM1Nnc2EpcOeeWU7fN3pS6sdVxjANZJh5pBB3mu3sivDHrS0sayewZGKP+1N0W8IqtZJEpnFdmsuo+pxMDJWmYg7hKOXan4Dc+rNN7AiAe38cocKmoKgnO5BP/zmJwGKOhVJs/E59FvLR8hGCxShLbEb68ISShFxcE0KWMqTNGIA5e3m7wEriidIKe505YwwLWB2/ji1AQPfyOHWBJUVhG34IrrQilAxiVGV8zeKkKCshVHVuWPGoFRTM0NkiDCxOqJPNyflcVGzQ2YoCCXvnv7Hl7IEgdAu19+VJs5sVW1M0D4dUjg4we+tEChXKBAuGZnPN9ZY/UhqvhqKj032wkiPEpa+nKKD1NUgp2lf07Kik48BlATv9nUh4o+E4dVxJVBQm/73ITgexBELpBzphNquagqW+gH3JWLRyMjeqKTzfGANgXD5HJEq9OtTbpkGrvDB5UKHysP9hJuLrM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NP5y543XffXo/j7kuRuNYLlvYh6BRIcUFhbTGb/ucPYs6fiHwSZukPfriv80?=
 =?us-ascii?Q?vt3kMgUlTmvZstvSL6LoLfkCia+7obz4D1Ijr93Awe+oNged4UXzUaBZJFIE?=
 =?us-ascii?Q?tkHZz//VYI8oKi7nbpYbtWJ/Jt6wX1/KHfyKA4HIVVdEjEsf2xaCA4+LRNA/?=
 =?us-ascii?Q?78pJ6yfDZEwaHe6e0TcDngJw6UoTiBs9GGaKz4BLMBXfPyOh0R8ArFp6zlHT?=
 =?us-ascii?Q?wBSA2UzkqfKLzMdHXxCKjioCBoktFHTbI8cj1OaydzGswZEJBCBn8YbLxDGt?=
 =?us-ascii?Q?Gm6SClBM7w0gH6XvJT1hE4k/BCUVlxAFkzNQACF6tOVjLenD9BQAnO/2XeEh?=
 =?us-ascii?Q?gyQSQgcbO83I2a9+CNZO7EvB5580Ikcs3X74ddsrMTx6iCQy6qBBg7P+25Vs?=
 =?us-ascii?Q?imAVe5/iZtCZGgL/m+wcQlM5smAPJjvk6ejLuDIP6wZTAd7MAbgmC58GUzUW?=
 =?us-ascii?Q?6JNrROJoUP2Pg+m/IJOrSvgBV3KoNigDpX1sdslqKxHTO+CkwwydDXnU80Uf?=
 =?us-ascii?Q?iVBiN087k+4wu/0JH973EISiFgxU+aE5a5lNZpO0UzVUXiwj1jbtDOKJiazU?=
 =?us-ascii?Q?3fhwy0TVH7Z3Aj1vhPNkODzFO6IQu1RkBa1zr5sERL7Gm08fslc3mfNys5m8?=
 =?us-ascii?Q?TJ2fYrr1Ak245BbVIiq8+eCfMnz5xbZ0ma35k51dXu/GbAEvfPvl7xeK1285?=
 =?us-ascii?Q?pNGQkQMlBY36QgjGsUr0Qzz71RpNYX/A/LR7RjpgXykUyVgzNJvQ6e4cTpB7?=
 =?us-ascii?Q?AH2oand7KY65b2YCj5czGdewFuk2Aq8pBpItF2lditG/QZ7lwK4T4S+9j822?=
 =?us-ascii?Q?nNzAKKAD198AgS+cnw53uAAfI0FPjhWiVU7+QOvnEFAWXBiRay5YehSkGo6E?=
 =?us-ascii?Q?hs6ECl2WT27P7vBkcizAT178r/EU+s0VbsxL8xwrZPET3eXfs3Bs4k7BPa+l?=
 =?us-ascii?Q?PgE69kE9v8jtdSDcrcRErsX/vDhcNdLXznXY+GXmh1epzhfd60ZHF64O29MC?=
 =?us-ascii?Q?pS30Eht2lEXItW9JiRlbru+2yXAlr6Wo/Vp2pGtGweUr4/+1anOTkvjnvPpg?=
 =?us-ascii?Q?JTtksV/Y5dOky/RmRAF7hz2a790+Kc4zDvIPLnNLmwylquRK+O111Aepy/Kg?=
 =?us-ascii?Q?WbbWezSr6FTA7MzbNUQCcg27L3z1f5uMw5n44feN8KYCsGBhNa+H45KDZ14L?=
 =?us-ascii?Q?/uQIOwx2ZHAtFjJf+C6R/Qo1oUIedif8ULb7pKvpfoq3ZeYp3evNmwSqCQ3w?=
 =?us-ascii?Q?SUBORjPJBn4UobrqAj3Zzgf6I7U9VZ6zE5ZrWYWh7Of8o70t9IEoMAFExPa3?=
 =?us-ascii?Q?hvEDBTeXKZlwut6QnS6/4JHTch+AYxM9sd4OdKkbm9EBL2RbRk+9Q9rwbk+l?=
 =?us-ascii?Q?atZDnRV1QiufrIDb5pAs0BzUsjcNIqsQ6169B5oEKltov/mbUK4uBCPqHNNG?=
 =?us-ascii?Q?jYPZlAK2RtT5y/mYTKx7qTLybFt5B1WoV+dqbl9Htt/695c3/mxVV1LmNML5?=
 =?us-ascii?Q?4Js/tTrvdyHZ+HJmqE5zfg9SajoNchzza7eFmIyVsaJMNqueo3snkGqg667e?=
 =?us-ascii?Q?0Jk0/wyPb163Yq1fEg6HuRY29GBpVlZFPGIyV0ADPxHpm4ke7AiEqvlr5aTD?=
 =?us-ascii?Q?IX8OFH6Y1GAm7XrbRPxRrKURH7Xt3TvihEgJ1m6tgHb4GEchE5+MQp5CJRY+?=
 =?us-ascii?Q?i/erFIIlgufMmH+cttcFqS0bbndGa+GSAhiJjjOaVKrTt/uW4xV72NPXYDsE?=
 =?us-ascii?Q?RQSO/TmoV6p6LJiN43UrM7YoJsmf9yE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 39bb990a-471e-47f7-a4bc-08de91bc5088
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 20:05:12.4067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i0nVz76oRFYpuStEpa/uLgchPtmOIalrozY47eOSQ0b835lVpkErq+MCam18sqAccYNZ5v0DYWm+G/hNYB88v0oKzh/a3O2OjDl3Bpxhn4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10008
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30882-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 746EF3980C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark,

Thanks for the review.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Thursday, April 2, 2026 8:06 PM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCh v3 10/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF
> supply clock management
>=20
> On Thu, Apr 02, 2026 at 06:24:32PM +0200, John Madieu wrote:
>=20
> >
> > +/*
> > + * RZ/G3E: Prepare SSI clocks - call from hw_params (can sleep)  */
> > +int rsnd_adg_ssi_clk_prepare(struct rsnd_mod *ssi_mod) {
>=20
> > +	ret =3D clk_prepare(adg->clk_adg_ssi[id]);
>=20
> One other issue here: hw_params() can be called multiple times without
> starting a stream, this might lead to leaks of clk_prepare().

Thanks for letting me know. I'll address that when implementing what
Koninori has suggested. This should normally not be an issue anymore in
v4.

Regards,
John

