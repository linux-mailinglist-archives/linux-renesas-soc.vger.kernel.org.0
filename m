Return-Path: <linux-renesas-soc+bounces-34808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HE1xJEXtTGqjsAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 14:12:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D477F71B3F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 14:12:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=jeVBZRVQ;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 222E530293DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 12:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D0A3E2AB9;
	Tue,  7 Jul 2026 12:10:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FAA3F23C5;
	Tue,  7 Jul 2026 12:10:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426247; cv=fail; b=FycjCTaflN86dVeuNnc5DLSm+kQwS8G7Q8SAcQBs2ju0zlmeXBbjoxwMVsgomzSJnAdOWbDxTsNd/TntpSQ9rLqbfcUsABoQKqoIc+zplMyRR7q7Nqa3bm0JkhAuSgYqYoMiVZ4o9x4didBQw09ZTDALavAz4G4QAWRWzhxp6Jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426247; c=relaxed/simple;
	bh=q4ebm77JRMIygz2WsQoFQ2+bJ0JISvFEDxWMrs5ahuM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m9ccyskzVgV/kldb6SnVIbwDOVtYIfx+f/7NQHsalZ3qd0unHJE3hj1aXchtj5yCPaoE9V/vYKQ654Kk2T0e8zr1qSaFySuVxQ8925EZoMQe7JWcLkRoP5c3jys02r7uLQGGYfTfpW18LQZrB/gf0Z4hs79g6PUO1PhYCQ4hTYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jeVBZRVQ; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+RK7h2QWR6XhDJMC+rWzjNjhhLIs/ieiX+efJy5wsNp/HdpHnPL5IHIcrZClpgLsP6DQ3lmEdvTXitc4VPURx3Y3VcU3u2z8/p+kxtnnYaBGJgTAfImKBZ2hjPoKFmb8m3SjoA+6+LPblipqJbnVOduA+sCMYlacI5FMpZdHGrom6VMYwqMsYoejvx8n9J66BU5ldyKZ6RXBqZrhONI/kJGjIz2xRNiQZ+40/auckXmOwuBAKKA3VeDZ1X+G2FZVjAtv0uoBgHc8iBoVxARGowormD078SniHCGL5suRMm40v/fjQm3XWNRcBJ6sAeOlI4HBmgDtJ98T6Dqr5YQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3wa3l0vv6mw2UQVuVdIK1Cw3NjwAVs/6JsuNyfussA=;
 b=XJF9nC6wBbVrz7tBKogJ9ceRdO+yBfcV6Wb4pe8op6fBzyWZ/yFcJ4fP6+mha4QHx2aNnKNCk7okQQ3mCPNxsVPlKin2Woc1yuRpSft83pxT+jKgDpMY5GPm9RgmjdEOuhiMpgzZKeTdkozzHjVbOvdXyjXwKAMn1k7bvaObZ/XeHQEAYl9cHWf9k9s09CTBDQ206QO32CNvDmeo2oexKHdCcLDvHZaJe/rNkKjvuplqgEf5aqt7+lZ2LUJk2FtmdfOih/tAyydGGyMPDypMcd1zojJFPj9wnsO2hKY7T8NECjEAOpyA64FNzvPkYamhqTfKhsmGcmGKuzETWNzI/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3wa3l0vv6mw2UQVuVdIK1Cw3NjwAVs/6JsuNyfussA=;
 b=jeVBZRVQNJ79kwq3Dajgx+9cTdPYtt7n8L77Q3OFOyJcQ5UMHwAd0hVnGfUrVl9bhhR9Qv1RryJwEHselzmQfGs3hq2H3Lvd353EEqKWfajIaXZojvWawU1JvV6Fwd3F/0xd6p01m6Ag6LPN0bSZuYjbnxQcIpiblrG78PQNt6A=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11475.jpnprd01.prod.outlook.com (2603:1096:400:40d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 12:10:42 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 12:10:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v18 11/12] mmc: renesas_sdhi: Add RZ/G3L HS400 support
Thread-Topic: [PATCH v18 11/12] mmc: renesas_sdhi: Add RZ/G3L HS400 support
Thread-Index: AQHdAl+xXV0zBAPvD0qrozf0kz69PLZiDWFA
Date: Tue, 7 Jul 2026 12:10:42 +0000
Message-ID:
 <TY3PR01MB113464E7293163E4E349FE76586F02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
 <20260622155610.184271-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260622155610.184271-12-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11475:EE_
x-ms-office365-filtering-correlation-id: f09703f7-095a-4a97-eafa-08dedc20c482
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|22082099003|18002099003|56012099006|11063799006|5023799004|4143699003|6133799003;
x-microsoft-antispam-message-info:
 bGIdvdmRhqRN72E5YvhUv/zuWATBHzkZMXn3xFaCRqJv5wjr7+Av4paxsrzO4zwQPlGxRTQjutko45rGI6XIGMGVl2BBzk1NnQkhYpsguYvMeM4yCbmu6v8iX1Lj08WmC2i5Jd6BdZiY5DMGQhEF8pQWKURnFId6gkYgkjqQ8foJDg6Fhs2mXQa7IdxD1ETzk5CHW4FfRvOnnghYhWcSfQn35l4fEEDE80mXULsYMjbecok55K+c1N4Aa31/FA/LWx+Q0TKJbYBjfTwPCe8dJ3h8ea1lwetk05nt5lC4/t1DBd4CGMAMfJ/KUM7EUvHsPtVUp5Drinj1iK7wLmLfpC06Pey0DGf5XbQZ39T+gZiJ08ijCzjmig8cK2zPp+P/P33h0KSI1gaLWCN+nt2y2W+b88YYYP/99b/w5zWy9lpHCHwwEPU4UorWPocz5tgWdIEQkxYRumveK13ku9zZQNKbzM1BlOfEjQYfKAFqJeRnVrA87oOVFwLlpGlAnIOLivRJRiSJcrZ6DaxWw3zHAjjgkEs9nGzwHfq/nGkRigP0oUXmBuhG2vezqQ646GR9U7eXQOOn6AsU951WC9//yRg3ID/AAUJVZWY8L8m2G/+17AKvLvHgzcdDMVMLIyJTfCHprswID+vqUc077aqxGGukHniphMR6MrQF8Enmg0c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(4143699003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TgE04Wbb3C9rNDh9jFLiwGs2KG0DBoTJA9AMzG6FtWNuzkRFhiaoUdjjZdrx?=
 =?us-ascii?Q?2SyWLfEp066SN+DAuMsyMcMQ3Ke7FhGWaOotJKi9NHfp3izkyyP8dH+IYj4J?=
 =?us-ascii?Q?MN30UIj8sWCtc9F2uflm2b9Ixocwj1MlnkW7R5DkS8pJJeaathOK61+pSL18?=
 =?us-ascii?Q?QNCi/ZEWUB/FCse8/jgzZCF1OjgSRe4Xnt1X8pvDTmscBkGABqM2gU7GIVQN?=
 =?us-ascii?Q?hs4gH1HLYKxu6SE968RpqHRZvwfltHTu/fknX0a5YjzzF5aHeazoqMCgahgv?=
 =?us-ascii?Q?9EiSm+L5+zvc+yFu9fS9Wusqkc0Nfei2eRad/V0YmwxXjdXVA/uHvLOdzHc/?=
 =?us-ascii?Q?Zbwc1sDaiCoK+O6APlE3GCZKNPhAsCbtPLoU9SEn1XCm4iQfd3D4jNbXcgaU?=
 =?us-ascii?Q?50phpTbup3ZsGPi+5Na0JYHO05mArFg9MLX1d0cxhIzbkdfG0OSshUCzy96C?=
 =?us-ascii?Q?RTgb1RY+DbUzdHfhmzkqWvTWd/XUk+YAbxwerDtWBM/GAJtVQ+UyL0H+S89q?=
 =?us-ascii?Q?S9Gad4oFcI4WnqUbujrY5A0bWi+ayGa/60cj7uaTg7EWQkAWM22hr0dXMZoH?=
 =?us-ascii?Q?tR0yZHX2qnHuwrbSUi/z762UicgWvAADq3GC/qsjcp4FJovI4ic3GOO/AlZJ?=
 =?us-ascii?Q?mEi0n/PnUlUuYsbUsggMC6h8yXdXjIuYI/bdozWcGqKtwZBLj28XaFjQoDWk?=
 =?us-ascii?Q?dC5fG2BA4j3bbXPj0a0QzV4fMxWtEqcysNJ1eRaTFRkBxWPG6rseHxlsoeFZ?=
 =?us-ascii?Q?6PSdPGZ6FF+jqdAVnR+3zqTvruVWjSfmaliG24z1cH0W77PfKWEFDPvn2bay?=
 =?us-ascii?Q?Jp2M/ZrzEcS1kcZlKi6M9rVhVeMKflFpyzntpE/9l+2FYQgFAcpOdGiwjmBD?=
 =?us-ascii?Q?fNklkOFkQR9dNyH5E5GLIxzr9b1xxoLWyuLVUZcBeXZQM3xUfaH9Vqyxsdt+?=
 =?us-ascii?Q?z/NoHP+hXX7dKbgkujGAGspCTeiN5yE5YVcLI8qWPKlrJU6RQEV3NN1ap1fn?=
 =?us-ascii?Q?N3zGwM9XuYvA2OPegAqALXnR7v3cLDRKk3U6+w7p4DwYqkyCWWHfHfC0YB03?=
 =?us-ascii?Q?4Qb4dbS+uybQkUXgocnROCJZp6Uh5x2UgmTitoL9oLwCZJEwax8li0NAvVEu?=
 =?us-ascii?Q?jJrRGmT4FkCVa2C3POYcIH0hi/KM+TqL8WH9lQygppvFh7MLG8N/tTnh626h?=
 =?us-ascii?Q?XE3FLeVXKZLESmHw0cML5VJXyWZhigGNU0ngv+EFQacMwpuILJj1ffxzuwD6?=
 =?us-ascii?Q?25b6EflOhLnUTRqa4ED9f0lTzrSS58eprvMJNSz6iqd2nTtgNj+Au2Ma0QlF?=
 =?us-ascii?Q?AK/dILJkKlAyrV/TBkZrQ0ja69LhAMvZByH2KtHuYf9Ypr2SZ9exdJJmc1qI?=
 =?us-ascii?Q?ncHmRC0LzCEKGfnZgbsmb/alZ1X/8LdJqBHK9CgsZ2Sbb4kXQLB3eyMkJGXC?=
 =?us-ascii?Q?aVvTOf/B7w5K4FkUBiTKL/EEJzA6xKjuCUENzzQqkN9xv25V7HTtsMvWtD0s?=
 =?us-ascii?Q?eAbEg28oiLYeM6SYjDaPJhr8tIac1Mp2Yquea6YsqzLlIqx3+sTJURO4jM4F?=
 =?us-ascii?Q?+t9B6BA9qtjQDYSg0heQ8trNa61lmHUtJjMwQfwxe6iktSaZ0TCKIt12pDZs?=
 =?us-ascii?Q?rAdsSNeKUzxFuZO+ncO+74FF3XXlApQK7kqnKgeWWzQcQsBQ/C0/1dRidsRt?=
 =?us-ascii?Q?PWt5ZmrNRwFuuOXng7VB9i8NUzA79Tch0yTq8g/+1JNeauPTxTLBZDYAGAyJ?=
 =?us-ascii?Q?S9jxHsqwqQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f09703f7-095a-4a97-eafa-08dedc20c482
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 12:10:42.6638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2erMwUXPx2F26OnmpXu4SFWoDKYnKRgqJcNPiTtgr1YfrdzZAip9vzaT0TzHupUmuN/63b19qDwsqAh/AFEDp77YUrvFF5BWFcqma/d5+GM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11475
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34808-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,sang-engineering.com,kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim,vger.kernel.org:from_smtp,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D477F71B3F9

Hi Wolfram,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 22 June 2026 16:56
> Subject: [PATCH v18 11/12] mmc: renesas_sdhi: Add RZ/G3L HS400 support
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add HS400 support for RZ/G3L SoC.
>=20
> RZ/G3L requires a dedicated HS400 enable register (SDm_SCC_HS400MODE2 at =
offset 0x020) in addition to the
> existing TMPPORT2 path used by R-Car. Introduce a TMIO_MMC_HS400MODE2 fla=
g (bit 16) to identify
> controllers that need this second register.
> When the flag is set, renesas_sdhi_hs400_complete() additionally sets
> HS400EN2 in HS400MODE2, and renesas_sdhi_reset_hs400_mode() clears it on =
exit. During tuning, when both
> TMIO_MMC_TUNING_DELAY and
> TMIO_MMC_HS400MODE2 are set, the lower 16 bits of TMPPORT2 (TMPOUT) are m=
asked off while preserving the
> upper bits, replacing the previous unconditional write of zero.
>=20
> In renesas_sdhi_clk_update(), force clkh_shift to 1 when TMIO_MMC_INTERNA=
L_DIVIDER is active and the
> timing mode is HS400, allowing the SoC's internal divider to be bypassed =
for that mode. Adjust
> renesas_sdhi_set_clock() to halve actual_clock when TMIO_MMC_INTERNAL_DIV=
IDER is set, and guard the clock
> divider calculation against a zero clock value.
>=20
> Enable TMIO_MMC_HS400MODE2 in of_data_rzg3l, completing HS400 support for=
 RZ/G3L.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v18:
>  * New patch.
> ---
>  drivers/mmc/host/renesas_sdhi_core.c          | 33 ++++++++++++++++---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 +-
>  include/linux/platform_data/tmio.h            |  3 ++
>  3 files changed, 33 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 42645480b62f..efc8bd1d2422 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -186,8 +186,13 @@ static unsigned int renesas_sdhi_clk_update(struct t=
mio_mmc_host *host,
>=20
>  	clk_set_rate(ref_clk, best_freq);
>=20
> -	if (priv->clkh)
> +	if (priv->clkh) {
> +		if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) &&
> +		    host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400)
> +			clkh_shift =3D 1;
> +
>  		clk_set_rate(priv->clk, (best_freq >> clkh_shift) * priv->divider);
> +	}
>=20
>  	return clk_get_rate(priv->clk);
>  }
> @@ -206,7 +211,8 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_ho=
st *host,
>  		goto out;
>  	}
>=20
> -	host->mmc->actual_clock =3D renesas_sdhi_clk_update(host, new_clock);
> +	host->mmc->actual_clock =3D renesas_sdhi_clk_update(host, new_clock) /
> +		(host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER ? 2 : 1);
>  	clock =3D host->mmc->actual_clock / host->pdata->max_divider;
>=20
>  	/*
> @@ -227,7 +233,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_ho=
st *host,
>  	}
>=20
>  	clock =3D clk & CLK_CTL_DIV_MASK;
> -	if (clock !=3D CLK_CTL_DIV_MASK)
> +	if (clock !=3D CLK_CTL_DIV_MASK && clock !=3D 0)
>  		host->mmc->actual_clock /=3D (1 << (ffs(clock) + 1));

Ref: https://sashiko.dev/#/patchset/20260622155610.184271-1-biju.das.jz%40b=
p.renesas.com

I will drop checking the clock. Also, I have reported an issue with divider=
 control values in
Hardware manual for HS400 mode. I am planning to defer HS400 support, till =
I get response from
them. I guess it is OK for you.

Cheers,
Biju



>=20
>  	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock); @@ -274,6 +280,7 @@ =
static int
> renesas_sdhi_card_busy(struct mmc_host *mmc)
>  #define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018
>  #define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A
>  #define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C
> +#define RZG3L_SDHI_SCC_HS400MODE2	0x020
>  #define RZG3L_SDHI_SCC_HWADJ4		0x022
>=20
>  #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
> @@ -306,6 +313,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mm=
c)
>  #define SH_MOBILE_SDHI_SCC_TMPPORT_DISABLE_WP_CODE	0xa5000000
>  #define SH_MOBILE_SDHI_SCC_TMPPORT_CALIB_CODE_MASK	0x1f
>  #define SH_MOBILE_SDHI_SCC_TMPPORT_MANUAL_MODE		BIT(7)
> +#define RZG3L_SDHI_SCC_HS400MODE2_HS400EN2		BIT(0)
>=20
>  static inline u32 sd_scc_read32(struct tmio_mmc_host *host,
>  				struct renesas_sdhi *priv, int addr) @@ -441,6 +449,10 @@ static voi=
d
> renesas_sdhi_hs400_complete(struct mmc_host *mmc)
>  			host->pdata->osel_tmpout) |
>  			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
>=20
> +	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
> +		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2,
> +			       RZG3L_SDHI_SCC_HS400MODE2_HS400EN2);
> +
>  	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
>  		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
>  		       sd_scc_read32(host, priv,
> @@ -582,6 +594,9 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio=
_mmc_host *host,
>  			 host->pdata->osel_tmpout) &
>  			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
>=20
> +	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
> +		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0);
> +
>  	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs4=
00_bad_taps))
>  		renesas_sdhi_adjust_hs400_mode_disable(host);
>=20
> @@ -739,8 +754,16 @@ static int renesas_sdhi_execute_tuning(struct mmc_ho=
st *mmc, u32 opcode)
>  	if (!priv->tap_num)
>  		return 0; /* Tuning is not supported */
>=20
> -	if ((host->pdata->flags & TMIO_MMC_TUNING_DELAY) && priv->tap_num =3D=
=3D 8)
> -		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0);
> +	if ((host->pdata->flags & TMIO_MMC_TUNING_DELAY) && priv->tap_num =3D=
=3D 8) {
> +		u32 val =3D 0;
> +
> +		if (host->pdata->flags & TMIO_MMC_HS400MODE2) {
> +			val =3D sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2);
> +			val &=3D ~GENMASK(15, 0); /* TMPOUT MASK */
> +		}
> +
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, val);
> +	}
>=20
>  	if (priv->tap_num * 2 >=3D sizeof(priv->taps) * BITS_PER_BYTE) {
>  		dev_err(&host->pdev->dev,
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 709351693efa..bce8f4bb6cf2 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -175,7 +175,8 @@ static const struct renesas_sdhi_of_data of_data_rzg3=
l =3D {
>  	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
>  			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
>  			  TMIO_MMC_64BIT_DATA_PORT | TMIO_MMC_TUNING_DELAY |
> -			  TMIO_MMC_INTERNAL_DIVIDER | TMIO_MMC_HWADJ2,
> +			  TMIO_MMC_INTERNAL_DIVIDER | TMIO_MMC_HWADJ2 |
> +			  TMIO_MMC_HS400MODE2,
>  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>  			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
>  	.capabilities2	=3D MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
> diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_=
data/tmio.h
> index 8b4032b24d36..fe8cdc057e5a 100644
> --- a/include/linux/platform_data/tmio.h
> +++ b/include/linux/platform_data/tmio.h
> @@ -59,6 +59,9 @@
>  /* Some controllers have hw adjustment delay */
>  #define TMIO_MMC_HWADJ2			BIT(15)
>=20
> +/* Some controllers have HS400mode2  */
> +#define TMIO_MMC_HS400MODE2		BIT(16)
> +
>  struct tmio_mmc_data {
>  	void				*chan_priv_tx;
>  	void				*chan_priv_rx;
> --
> 2.43.0


