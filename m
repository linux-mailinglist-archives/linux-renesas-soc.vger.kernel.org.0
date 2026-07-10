Return-Path: <linux-renesas-soc+bounces-35021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9CZpB4q8UGpV4QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:34:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 625DF7391AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:34:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=N7TF63HV;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF0DA301051A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 09:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680833DD85C;
	Fri, 10 Jul 2026 09:27:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FC53DDDAE;
	Fri, 10 Jul 2026 09:27:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675652; cv=fail; b=qaK/MDZyR8vnear7IiqCuYWcs4+YCbJALOoKBWfdQu1k6/368s7eZLPY3/1seXp855zOK+wH7WTXMoj+oNSjH3hWhO74eaONZowX8gaNXqIyu36/AbMY6N1JaS5avokjGIv7OfAK30kehtGAcsiVyT26VQF+VfPKo5el3WbdAU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675652; c=relaxed/simple;
	bh=AKqNwsZYqqtlHG5BxRccigcaI0uXr0+l35qXjA4+tnE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N6l4GCHLPgp2G3umosu22GT52GFpFxmiI7jBuBeszsh2ZbqEpZcnSegGAP9a/WiRu3UvYUeIFV86ZyxIF+Ty90XxTchiZKtukIs6YZnoU+UdoIQ2o/5XKdPOowReDqeArMbEL7/ZgJI1QQFOsrqqVpBa0+X6a2P+eKp9nVw7/nE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=N7TF63HV; arc=fail smtp.client-ip=40.107.74.41
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAkdkhKsqmec11u5+gg1bfxmEA+9oGJ5grs+D4yR/PT8iOEwOFIHwhPRqpfm9Z6D8CkwolkR0p39hyzZF0upA57Pc5fpMSkMI5K8bNrUZ8lgLwVhthJ8X/WC7bxm8vsjVCqJiJbT8kzv22NP3HmX2Gwp0tvdn9qQyrERv6ejXtjqHOU1c2U+md8qGGrCGjNRuHkJlm3EOUP1vEHaNH4ayUisRbrG0sIy6F5gwMKgu6Fzbv5m3Fm/QX5r3Yjm0c0n0MSxo6p9eMWpbnooohJeKyYAktdDcnlL+kcz+58e/ZQvLqWhaU0cEFQ05mFJbyi+HYPlBwA0PG+9APpCwKbB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBKyXtvGhF6PZWYhyo7FfNwM+PuVGNduSPckn936k9k=;
 b=d6bNN+FaQ39aM7c/kIZJ+7lsMtgFdjN9AMG8AfDm1CPoPuoYrKN8mCasdA8HFdogqTVVqD8N3dOQRXnPiHDX7lGB08wXQxl1Y7LtXMiNx8ATK9ohc1ivFXzscYGsPhcGc0+5ihi/Znt01goRkd+8A5De8jw+IayfBhs7rCpqFIcBHVCe43gP+YWDvzSdapGh8Xt6F6+Uxa2JAbWio09BhijUzUPF0VZcbdxq/ywyH5mBMGA2wLrkrZRhwUlKz5cSERDk0XZvJxL2fY+QK1EHmAZLomuR6aRUeVCvlIdubSjFm4ETpV32b3zRHh5PxfgpFHir9+WMt7MpEeQchumGBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBKyXtvGhF6PZWYhyo7FfNwM+PuVGNduSPckn936k9k=;
 b=N7TF63HV9xKVFDmYrafcTTCmbnaN4YqkNyHkFwu64hpX8xlz4hNCKK2HHolyx+DG4pBFEmJvRFQLqXgLsKgpdKz/L82Fwnn3WPG2NWELyKAOxwAVQIXmN7t3cv58V6iaG+LDOxlV8XBdmm1lmKPQGxawx+A5VpMkqHGhczxnpCM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9469.jpnprd01.prod.outlook.com (2603:1096:400:1a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Fri, 10 Jul
 2026 09:27:27 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Fri, 10 Jul 2026
 09:27:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v19 12/12] mmc: renesas_sdhi: Add HS400 enhanced strobe
 support for RZ/G3L
Thread-Topic: [PATCH v19 12/12] mmc: renesas_sdhi: Add HS400 enhanced strobe
 support for RZ/G3L
Thread-Index: AQHdD9lFEfXhqOxAVUu80yErU0YRIrZme7Aw
Date: Fri, 10 Jul 2026 09:27:26 +0000
Message-ID:
 <TY3PR01MB11346F6F629176C46DEC3498D86FD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
 <20260709192916.630794-13-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260709192916.630794-13-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9469:EE_
x-ms-office365-filtering-correlation-id: 9378c12c-96ca-4c53-96dc-08dede6574ed
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|38070700021|18002099003|5023799004|22082099003|11063799006|6133799003|4143699003|3023799007|56012099006;
x-microsoft-antispam-message-info:
 mi7ncGZsHwxHimu4igtIhg1tA0NSjOeVtcS5GrYs/575Rb9x3S1zeR7VxFDvr9vZQk1FfClI63w1QYCKrYXFbfWlxnpUVx3lQQGyjgeh2pltiIg5h2yyBq0IkhaDnlsc2QV6LY2DShpHwS/RalpiSi+oYYiWVX1BGagmP8VHHYoWtCxHSh73EXgj/cFTCLS2D1pAfhJyGxl3K32GJg2GYROaIQifcR/JzSMkd+PeABtj5Ki7uyC+zwhjWUrqBiQT9tq0eiMIO27z/5wpPLlg7nSb1TKEeYK4FYC/bgP60w2igK/u1Jsr+M/BvE+G6IueGxyuYWbeKE0lc9XimAU2xheWHtAgfH2bimxldOawkWsmbW68yeose2i9Jj/da7CFxAUtopKdJ90YBFsa064zKMYoQugXJwNT45eK8MlEjIk7+5mwIyOg/vyQRJcboC9R0Ec3al9z7ACmjuYR/5ANXgFSu5DtreL9aazqK9ZJPQmi4tQ4lqhtNBJyt4zRiem53MLSCreI3ZMd/gF5/bvddqH+AKb1T8fskhQep9qCj/w8/TQWQSjbjdOGwqvjLmEIWMU2MGMOent8E456FTBS9yXZf0/o0bp6tOtp+3W1IXfa51+5H+5jJzRg+PBV/TYRFawUqGpTKB7LwlIUZ1bno4qmtKwK633QkcgtcZpDljc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(18002099003)(5023799004)(22082099003)(11063799006)(6133799003)(4143699003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?95tN5majHuzmlyXDFyvqFSYhCPMOHQ5DdHWC1EzUJu7mGyr7MGDtxqZTlWZw?=
 =?us-ascii?Q?G3+5z9gpRlqRDij13j0YBgXOMbtMPf9AnrRiZc/32acXgMUi4qR7vnOnAuDa?=
 =?us-ascii?Q?p0giAm8Cx9U6TsK3hTebrjNMeVCxQI+VwVRHe6ghoclVbz6tDaH4UsXuQu7e?=
 =?us-ascii?Q?VJqevaOY+bT3sEIKYQjxa0Ksk44J8+RpVgfiXA+0jyJGPQlsRhRxU/2NINvx?=
 =?us-ascii?Q?wYQ14DA0/z+6BSdhgrayCdXtDaGkK1Zja12PKyJcHGz86gI+rB0Mv6f8ie/f?=
 =?us-ascii?Q?fyT1bKneBwCWipDRfYn/tqfOkHiYf/w3FWQeZVVee8glo7dBYTzxBN/Etctw?=
 =?us-ascii?Q?I5KGRUSX3lhQ6FNkr1e99KNqKw49XvhmmUaDZB2/UeUYNHpyQNvlMQRxF+Fv?=
 =?us-ascii?Q?LM/bRDutCFU91kwvRAdOXqCwwRxfN0YT5TBoKbReOOci13Po/nT1N/GpWO6i?=
 =?us-ascii?Q?5bBKXfM5fERPDuBelo0CGdVtqh0r/SvO/mO2LbofidOulhnHfw+bkhz55cQ1?=
 =?us-ascii?Q?CAkVKi/aZEa7/lDQnE67btuQwJiNQ/6bdtNnYljGtnCddKW/6m1ZkrUfs/C2?=
 =?us-ascii?Q?Vf8zwlj7Q99QfDMlvS1UBPzWpajUtQPBXe+0LDHiAtvxVUuupJNYtYiTeK/V?=
 =?us-ascii?Q?tThMidyLE4jVzjQMHFyjdtAA1r6DoPNdbIy8i9Kq+lfxkNGG4FtRNfBR14Jf?=
 =?us-ascii?Q?abdUcdAfhM24s+2Ldf4maX8sQWi4lU47rD7z8PIdkidL6A9i/ZWDV63Ij7um?=
 =?us-ascii?Q?rSqERc06xeat+IU8zdGnIpjF0JWm1TZ/9gJEUw+dz6Z57xxx/WAGsVrZgbE9?=
 =?us-ascii?Q?lrU9RX0Xc46IDbLAwlnkRhbGKf0gLTJQlAE5S1S/28DNnzfYXDvvFWkYZv6R?=
 =?us-ascii?Q?5JaNj15wvzHbJDvxZe66Yak+N4jho7LY6mJM7+K2xEawPXSRqXovcGAx+ZWA?=
 =?us-ascii?Q?GYFYpbCL+rmGhuVppKLnu13JVskw6J+wngEV4+ylTpKc5+oHUaB7hG4IiL49?=
 =?us-ascii?Q?hi6c3vw/Xn5VlCsoXlOAavAcGpwk5GjFI555YMkEr+gsSuDT7hnRix68lyVT?=
 =?us-ascii?Q?4b76gOSuqfJfcyBA/mKeP1lrTSwEqFN0vuk2Q7QiF+jEsMcLdXJTq41dZVvH?=
 =?us-ascii?Q?OJrquer6pFSr0n7IoXl7wD7aGo6lFm06WOU+T6PLr2Rb/32mb3QeQp13gIAP?=
 =?us-ascii?Q?YqzH+2VYyD3NEx3dypFQmvlv4H3Z2wIuIOgyYtQh5yKpocgLj+7i1251oOKc?=
 =?us-ascii?Q?vyk51ZsRYBi5bMs4kU0MGSIshqWUVA5jyXBB6HdCl9E7Gf8qA0Spq9kVHFC0?=
 =?us-ascii?Q?9Dlrruy6z9zkhLLDwIhRYK+WwK2EhCFjgmek787A5StHYD3KXoq9SZHWlZDj?=
 =?us-ascii?Q?moZ8ICX0/kwKJYHd7a7TmEdWUUr39x5Dc44L8p/woiRzQwJWP76cVK+CPZSG?=
 =?us-ascii?Q?taRaFD86vj6IQxJVkrc/GwSqr+1wvUyCtiMmd/GhgYYLw4ifYGQcRtdJC5kP?=
 =?us-ascii?Q?Lrgaw9Kbzyj32JggCkR/Y4Mh4PKqwCqyUUFnfphDinfkQtBunaR0uQBrEhyc?=
 =?us-ascii?Q?nGQriuutidw8WffwUFI6kvgm6ngKVI4qqF1/LGnMyHpQw4AqOOKPeka35MSK?=
 =?us-ascii?Q?OPXiaKmg+QEXlg+/7LvtdWUu1U5Aly9c2Zppgf9Nmzr9sJ8J3oArL/MnF14i?=
 =?us-ascii?Q?E6ZaHJx7GPdO8UsYnb1QesghUxMfeGIlZgcwyePyh7jmkwG/i89UvEPlTuCZ?=
 =?us-ascii?Q?3meywE/lZw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9378c12c-96ca-4c53-96dc-08dede6574ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 09:27:26.7463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YmccKljYIMEhlTB0/EaoaA6lEe3Xzwz7cBIrKyPhHeK4Uc68B37FJUeAaMYl+Jz8pbz5axmk4aLs9/BqaxVy89wEHtRQEdv7XaLbubUcAK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9469
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35021-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,renesas.com:email,bp.renesas.com:from_mime,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 625DF7391AF

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 09 July 2026 20:29
> Subject: [PATCH v19 12/12] mmc: renesas_sdhi: Add HS400 enhanced strobe s=
upport for RZ/G3L
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The RZ/G3L SoC supports HS400 enhanced strobe mode, which requires additi=
onal SCC register programming
> beyond the standard HS400 path.
>=20
> Introduce a TMIO_MMC_HS400ES flag (bit 17) to identify controllers that s=
upport enhanced strobe. Add
> renesas_sdhi_hs400_enhanced_strobe(),
> which, when ios->enhanced_strobe is set, disables DTSEL in SCC_CKSEL, cle=
ars TAPEN in SCC_DTCNTL,
> programs SCC_TMPPORT3, sets HWADJ2 to 0xFF, enables the HS400 interface m=
ode bit in CTL_SDIF_MODE, sets
> HS400EN2 in HS400MODE2, and sets both HS400EN and the new HS400MODE1_ENHA=
NCED_STROBE bit (BIT(30)) in
> TMPPORT2. On exit from enhanced strobe, only the enhanced strobe bit is c=
leared. Register this callback
> as host->ops.hs400_enhanced_strobe for controllers carrying the TMIO_MMC_=
HS400ES flag.
>=20
> Update renesas_sdhi_reset_hs400_mode() to also mask off HS400MODE1_ENHANC=
ED_STROBE from TMPPORT2 when
> TMIO_MMC_HS400ES is set, ensuring a clean reset on mode exit.
>=20
> Enable the TMIO_MMC_HS400ES flag in of_data_rzg3l to finalize support.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v18->v19:
>  * Updated commit description.
>  * HS400ES support is enabled based on of_data.
>  * Fixed the space in HS400ES comment block.
> v18:
>  * New patch.
> ---
>  drivers/mmc/host/renesas_sdhi_core.c          | 49 +++++++++++++++++--
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  2 +-
>  include/linux/platform_data/tmio.h            |  3 ++
>  3 files changed, 49 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index ae6b7d8c5b98..894da06b0d2b 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -308,7 +308,8 @@ static int renesas_sdhi_card_busy(struct mmc_host *mm=
c)
>  #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP	BIT(24)
>  #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR	(BIT(8) | BIT(24))
>=20
> -#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
> +#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN		BIT(31)
> +#define SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE	BIT(30)
>=20
>  /* Definitions for values the SH_MOBILE_SDHI_SCC_TMPPORT4 register */
>  #define SH_MOBILE_SDHI_SCC_TMPPORT4_DLL_ACC_START	BIT(0)
> @@ -589,6 +590,8 @@ static void renesas_sdhi_adjust_hs400_mode_disable(st=
ruct tmio_mmc_host *host)
> static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
>  					  struct renesas_sdhi *priv)
>  {
> +	u32 val =3D ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
> +host->pdata->osel_tmpout);
> +
>  	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
>  			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
>=20
> @@ -598,10 +601,11 @@ static void renesas_sdhi_reset_hs400_mode(struct tm=
io_mmc_host *host,
>=20
>  	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
>=20
> +	if (host->pdata->flags & TMIO_MMC_HS400ES)
> +		val &=3D ~SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE;
> +
>  	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
> -		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
> -			 host->pdata->osel_tmpout) &
> -			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
> +		       val & sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
>=20
>  	if (host->pdata->flags & TMIO_MMC_HS400MODE2)
>  		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0); @@ -806,6 =
+810,41 @@ static int
> renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  	return ret;
>  }
>=20
> +static void renesas_sdhi_hs400_enhanced_strobe(struct mmc_host *mmc,
> +					       struct mmc_ios *ios)
> +{

Looks it is false positive as mentioned by sashiko[1], I can enter
and exit suspend to RAM without any issues. On this platform during
STR all power supplies down except PMIC which puts the DDR into retention m=
ode.

[1] https://sashiko.dev/#/patchset/20260709192916.630794-1-biju.das.jz%40bp=
.renesas.com


root@smarc-rzg3l:~# cat /sys/kernel/debug/mmc0/ios
clock:          150000000 Hz
actual clock:   150000000 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      3 (8 bits)
timing spec:    10 (mmc HS400 enhanced strobe)
signal voltage: 1 (1.80 V)
driver type:    1 (driver type A)

root@smarc-rzg3l:~# mount -t auto /dev/mmcblk0p2 /media/
[   75.719668] EXT4-fs (mmcblk0p2): recovery complete
[   75.725806] EXT4-fs (mmcblk0p2): mounted filesystem 3a87d114-78ab-4be0-8=
fac-d055b25f4bd0 r/w with ordered data mode. Quota mode: none.
root@smarc-rzg3l:~#

echo TEST > /media/1.txt

root@smarc-rzg3l:~# echo mem > /sys/power/state
[  105.965920] PM: suspend entry (deep)
[  105.980163] Filesystems sync: 0.009 seconds
[  105.992243] Freezing user space processes
[  106.001271] Freezing user space processes completed (elapsed 0.003 secon=
ds)
[  106.008260] OOM killer disabled.
[  106.011496] Freezing remaining freezable tasks
[  106.017309] Freezing remaining freezable tasks completed (elapsed 0.001 =
seconds)
[  106.024713] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rzg3l_1.0.1_rc2
NOTICE:  BL2: Built : 09:19:29, Jun 16 2026
INFO:    BL2: Doing platform setup
INFO:    Configuring TrustZone Controller
INFO:    Total 3 regions set.
INFO:    Configuring TrustZone Controller
INFO:    Total 1 regions set.
INFO:    Configuring TrustZone Controller
INFO:    Total 1 regions set.
INFO:    Loading image id=3D39 at address 0x44428
INFO:    Image id=3D39 loaded: 0x44428 - 0x45428
INFO:    DDR: Retention Exit (Rev. 02.05)
NOTICE:  BL2: SYS_LSI_MODE: 0x12061
NOTICE:  BL2: SYS_LSI_DEVID: 0x87d9447
INFO:    BL2: Skip loading image id 3
INFO:    BL2: Skip loading image id 5
NOTICE:  BL2: Booting BL31
INFO:    Entry point address =3D 0x44000000
INFO:    SPSR =3D 0x3cd
[  106.061768] renesas-gbeth 11c30000.ethernet end0: Link is Down
[  106.065811] Disabling non-boot CPUs ...
[  106.068100] psci: CPU3 killed (polled 4 ms)
[  106.071161] psci: CPU2 killed (polled 4 ms)
[  106.075159] psci: CPU1 killed (polled 4 ms)
[  106.076800] Enabling non-boot CPUs ...
[  106.077070] Detected VIPT I-cache on CPU1
[  106.077135] GICv3: CPU1: found redistributor 100 region 0:0x000000001246=
0000
[  106.077182] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[  106.078267] CPU1 is up
[  106.078429] Detected VIPT I-cache on CPU2
[  106.078469] GICv3: CPU2: found redistributor 200 region 0:0x000000001248=
0000
[  106.078502] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[  106.079474] CPU2 is up
[  106.079661] Detected VIPT I-cache on CPU3
[  106.079708] GICv3: CPU3: found redistributor 300 region 0:0x00000000124a=
0000
[  106.079751] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[  106.080888] CPU3 is up
[  106.095014] dwmac4: Master AXI performs fixed burst length
[  106.095061] renesas-gbeth 11c30000.ethernet end0: No Safety Features sup=
port found
[  106.095104] renesas-gbeth 11c30000.ethernet end0: IEEE 1588-2008 Advance=
d Timestamp supported
[  106.096191] renesas-gbeth 11c30000.ethernet end0: configuring for phy/rg=
mii-id link mode
[  106.111005] dwmac4: Master AXI performs fixed burst length
[  106.111035] renesas-gbeth 11c40000.ethernet end1: No Safety Features sup=
port found
[  106.111066] renesas-gbeth 11c40000.ethernet end1: IEEE 1588-2008 Advance=
d Timestamp supported
[  106.112144] renesas-gbeth 11c40000.ethernet end1: configuring for phy/rg=
mii-id link mode
[  106.283664] OOM killer enabled.
[  106.286800] Restarting tasks: Starting
[  106.292440] Restarting tasks: Done
[  106.296062] random: crng reseeded on system resumption
[  106.301515] PM: suspend exit
[  109.062679] renesas-gbeth 11c30000.ethernet end0: Link is Up - 1Gbps/Ful=
l - flow control rx/tx

root@smarc-rzg3l:~# cat /media/1.txt
TEST
root@smarc-rzg3l:~# cat /sys/kernel/debug/mmc0/ios
clock:          150000000 Hz
actual clock:   150000000 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      3 (8 bits)
timing spec:    10 (mmc HS400 enhanced strobe)
signal voltage: 1 (1.80 V)
driver type:    1 (driver type A)
root@smarc-rzg3l:~#


> +	struct tmio_mmc_host *host =3D mmc_priv(mmc);
> +	struct renesas_sdhi *priv =3D host_to_priv(host);
> +	u32 val =3D sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2);
> +
> +	if (!(host->pdata->flags & TMIO_MMC_HS400ES))
> +		return;
> +
> +	if (ios->enhanced_strobe) {
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL,
> +			       ~SH_MOBILE_SDHI_SCC_CKSEL_DTSEL &
> +			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL));

OK,  hardware manual mention this "When this bit is switched, stop the SD c=
lock output from the SD/MMC host interface (set
SCLKEN in SD_CLK_CTRL to 0)."

So, I will disable CLK_CTL_SCLKEN before changing these registers.

Cheers,
Biju

> +
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
> +			       ~SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN &
> +			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL));
> +
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT3, BIT(8) | BIT(9=
));
> +		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ2, 0xFF);
> +		sd_ctrl_write16(host, CTL_SDIF_MODE, SDIF_MODE_HS400 |
> +				sd_ctrl_read16(host, CTL_SDIF_MODE));
> +		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2,
> +			       RZG3L_SDHI_SCC_HS400MODE2_HS400EN2);
> +
> +		val |=3D SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
> +		       SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE;
> +	} else {
> +		val &=3D ~SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE;
> +	}
> +
> +	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, val); }
> +
>  static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, b=
ool use_4tap)  {
>  	struct renesas_sdhi *priv =3D host_to_priv(host); @@ -1358,6 +1397,8 @@=
 int
> renesas_sdhi_probe(struct platform_device *pdev,
>  		host->ops.prepare_hs400_tuning =3D renesas_sdhi_prepare_hs400_tuning;
>  		host->ops.hs400_downgrade =3D renesas_sdhi_disable_scc;
>  		host->ops.hs400_complete =3D renesas_sdhi_hs400_complete;
> +		if (host->pdata->flags & TMIO_MMC_HS400ES)
> +			host->ops.hs400_enhanced_strobe =3D
> +renesas_sdhi_hs400_enhanced_strobe;
>  	}
>=20
>  	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host->sdcard_irq_mask_=
all); diff --git
> a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesa=
s_sdhi_internal_dmac.c
> index 4000673ed7f8..ea993197aff2 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -175,7 +175,7 @@ static const struct renesas_sdhi_of_data of_data_rzg3=
l =3D {
>  			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
>  			  TMIO_MMC_64BIT_DATA_PORT | TMIO_MMC_TUNING_DELAY |
>  			  TMIO_MMC_INTERNAL_DIVIDER | TMIO_MMC_HWADJ |
> -			  TMIO_MMC_HS400MODE2,
> +			  TMIO_MMC_HS400MODE2 | TMIO_MMC_HS400ES,
>  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>  			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
>  	.capabilities2	=3D MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
> diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_=
data/tmio.h
> index 8a5dc18d43da..75d32c8ee57a 100644
> --- a/include/linux/platform_data/tmio.h
> +++ b/include/linux/platform_data/tmio.h
> @@ -62,6 +62,9 @@
>  /* Some controllers have HS400MODE2 */
>  #define TMIO_MMC_HS400MODE2		BIT(16)
>=20
> +/* Some controllers have HS400ES */
> +#define TMIO_MMC_HS400ES		BIT(17)
> +
>  struct tmio_mmc_data {
>  	void				*chan_priv_tx;
>  	void				*chan_priv_rx;
> --
> 2.43.0


