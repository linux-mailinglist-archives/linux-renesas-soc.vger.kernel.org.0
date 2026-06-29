Return-Path: <linux-renesas-soc+bounces-34504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ArnmNd5JQmo94AkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 12:33:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B02D6D8EE8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 12:33:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=FRk4B+QT;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61A0D3004C55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 10:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD8A379C5A;
	Mon, 29 Jun 2026 10:29:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2143DD851;
	Mon, 29 Jun 2026 10:29:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728977; cv=fail; b=qLfyMiUgc5cUbm/vCik1yhzqGPFKKoVFS8qc8p75jDba4tHkdmkXRE1ZP30I8DJMg7mxoUwV6umkZcSBIJj/gtbQY6231cY+3K7ONoA5ZQGeUnB7cDQwXUAbrMhTR+q3RdzlWi8tBwkrs32I43WO2r1htRFFO/ayqJByDMm4i3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728977; c=relaxed/simple;
	bh=9/04PtlkXnbFfaOb7ZQfh/Xbt7yQd5xQo+OEABbkhaI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fEtOauryMAYtUjpbJoRRR5/j3r/Pc0neTtK8aJPsleOKZMxIbF7rrI/hs61YO/48SkfEPWlFpMuyc518VvDkp/v3zXXb4aBxOuSo8pEmEpROJ1c6jWLRylU46hr0f4E4vEUhev9S+G2iPER2A/c8Mcpb0c8vsKtnG2dOYEIiM8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FRk4B+QT; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gG9EaYURHvmsAYcIlNUkRtylVlB8TG07lI8+1RLsDblQl5EziyKxxdzw5A228itERRyCgMioNXvbf39sW56LWV+0XZTyZ2don8/09fztDIuM2UKmo7C59upeIDqQEDQtKeKf6rbeD80mIbwmUeg6tO1cv6rJ6DyFZ+d/tp+K4TQAldIS7hdd/UFAbrdyS2PsWWbhWC5hwDFHpGiQJVytG2qwDZjdPwgnmsf8NCr9orHphnIpXIkphAGXV2BIYZ8Qvd7uR5r/z/7/oZS02SisEdsA4L303y+Y/K6rQ8XhcoHUQRhqJDbF1q32BHvxemHoHUBkM1hUSGfKMqEpXdesew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/04PtlkXnbFfaOb7ZQfh/Xbt7yQd5xQo+OEABbkhaI=;
 b=UmFTi4v7w8dtF1YytJwzKLdvwXgGDiA9FzGupw2PcccLTeaAgSQ5F55BgFqDzpBVDfsyG09xH7YjD45tAAjO+srOIEdqAVfjjLk7eVjcrzRSmCcjOGTLnm+YDvrY7myGu35gHWsqNaDiIuPtbNVKp0sLWJYe66Ve9VaBdFzmdYSEXNH3tVL2Kc1MaEdJCOE+I4Pm5ri2j33EimfVWTw48rJqY6yeEgn9k4/UNSVNAl5iPhdva1NJ1v+69wWI/kXyiBfMWWMfvsqrU0cyzA2TacxBxW0C93Ti9yOXOVqxIQeLw6WZb+vMm3nRjBuBNCKB6bbkf5uHqjk5kFhRpv1pZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/04PtlkXnbFfaOb7ZQfh/Xbt7yQd5xQo+OEABbkhaI=;
 b=FRk4B+QTQpIoZAb3AgupPxcu3bzsVPyXXkvF/v4SyL8BJaI+Luh97sve9L4Pikm59vzdOseyEE13iYVNy04mS0EPR9W1dc+V2L4SoXHR+vJNhn8+j5qSmejTZIRTHUtd25lQn+LvLejjGrEsgys4cfaeDBHcHyqlZhN9GTi2gzc=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TY4PR01MB12702.jpnprd01.prod.outlook.com (2603:1096:405:1e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 10:29:33 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 10:29:33 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	wsa+renesas <wsa+renesas@sang-engineering.com>, Felix Gu <ustc.gu@gmail.com>
CC: Mark Brown <broonie@kernel.org>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] spi: rzv2h-rspi: Fix DMA transfer error handling for
 signal interruption
Thread-Topic: [PATCH] spi: rzv2h-rspi: Fix DMA transfer error handling for
 signal interruption
Thread-Index: AQHdBYU4nk2T2BceeEueIsD3nixou7ZRCqMAgARMlwCAAAHW4A==
Date: Mon, 29 Jun 2026 10:29:33 +0000
Message-ID:
 <TYCPR01MB1209315DED18430F660C7587AC2E82@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260627-rspi-v1-1-170c93ee14da@gmail.com>
 <aj6sEE5y62SOVsRb@ninjato>
 <TYRPR01MB156197735CBABA1699843B9B085E82@TYRPR01MB15619.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYRPR01MB156197735CBABA1699843B9B085E82@TYRPR01MB15619.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TY4PR01MB12702:EE_
x-ms-office365-filtering-correlation-id: 10fa3f50-d94a-4955-2fed-08ded5c94fbb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|6133799003|4143699003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 eYKR0+lVa+Qgeb3JcUY61PQEqJbmxhveG1RwlSjRZrD8OU2uRAeEkfrqnDtspG+v01ls0QOFpQv27uwtCTIPTZp9qhMedn4ya71RKAN4Umc5sHDAAhn5AUGv97+lJdgy5psnMXvqUY/TgkzApNoM1X+wiutWnXVpbccQUsw8WvUEUEmJeziFEESCI2rRjSxZI1w1cfsPj+wIfdheq8uCgg1PVT5lPLeTZc9eRjMShJ/b/JdIZYG1ShYkpbxaD5RBhSHhmdvfXvqB9VEmf+qjP5Vg8uUzzMrTCzfBCoGUyxfRPoIbqDBRptHCS5UNEY7CiRetYH3zr9nUCjVJYiVcCxqeg+MhBqy7iH16ism1+zUIw6RUXELQ7IRRexDr6JtNgLxSb1QWxMWCZN7pNF7EuVbLU7a1+LE9C5Sk1y5/3a7OWjBxgWJTTQObXkfEKroLr4+vGfHY+bI3js687fp+k0jiSnhvzAH4+ARBh3s8LiYgT4YFxA4quiRJKkJsJk3OP4dmkpneDb5EwO/L4rsxQEJCZeM+fNNeghroWDKFOZ4NGI1zjgootH286UPKKKgeTG9JFVtspYn1Qvy11A1GIWjIKibfr5SIUFCCoJZPlx/k7SYwJNke0A/Poow8/v/7sIZ4UMSc0m8R4Vd2mIrY8xS/ri5wjqQ37tGFj1iFE4Oe5nnqJJk5TcjRkK5aizl1+N+NFDhIQsQgFOeFI0HNG+gXbk43mF6et73WEaIt1dw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(6133799003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TV1WDQEJQGdAYJnPsJhvK//hllfstxDyq7Vjmv16OzEURNEA/OJAbqBU9n9d?=
 =?us-ascii?Q?hpZ7bROqi8/gJ+rDQfsqyis6VDDEgPt0yAVevWKtHVG75OpAZKomO03fxuXZ?=
 =?us-ascii?Q?/DyVct7uGrfxY8Nfrq9HrRS2S1I4fdIzOkINa/7pEvyPwFzBGb89FaApvtfa?=
 =?us-ascii?Q?Nf4RXH6J0CS+fc4070moC+IEwVhqjL8XHvNuXuiovGeiI+hSZC238jwLZffe?=
 =?us-ascii?Q?jtGAGPU9Pry6AobIeSTh0P2bFI49N+Y++eE/dBKsN2LQAtsohbEuCBYmuuag?=
 =?us-ascii?Q?bKzk818+pS1EqGvbgNU+Pq/s70u9+SnZJ30tFVfk+d+5VCpXPagX9dZLDL37?=
 =?us-ascii?Q?YCbQmiadp83vZDFsfEMEj1l7EdJhDJfxoD+/xyUFtpiGNpFj1uRcLs5J8gt0?=
 =?us-ascii?Q?m9BdqYgQZKprzT2THuO+SVMVIUXmAbMwzuNyVM70KHez3HJ5KORehSLO0UUX?=
 =?us-ascii?Q?C4CirN5M7Gh7BbXPa1BQT6Dkzy/gDAPp0KN15sWf9u7/vd361ufrQXY5jq/t?=
 =?us-ascii?Q?GPZmFGO/CDJj3+eStvbH1e++DjDNUVc/QNJNU8/teeOPtHH1VGZqH9ZZDnxb?=
 =?us-ascii?Q?/HDOAonJj4tA+xbC57Ry2t45jELh9vTrGWYin414IWxd2JfaEsg2JyxLd3rr?=
 =?us-ascii?Q?nGxb9w8/KsQLFM8Rfc/cxEHX5G4OxThGVd3sQ5KpqxYLKJQRt3XjDjGn0RQT?=
 =?us-ascii?Q?UX7opKabnCbseOdUjg6nJMvjhHkBneYrGxxrtPsudkAjvjb03AQc1uMYcq8H?=
 =?us-ascii?Q?42iD8psYf10PzPteo3EKL6F6GyK/OVUedBSpfTe4JJVg8nAnwPPWfBMo5D9g?=
 =?us-ascii?Q?cvYFe2WvvF1Fa6dMoI7XVSeYhXT5QuhdHGVH3phBbMDfIYBJIYlBLbxhvDhJ?=
 =?us-ascii?Q?wd8VQB1UNAOpwD0OrFkiaZbRxMXpVpk5PV7uOuZReAvs0k1SCs9o5Qtg/EUo?=
 =?us-ascii?Q?Fy6IPOg1iP4W4xcwNib4YJ5CxhaoJI8sBtmteMV5w9Vn7vq309Y93GjVy1rY?=
 =?us-ascii?Q?tzVw+4PkmGg31pkTkBOlMvmbf3HpMjNuUMYZThEh6R0l7FQeWGV+2SJ+QNJ+?=
 =?us-ascii?Q?6nmLgDdtezgDfSb5PpUoEtz+nx7D13/fm/Z02+71gr3TRcrFbLy3oNc1i4q+?=
 =?us-ascii?Q?4If6RtUiS1g6VPTOxwG3+ISPySA/4T1cq/1fYcZV0XZwGLlzkq0TI6jB73Mp?=
 =?us-ascii?Q?9SOeeYbc4/gTUI3AcRj+v+1u1ohhcnHqg8Y2N6kIbiN8f1pOACeUz60UNPTk?=
 =?us-ascii?Q?PQYGLf6aG16iknO26CI+OaOWR/wtJQEGt6rU6nsCJGPV9F1Wf61EisC2QDY7?=
 =?us-ascii?Q?XvjkA+8yryPT1UWH8cFzQAOVbc87BCLmcPvfRsEJF/MHds0n7OBpPgV+Jjvb?=
 =?us-ascii?Q?1DCOEzH/5+QL/dadqXenSW2TI9gjzlscoOcTVtXu/OzkQiaDdaDsUqwRHUQk?=
 =?us-ascii?Q?VVNcM4hggh5qBdUrnElmld9TgiOk/0ExvkJbTT/jAhTtY4nz29KajU8w/3NG?=
 =?us-ascii?Q?+norLBi2ZYnor5KhpOEx4piCycaTmyuupMyZq9dMHlijkBgq/aiS9gvPrw6A?=
 =?us-ascii?Q?muXf6BWGoIbCaXoHUzRpqv+y/zzvQdBduv7QYzOkJCWzJE5/7ghrHHPxBwNw?=
 =?us-ascii?Q?Dlq4Sa5fKXmxFWtSLAlZUU5VMRTmmzNFVuUG9af/bQ19PuUy5h+oXF7yeCSh?=
 =?us-ascii?Q?jiZnIhW5bkpl8Jl+jcd1JE1RbwxFlhdrNQCvoycfhIr+qbM4zmNInHU7SD31?=
 =?us-ascii?Q?cdp4uOXyGIW0GIsccCne9cRW27k/xeA=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10fa3f50-d94a-4955-2fed-08ded5c94fbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 10:29:33.5594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K4WH6z77jcbAsakM0NK/TlxcbKUyONB9d8l0tqL/kcyu8Mi0ECLtdU4DzbFv1XemDKYE7il0fUh+48Isc6Snq+PbthABzg0uDqrZnj4CYCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12702
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34504-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,sang-engineering.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:cosmin-gabriel.tanislav.xa@renesas.com,m:wsa+renesas@sang-engineering.com,m:ustc.gu@gmail.com,m:broonie@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wsa@sang-engineering.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,vger.kernel.org:from_smtp,TYCPR01MB12093.jpnprd01.prod.outlook.com:mid,renesas.com:dkim,renesas.com:email,renesas.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B02D6D8EE8

Hi Cosmin,

> From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Sent: 29 June 2026 11:22
> To: wsa+renesas <wsa+renesas@sang-engineering.com>; Felix Gu <ustc.gu@gma=
il.com>
> Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>; Mark Brown <broonie=
@kernel.org>; linux-
> spi@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-kernel@vger=
.kernel.org
> Subject: RE: [PATCH] spi: rzv2h-rspi: Fix DMA transfer error handling for=
 signal interruption
>=20
> > From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Sent: Friday, June 26, 2026 7:43 PM
> >
> > On Sat, Jun 27, 2026 at 12:02:29AM +0800, Felix Gu wrote:
> > > wait_event_interruptible_timeout() can return a negative error code w=
hen
> > > interrupted by a signal. The original code treated all non-zero retur=
n
> > > values as success, which would incorrectly synchronize DMA channels a=
nd
> > > return 0 instead of propagating the interruption error.
> > >
> > > Fixes: fa08b566860b ("spi: rzv2h-rspi: add support for DMA mode")
> > > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> >
> > Patch looks correct. But it makes me wonder if interrupting the transfe=
r
> > has actually been tested? Cosmin, can you recall such tests? From my I2=
C
> > experience, I know it can be hard to get the state maching back to a
> > consistent state. Sometimes, it was preferred to simply use
> > wait_event_timeout() instead and drop interruptible support.
>=20
> Hi Wolfram, Felix.
>=20
> I don't think we tested interrupting the transfer.
>=20
> I can run some tests locally this week and see how it behaves.
>=20
> Looking at it now, the timeout / -ERESTARTSYS path might need some
> extra logic to put the controller in a good state.
>=20
> I also think the patch is correct and should be accepted for now.


I think perhaps let's test it before accepting the patch.

Cheers,
Fab


