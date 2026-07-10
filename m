Return-Path: <linux-renesas-soc+bounces-35014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g9QvK7iyUGps3gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:52:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CBF738ACB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 10:52:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=T43BO3zt;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77EAC300E17A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 08:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFA334E760;
	Fri, 10 Jul 2026 08:47:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BDF3783D8;
	Fri, 10 Jul 2026 08:47:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673245; cv=fail; b=PF6lEQCstgyN1f1aQByqT2EMOQPEvq0/dO1b0f3ltaeTWe9SxeYvobRLRq8+iLuIsQXK2dSPfZ0duyKFOoI/0mm+rrFr1jb4fKKWsHquWZojPPMG8hED1yp/4PCqBmQoA9SxXiej1Og5d+mxlqGRE50MFxQjqWGnf89lHkpuDYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673245; c=relaxed/simple;
	bh=ItinOLGNTsjrB/EGYcEPbFQypOzOwmereNEYqZ70GIA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=saUfeD/Jlp1kabKSICjo9FVJKfsq9O6V2bi5OspPJGil2ChqBoje+SOArO/qReza7WiXYkaQ5eI+H9AKCMdUrUBhgkEqHGXxv9jiMhtBIBTb022kIMkSLC4/oHP0l+Z+NX1uWmnNOWX4kGPZOVJ4aUjOkGr+sRzAoPcytpOyb6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=T43BO3zt; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvxOGYnfxBa5W0kohb8QHEi/gnpabEWCHO4WBdOJtKqed2Ecc9drnAq7jhuyw1fs3eO5+i3ZrDBAeV98vR4U7AO6PBV13SmrDXZsL3CX/7if30eAiLElOOvwQfheTBtXzmNpBMNOtXkDARVTm8gRKQDxapMybIagvTdydiBnuXD+JoKkd4Nsfm3Z6/0O9fud3HTr97HAADSMD7MnW3ngkFkgzWezD7v7+a4ctR/X88pPBj7flgFIBOVZR2jPJT+gFNpyA1dzy/DJh7K5jmUxA6XZm+pVYp3yOcQmf8Ob6VzERHx7r6QOs4QJIqDfDx6AofEEmysbkJxwOF3ExMhI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDSnA8csiTPGdXyRNmk/QEh9kBNI/Pbhir50WEOnRik=;
 b=c8d6AZC0Apzws3RsmKjuA3UvgLWcI5q4dMGVzmyK5R2y/V3HgEpE1MAeY9nSkmXVnZPtD2IDcYtzbc+IK2JSVU4sS2SBGWYiR9J4vfT3t8FY+ndxYLi/jPPvWvSN2XZOmuNfpVzrtoV+eTy/8cfu8XVXWed3XbK+/1w9Y5oJTAU+Bk6vhmILRVJFii8dHZtwWWmkk7yQgwsu4CKszy7taw2cndKs2gu0wbjHW7TXAbVIeMgCnvyeJToltLgKZhgCMWXpMjoj3ctChXsGFNNleKv1XKOyGKb1okosB+uEoup5Vd5h8g9vPc6aYD7bJJ+D21JAefAN5PpzuxUmYQ2RTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDSnA8csiTPGdXyRNmk/QEh9kBNI/Pbhir50WEOnRik=;
 b=T43BO3ztztCqkv3UPZiAAf4jsVrX/Mgrc2MaZNWL+f3Iojp9y/nVZMahTb20Df/MYcNqhL8XlDpLDmFK3UinoGvy8nPzHHC8gg2pWwuQeZaBqDR2pbpjFl4oYHAMQphymasR0fDzuHP7o1VJdIWr+xQO5bztHU+oJn8X1N5QBEk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9802.jpnprd01.prod.outlook.com (2603:1096:604:1ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 08:47:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Fri, 10 Jul 2026
 08:47:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Ulf Hansson <ulfh@kernel.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v19 06/12] mmc: renesas_sdhi: Add
 TMIO_MMC_INTERNAL_DIVIDER flag
Thread-Topic: [PATCH v19 06/12] mmc: renesas_sdhi: Add
 TMIO_MMC_INTERNAL_DIVIDER flag
Thread-Index: AQHdD9lDUQtKz6TL/UOUavY9dNAZ57ZmcJWA
Date: Fri, 10 Jul 2026 08:47:20 +0000
Message-ID:
 <TY3PR01MB11346E4BFB27A5002B27AF21486FD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
 <20260709192916.630794-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260709192916.630794-7-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9802:EE_
x-ms-office365-filtering-correlation-id: d4c5912d-41a5-4449-2984-08dede5fdaae
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|11063799006|56012099006|4143699003|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 37KK0Wa7TKtyTgen6ERH3JOXRDsrwj1XLDMfWcVYxAiBcFdcNHdL/2YekODoszF0Hil+FnN70Ghe5qWUgjpHzr7f4Y06bbcsK4uIghzynctCI0iLGlCqJ4XnIY1QjdXDDi/MgKU0Jxry3kNAPleGySVHgvGSqMKyzO3a2vCVdNH8Pq/dkgqaL1o+tgGP4J3RYSRVR2WuXkxfvYIQhFkzOK0ORirYFrQRlgZ6W7I3SUfz8jzYw2t4v5FwsZ82cpq+kaNd6lEmEG2BQTNqsf+ffFf0p6DeaYYme/n+IgbWoHyndK1+AfIUlSxsqIJo5Z5gHt9SwOcplagD3loDau8MqZqkkrydGKsh/nYHbRK/aEIgmD75dCEp1tZTqwkNopB4iqsS7cloCGXcEdwBNQwCqzMtH5TwnppHbtr45Zak+AB67w7wgXL2Rqi8H3dXDL5peydomr/hg7ne25MvYht8PbU2HqWpikuVzJk9dc3hnOETOvIJ7kuopsTHLAGozG3fOVcVit46P6a0vhkD0+NMKJq0fPxXnoIXcvOdQXT8tg6XwqY580ncLnFV+JNhKw+wNeT0l3+HB13sxsrEIKVVfgZXVZ/wtIqGlfcJamx/Wvh7XxLHaisC/mUKyF72fIrcrCnIgXZnnd5+7kB27U4CZTsfpvEVjchWHawm7diqBpU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(11063799006)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cdiEZ9OSTI9hdg9q8bZNeI7lYOXaVIUUF0nTvsUxEO+g7sIABfh30YV7bXKd?=
 =?us-ascii?Q?DRukFk4pH58ymK35BtrOrOllV6VIM82dPprNc077TZ9GTTOaXJ6pdQSx6WMn?=
 =?us-ascii?Q?TV1ObVXPLIl45DhZ0qUfh+lZF419ITB+y4gQ9UUv0IaxChlrduC7sqH2t3jp?=
 =?us-ascii?Q?MfNe3QTX1zCBARdpveNst64DhnVHV8PqVL3pTCsLeaEroMbbmSWMSeVu/F6L?=
 =?us-ascii?Q?Pp1CEerTQv6zAHkWkTnauaHoJeHXCLqeH0uxHrwH2rLjodb2PCJFTdMttH1W?=
 =?us-ascii?Q?jwb2O8evJhcPEh8EQ6G5ItEbS8olOEEfYS3ayNCL6JG48pMbdIhn9vgQ2BLv?=
 =?us-ascii?Q?klBYp+DNvxUlBiIeqL/kWQCbnsYbn1nb0qXmK77Y88Q2kHxyZXDhouJ96G2L?=
 =?us-ascii?Q?vBXD3DWBSGnEGBMGP+B266yoMDU6PMa21l6s2zJnNvMWZpJ1y2X9Z8yqdylJ?=
 =?us-ascii?Q?J0NgbZZNwPt4b0lMFEzLzXvJykAPDBJpB1f5xhzXDmXH5FTWuy4eeilwnXdd?=
 =?us-ascii?Q?ygi9ScyirIkk6g1e3Lcnzg314rR8HqCMflqb9IGSU6LAbFs60PdvJy5jJaMM?=
 =?us-ascii?Q?Q+yqI13HdmczKO+fQUBogDcTuhBbSbId1C+k5Iy8Oiad6MrYRZBxnWys+B0N?=
 =?us-ascii?Q?SlhIY+Z5FQiCFH9exiWdMd9i0P01YLTPtih6HQazQl7vBy6sEJ1Femp7imFd?=
 =?us-ascii?Q?5lQ9+bnRDjwku+QgBIInzxu2JnnLhI925hj+UdTd+AhHHrJqcsjJnCYMpOwA?=
 =?us-ascii?Q?8h/LDxgGhqXRq+gcyHE8bps3MjhDV7WyXfue2AsgO7IuGwI9hg3fXLZsl9iN?=
 =?us-ascii?Q?Xl6jIuq79JLf3T4mUz5RLpdCfIraZx13pB1PD2ZNG+mjI6wNh7vgNv98A+3B?=
 =?us-ascii?Q?6x5TXa/stkjTxUzuhHFYn0lX3c904SXDfqi5hMZneensr6imFlcbMZjmBdDr?=
 =?us-ascii?Q?E6u6XNpAvdN9B9DP9IY7YWay23WNS0F0xudzUJR+ssqFYitHYNeBt+Xb6mJf?=
 =?us-ascii?Q?mVdvA0HzklunQRKE79Rrtf19PQ0OUZ9tIrwgY7z1CMqkiqmVhORFeGu5E+dO?=
 =?us-ascii?Q?85Q/m3rd0h+7oqJa+ITM5aAD+I0SEfJ6Nv4codpK6wRwYB5PJTq00qk+KoUo?=
 =?us-ascii?Q?OiWToDXdKCKoWT+XFTW6ZOlpIhPTtRA/FAWdYD2MnDxF3pJ+uK6YjVhPXcDk?=
 =?us-ascii?Q?vw0Oj3kKggKuFwiM5XuXs7ne8cJEVbJqZ+NIC4KuqFuilIUzYBgk3tRynk8j?=
 =?us-ascii?Q?oZ7IUgr8GMMTrDqUYtygvws+9i2rqFZfqPYzyxE5Z+C1xpPwAa2AmSJqqcKc?=
 =?us-ascii?Q?XreREziT940ZfMJnUNFEGv6SU0TeyZb2O1baWw1dBifwk+O7rQz9AoQFUQmS?=
 =?us-ascii?Q?J0cjRsaESG6tqmf/DmgVGZP1ogVDZhr50dQK7yOGwLueikdauHxNDFfyuVvU?=
 =?us-ascii?Q?w8krPSHPXx1Js6RVkqXLsun/RtfTE9mAYGNxcF9RPgFMZtYg9t0HhA29AT4P?=
 =?us-ascii?Q?bR/SY6eRX+mu2bPcge766tYp0L+ei7QYgE9jc/hT9OJifbkpU3AuMFkkU3yR?=
 =?us-ascii?Q?xvAbRaIeO9+1lFHVzYDoPhOrdeXbq0PXYzJ2PmqpewyZpZc6bB+FSKyrzXiZ?=
 =?us-ascii?Q?xlY/iuJwTEHofmUsNIufHqyL6lipAJI8rN8JL4h8WbOGOOsuIeSUQj+Nb+6C?=
 =?us-ascii?Q?UrKQ8LL9hMjAuJr/oj/Zvr9+q1subn3LBlB9FVVgxHf5mYtJM/u+asfLjbeR?=
 =?us-ascii?Q?RsZ7XQi1kw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c5912d-41a5-4449-2984-08dede5fdaae
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 08:47:20.5230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dARCNRC6Y9shFaHnTaNurvVJX3ZD/5SeA3C3Uc5stChGi0j5B5KxVIvG6yK0vbu33+1ndw+vpA3HSyHlrtW0d4+adBpn/Mk6CgK0LwwZ234=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9802
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35014-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,vger.kernel.org:from_smtp,bp.renesas.com:from_mime,bp.renesas.com:dkim,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17CBF738ACB

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 09 July 2026 20:29
> Subject: [PATCH v19 06/12] mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVID=
ER flag
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The RZ/G3L SoC integrates a fixed internal /2 clock divider that is activ=
e across all bus timing modes
> except for HS400.
>=20
> Introduce a new feature flag, TMIO_MMC_INTERNAL_DIVIDER (bit 14), inside =
the TMIO platform headers to
> mark hardware profiles carrying this integrated divider scheme.
>=20
> Modify renesas_sdhi_clk_update() to inspect this flag when setting and re=
porting clock rates. When the
> flag is set, the function bypasses the standard base division logic via a=
 modified clkh_shift adjustment,
> then factors the physical /2 division step directly into the final calcul=
ated frequency value, provided
> the current bus timing is not MMC_TIMING_MMC_HS400.
>=20
> As no existing platforms configure this newly introduced bitmask flag, th=
is patch delivers the underlying
> operational infrastructure with zero functional impact on existing suppor=
ted chip variants.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v18->v19:
>  * Updated commit description.
>  * Dropped divider variable from struct renesas_sdhi.
>  * Updated renesas_sdhi_clk_update() to return rate for HS400mode
>    and nonHS400mode(uses 1/2 internal divider).
> v18:
>  * New patch using flag.
> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 13 +++++++++++--
>  include/linux/platform_data/tmio.h   |  3 +++
>  2 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 832a7a7be725..b6bba03316fe 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -184,10 +184,19 @@ static unsigned int renesas_sdhi_clk_update(struct =
tmio_mmc_host *host,
>=20
>  	clk_set_rate(ref_clk, best_freq);
>=20
> -	if (priv->clkh)
> +	if (priv->clkh) {
> +		if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
> +			clkh_shift =3D 1;
> +
>  		clk_set_rate(priv->clk, best_freq >> clkh_shift);
> +	}
> +
> +	freq =3D clk_get_rate(priv->clk);
> +	if ((host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER) &&
> +	    host->mmc->ios.timing !=3D MMC_TIMING_MMC_HS400)
> +		freq /=3D 2;


Looks sashiko's feedback is false positive as it is preparatory patch
and there is no platform uses TMIO_MMC_INTERNAL_DIVIDER. Moreover
the check is for early SoCs that do not support tuning.

[1] https://sashiko.dev/#/patchset/20260709192916.630794-1-biju.das.jz%40bp=
.renesas.com

Cheers,
Biju

>=20
> -	return clk_get_rate(priv->clk);
> +	return freq;
>  }
>=20
>  static void renesas_sdhi_set_clock(struct tmio_mmc_host *host, diff --gi=
t
> a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
> index 868a21842fa5..6c512e96e192 100644
> --- a/include/linux/platform_data/tmio.h
> +++ b/include/linux/platform_data/tmio.h
> @@ -53,6 +53,9 @@
>  /* Some controllers have tuning delay */
>  #define TMIO_MMC_TUNING_DELAY		BIT(13)
>=20
> +/* Some controllers have internal divider */
> +#define TMIO_MMC_INTERNAL_DIVIDER	BIT(14)
> +
>  struct tmio_mmc_data {
>  	void				*chan_priv_tx;
>  	void				*chan_priv_rx;
> --
> 2.43.0


