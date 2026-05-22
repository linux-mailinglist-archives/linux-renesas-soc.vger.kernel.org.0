Return-Path: <linux-renesas-soc+bounces-32963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPxkDYk6EGqoVAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:14:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A23DC5B2CEE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C084300071C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 11:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BADF3D567B;
	Fri, 22 May 2026 11:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pKk2s6Rx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E7F3A6B6E;
	Fri, 22 May 2026 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448453; cv=fail; b=K/oHsSyyf5yhd46PXpChjEfnVIo+le28J+OXTiVMkJo2a4R8VLoEYqzDlWy4ShAxqAhma2aAe2ZX//1QjyPfLTfMIuPsA8u01swnPTZcWCAsvr1IYU3dOygFxWGzX4hAf03FzwlEOSjTLnriRwXsKP6Taz4Ngw2A9c2N3wDNryE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448453; c=relaxed/simple;
	bh=ncEJlS3LgFAu2TgbigpRn4BQIbFHJ0beJ//KhTRuQvA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rCMdYUirbe8g5/KAU/zmfdKYjKcG8Z9CjHxivOf3gUkaaENVlIro7/BMFSaTpSDG1aXF0fwjnG33Zj1t+1/WTY4P7P+BUkKYcGjcB/F0dSMi11jKhkJdoGq0oHXZE7hSksrYCDEfVG09lfFGF85A2p6bExme8PgoQ0j12QkB6QQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pKk2s6Rx; arc=fail smtp.client-ip=52.101.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1/UjBu2iWB4Yy46bimD+nx80sMWH3u8AF2yaC2f+2BfGwSDBSmNcmWTdLZeIFriiidVEuDXKMHssqiRDVM0uEgm0UplXB5MILdb6oy5eTnv7sUIzDJrAiaAweGdkP0glga3g7JVwTSgmPBBCla3X4SKtJAB9AeCdhakEynyBrPcsbB15j9AYbtsqQHiuCP1eUsJbL2F8Kqk3oHqgmtiXd1XDb65T+6ox6U0X9A+66Scdan7TvDqxenohJZvsQIGH13WEPkEiXNY1/QQxMoCBnH7r7MlsHPCP7C7lFjw60WRx4TYv5JIeAeClDthDF+U4grBno/7Z6OxM4bHcIucQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPyoR1/XUd26VazEPxRH7yB+mB6YQA3qhJvccKakT2M=;
 b=vAq31Cq+5HOG/UNBqiWgkQs1D5q0znnwF2zmAkRUpy/vmqUXXegYzZJu9s1SVekb7dLao+pi75CfAw6IbOztMkNAgvzHZUIDJ2qzR8qA5Zjzs4w7ks8BaKYKohJwtkuqP/R2rLpRTZA4QayUvKTbitN4RQ7mUF4NIf97C932BW4aZOQwOpcid2/cm02apdkaBCiEgquJBkG7lb9HQ74P2O0mpghLtwJVqgRNQYZ98v4N4AbWOBOcapgukGrwaNzbeXmvx/ZtVEJRENq5kRTYIlUzCZxwosw7fFhpuV9ZUoyqoJFXdlbOYCCe+I5z1a7V+4lRLwzFoTbeg/AGGoJcoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPyoR1/XUd26VazEPxRH7yB+mB6YQA3qhJvccKakT2M=;
 b=pKk2s6RxS7RPCsq97buzu0SIFZglJTGSlDb/D/hLjD41y9gnqiB41LtfD72FcgD+dNuk2j5tbF4IV1zBjtwgX+Sv3D66f4pc36V4S5M108CwG97Vu1fFQGNorqseFDaraO2Uiacv5Pr7PZCtEmoZvh21jr9dGJIG2ytglIgpoh4=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TYCPR01MB7992.jpnprd01.prod.outlook.com (2603:1096:400:11d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Fri, 22 May
 2026 11:14:06 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 11:14:06 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, "paul@pbarker.dev" <paul@pbarker.dev>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net-next v4 10/13] net: renesas: rswitch: clean up is_rdev
 rswitch_device checking
Thread-Topic: [PATCH net-next v4 10/13] net: renesas: rswitch: clean up
 is_rdev rswitch_device checking
Thread-Index: AQHc4SOW3S19c3B2xkiQv0ZAQJ71orYLL2gAgA7F4bA=
Date: Fri, 22 May 2026 11:14:06 +0000
Message-ID:
 <TY4PR01MB1428254969CF2955F441A833B820F2@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260511-rswitch_add_vlans-v4-10-a5a225f8faae@renesas.com>
 <20260513013556.1408455-1-kuba@kernel.org>
In-Reply-To: <20260513013556.1408455-1-kuba@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TYCPR01MB7992:EE_
x-ms-office365-filtering-correlation-id: 6781a1ca-8142-4aca-ad40-08deb7f33d28
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|11063799006|18002099003|5023799004|38070700021|22082099003|56012099003|4143699003;
x-microsoft-antispam-message-info:
 Agz6CkUBvI8SdKYGsXxkhrF2vy52pUWEeG2VhsLoK6gVQ7ETWI8VRxI3xmDkp2sDAbR6oh/Naz86t3j8Cn9Su9/rdbC8vAHVWO/n8y6TnjJXzga4h/4M3IJQ8ZfFRiDoW7Q4HPz4z3L4UlGa8sa5l7v4Cs8bvJkPfIswaMgavtfLfEspTiVdpxOYDEgSaHUIDlWDTmVWwsUyaR5Fh5leVYdoq18Zgchg3UmuhrUTuPjxH3QIS5Ad5wOhowDQpcEqoQ7VyZb5y4BMq3qRV8bnny0Dis2JVQKwvO8M7ovBeDIuO7Dyuyg44K7jHM+W76KtaUTsNreEyrav6JYZBQziQKG8Bds2jR/PsKo324MiOo9DfTJv3gr1+3Vmmm+pvC5vwxNdQhv6MRIqr38pL76y23yfdjuQ5W4/i+67grETUoTTXi8SNWK9bQNFM47vPXHJrcsNOFh01rWIPBSIgCQGKbxLc2I4Z+EkJOZL2Lxu39mv5L3dxceviG/FrUcpu0BKR9pSogjqv+art4/0yVUIA/7pJl8ioykkAIESiWRXnmvdE3YkTtQJxZpun7R3HpAepHjf4qiBFKny+uQSJjv4pXUYkuRXhVY+NjJ4Qjxq4TsSTZ3KHokOmKALXq1wlADcZ4gjW7LTbIvhEV3K3OmAjL5CZ1Ir3hLzbDR7J6SB4YZZ5ZIzI30ioLDzFQyt2aKodL4yQVH1QoTTluel3FlPeB83WOKg1imW+gQ3eS4shPA+LxBG4Lnzs7jaNO1JQVZ8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(11063799006)(18002099003)(5023799004)(38070700021)(22082099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8wbzp9j6LliwjWgC7hREpygB0+Esbi5zuglE1/m0WrWEIK8+sPSKMC0oFiPQ?=
 =?us-ascii?Q?OqeXqwOHhUMBAx0Ld+iIeZrPu1e32MK8qFAVhHULMkRzp8JItAql7eNe9WnU?=
 =?us-ascii?Q?ijILvb/NFNV9QSDRO2i3fYLVeAAycaIlNGsVd7He+dM8GG+QM4VN5P/QZaAF?=
 =?us-ascii?Q?+Yb5jF2/UhtdC9b7vH9CAeXzxHociBhFhIqV8VamQrufE+cuuXp3H6Ngy1O+?=
 =?us-ascii?Q?SATFqVAY0wMsa+Tx/qVWhN0lMbq2aIsGd2BnX8SpVTMlltdchdG7p45Qfrz6?=
 =?us-ascii?Q?C2wG/vIzabHoBY5alZ1WTssyHTuMXLMurUipWypvGbmsGIxpEM+iEZRPKXX3?=
 =?us-ascii?Q?vGI3gK9JLXSx3nt+qItXsfY0gKjPUT8+vZRj0quV5n2gsdPA96aIUHlXygnK?=
 =?us-ascii?Q?0iE5NufTGCeu0Yq10AtOZ2rp1v1WeCKF5R/bmAid6Qn5OQR1oKiyUPxzbWOH?=
 =?us-ascii?Q?QNg2+PY9dbtKS7Typbr5Muf+8CuqSiqeKKvPyLPhGJQzrr2C0NLi75wIZXim?=
 =?us-ascii?Q?bKKOdxmaho1gswprnEkUByaKVpmZJ6Q2XDaKrtc6GwuBuicf6UioWvcGRZB7?=
 =?us-ascii?Q?bnTjrecKuALhzYMJ4RaV5ep2Wd1ijDnY27KWM+XDGSHFD9S38nqYG1/QKTja?=
 =?us-ascii?Q?os+d4mLGF08xoVv/hM/sXXMO5cGxlFSNzSdw2NdGaa3tR9kn3kM4MPkq/igR?=
 =?us-ascii?Q?XC0dTJRd2aFPtEB10wsH51kSyPRolBsoGkXc7ITmYJsnR6MrFzfamnDk5Ana?=
 =?us-ascii?Q?z5iNst3QxadCeGSjDkNq7f/eoNs0NQWHfgqfQmvmJ21KexrTG5JsTZjEg6Yv?=
 =?us-ascii?Q?BS9RNugO/PHB5EqWR3qk7Zm3AcZ7mTPIzYv2xcuOEw3YAmWZ5ybnGrPfopgY?=
 =?us-ascii?Q?T0dL7qC4uF90od4ls8aYS800Snz8GdI7aPPXoAdI9O4uX1Ep/vtZGUBcZPHc?=
 =?us-ascii?Q?AkFd5jndHvyicercB+Sp4T5d5ivKT4VoLAaThM2JLMqzCYvqYuWIeI81TZSb?=
 =?us-ascii?Q?qgvQUGd2IYZIsZAszL9LOETSk/BNcflBSf0RM0Qed18rWvGQiBUVhDWylpPB?=
 =?us-ascii?Q?jFMa+yrtIXZ1AfHK5thfahHRmDK+7XqWxi/oSJFjBbkIWYt25vd4fbrMosTo?=
 =?us-ascii?Q?ojDIkp57i4egX48l1vHb8aPGpzqzJ+we2WkYt5kqv9AuvxYbRg2PAdG9bV7u?=
 =?us-ascii?Q?wyqGxa6twKufcfSX2gF2D67v0kcs+XP/SOfiBxWvHjKfLyXsxkjrRLJ4519p?=
 =?us-ascii?Q?5nXSlumYRQrYnIZV6v90umoIi46i/f2zVcOOfH4G10cT50M9zzoEiSu4VSrx?=
 =?us-ascii?Q?AOGtf1jkWmKtHFbqRQIZrSZUr5t98z/29OOLhxffLfC5PZI+NHo73o3rDClq?=
 =?us-ascii?Q?vWMKcrfxYljA35xyMRoSSk8b59yKy2kh28W8241hBQEJRZOUS09SgRXCzUDD?=
 =?us-ascii?Q?xYHkiPAHIvWbdmo+HA43+wlbZweSv93eRe12rp560DgYcFM3I3zaw5mLnTsl?=
 =?us-ascii?Q?Yqlx3jNGTJcMzyBrSIefOFog2yWw8CfRufS/KBSBeGtyHegwj9kNVvfUjr5y?=
 =?us-ascii?Q?7wMdYzNd9bGHvc3u5kz4v5B6sSzCx8VP81M9qlaeppQDW12Xj9cbQi62ftck?=
 =?us-ascii?Q?bdxVHDu9bVZkCJjO7QEFr+KJqwqy6EgUvT1ptxRiC4tTcI0Wfm7kjqattuKL?=
 =?us-ascii?Q?QvBtX0MUcmrQw2NvTOrlMaq8J1RRNQegNWL/E2bSK+x8YrJEVm+Zzu6BgiP7?=
 =?us-ascii?Q?ZZ4av2G7lQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6781a1ca-8142-4aca-ad40-08deb7f33d28
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 11:14:06.3611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /dfeGteuEX7ex8MegmzQ74TO5mKgXAKxhjWk6aURsGp9nqlWLXWgSlgDnYC1KHb030OtaDzFUQDK2OURwCAGrBIAmUTN2eHP3vchEwokvJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7992
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32963-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,TY4PR01MB14282.jpnprd01.prod.outlook.com:mid,lunn.ch:email,pbarker.dev:email,renesas.com:email,renesas.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,davemloft.net:email]
X-Rspamd-Queue-Id: A23DC5B2CEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Jakub,

Thank you for your comments.

> -----Original Message-----
> From: Jakub Kicinski <kuba@kernel.org>
> Sent: Wednesday, May 13, 2026 3:36 AM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Jakub Kicinski <kuba@kernel.org>; Yoshihiro Shimoda <yoshihiro.shimod=
a.uh@renesas.com>;
> andrew+netdev@lunn.ch; davem@davemloft.net; edumazet@google.com; pabeni@r=
edhat.com; niklas.soderlund
> <niklas.soderlund@ragnatech.se>; paul@pbarker.dev; netdev@vger.kernel.org=
; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH net-next v4 10/13] net: renesas: rswitch: clean up is=
_rdev rswitch_device checking
>=20
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
> ---
> net: renesas: rswitch: clean up is_rdev rswitch_device checking
>=20
> Add null pointer checking for ndev and remove unnecessay
> rswitch_port_check() wrapper function.
>=20
> > Add null pointer checking for ndev and remove unnecessay
> > rswitch_port_check() wrapper function.
>=20
> This isn't a bug, but there's a typo (unnecessay) in the commit message.
>=20
> > diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c
> > b/drivers/net/ethernet/renesas/rswitch_l2.c
> > index 3cc0ce8762f3c..dd8aecbcb2a8b 100644
> > --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_l2.c
> [ ... ]
> > @@ -278,11 +273,11 @@ static int rswitch_switchdev_blocking_event(struc=
t notifier_block *nb,
> >  		return -EOPNOTSUPP;
>=20
> This wasn't introduced by this patch, but does returning -EOPNOTSUPP dire=
ctly here abort the global
> switchdev blocking notifier chain?
>=20
> In a 32-bit signed integer representation, -EOPNOTSUPP (-95) has the 15th=
 bit set (0xFFFFFFA1), which
> inadvertently matches NOTIFY_STOP_MASK (0x8000).
>=20
> Because this happens without verifying if the target device belongs to th=
e driver via is_rdev(ndev),
> it seems like this will silently break switchdev object offloading (like =
VLANs, MDBs, MRP) for all
> other NICs system-wide as long as this module is loaded.
>=20
> Additionally, notifier_to_errno() strips the stop mask, transforming -95 =
to -32863. Since this is
> negative, it returns 0, which could trick the switchdev core into thinkin=
g the event was unhandled
> rather than explicitly unsupported.
>=20
> Even though subsequent patches in this series (like "net: renesas: rswitc=
h: add vlan aware switching")
> refactor this block, they still return -EOPNOTSUPP for non-VLAN objects b=
y wrapping it in
> notifier_from_errno(-EOPNOTSUPP).
>=20
> Because notifier_from_errno(-EOPNOTSUPP) produces NOTIFY_STOP_MASK | 96, =
doesn't the system-wide chain
> breakage persist?
>=20
> >  	case SWITCHDEV_PORT_ATTR_SET:
> >  		ret =3D switchdev_handle_port_attr_set(ndev, ptr,
> > -						     rswitch_port_check,
> > +						     is_rdev,
> >  						     rswitch_port_attr_set);
> >  		break;
> >  	default:
> > -		if (!rswitch_port_check(ndev))
> > +		if (!is_rdev(ndev))
> >  			return NOTIFY_DONE;
> >  		ret =3D -EOPNOTSUPP;
> >  	}

I have reworked the event handler and -EOPNOTSUPP is not returned anymore.

Best regards,

Michael

