Return-Path: <linux-renesas-soc+bounces-30101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJCOEl8rwWmbRAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 13:00:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B66632F18F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 13:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9AC2303EB9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 11:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6584B38C438;
	Mon, 23 Mar 2026 11:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OBfGilOP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7FB39B956;
	Mon, 23 Mar 2026 11:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774267143; cv=fail; b=ccOeBWFxKeMkdlLzmtkibL8uURpfYM1XZl7BBWhNQYEwn7Kc8vkrQZelSngj4vut7T1nQZH6oWdhUacaneP7Ua6Y1a/Ir7tTAk2S1zRuHO9SxLJsXNTCe4zgq+vKVF7r2uj/IxGlAi4adJYyyxMJIzSmv5xLwPlSlJxgZl2lO4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774267143; c=relaxed/simple;
	bh=zNFXLdf0K3dXtLPyz50mCsN/7qcKywx4khs9AocOScY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tIHNex4dnoPh8AIbKGRcStRpoA6VSVVhVwhUZS/hW6ClHs8lz2NZbvjPTtIRQF28iDHHllIc4fiPQAllFLrFEkcxuAONuNtopxzQJYsA2k2Uy7d40F0nYy0kOMjaszq2M6IIM0ZLC9iLg8Ds301f19RVlqVBGlVkwPx3cpKVwaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OBfGilOP; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5Pa+aUAgLtITrkg9CWN7n6Sh+YFJpFM5uuLGXLTtU6Sfj9NyZidQAN6LX3VY/uOVGPV+plzQD+V0061mwtA59VXTqlcVpyxMLDW0RDXoUvZ8alFAwLe83TNwd3HIyMjPbL3YpE29FF1H4H1l8evZJg3y+fLLSxXfvlAgmqd0pmbcNueILVWvSlhY4sDJDlgUdncy3lVan8WaZhykDnZ/ArmC4naKZqvKxIbIb6AkgFnOBZciiSwzsRQIjToK6nFeyA8dgEHE6MwgHjqZen9uvqEy/Jg+V33OB2PZJmnwFmQC7+JH3drlSONapDK/oOvI6iQjEl+ZRLxPwgu83Gg8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFChd+n17YMrea5cVGobYw63eqDoBsn70TQWfuDtMBU=;
 b=Rbp+hyJQHeICGAcRVOxfKSnIxRc2sf8AJrz9QNCHK2gUK7ehiEcfVTBHj0vB5n4097RUDTRT9dbYgnmsz5ZgABOhvg584rFRcESq7B2spNcf35gV6fDzGBeaIQLZxy/4IVxJfU5dEbqoCr/VFBmeqewWGh1mdtWcUbjt239LCqQY3hplMPB8zV8+y2umUl0sONE9chOrXQPxKeKVpREdUljBG9uXv11UQ1ICGm8n5UdLLXs0h8jV2lb5TXgJCwP1MPqYiW4P+Q1EwM4RpafzmUeu+Y+w918ldR/ROMSLR/L9l+GfFeSvKRk+F6iZVxXG0tk5XcnIOpeoBIh2ay4xSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFChd+n17YMrea5cVGobYw63eqDoBsn70TQWfuDtMBU=;
 b=OBfGilOPXBsLSUjK7o1srN90SlnNFC2wbRUlT0DOdcizW1EDVJDjFyHpRVZs0x2NxAxBoK2FdcitVWAUBjdlcj55/bwF2YRY9vmCiUwmFTqPK3Q8PuS9o8UyB0rvdz5scAGr5Ntqc8FBZmYqCourzLH4A1/GqQxXIWHPjgDpjFY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB12648.jpnprd01.prod.outlook.com (2603:1096:405:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 11:58:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 11:58:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Thomas Gleixner <tglx@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 03/15] irqchip/renesas-rzg2l: Drop redundant
 IRQC_TINT_START check in rzg2l_irqc_alloc()
Thread-Topic: [PATCH v6 03/15] irqchip/renesas-rzg2l: Drop redundant
 IRQC_TINT_START check in rzg2l_irqc_alloc()
Thread-Index: AQHcufbQoz1eVvgnakyaEdniaPYxJbW8BFZQ
Date: Mon, 23 Mar 2026 11:58:41 +0000
Message-ID:
 <TY3PR01MB1134678CEA04F42230ED8929D864BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
 <20260322122421.132474-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260322122421.132474-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB12648:EE_
x-ms-office365-filtering-correlation-id: 1b1a8608-034e-4cdd-ea7c-08de88d386fc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 6gn8mmciDrVW9S3wslf8UHXW/NQe7cHwTlpzOKWKtAP1lZe2qi/yN6WvzJZDyHFddpd2p1Urf+hduGxqtWXK0kFQTcCDB+ELhJsUtVI9xqDra6Ks01jH069zlkeAuWeGNVWJi2nGPtwqQWw3rKY55lXRHHNLAl7pFmE2ACC48PAr4RhOKVSzsWWNpfzPAl8WxeD22Ynuy7DyVa4eRwm4lcjUTiF0LT4ojcYmWFKD4Hybtnrxve7AegKY0AOjzGKwu38d9Rf+HwJNq8S/DTjH9Q9GdPBbpSQ19z2PNa37t+99dOaleQVqxRohg5DxhEq/jBxNy+V4BaYZJ2GxreAX5OBNqoj/mOSoP0FDnQ66Md0Dq79JyVDDtJ85UcrNhTVQNAEMoaH6eT4paNKChWQqIx+XjGbq1xRji1VglBGpKDH0dPNY+VtQ85448OiHap6WPIz4Cj4KYlS8H4xBx0WjtY/tg0SwjEDt8BlZMpe6Hv9SndaIh9dhIvoaKW+4Ki3uVICuGu91vm5J28tIa3kjmObeq7UKJBgN5GJIAQaozhdgPwT4/LqywWEa/8EMcw/INGplmnxc2646O+LwyW6rpzbKfYR7HxgsGcvRNBgcqLgBum/6F9XvINg2fbD0nnN+A2jNtp7g+2KohGOEKRoJW7mjuXYlte3k4G9+VRH2x9fqVTpg82hu3mh2NxxaOBjp0jLgGv1vQzQq73f92gLZFQpGS74RONl2IisEjzmJGPxb2flwzFhfy/YotzxuEotXNXZiNjw25HTfjpmsxp0W3Zq3ZtRB0ZHLh8QUVUodzh4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RsbPxhC70edisLUhZywPkmS/qw7toD+4U99cGmVjzleU63pR4pFLoMrzLWEr?=
 =?us-ascii?Q?Rxvds/vBchA1eSfksYvCAR0EoaHyjcin/Yc9/06/n+rv3TiEmgIqFDSvKFZd?=
 =?us-ascii?Q?foPbPImR7SkyaPV3SLEfRDQbwuiWYJXeNy1+ZpO21iuvm5dwe7rNmjNgM0IW?=
 =?us-ascii?Q?MnlEW4MjLRp80HNGK+QDJYGwiGbPsSvJ2p850Pb/lHR/nJUNQQ1qbJ/RuPn6?=
 =?us-ascii?Q?dpFywVHfYfYOEIxdofCR13Tc9q3egXA8WW+zTKfu3VkKqqX9qwLUMnmT05XU?=
 =?us-ascii?Q?fb4feIaDrz3btNLQgR+jaLxYXZE4aEeDXWtDSqndux44JBvGzrfSJ3mTOXhf?=
 =?us-ascii?Q?HFLOIFBYmekghYQ3TX7+ptuXSRAQB4886yJm8i53A/xGi5+gE/tEW1gPP3Lt?=
 =?us-ascii?Q?r8ne8boIj3Qq5DRbkN1yws8iro64byQMFRm0gz4yGV5Llv4LSSTLSEaLtfel?=
 =?us-ascii?Q?IOZz25mTXVpivoV5LPfDn8rxnQN1L1IyuCfJFxEqBMXQFLmQbNh/FBcdcY7C?=
 =?us-ascii?Q?TKWi0Bx4K1hR9/s/8YzRLxuZkLDhK6AUtBdgaLHQyMLzSHaoGRHjEnag7XRt?=
 =?us-ascii?Q?uoUt+B+FszAcW+QWKsgXMLwxrUCYg6BiWsUQ9WqR34dgOKwxtnQpZLgjs//V?=
 =?us-ascii?Q?CZWEvz+2CEsroWUQ11j/b/uGkO+YwqAUKcEY7UTFrjvt39Sg08q00C8L0PMy?=
 =?us-ascii?Q?rrSPsC10ZyRQ2kxHxn8mvu1dcWvVUBIa9yvaf0DFeEolYxxmnrEV859i79zK?=
 =?us-ascii?Q?GTXhjLsW3Bmm1npIg90biiCuUeEJtoMNY8SBPBEcjQSMfvE/tnxGXjwQU61M?=
 =?us-ascii?Q?n3RWmkPNa5x0xNI3Pkgg0Ik1l0bof/2bj+tw/1dbmFKxmtjFKygn/GjPoyPA?=
 =?us-ascii?Q?TcOLK6PZAkLqVhP0iuN05zG7+SClkpS61SWSMjF1Ogv0xVBlEMAO6BH5Adlo?=
 =?us-ascii?Q?Dn0uLvYSTVNNCPkZEn6jCNzkYjj2/pOlxKCKJSAldkfoz3d/PwQy+7rcu57C?=
 =?us-ascii?Q?jiBpi2mr/zYLCdKKh4kKhswG0o465oe/aB0TZSUIuZ5BFLSzNR7z+znYbAlq?=
 =?us-ascii?Q?i7iTHehOESaqqFGZiaS6XYU0QP18rIu8VTZgaBT5rR0recZojQV5KLAXkMeB?=
 =?us-ascii?Q?vACp0vR9lExyx7FTg2+0JUoYSt/1ywp0S92tSLPzVNHw4L5KhVGC/AEn3yRx?=
 =?us-ascii?Q?TH5K/XMPIKOyQ+qXVsbCDx9DGD8RWCbjHgpS0FCc1TYjHWkDDIdUe1aCXhgJ?=
 =?us-ascii?Q?ywgRn8Mqhox+fFM881Qn0Z1ujSlMh6NJpCwHQqp+S3zLTe7F2tqClXINyE7c?=
 =?us-ascii?Q?HtYYOmY9fcPOvJfxvRrq3Fl/hE2iGuFPCJk7JBupX/to0WzZgZ3KTIlFfkg+?=
 =?us-ascii?Q?/kI24MAU7yyy7ORPP7jAmSITHh3kXkHyZ/R+IVTvl5stotC3jWlCz3GjSvWv?=
 =?us-ascii?Q?XZWiouIDGjBdy0OqtvS+ucLl96Firz6KVJwowGESrRN2NEJEzdC9VH0xU5GE?=
 =?us-ascii?Q?LG6ZYBpDBQ8G3EvjMAQvF1ybGfpxkuoG0/3XSOE/nh4X5RxGhP1AopwNkaB1?=
 =?us-ascii?Q?MCSam8PWSS2YNGZxfqxe7C9T1SRWkz7+18tmbYgx9eXTt4Gi+7eriNYQGVPu?=
 =?us-ascii?Q?lQ44vDKirlR19VVqob9nhfVTs6DhHZniS6zB2g6dTbd6BN9ME8IhfYAWV906?=
 =?us-ascii?Q?sOzh9gnoXx4t//hDDPMZutufXj/Tu7UV/nY/DfhxCeRqd6XTSkHapMFBZcJM?=
 =?us-ascii?Q?JJf3/pZdSA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1a8608-034e-4cdd-ea7c-08de88d386fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 11:58:41.7169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GZIcQ4zw/NEyKf1VANhBlmeE8DCTv2ek9OThrnmOIH4l7+aC/2NQ4Z6fDwFGp98UlrHC8WO9NPRnjhG0+iPX8qkAbLoUZ4TLfGH2PD2HCWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12648
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30101-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: B66632F18F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 22 March 2026 12:24
> Subject: [PATCH v6 03/15] irqchip/renesas-rzg2l: Drop redundant IRQC_TINT=
_START check in
> rzg2l_irqc_alloc()
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The check `hwirq < IRQC_TINT_START` in rzg2l_irqc_alloc() is unnecessary =
as the condition is already
> guaranteed to be false at that point in the code. The outer `if (hwirq > =
IRQC_IRQ_COUNT)` block
> ensures that hwirq is always above IRQC_IRQ_COUNT before reaching this ch=
eck, and since
> IRQC_TINT_START <=3D IRQC_IRQ_COUNT, the guard can never trigger.
>=20
> Remove the dead code to simplify the allocation path.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5->v6:
>  * No change.
> v5:
>  * New patch.
> ---
>  drivers/irqchip/irq-renesas-rzg2l.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-re=
nesas-rzg2l.c
> index e73d426cea6d..ed8044b0a339 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -491,9 +491,6 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain=
, unsigned int virq,
>  	if (hwirq > IRQC_IRQ_COUNT) {
>  		tint =3D TINT_EXTRACT_GPIOINT(hwirq);
>  		hwirq =3D TINT_EXTRACT_HWIRQ(hwirq);
> -
> -		if (hwirq < IRQC_TINT_START)
> -			return -EINVAL;

I am planning to drop this patch as 0x10005 is invalid for TINT IRQ
This check will return proper error.

Cheers,
Biju

