Return-Path: <linux-renesas-soc+bounces-11139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2339EA8E8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 07:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C40D283484
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 06:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AFE224AE3;
	Tue, 10 Dec 2024 06:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HxWsGGMz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C523594F;
	Tue, 10 Dec 2024 06:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733813171; cv=fail; b=QExedORmcpNMxnpfezxtaK2IMaXYtzjPEMjMBR3//cj5PaZgvoyw5xIBiltug59GKlo85YOX2wkIvoL/WfjvZcf6e2z7pnbgGj6B+fzxjyRZdvHwa7zhZWSXMC28LB9bQNBJshTSGpe404nS2Ji6BVGkUk37blVi5qrt/HfD1OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733813171; c=relaxed/simple;
	bh=uTHB9lyk0UqVu9XilkSYKsaEgmoMw1GXxoLvFZRHRqc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HHB7tuEx70vNuf/mx3am9neB4aGxeeTMxMW1NjPK/TgPfR6qK9EWeUWDJqa89Dvw62x9Cfk/PpfBrILDOrFuNSr2NaDZwbiIu681PknE6zYuc0OipSp7X7qx2twa+Ds4S7kC/rk8l8DKTrnuPSI3PGFqBOyfIdo4h7BddvdKst0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HxWsGGMz; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFAfX1O6JTPJkmOgQfWvRiakjROXiupY0+IyD7KElnDrKE0dYhy+WACQFeAz/Ug4q7t+SbKel9aCxXlksIzIIoqflHtgEsNNd3wpq3+ZcoGq2XiXD3MmRlYgeVXjmHDZx/TZfaymhNAtaUB/us1AZ1/VrdSgRXGTBg5e8mVCV9yvB39SjeVLbTAX7pqS2u93HdgC4yh1+1zLHYQxzASnv9hK3qUsg9M4U3raZkulWV4tJYADfSt79JTzvNBFBF92VYGvkCUgidpyIeI0n20rqekuWWFup3iO6oESFrqKosdpmo/oSK4IThzNK/vE5GT4ivAun+AW+23E7gHA6Qfxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BBSsPz//9QtxspfjErmjJvfFc0CKkrmm+QuEGlzpI4=;
 b=SvAAxyf+B/mqL6HtWU2h7vrp0qzoqG7muGxDqh4gYRf9j3evfnGFQvrK5xp7GuZj5q8abT4XsfhiK0dPvx5I4XVSCnyHwv6iN0j03PXU15nbVZByhpLSN+63sFHPcQy7H5+brOmxxHEdxbu06XH2lPb8hXIwUiYM9fDXpvZqdmSjL3iPfYKgeOGuCJj1drSOKmIplK0gRaxI3MyjerAMAt3e2lN6lG5oeOQcFWjoH3QL+BDBvCiyGHq4bsKEbllA0F0JpT9H+GF9f8h2kShg1IT+7Frsq8pNTdWtHb0Xfw0UmxKxyZt+n+zG7ppu1ix6uquB4RyTex7s09mof3VRqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BBSsPz//9QtxspfjErmjJvfFc0CKkrmm+QuEGlzpI4=;
 b=HxWsGGMzQhdzL6yAzWk48mp9giR7/DzjysboJUuKlCDKVpo5Xt8PXypI1C9lGXmh6Gf3dy+WiUQMEd+lGkJGCp4VBd99XEUSSZXOJJrNv6vexRkWZRi7QWg2upWPLuJ2u0ChOmNMp49inbZHKtz/5A7Fcp+u9q7HoWIaqccwqiM=
Received: from TYWPR01MB11030.jpnprd01.prod.outlook.com
 (2603:1096:400:390::11) by TY3PR01MB10061.jpnprd01.prod.outlook.com
 (2603:1096:400:1de::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.10; Tue, 10 Dec
 2024 06:46:04 +0000
Received: from TYWPR01MB11030.jpnprd01.prod.outlook.com
 ([fe80::a78e:aecb:953:b562]) by TYWPR01MB11030.jpnprd01.prod.outlook.com
 ([fe80::a78e:aecb:953:b562%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 06:46:04 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: nikita.yoush <nikita.yoush@cogentembedded.com>, Andrew Lunn
	<andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Dege
	<michael.dege@renesas.com>, Christian Mardmoeller
	<christian.mardmoeller@renesas.com>, Dennis Ostermann
	<dennis.ostermann@renesas.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH net] net: renesas: rswitch: handle stop vs interrupt race
Thread-Topic: [PATCH net] net: renesas: rswitch: handle stop vs interrupt race
Thread-Index: AQHbSi4BGb0KrsT/rk2BwvNszCBRyrLfBb6w
Date: Tue, 10 Dec 2024 06:46:04 +0000
Message-ID:
 <TYWPR01MB11030FA7F8B6B30B8A7759847D83D2@TYWPR01MB11030.jpnprd01.prod.outlook.com>
References: <20241209113204.175015-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241209113204.175015-1-nikita.yoush@cogentembedded.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11030:EE_|TY3PR01MB10061:EE_
x-ms-office365-filtering-correlation-id: 280f3f53-043e-4a8d-d507-08dd18e6513c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?a38UVkUqxhdSaVjOTQ2Tvelid42qzV+toX8gsmoIcDL40GG5nIs5lemfT+V3?=
 =?us-ascii?Q?yKZsd+1DX44TAPw9wSAc64j1PpI3JyxXQhp1m/bdWtRyjcQrnpBI+Tbz5u5H?=
 =?us-ascii?Q?nSRr6B1pRJalMyzGzvWpACV0kBd6CW8Ond9NYe9C65YJMuM92T/GLc7PUpD5?=
 =?us-ascii?Q?MLYfxY/QJYHb+xrc/a5xiS+U5xoDyn5Tsi0HXykl1/nitHAGh8d4WjxHIcCs?=
 =?us-ascii?Q?J/cZDyETHlinzwipcjfLt+pIeahOq841YUWCUVBWl3KIFKMD+urXhNs198F7?=
 =?us-ascii?Q?4VDUUsAbopypoS467aSP+c8uTcPVes+eeRC84EPGyjavRVw9sJplhDqSvcpS?=
 =?us-ascii?Q?Z5jyweu/uLrdFvG6aDtcv05z+NqmEKz53UzaRGxik8TqDhbuZUMflSG+4CI+?=
 =?us-ascii?Q?4OZnLO7LRd16UCmFTcMpYR1wNbmA3pi2ZmrHAZhP06CjVjF2z2JfieO68XQb?=
 =?us-ascii?Q?5ucGhKsI0p0dgLhYj33hbxzD4IGZPTE1ILMKvuTgO1n3JNRqu5ITsjMFNja5?=
 =?us-ascii?Q?eAlVbHIkC+sKkmhl7BV6V/Pll/J7K5FldcjUrVoRjNVs5ispHUaoNEYeKVFI?=
 =?us-ascii?Q?iNEMdKo+MEb6aCOICIZur0gwjYdzKoky+YZnVLfuf48u0v6/UwbhTSOoTUpv?=
 =?us-ascii?Q?91GCyhExzC7Xxp0WqUcbOBNjMR1r+xwZT4uPEvm01FI1hcVQ5Q9tdNC9SG8y?=
 =?us-ascii?Q?lQi/GXWpR5yZJtHth1bm3pM6zZjFLgjHSpbjya1OGdry767+y59BP41VUpPY?=
 =?us-ascii?Q?qUik25Rcfn0t23vLm9jkAqbfuuKPKNwm/3GoUpEUDO+nr5x/sBBVNBBij1ae?=
 =?us-ascii?Q?xI65PZuOhKRwy1vzxK/2UEsCTU32nKYL9MSqbZz0rNeTTIeLvk0xSmNVt4f2?=
 =?us-ascii?Q?7OMZsQoqwCgE1iSAkudwC6GBiMeCLQ4kt0HN+WGQ/TwkKV1KaIQS9klh+YaF?=
 =?us-ascii?Q?puobo1lY9BNBTLeDitmE8sHX2S+wu/niW/8OC/qr5EsbOTJ+bR4POPbkp4Ez?=
 =?us-ascii?Q?ciGUFhVZ9QFgrD2LAEfcdJatwnnBvYt4HlzezplKoVVge3uTEOtW4NkS7DM+?=
 =?us-ascii?Q?gaW1wqR3/IwZIQfA2cqrHZy+Pz0kQKhlUpvaXhV1m8J7iCpENRGczlIVLfgQ?=
 =?us-ascii?Q?4UkRYpAFEHqHrMztZaIEcnrlGW5NnBU7SkXGXxqmLtxU3bElHjV1iyHdJt4U?=
 =?us-ascii?Q?izBTZOHZETfadDOn4SoaI22rLPrlTgF+1w0S75c/mMZSzdb+sI8y+OtSVHO/?=
 =?us-ascii?Q?lJXt8g8nsgcWzLO3QNbfhA3oDoDq9zTQjLG0a5Ihdwg9v36LarjQybqOuiv5?=
 =?us-ascii?Q?EV4DE83Um+AECC3TuzgX50qCckQptXCUK0ZwCBQBBVKhiTHs53Z+ZpL06Pvn?=
 =?us-ascii?Q?Kkafq+GRnWVgtKxv28qw+WepTz6Ko8Fm5xY0q+zbigl4wBBP6g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11030.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?b7eC03ZUrcd2yIU+qNNwDldHEz0tKLZeuoMszANiKJ4D0r8bnSM8l2HzGsM0?=
 =?us-ascii?Q?z7WwNwLLP3mzk91NnQllFWfVQkEmVv8YukGCBnzbz51rovRO40WpUStwmdTq?=
 =?us-ascii?Q?apV8l/eqqRy8abtC/1Rstll7D/ChuFs4izPszmfTkroe7v8uTmrLudecYi9o?=
 =?us-ascii?Q?16j5MgLs1d5aOYyUFGFcSFyaBeUnZsd6UbVRU5UUPWNuXu/+/z1lkr3CY1Jb?=
 =?us-ascii?Q?llDiykvxnnBancwehP1xFPI3vSebL/aVK5yZkjxfhRB37aTmWTjYtjhEACuM?=
 =?us-ascii?Q?z1JzPtxUOAf9EOpjpLOfRiWsTRW3nZNxmAdpNTwKplIvWMsnnXyV202Fe/bl?=
 =?us-ascii?Q?j27G8dlNeM2pzDsDQbbhpwphMDS/z8/lYwOe1clKw4Ttg/anxE9a3AIAOJ91?=
 =?us-ascii?Q?NsTesqeVBHg01GoIDQC3BB7SnWsNUC25yVl2N8Wy0+biM4oKON6G/wSg0Lcf?=
 =?us-ascii?Q?Wyb59pabn/7AGVBSMcWaz60qEyXnnFUsfpvEQQqeJN71dbZQgHe3V1HXv8YP?=
 =?us-ascii?Q?qT88ekeRgpxSP8bd+1JkRi6xezjSe9TDjRSkkvirKuCMIECtS9TDyE4dg42d?=
 =?us-ascii?Q?A15Mb5GQvQ24ABhSH+QVWBko/J2mMhQSbaE7BaAAcXB1oArZUXdqOKlxJAKY?=
 =?us-ascii?Q?zBz2t0TaCLj0Xi+CSuZhn5omTCRXpuhOqEXCIU7IoexkxDkMcCYTgoa9VOjM?=
 =?us-ascii?Q?ohlYTtZuH39l0SxFN9oW/Oejvvh5Ucn5fNwhQBSfaEetwiAFWjI71oZZbzZa?=
 =?us-ascii?Q?8ZBqNynBjP6j7L3/CnU1QmaTA6f8SvxS2DQqZOHFyCLsS1koj3gm1t4VKauW?=
 =?us-ascii?Q?LvxuEICflDmtKzh+DBL9zPoZicEC4cK8k16DDuiTff2CrfAKFXJ9htAyMry/?=
 =?us-ascii?Q?F4e4yYWp4hyiJQ4gJ0kaSJRyan9QmntpDi5Rb93dHmU2mLWkj3mAMq19Qf0D?=
 =?us-ascii?Q?P9YAQyfSCcCVe5UjM1/ZFD8LQaSCDPLWSv1oNSOpiBWnJpoCt2MlDsnrMfSk?=
 =?us-ascii?Q?aPQGDZQdVdDu8DA5hYxcU8RXzTZ+6W/es2y+/Y1R/T1AdEpKQNpOUJpjPivM?=
 =?us-ascii?Q?N/U4fYpcZRIye7yGyr1ssd+vmqPcX1S6Vifunsauw/gQFIL0DQugpIgPk21o?=
 =?us-ascii?Q?ZfkYZPMc5it+xCI+QEF+1+VRreOGDu5iyHLoIgo9xLu74UY7YGtldWH99hcI?=
 =?us-ascii?Q?0rUKK7MJzidRZtu74NChSc0wReJq7i7Y3HSukA7JYT8yPFPxrW+Tnb1uCEuK?=
 =?us-ascii?Q?uDBXWsnsbtp5aHB39GSA1FSuP5PHxQFWhNanbRpxc8EN1+T0T9moVME1yK41?=
 =?us-ascii?Q?EIYmeqMrt5EOzNJ/t5h9grpht7DjiXkTmeNXD7cerhS/4KrkAm/UCaauf1rr?=
 =?us-ascii?Q?Plg+R41a3edjeIzzGORbc/cMn9gEPKIHsWSP6xopWEzboFItz6j9JiyzrxGj?=
 =?us-ascii?Q?GqEbB9GAwi9QDo4H7zjyzoYWv1OEF3GShHBQhVZlDqIGLUyCsg1n3s6WhMYi?=
 =?us-ascii?Q?Mlzm+tKK6ga31armg0+1nK4NBn3vgP/RRfLODPShT7VuxsItGupGjsrKWiOD?=
 =?us-ascii?Q?GOj2GU/pLXm8sQ41KzBpA/hhQ1cFtqdRmfXrmXhORskZAmnJzkgF9F7xRyHU?=
 =?us-ascii?Q?X/v/4ba5arOAFctt69GwZ3kKpE2XynyDbLO6oxpDV6Pv1BgB+2kxpumfNZRL?=
 =?us-ascii?Q?WxtLVQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11030.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 280f3f53-043e-4a8d-d507-08dd18e6513c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 06:46:04.0914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XHiPiJwlWXC7IOiAu3ht/Q/ZaquVJr4vIxpE1tkAj++ahMA6cYgjsBtyEVsUcsDWOsb5u5M1ISc6m4eJTxpwzo9uUZ7/qCvR3gMFTKvJvLFvsELTIgI0LIQswwfJ6PZc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10061

Hello Nikita-san,

Thank you for your patch!

> From: Nikita Yushchenko, Sent: Monday, December 9, 2024 8:32 PM
>=20
> Currently the stop routine of rswitch driver does not immediately
> prevent hardware from continuing to update descriptors and requesting
> interrupts.
>=20
> It can happen that when rswitch_stop() executes the masking of
> interrupts from the queues of the port being closed, napi poll for
> that port is already scheduled or running on a different CPU. When
> execution of this napi poll completes, it will unmask the interrupts.
> And unmasked interrupt can fire after rswitch_stop() returns from
> napi_disable() call. Then, the handler won't mask it, because
> napi_schedule_prep() will return false, and interrupt storm will
> happen.
>=20
> This can't be fixed by making rswitch_stop() call napi_disable() before
> masking interrupts. In this case, the interrupt storm will happen if
> interrupt fires between napi_disable() and masking.
>=20
> Fix this by checking for priv->opened_ports bit when unmasking
> interrupts after napi poll. For that to be consistent, move
> priv->opened_ports changes into spinlock-protected areas, and reorder
> other operations in rswitch_open() and rswitch_stop() accordingly.

We should add a Fixes tag for net.git here. I think the following tag is be=
tter because
the first commit had this issue. Although this fixing patch cannot be appli=
ed on
the first commit, I believe this is no matter about the Fixes tag [1].

Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Swi=
tch"")

> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

I could not apply this patch on net.git / main branch and the branch + your=
 patches [2]
though, the fixed code looks good. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/process/5.Posting.rst?h=3Dv6.12#n204

[2]
https://patchwork.kernel.org/project/netdevbpf/list/?series=3D915669

Best regards,
Yoshihiro Shimoda

> ---
>  drivers/net/ethernet/renesas/rswitch.c | 33 ++++++++++++++------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/etherne=
t/renesas/rswitch.c
> index 6ca5f72193eb..a33f74e1c447 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -918,8 +918,10 @@ static int rswitch_poll(struct napi_struct *napi, in=
t budget)
>=20
>  	if (napi_complete_done(napi, budget - quota)) {
>  		spin_lock_irqsave(&priv->lock, flags);
> -		rswitch_enadis_data_irq(priv, rdev->tx_queue->index, true);
> -		rswitch_enadis_data_irq(priv, rdev->rx_queue->index, true);
> +		if (test_bit(rdev->port, priv->opened_ports)) {
> +			rswitch_enadis_data_irq(priv, rdev->tx_queue->index, true);
> +			rswitch_enadis_data_irq(priv, rdev->rx_queue->index, true);
> +		}
>  		spin_unlock_irqrestore(&priv->lock, flags);
>  	}
>=20
> @@ -1582,20 +1584,20 @@ static int rswitch_open(struct net_device *ndev)
>  	struct rswitch_device *rdev =3D netdev_priv(ndev);
>  	unsigned long flags;
>=20
> -	phy_start(ndev->phydev);
> +	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
> +		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDIE);
>=20
>  	napi_enable(&rdev->napi);
> -	netif_start_queue(ndev);
>=20
>  	spin_lock_irqsave(&rdev->priv->lock, flags);
> +	bitmap_set(rdev->priv->opened_ports, rdev->port, 1);
>  	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, true);
>  	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, true);
>  	spin_unlock_irqrestore(&rdev->priv->lock, flags);
>=20
> -	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
> -		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDIE);
> +	phy_start(ndev->phydev);
>=20
> -	bitmap_set(rdev->priv->opened_ports, rdev->port, 1);
> +	netif_start_queue(ndev);
>=20
>  	return 0;
>  };
> @@ -1607,7 +1609,16 @@ static int rswitch_stop(struct net_device *ndev)
>  	unsigned long flags;
>=20
>  	netif_tx_stop_all_queues(ndev);
> +
> +	phy_stop(ndev->phydev);
> +
> +	spin_lock_irqsave(&rdev->priv->lock, flags);
> +	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
> +	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
>  	bitmap_clear(rdev->priv->opened_ports, rdev->port, 1);
> +	spin_unlock_irqrestore(&rdev->priv->lock, flags);
> +
> +	napi_disable(&rdev->napi);
>=20
>  	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
>  		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
> @@ -1620,14 +1631,6 @@ static int rswitch_stop(struct net_device *ndev)
>  		kfree(ts_info);
>  	}
>=20
> -	spin_lock_irqsave(&rdev->priv->lock, flags);
> -	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
> -	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
> -	spin_unlock_irqrestore(&rdev->priv->lock, flags);
> -
> -	phy_stop(ndev->phydev);
> -	napi_disable(&rdev->napi);
> -
>  	return 0;
>  };
>=20
> --
> 2.39.5


