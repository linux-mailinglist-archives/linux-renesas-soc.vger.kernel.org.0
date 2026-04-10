Return-Path: <linux-renesas-soc+bounces-31146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA6VB7wa2WnfmAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 17:43:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 876ED3D9973
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 17:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74E5830940A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 15:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C063D348F;
	Fri, 10 Apr 2026 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wx7E3oi/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4143A1A2D;
	Fri, 10 Apr 2026 15:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835523; cv=fail; b=QMv4kXEb3rHHwY+zQX5ypvIBmAHDBBLw9RnB1c3K/tC6jRDnC0+NG4pUhX/sO4HKN5NsRsV89ngnUuHuqBbrkOSLNlbXqJasBiqIDj7Zxka7uFK18qOFcj9U6xHvFT7TY1PSxQGeLJMDSqL75ssV9++XChA0oWwbh9upr5Wt9wI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835523; c=relaxed/simple;
	bh=xG6/ZZua5di7ivDUIgczWoZIfhbnBckOg/kxRWa/+Cc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NO/zWalmgXAkzgbaDeeKizHo7+d4ze6DnD7s6wfb9G8CGjGA09n699EVtgefn9k3k/MYCclA4GGUG39PQqL8oMBEWe66thWnG2z6bP32/zQj0NdJGEjeR9t9qaG7Gp1naqSrqMscRi6E2wEN3QSSxEfYDmaV0CAYUMELdDPOrEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wx7E3oi/; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEUL81Lp7AnpQgXEdtE1e6tHnKJvNiNaiXqUTwZQsDyrTo5Uk+v16R6PBSvQqQpP2SkTmF+hmIFO/RevhnUXG5BPHIphWbYrbWwVzv68Nrq32/KLBHMMLF3rRBVVdbjyyS9G5VGhjyTd4SEyGyUvjxWZBq0F3OaPpCB7gZPDI6Kisw/dhVXcgp/m8aHqOSRVbIlaqiKkW0bPZl038cGLpAkZi8IeWTbcEVTvzK0NHlabNUkTeFqe358b0X1xGRLBTEgrcgNQwoyXQHcGCGpH9YGIxScrQZk5D6zvRnGuNO26pbnQOPcQBqAU/z/LxmwXTo6bLuKZcKJUyLjZcNIyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCJKfS65xAtKr94K1LM4crG/BE1kEuxoZ3hvhJD2Z/s=;
 b=Ol152a9g1hfilzP6SEA0/MDocEjHiP9Dc/GvsQD4WT3A69CLAcQbdZCAMG66D18G01LMkSmVcOf3KYeM2KSysnCObJaDn2A7kzRH3MDFALpYIFAX5sslvLGQ3xBso8EzKmpBib1ODLe51/iiRWwWRsc7dawbJjBxg/qNE13cnFU46hXTjBxAKhNMSd89IO+82RDuWPPChUsHecgiGg/CFp9RWrCPNqzESm+DVDGOrwJosmDq+A4UUVhYf/F7qiB0aBAluHfEi4vScpOv9cFcOhdsYsyP/KTZYvLZFyfINW2Nqr50Ar6HZaC4F1YF3+ronXzCM96BGgij48Oc6Km6dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCJKfS65xAtKr94K1LM4crG/BE1kEuxoZ3hvhJD2Z/s=;
 b=wx7E3oi/aLvnafOiR9C+z1DjyyZNwvmn7i84YaMUk9RQi1djUSfCwP0ChSey75Um1admd7Wk7EPmD9B2xv0SKk1qLtzo7jMnj6iGmSC5sVlzLAeN4D0SNY7wb50tojGKI2enEaham6vUL9vqM3Uyjhu/RZBdNOh7IedUBZH0z50=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12337.jpnprd01.prod.outlook.com (2603:1096:405:f6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 15:38:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.043; Fri, 10 Apr 2026
 15:38:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
CC: biju.das.au <biju.das.au@gmail.com>, Heiner Kallweit
	<hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
Thread-Topic: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
Thread-Index: AQHcyPZnBK/SG6spWkirTeqviN9wXLXYYQwAgAAGuICAAAH3gIAAA7nA
Date: Fri, 10 Apr 2026 15:38:31 +0000
Message-ID:
 <TY3PR01MB113461216CB9D880244ED824B86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
 <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
 <839fec66-5ec0-4cc0-a0c4-ae2de6902188@lunn.ch>
 <adkVr0mMzDsXile1@shell.armlinux.org.uk>
In-Reply-To: <adkVr0mMzDsXile1@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12337:EE_
x-ms-office365-filtering-correlation-id: 98a4f449-0d31-41e2-9e54-08de97173847
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 pRQSwzZKzLs2BiSG7ARhMs9JSZk95ouc8gRq9abAghWk7kjJThDNUli+kmkcOyw8jjylbVTx3NRvrZHSRRsTR57KqjmETD/CTFPH2m8ehtqiObuK1BajyVUZHcoxmrCuCElaMoPleWOk99IX4c5vuvVTXkL6ykcNMJnek2DLwJXode7PgPy6reg4xw+7mEZ+P5dPwLwAWe5PGvgW/rfkViA0Jcstz3/tZFZnUzvEfxi76JBF02US58ErlLkMd4Y4RoLBlAg3/ss+s9rHOIHUSN0I4qKoUFrZFiAxb52puggzNA5+hSGj+/uXy1EoTqO3ag1QmmLsJ5CKtU3zXjOcS6RjrSlF2NmwKmYJig1MZQevTM/LDF3qFtV4YSI1tVYeOErAb2v6RCYjkIAgXpwr+XdJzIWfOICa1jVuvLr2d0dSGXnHhdN7Av+gytVrC8uAhSXqNpBl5DVGaF97pKZhXrKDdRkv/uOTUg08h0dogmhnfTy7uPUrDwX9ga2w6VqMQOMNuIkSbIie1IUDlTPfMRxxijzGZzU6LUEq/8Wes7qoABqQRAf/3DcPNCpYOhdNNizmv2uNPCDdnUFb36JQUo4ZIHrWOx+zb9aK0mlpZQHVG5m/cEfUm26Vo0Q2BvulV4lNwnfQWu9D5pZqDR9rI3ZAk9OEb89MoqNGOPrt6eTxCpCxnu5HR2urY3/fsUN3Taz1NcTKwetRGHlL5bzhtfIrZo03ypjsurQFzPX0xyX0ytaGjFeH0KEtUt5moUZvy0unqqw4RnsLqTidn8SWZk7FD/0YSzy0wyULv9RB0MI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XerLgn5gSfcCieMFpJX24cIq3OZrcxOhW4jWxc/PgiGpe/rr0StjCC4hTy9x?=
 =?us-ascii?Q?mqKZCVlNiKemAm8wgpfIcg1HM5PbHVWaURR52UyJS2+qx/+52j5uuTPRc2FI?=
 =?us-ascii?Q?G/6Ee0KQd0tvGLJA3saqa3YbQ1I1gQQBjE5HTlk8jaLJpBJh2a6OJLE4WKqd?=
 =?us-ascii?Q?E0b7sSE1huwkkSQtP/LgXGxwsWEB5qQOEuDXvaKpIWcmIauNWn8xHH3awoFb?=
 =?us-ascii?Q?7XIVLlHm0FBmhGCbLiEXs8LtGyn6gHQxllXcRdV+e4OFzGvi6Z18VXt9pXAv?=
 =?us-ascii?Q?RFwYNIb+dZw/tDc4/RG8cUoh43W9mDBdDUPdwr5iiWTwPlkh5vDbjQxJR7Rp?=
 =?us-ascii?Q?v3iGwgO2q+K7XfLS0owBmqSUmS6KocRiX2/S5KN0BuPwGE9e/TNNM2ooQto2?=
 =?us-ascii?Q?xEWnwt0dH5DGQlB9YAW7SrDD9ybill9SBWmG8F9fd9pzWqBeXzJmAp9pQNPR?=
 =?us-ascii?Q?GwA6exWbaKu1Eq8TYvdUgt0T4R3VulqAttn6i0Gnl1DMEPlL1qHyunGmi6CG?=
 =?us-ascii?Q?ky2hbGUAe5JwkqdSg0tAKqA9fdsqTUOjzVjCxUMvRBNe2Y/sAoVj3ZsAMCDg?=
 =?us-ascii?Q?vJfXcDI394rJ/VPffHYXZo+Htt+1Kb/L77SwK62Aax5XT+BEyFpxP9QLB7XU?=
 =?us-ascii?Q?7+HcFmM3TH6O1FZtMo5xU4GOg6RTEmjG289NPqNWGtnevpcgOBLGKtUSkUzf?=
 =?us-ascii?Q?K7X+sUqJ9U+CyKRjIrfzpJxy1g2mVsEbnxRNez5dYOQpq8FBBALSfAizz/tN?=
 =?us-ascii?Q?DiVlQMIPhPZYQGGs6uB3FxlVMj+wiR8dE64SIvHRSY7e/K30pXq8JjcLfkyQ?=
 =?us-ascii?Q?FiAxdubZRTEtseP033ZmfNBb1SOQuaAtU4pcmAU2bZkRR9eQB6/sSevIV2p/?=
 =?us-ascii?Q?EESnSxVXr0RlYch386HdJN0mRakPOacCjXP54dklIAERUNMlUw2s/lo3F41i?=
 =?us-ascii?Q?kv6c6Q9dY8kPcMcJdAqMkY5K5YTH0RvBfBIFwoZa3RQMvckiSp67dRUGHBNn?=
 =?us-ascii?Q?8gTmEsyColpDT7BZAJV9NC/KHAza0/vbDsgsoKhy6bsUffL5Pl0svUBsUqgI?=
 =?us-ascii?Q?hEhoAfCc6J8QFOCLxKvhb+gyEfno0TjqbfQCJN480JZH94XEgA1/CLLfFJZa?=
 =?us-ascii?Q?mQVo9Ft3x8s6U/xsY6IH2glDOCYCYwgspW4VggQHgSvzOI0PBfjaaECK6G25?=
 =?us-ascii?Q?dfXFcC3l4wMS+pSu8PdTPFn2xNAX4pbiGIkJXZtVEXqcgCjUMHFMsDOFAr8R?=
 =?us-ascii?Q?WMe+u6jgqV5GV+2RuB+qW1zoMWrv9U4IBzytpHgH/Uj6aorP6wXnYnt0iXsz?=
 =?us-ascii?Q?81lO2ks0Eq115eBT2SYl3jsO9PPPI3Jo/bsjK892rgruwjy9Pew03BRsB5It?=
 =?us-ascii?Q?DYgRcFnyysKwt+jkctjAdoCXRLYmAiIp6VlythgdVKgrPBg9htLiYYxgagi1?=
 =?us-ascii?Q?bQmvcP+MeYa7rh55rH9B/ThVS+bn8eIPu2olDUxGNowqBvYTfDdNn107IHKr?=
 =?us-ascii?Q?JPrZ504lCe8+Xu8VUNJPXq9t6sKm33VwwezQeOM3PbmyjCFFTcRrbP+0HSkA?=
 =?us-ascii?Q?DUUx+IQHB/+qOQ8ZQBD8SDqO8FXE45+tzNBVhgNlz1nUTdtDQvlEbGPdTl1c?=
 =?us-ascii?Q?gnMyPvMzFG7R45CRF8mtLjKlHBqYgAbE0yQ2XLsYr4XFjw4wz1KDXT2B7jf/?=
 =?us-ascii?Q?D8rFouQefsXmYWfqDixQ2A7RuJe7UL0IxxXHd0PBT9vyCrXItCcldDrVWJFj?=
 =?us-ascii?Q?8vjaNYcDFA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a4f449-0d31-41e2-9e54-08de97173847
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 15:38:31.6974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lA9p/O16jt/udaclK7/gE5pIm/0LyQh8RSWB1DWA1xEqMpPYBwJZPw22Oua6+m3ZJ694hdA/wRssLf1E9YpkP8gfua0Jr1QgKZPXVc8eS3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12337
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
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31146-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,renesas.com,vger.kernel.org,glider.be,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,armlinux.org.uk:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 876ED3D9973
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell King,

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: 10 April 2026 16:22
> Subject: Re: [PATCH net-next] net: phy: call phy_init_hw() in phy resume =
path
>=20
> On Fri, Apr 10, 2026 at 05:15:21PM +0200, Andrew Lunn wrote:
> > > Apart from that, looks fine to me - it seems some paths call
> > > phy_init_hw() can be called with or without phydev->lock held, and
> > > this one will call it with the lock held which seems to be okay.
> >
> > Haven't we had deadlocks in this area before?
>=20
> If we have a problem calling phy_init_hw() with phydev->lock held, then:
>=20
> phy_state_machine():
>         mutex_lock(&phydev->lock);
>         state_work =3D _phy_state_machine(phydev);
>=20
> _phy_state_machine():
> 	switch (phydev->state) {
> ...
>         case PHY_CABLETEST:
>                 err =3D phydev->drv->cable_test_get_status(phydev, &finis=
hed);
>                 if (err) {
>                         phy_abort_cable_test(phydev);
>=20
> phy_abort_cable_test():
>         err =3D phy_init_hw(phydev);
>=20
> that path has a problem and needs fixing.

These 3 Phy drivers are using the same lock, and it can lead to dead lock.

drivers/net/phy/microchip_t1.c
drivers/net/phy/marvell-88x2222.c
drivers/net/phy/mscc/mscc_main.c

Maybe as you said earlier, moving to phy_resume() will be safer solution.

Cheers,
Biju

