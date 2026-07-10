Return-Path: <linux-renesas-soc+bounces-35015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id onY8BJOzUGq13gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:55:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 547BF738B6F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:55:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=XULmYT6U;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29E5C3006148
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 08:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3D03806CD;
	Fri, 10 Jul 2026 08:50:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208E7378833;
	Fri, 10 Jul 2026 08:50:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673407; cv=fail; b=lg94NXvhUqOCHKqScwZaseiO2GYRpY0Os7QQYPkkgpRHzTPgDLlPJB11UyVow6Qfk60q8j7OFuQgNzbStMU97uSyVZe0tlVpxjaZ5twFMQg7FNqHXmBHpJB9rjAKsFVNiF0pdD+rg20uKgChEkJ7xC+nk4IqH3OwcgVFb2bY+Y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673407; c=relaxed/simple;
	bh=s1miFZLQSBl4fcKM2yV5r4lomShz1CblX7hWJJ7ev/M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RZio1zhWatvxJByiY6CCUa2Vl4Tcu1KeAyH+7xb63KJNLOUAjQnR5700qj+tqBg1V5L3BxG+GTTCh8/JO/SSSzEktXrMx98pgb/v5l75k16F1ISQ83IzGz+sucz5bGDtJywtCnABgMxbyDdSwV9xKIjGkCKYA5osyevznLg5Xpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XULmYT6U; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcXIgOIwPf8G3X2SJbkWHoNd+1CgmhN0gGYdE1FOXwXPJ71IMxWljyo4JNFi/OCEvThc6Xzldd8U/2dllCeG9Q7CLtLS5aj6+YFW0a1I+Z0FudY2h+DGTtv9NW06uYyZA3qb/Y5+NUlc7wLMhWVl4d1lAOQGbjz++yl/zpI2JvNmW4hSisqhqYrGvFshrz3aXkTocqoruTndfZSEzQE35CN7knxAwG8i5ZIJINi3L8dVJmtlte3cxANASq5rdrn9PA+3+eTaqtT5WfE03XqrWGEDIfPkd3s/GYle7pWQ1mSDTfSJEbgU9Ik/6NxArxoouRsI/ZR1wm9gnsbZ1ky+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH6NK+OeQYGl0PFWpSJ0oSzpU8IINELK57jWA6xVz7s=;
 b=u+krBunEeCgWW5/pzA51OU2p+ChvDzB/Uljj6+1HCTXaxWoBtIiJQMde/++CnLfThsLm3/650dW+P7GxaPvo6gqR6ZZmgW33Au95zt7OSdB5AkztsGfNQKd3gHKe07n9OnLtAGSfAfsWj3VrlFSrkoxtuJS1BQJlkwH0CobQnPXXX4GC+H4nKCyUUfA8kIsdC+DB6FPzdLP2IeH5INO6zM6CilOSXGToWFmAzcmvyyyGUv/uDHD66jMNZlhrdZiU3Aidw+g8l0O7JOfzwlopqMtJgL9FN8Rc+ugUkOmDnZJXMIRZ4YjJmo0lg3WfwUszaEIEaOCsHC2NU3CDsiNqlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DH6NK+OeQYGl0PFWpSJ0oSzpU8IINELK57jWA6xVz7s=;
 b=XULmYT6UgasmSazD8oDwaM4ya0aR9rG5ZtwWI2mJK0RBal8n+OO8XTcL8bnNpustwHnihz0+JFp4ZU4sNxMeqvWfbEdRzbJPhQPbwnmmrArOAmNjuO1TqXgGRoD+3ZvJ3AF6AQ/cDBLTDsfOXo/xckQR7Bfm02wca8gWwg5y/mc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB17753.jpnprd01.prod.outlook.com (2603:1096:405:388::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 08:50:01 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Fri, 10 Jul 2026
 08:50:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v19 07/12] mmc: renesas_sdhi: Add optional axis/axim reset
 controls
Thread-Topic: [PATCH v19 07/12] mmc: renesas_sdhi: Add optional axis/axim
 reset controls
Thread-Index: AQHdD9lDpPFomxploUisKt/fuEteSrZmcioQ
Date: Fri, 10 Jul 2026 08:50:01 +0000
Message-ID:
 <TY3PR01MB11346721264D8D0454110707286FD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
 <20260709192916.630794-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260709192916.630794-8-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB17753:EE_
x-ms-office365-filtering-correlation-id: 532593c9-1a45-4891-ec38-08dede603a7c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|4143699003|11063799006|56012099006|38070700021|6133799003;
x-microsoft-antispam-message-info:
 WpuArWG2KyghAI7TwL9fN1Kf/ly6iWLPQxwwmnI83q/xuf5w1vlaAl0vYZKU+S2CncTJkk3eBv71BhZCZMNLGrdFik3+xWWMr4vw5kcY3w0O2GYFkrf0zJr56ixZ82dP9wuDETEtBsdQpR7kw8KDC92FXuj6eZCioVfD15nQyDMS99GP84aY5F8872cVMjgHpcYVSFU0EfXzaFWFRDZVaMQLfMzFJsqHY/4vyCURU9mdWR5Kqr/lBJ5J4QkoFpBLHAEnuGUv4jaQiqz8EnFdVoCaOFwj9ujEx54khvVfmlp/H5uoOEsxqCViQS6PBhMmKjV2jaavgxLm58w+/EEFlTs3TLHv70Y+4oQ9YsMeX5Ea9md/7qO4mUk0DEEFZGOaaurfAy/lkKzhymCh5aJQBsDz0LOnkhIo+GyjIrUc3bgr+A/ybs8Hz7AVAHdQnqb3ESX7vVk7am0iB25dJQIzw4AGx1vsvrsrErvdArxowCN4bbb31Hf8SK0trHPovyOGw5kxaVTRK1l3u3p/Dcex99nOgyRIS5H9CdRsgLRFDoeHu9ytq4HQuBA9+aV7xE/zEKZ31L8Z3v2+F5OZX5axgbWiWTG70SYCaIlSYu6qfH0tY+DMHA2/OcJgXx2few0MEx0x1lxHVDizQmbJ3BZEsTKZ7AQLLplyyBkABGC8+vg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(38070700021)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4NIJR00A5tz+xuzHSqBZkjWR7SLJskxflhadXR1WT/w3oovEJBP9jvP581ge?=
 =?us-ascii?Q?TyH5UCwbOEi0MJR2wFQPrguby5NvAz4ymcc1ZjLMvtttidEsuVWnV1JXGH6L?=
 =?us-ascii?Q?DJeaGHOioBzqKbenwpLCJjFrrkp6aIESjrrcl0TnogwKXGBYQBiQj0mTJjP1?=
 =?us-ascii?Q?YpXxvEShHA7ISdTLvjJchMCypASi6vsuFiKlsvZlsyPjAyQ5XHrQvnvV7qBk?=
 =?us-ascii?Q?UULR2DskGvc7jFIHnW0BE7WAb1VMUquxmFoHD+FMXLPdUqUPl/kVIEMUwAuq?=
 =?us-ascii?Q?mSkfCrvFLYKLrqBwX+KAhhfLcFKBmEgaOyRb8KeHggL8j11y77uwD/+VQqjV?=
 =?us-ascii?Q?xV2JqyIwtQMv3n2UanQi1kPVqANVLLyrWKqjKUStgEc4Q/fIIcgJjhbKco7Z?=
 =?us-ascii?Q?1VBeUtfXjrAhxC4dmnVE0JD/55QP6yReVE7zflnTdCVeHJ5feQg25M7OwTcQ?=
 =?us-ascii?Q?EWcPfBTy30XHbZRChU0sZZ52PdUqQ/HItkC3xYQdDtArQA0RWgbSbnSgxYl9?=
 =?us-ascii?Q?ws6SdC9jUVSvll8ZvS4b3x2vzlmGxUiNKNfAOKdfFQ4DgTf3cavNg9mQhM0c?=
 =?us-ascii?Q?SKwACGAIkr9MvrKvnNWog1FiJHQ3vYeiTSHcaoB30BWgfTZWDE+U3iHXk1Wr?=
 =?us-ascii?Q?G7tOxOxX3oQNDFaoQd0hC8hnHRWRISjZ0B7025m8GFFdvA7foltaSy8LfdJc?=
 =?us-ascii?Q?sRZaGaQrEiV5FaEgDJFRelbf6Oqx85e/QHIQoYB6J8JydVydYfdM0m1E0db6?=
 =?us-ascii?Q?H4rhIyyxqjyCaJGITJqNKB2/EZOu9+UXsXFIEMBUz5+sYflbnayF1A5uK2OT?=
 =?us-ascii?Q?BMBLKFTEQDmBdiQYtE+BCAz/twt5r0bTIa7LM63dweLuFm+R837Agl9SsLvo?=
 =?us-ascii?Q?UOeU0rMdpKJwJdop9jw0K42rbkLn5n862eQGp2XVI4NyZPOAoDiO/5vJYhuu?=
 =?us-ascii?Q?8subq1cIHRDLqB2f9owHu5hcVnNv6nLgUnae7mtVb2Sjv4PIYH6Rij/tglIx?=
 =?us-ascii?Q?qhOEWMhlpXM2mKpA+UI1TbR86MFXhe4cfngO6gtk6B8xZJesWM9bR5irDcVE?=
 =?us-ascii?Q?1qlJ1YLRUiwVja+o1ogZFYGzzj/Y4Hmo82aJ5HVxCBX+rFpLhaZzGTi1RuDZ?=
 =?us-ascii?Q?qCcvgYa3CmSUPXMqpOIZogPygT3+0x81IeTSueDyZj7dx7o1Mzr/JWUz/AWe?=
 =?us-ascii?Q?YDORWRjjmlCQ0YV8bS200lCM9HYZ65VSWF8hs+V1pNRKay8NUIhZ855hrUoc?=
 =?us-ascii?Q?XDWjAzHiROYSJjC6Ym2RfT6XEN6JqSQo8DiltrIR4BDtEyNvqRsUOLfn24CE?=
 =?us-ascii?Q?LQoPMiQ6PVGhG7Z7ll+qqZOL5duMdg8ct6S4GqK5MrAPN13JMBlkj5m1Chq0?=
 =?us-ascii?Q?5r/GMOWhp4pLTBEHowC/jil5gZhPtnE69JKHBGDxnO2Vu6Ne8mp9bDgERG+7?=
 =?us-ascii?Q?cgHZ6uoZKzXBMqGRtXGhrJ+o8KNP5Ht8h+IGMkcxxXPSw1jgo5aPJrvPa5dA?=
 =?us-ascii?Q?3USxXizVRP5u5nau3B+1SkGxFlune5X489/1N3vK1FcmsFzxpLOKDnNJhuji?=
 =?us-ascii?Q?x4cXiANoSvOVb4NaEZoI6XeC4bt7MfiPfSN9YhrPG3ElLiari9hVFRQTjNcL?=
 =?us-ascii?Q?KzelYZJZtndPAzCiJWmI4JphWDK32kkomjGBPoOo69or1P/8aomwF5mAjPZ5?=
 =?us-ascii?Q?SmGDu8T3OauYEphzGCRt3+1Oyx1qM7juXCh091ChX5FB7wYGS4a4WECmmxaf?=
 =?us-ascii?Q?HVAlfXrHAQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 532593c9-1a45-4891-ec38-08dede603a7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 08:50:01.2065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8EZ9df1rO3T6EHs8faByW3dkiQ6wjYu9gU/mvcv6f+7bU0WGyOlGn+1vSEkGA1zoBYgWRWZ2K4wrckd/dR/dAIB+L7dFpH/rPSoAovYCwmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17753
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35015-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,sang-engineering.com,kernel.org,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 547BF738B6F

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 09 July 2026 20:29
> Subject: [PATCH v19 07/12] mmc: renesas_sdhi: Add optional axis/axim rese=
t controls
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The RZ/G3L SoC has axis/axim resets compared to other SoCs.
>=20
> Add two optional reset controls, rstc_axis and rstc_axim, to the renesas_=
sdhi struct. Both are acquired
> at probe time using
> devm_reset_control_get_optional_exclusive_deasserted() with the "axis" an=
d "axim" reset names
> respectively.
>=20
> Include them alongside the existing rstc in bulk reset/assert/deassert
> operations: triggered together in renesas_sdhi_reset(), and managed via
> reset_control_bulk_assert/deassert() in the suspend and resume paths, rep=
lacing the previous single-
> control calls.
>=20
> Being optional, these resets are a no-op on platforms that do not provide=
 them, so existing behaviour is
> preserved.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> V18->v19:
>  * No change.
> v17->v18:
>  * Fixed ordering of reset in renesas_sdhi_reset().
> v1->v17:
>  * No change.
> ---
>  drivers/mmc/host/renesas_sdhi.h      |  2 ++
>  drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++---
>  2 files changed, 25 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h index
> 438b2a7afe76..d46598190004 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -100,6 +100,8 @@ struct renesas_sdhi {
>  	unsigned int tap_set;
>=20
>  	struct reset_control *rstc;
> +	struct reset_control *rstc_axis;
> +	struct reset_control *rstc_axim;
>  	struct tmio_mmc_host *host;
>  	struct regulator_dev *rdev;
>  };
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index b6bba03316fe..6ec8dc96b581 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -623,6 +623,8 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *=
host, bool preserve)
>  				sd_status =3D sd_ctrl_read32(host, CTL_SD_STATUS);
>=20
>  			reset_control_reset(priv->rstc);
> +			reset_control_reset(priv->rstc_axim);
> +			reset_control_reset(priv->rstc_axis);
>  			/* Unknown why but without polling reset status, it will hang */
>  			read_poll_timeout(reset_control_status, ret, ret =3D=3D 0, 1, 100,
>  					  false, priv->rstc);
> @@ -1137,6 +1139,14 @@ int renesas_sdhi_probe(struct platform_device *pde=
v,
>  	if (IS_ERR(priv->rstc))
>  		return PTR_ERR(priv->rstc);
>=20
> +	priv->rstc_axim =3D devm_reset_control_get_optional_exclusive_deasserte=
d(&pdev->dev, "axim");
> +	if (IS_ERR(priv->rstc_axim))
> +		return PTR_ERR(priv->rstc_axim);
> +
> +	priv->rstc_axis =3D devm_reset_control_get_optional_exclusive_deasserte=
d(&pdev->dev, "axis");
> +	if (IS_ERR(priv->rstc_axis))
> +		return PTR_ERR(priv->rstc_axis);
> +
>  	priv->pinctrl =3D devm_pinctrl_get(&pdev->dev);
>  	if (!IS_ERR(priv->pinctrl)) {
>  		priv->pins_default =3D pinctrl_lookup_state(priv->pinctrl,
> @@ -1363,13 +1373,18 @@ int renesas_sdhi_suspend(struct device *dev)  {
>  	struct tmio_mmc_host *host =3D dev_get_drvdata(dev);
>  	struct renesas_sdhi *priv =3D host_to_priv(host);
> +	struct reset_control_bulk_data resets[] =3D {
> +		{ .rstc =3D priv->rstc },
> +		{ .rstc =3D priv->rstc_axim },
> +		{ .rstc =3D priv->rstc_axis },
> +	};
>  	int ret;
>=20
>  	ret =3D pm_runtime_force_suspend(dev);
>  	if (ret)
>  		return ret;
>=20
> -	ret =3D reset_control_assert(priv->rstc);
> +	ret =3D reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
>  	if (ret)
>  		pm_runtime_force_resume(dev);
>=20
> @@ -1381,15 +1396,20 @@ int renesas_sdhi_resume(struct device *dev)  {
>  	struct tmio_mmc_host *host =3D dev_get_drvdata(dev);
>  	struct renesas_sdhi *priv =3D host_to_priv(host);
> +	struct reset_control_bulk_data resets[] =3D {
> +		{ .rstc =3D priv->rstc },
> +		{ .rstc =3D priv->rstc_axim },
> +		{ .rstc =3D priv->rstc_axis },
> +	};
>  	int ret;
>=20
> -	ret =3D reset_control_deassert(priv->rstc);
> +	ret =3D reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);

I will fix the reordering for resets as mentioned in [1]

[1] https://sashiko.dev/#/patchset/20260709192916.630794-1-biju.das.jz%40bp=
.renesas.com

Cheers,
Biju

>  	if (ret)
>  		return ret;
>=20
>  	ret =3D pm_runtime_force_resume(dev);
>  	if (ret)
> -		reset_control_assert(priv->rstc);
> +		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
>=20
>  	return ret;
>  }
> --
> 2.43.0


